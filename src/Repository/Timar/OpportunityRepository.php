<?php

namespace App\Repository\Timar;

use App\Entity\Timar\Opportunity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
 

class OpportunityRepository extends ServiceEntityRepository
{

    // private OpportunityService $opportunityService;

    // public function __construct(OpportunityService $opportunityService)
    // {
    //     $this->opportunityService = $opportunityService;
    // }


    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Opportunity::class);
    }

    public function findRecentOpportunities(int $limit = 10)
    {
        return $this->createQueryBuilder('o')
            ->orderBy('o.postedDate', 'DESC')
            ->setMaxResults($limit)
            ->getQuery()
            ->getResult();
    }

    public function getRecentOpportunities(int $limit = 10)
    {
        return $this->createQueryBuilder('o')
            ->orderBy('o.postedDate', 'DESC')
            ->setMaxResults($limit)
            ->getQuery()
            ->getResult();
    }


    
}