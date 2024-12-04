<?php

namespace App\Entity\SERO;

use App\Repository\SERO\DecisionTypeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DecisionTypeRepository::class)]
class DecisionType
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $createdAt = null;

    /**
     * @var Collection<int, Version>
     */
    #[ORM\OneToMany(targetEntity: Version::class, mappedBy: 'decisionType')]
    private Collection $version;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $color = null;

    #[ORM\Column(length: 255)]
    private ?string $code = null;

    /**
     * @var Collection<int, Application>
     */
    #[ORM\OneToMany(targetEntity: Application::class, mappedBy: 'reviewMode')]
    private Collection $applications;

    public function __construct()
    {
        $this->version = new ArrayCollection();
        $this->applications = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function __toString()
    {
       return $this->code;
    }

    public function setName(?string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTimeInterface $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * @return Collection<int, Version>
     */
    public function getVersion(): Collection
    {
        return $this->version;
    }

    public function addVersion(Version $version): static
    {
        if (!$this->version->contains($version)) {
            $this->version->add($version);
            $version->setDecision($this);
        }

        return $this;
    }

    public function removeVersion(Version $version): static
    {
        if ($this->version->removeElement($version)) {
            // set the owning side to null (unless already changed)
            if ($version->getDecision() === $this) {
                $version->setDecision(null);
            }
        }

        return $this;
    }

    public function getColor(): ?string
    {
        return $this->color;
    }

    public function setColor(?string $color): static
    {
        $this->color = $color;

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

    /**
     * @return Collection<int, Application>
     */
    public function getApplications(): Collection
    {
        return $this->applications;
    }

    public function addApplication(Application $application): static
    {
        if (!$this->applications->contains($application)) {
            $this->applications->add($application);
            $application->setReviewMode($this);
        }

        return $this;
    }

    public function removeApplication(Application $application): static
    {
        if ($this->applications->removeElement($application)) {
            // set the owning side to null (unless already changed)
            if ($application->getReviewMode() === $this) {
                $application->setReviewMode(null);
            }
        }

        return $this;
    }
}
