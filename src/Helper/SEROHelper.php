<?php

namespace App\Helper;

use App\Entity\ActionAudit;
use App\Entity\SERO\Application;
use App\Entity\SERO\IrbCertificate;
use App\Entity\SERO\MeetingSchedule;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\Mime\Message;
use Symfony\Component\HttpFoundation\RequestStack;

class SEROHelper
{

    private  $allCert;
    private  $allapp;
    private $security;
    private $em;
    private $container;
    private $requestStack;
    public function __construct(
        EntityManagerInterface $em,
        Security $security,
        RequestStack $requestStack
    ) {
        $allapp = $em->getRepository(Application::class)->findAll();
        $allCert = $em->getRepository(IrbCertificate::class)->findAll();
        $this->security = $security;
        $this->em = $em;
        $this->requestStack = $requestStack;
        $this->allapp = $allapp;
        $this->allCert = $allCert;
    }




    public function fileNamer($version)
    {

        $app = $version->getApplication()->getIbcode();
        $versionName = $version->getVersionNumber();
        $attachmentType = 'Original_protocol';
        $time = date("h-m-y");
        $user = $version->getApplication()->getSubmittedBy();
        return $app . "-" . $versionName . "-" . $attachmentType . "-" . $time . "-" . $user->getEmail() . ".";
    }

    public function icfFileNamer($icf)
    {

        $app = $icf->getApplication()->getIbcode();
        $icfName = $icf->getVersionNumber();
        $attachmentType = 'ICF';
        $time = date("h-m-y");
        $user = $icf->getApplication()->getSubmittedBy();
        return $app . "-" . $icfName . "-" . $attachmentType . "-" . $time . "-" . $user . ".";
    }

    public function ammendmentFileNamer($ammendment)
    {

        $app = $ammendment->getVersion()->getApplication()->getIbcode();
        $appid = $ammendment->getVersion()->getApplication();
        $versionName = $ammendment->getVersion()->getVersionNumber();
        $attachmentType = 'Ammendment protocol';
        $time = date("h-m-y");
        $append = $this->versionate($appid);
        $user = $ammendment->getVersion()->getApplication()->getSubmittedBy();
        return $append . $app . "-" . $versionName . "-" . $attachmentType . "-" . $time . "-" . $user . ".";
    }


    public function versionate($application)
    {
        $code = "EPHI-SERO";
        $year = date("y");
        $allAppinDb = $this->allapp;
        $newAppId = count($allAppinDb) + 1;
        return $code . "-" . $newAppId . '-' . $year;
    }

    public function certIdGenerator($application)
    {
        $code = "SERO-EPHI";
        $year = date("y");
        $allAppinDb = $this->allCert;
        $newAppId = count($allAppinDb) + 1;
        return $code . "-" . $newAppId . "-" .  $year;
    }
    public function icfVersion($application)
    {
        $versionnumber = count($application->getIcfs()) + 1;
        return $versionnumber;
    }

//     public function upcomingSchedule($application, $message,$label,$icon)
//     {

//     $now = new \DateTime();

// // Set the time to midnight of today
// $today = new \DateTime();
// $today->setTime(0, 0, 0);

// // Query for meetings that start after today
// $meetings = $em->getRepository(MeetingSchedule::class)
//     ->createQueryBuilder('m')
//     ->where('m.startingDate > :today')
//     ->setParameter('today', $today)
//     ->getQuery()
//     ->getResult();
//     return $notification;

//     }

    public function appHistory($application, $message,$label,$icon)
    {

        // $seroHelper->appHistory($application, " A message  ",'bootstrapColors,', 'pin, sms , paper-plane, fax');

        $history = new ActionAudit(); 
        $clientIp = $this->getClientIp(); 
        $user = $this->security->getUser();
        $history->setIp($clientIp);
        $history->setEventTime(new \DateTime());
        $history->setDoneBy($user);
        $history->setLabel($label);
        $history->setAction($message);
        $history->setApplication($application);
        $history->setIcon($icon);
        $this->em->persist($history);
        $this->em->flush();
        $notification = "Changes";
        return $notification;
    }

    public function getClientIp()
    {
        $request = $this->requestStack->getCurrentRequest();
        if ($request) {
            return $request->getClientIp();
        }
        return null; // Or handle the case where there's no request
    }
}
