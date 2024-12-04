<?php

namespace App\Entity\SERO;

use App\Entity\User;
use App\Repository\SERO\IrbCertificateRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IrbCertificateRepository::class)]
class IrbCertificate
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $approvedAt = null;

    #[ORM\Column(length: 255)]
    private ?string $certificateCode = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $validUntil = null;

    #[ORM\ManyToOne(inversedBy: 'irbCertificates')]
    private ?Application $irbApplication = null;

    #[ORM\ManyToOne(inversedBy: 'irbCertificates')]
    private ?User $approvedBy = null; 

    #[ORM\ManyToOne(inversedBy: 'irbCertificates')]
    private ?Version $version = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $validFrom = null;

    #[ORM\ManyToOne(inversedBy: 'irbCertificates')]
    private ?ReportExpectationPeriod $reportExpectationPeriod = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getApprovedAt(): ?\DateTimeInterface
    {
        return $this->approvedAt;
    }

    public function setApprovedAt(?\DateTimeInterface $approvedAt): static
    {
        $this->approvedAt = $approvedAt;

        return $this;
    }

    public function getCertificateCode(): ?string
    {
        return $this->certificateCode;
    }

    public function setCertificateCode(string $certificateCode): static
    {
        $this->certificateCode = $certificateCode;

        return $this;
    }

    public function getValidUntil(): ?\DateTimeInterface
    {
        return $this->validUntil;
    }

    public function setValidUntil(\DateTimeInterface $validUntil): static
    {
        $this->validUntil = $validUntil;

        return $this;
    }

    public function getIrbApplication(): ?Application
    {
        return $this->irbApplication;
    }

    public function setIrbApplication(?Application $irbApplication): static
    {
        $this->irbApplication = $irbApplication;

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

    public function getVersion(): ?Version
    {
        return $this->version;
    }

    public function setVersion(?Version $version): static
    {
        $this->version = $version;

        return $this;
    }

    public function getValidFrom(): ?\DateTimeInterface
    {
        return $this->validFrom;
    }

    public function setValidFrom(\DateTimeInterface $validFrom): static
    {
        $this->validFrom = $validFrom;

        return $this;
    }

    public function getReportExpectationPeriod(): ?ReportExpectationPeriod
    {
        return $this->reportExpectationPeriod;
    }

    public function setReportExpectationPeriod(?ReportExpectationPeriod $reportExpectationPeriod): static
    {
        $this->reportExpectationPeriod = $reportExpectationPeriod;

        return $this;
    }
}
