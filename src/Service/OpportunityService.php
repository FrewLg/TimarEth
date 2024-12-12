<?php 
// src/Service/OpportunityService.php

namespace App\Service;

// use App\Repository\OpportunityRepository;
use App\Repository\Timar\OpportunityRepository;

 
class OpportunityService
{
    private OpportunityRepository $opportunityRepository;

    public function __construct(OpportunityRepository $opportunityRepository)
    {
        $this->opportunityRepository = $opportunityRepository;
    }

    public function getRecentOpportunities(int $limit = 10)
    {
        return $this->opportunityRepository->findRecentOpportunities($limit);
    }
}