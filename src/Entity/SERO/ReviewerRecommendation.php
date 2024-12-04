<?php

namespace App\Entity\SERO;

use App\Repository\SERO\ReviewerRecommendationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ReviewerRecommendationRepository::class)]
class ReviewerRecommendation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    private ?string $code = null;

    #[ORM\Column(length: 255)]
    private ?string $color = null;

    #[ORM\Column(length: 255)]
    private ?string $hexcode = null;

    /**
     * @var Collection<int, ReviewAssignment>
     */
    #[ORM\OneToMany(targetEntity: ReviewAssignment::class, mappedBy: 'recommendation')]
    private Collection $reviewAssignments;

    public function __construct()
    {
        $this->reviewAssignments = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): static
    {
        $this->code = $code;

        return $this;
    }

    public function getColor(): ?string
    {
        return $this->color;
    }

    public function setColor(string $color): static
    {
        $this->color = $color;

        return $this;
    }

    public function getHexcode(): ?string
    {
        return $this->hexcode;
    }

    public function setHexcode(string $hexcode): static
    {
        $this->hexcode = $hexcode;

        return $this;
    }

    public function __toString()
    {
       return $this->name;
    }
    /**
     * @return Collection<int, ReviewAssignment>
     */
    public function getReviewAssignments(): Collection
    {
        return $this->reviewAssignments;
    }

    public function addReviewAssignment(ReviewAssignment $reviewAssignment): static
    {
        if (!$this->reviewAssignments->contains($reviewAssignment)) {
            $this->reviewAssignments->add($reviewAssignment);
            $reviewAssignment->setRecommendation($this);
        }

        return $this;
    }

    public function removeReviewAssignment(ReviewAssignment $reviewAssignment): static
    {
        if ($this->reviewAssignments->removeElement($reviewAssignment)) {
            // set the owning side to null (unless already changed)
            if ($reviewAssignment->getRecommendation() === $this) {
                $reviewAssignment->setRecommendation(null);
            }
        }

        return $this;
    }
}
