<?php

namespace App\Entity\SERO;

use App\Repository\SERO\ReportExpectationPeriodRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ReportExpectationPeriodRepository::class)]
class ReportExpectationPeriod
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    /**
     * @var Collection<int, IrbCertificate>
     */
    #[ORM\OneToMany(targetEntity: IrbCertificate::class, mappedBy: 'reportExpectationPeriod')]
    private Collection $irbCertificates;

    public function __construct()
    {
        $this->irbCertificates = new ArrayCollection();
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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection<int, IrbCertificate>
     */
    public function getIrbCertificates(): Collection
    {
        return $this->irbCertificates;
    }

    public function addIrbCertificate(IrbCertificate $irbCertificate): static
    {
        if (!$this->irbCertificates->contains($irbCertificate)) {
            $this->irbCertificates->add($irbCertificate);
            $irbCertificate->setReportExpectationPeriod($this);
        }

        return $this;
    }

    public function removeIrbCertificate(IrbCertificate $irbCertificate): static
    {
        if ($this->irbCertificates->removeElement($irbCertificate)) {
            // set the owning side to null (unless already changed)
            if ($irbCertificate->getReportExpectationPeriod() === $this) {
                $irbCertificate->setReportExpectationPeriod(null);
            }
        }

        return $this;
    }
}
