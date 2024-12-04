<?php

namespace App\Entity\SERO;

use App\Entity\User;
use App\Repository\SERO\ProgressReportRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProgressReportRepository::class)]
class ProgressReport
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'progressReports')]
    private ?Application $protocol = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $submittedAt = null;

    #[ORM\Column(length: 255)]
    private ?string $attachment = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $summary = null;

    #[ORM\ManyToOne(inversedBy: 'progressReports')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $submittedBy = null;

    #[ORM\ManyToOne(inversedBy: 'approveProgressReports')]
    private ?User $approvedBy = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $keyResultsOfResearch = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $challenges = null;

    public function getId(): ?int
    {
        return $this->id;
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

    public function getSubmittedAt(): ?\DateTimeInterface
    {
        return $this->submittedAt;
    }

    public function setSubmittedAt(\DateTimeInterface $submittedAt): static
    {
        $this->submittedAt = $submittedAt;

        return $this;
    }

    public function getAttachment(): ?string
    {
        return $this->attachment;
    }

    public function setAttachment(string $attachment): static
    {
        $this->attachment = $attachment;

        return $this;
    }

    public function getSummary(): ?string
    {
        return $this->summary;
    }

    public function setSummary(?string $summary): static
    {
        $this->summary = $summary;

        return $this;
    }

    public function getSubmittedBy(): ?User
    {
        return $this->submittedBy;
    }

    public function setSubmittedBy(?User $submittedBy): static
    {
        $this->submittedBy = $submittedBy;

        return $this;
    }

    public function getApprovedBy(): ?User
    {
        return $this->approvedBy;
    }

    public function setApprovedBy(?User $approvedBy): static
    {
        $this->approvedBy = $approvedBy;

        return $this;
    }

    public function getKeyResultsOfResearch(): ?string
    {
        return $this->keyResultsOfResearch;
    }

    public function setKeyResultsOfResearch(?string $keyResultsOfResearch): static
    {
        $this->keyResultsOfResearch = $keyResultsOfResearch;

        return $this;
    }

    public function getChallenges(): ?string
    {
        return $this->challenges;
    }

    public function setChallenges(?string $challenges): static
    {
        $this->challenges = $challenges;

        return $this;
    }
}
