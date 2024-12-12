<?php
namespace App\Controller;

use App\Service\OpportunityService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

 // src/Controller/BaseController.php
 
class BaseController extends AbstractController
{
    protected OpportunityService $opportunityService;

    public function __construct(OpportunityService $opportunityService)
    {
        $this->opportunityService = $opportunityService;
    }

    

    protected function getRecentOpportunities(int $limit = 10)
    {
        return $this->opportunityService->getRecentOpportunities($limit);
    }

    protected function renderWithOpportunities(string $view, array $parameters = [], int $limit = 5)
    {
        $parameters['opportunities'] = $this->getRecentOpportunities($limit);
        return $this->render($view, $parameters);
    }


    // protected OpportunityService $opportunityService;

    // public function __construct(OpportunityService $opportunityService)
    // {
    //     $this->opportunityService = $opportunityService;
    // }

    protected function getGlobalData(): array
    {
        return [
            'opportunities' => $this->opportunityService->getRecentOpportunities(),
        ];
    }

}