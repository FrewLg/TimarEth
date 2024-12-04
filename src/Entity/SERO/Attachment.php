<?php

namespace App\Entity\SERO;

use App\Repository\SERO\AttachmentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AttachmentRepository::class)]
class Attachment
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\ManyToOne(inversedBy: 'attachments')]
    private ?Application $protocol = null;

    #[ORM\ManyToOne(inversedBy: 'attachments')]
    private ?AttachmentType $type = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $uploadedAt = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $uid = null;

    #[ORM\ManyToOne(inversedBy: 'attachments')]
    private ?Version $version = null;

    // /**
    //  * @var Collection<int, AttachmentType>
    //  */
    // #[ORM\OneToMany(targetEntity: AttachmentType::class, mappedBy: 'attachment')]
    // private Collection $type;

    public function __construct()
    {
        // $this->type = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
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

    public function getProtocol(): ?Application
    {
        return $this->protocol;
    }

    public function setProtocol(?Application $protocol): static
    {
        $this->protocol = $protocol;

        return $this;
    }

    // /**
    //  * @return Collection<int, AttachmentType>
    //  */
    // public function getType(): Collection
    // {
    //     return $this->type;
    // }

    // public function addType(AttachmentType $type): static
    // {
    //     if (!$this->type->contains($type)) {
    //         $this->type->add($type);
    //         $type->setAttachment($this);
    //     }

    //     return $this;
    // }

    // public function removeType(AttachmentType $type): static
    // {
    //     if ($this->type->removeElement($type)) {
    //         // set the owning side to null (unless already changed)
    //         if ($type->getAttachment() === $this) {
    //             $type->setAttachment(null);
    //         }
    //     }

    //     return $this;
    // }

    public function getType(): ?AttachmentType
    {
        return $this->type;
    }

    public function setType(?AttachmentType $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getUploadedAt(): ?\DateTimeInterface
    {
        return $this->uploadedAt;
    }

    public function setUploadedAt(?\DateTimeInterface $uploadedAt): static
    {
        $this->uploadedAt = $uploadedAt;

        return $this;
    }

    public function getUid(): ?string
    {
        return $this->uid;
    }

    public function setUid(?string $uid): static
    {
        $this->uid = $uid;

        return $this;
    }

    public function getVersion(): ?Version
    {
        return $this->version;
    }

    public function setVersion(?Version $version): static
    {
        $this->version = $version;

        return $this;
    }
}
