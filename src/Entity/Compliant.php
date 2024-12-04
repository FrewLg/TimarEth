<?php

namespace App\Entity;

use App\Repository\CompliantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CompliantRepository::class)]
class Compliant
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $message = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\ManyToOne(inversedBy: 'compliants')]
    private ?User $repliedBy = null;

    #[ORM\ManyToOne(targetEntity: self::class, inversedBy: 'complients')]
    private ?self $repliedTo = null;

    /**
     * @var Collection<int, self>
     */
    #[ORM\OneToMany(targetEntity: self::class, mappedBy: 'repliedTo')]
    private Collection $complients;

    #[ORM\Column(nullable: true)]
    private ?bool $solved = null;

    public function __construct()
    {
        $this->complients = new ArrayCollection();
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

    public function getemail(): ?string
    {
        return $this->email;
    }

    public function setemail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getMessage(): ?string
    {
        return $this->message;
    }

    public function setMessage(string $message): static
    {
        $this->message = $message;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getRepliedBy(): ?User
    {
        return $this->repliedBy;
    }

    public function setRepliedBy(?User $repliedBy): static
    {
        $this->repliedBy = $repliedBy;

        return $this;
    }

    public function getRepliedTo(): ?self
    {
        return $this->repliedTo;
    }

    public function setRepliedTo(?self $repliedTo): static
    {
        $this->repliedTo = $repliedTo;

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getcomplients(): Collection
    {
        return $this->complients;
    }

    public function addcomplients(self $complients): static
    {
        if (!$this->complients->contains($complients)) {
            $this->complients->add($complients);
            $complients->setRepliedTo($this);
        }

        return $this;
    }

    public function removecomplients(self $complients): static
    {
        if ($this->complients->removeElement($complients)) {
            // set the owning side to null (unless already changed)
            if ($complients->getRepliedTo() === $this) {
                $complients->setRepliedTo(null);
            }
        }
        return $this;
    }

    public function isSolved(): ?bool
    {
        return $this->solved;
    }

    public function setSolved(?bool $solved): static
    {
        $this->solved = $solved;

        return $this;
    }
}
