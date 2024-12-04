<?php

namespace App\Controller;

use App\Entity\SERO\Application;
use App\Entity\SERO\BoardMember;
use App\Entity\SERO\IrbCertificate;
use App\Entity\SERO\ReviewAssignment;
use App\Entity\SERO\ReviewChecklistGroup;
use App\Entity\SERO\ReviewerResponse;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Dompdf\Dompdf;
use Dompdf\Exception;
use Symfony\Component\DomCrawler\Image;
use Intervention\Image\ImageManager;
use Skies\QRcodeBundle\Generator\Generator as QRGenerator;
use Dompdf\Options;
use Dompdf\FontMetrics;
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\Writer\PngWriter;
use Knp\Snappy\Pdf;

#[Route('{_locale<%app.supported_locales%>}/gen')]

class PdfGeneratorController extends AbstractController
{

    /**
     * Writes text at the specified x and y coordinates.
     *
     * @param float $x
     * @param float $y
     * @param string $text the text to write
     * @param string $font the font file to use
     * @param float $size the font size, in points
     * @param array $color
     * @param float $word_space word spacing adjustment
     * @param float $char_space char spacing adjustment
     * @param float $angle angle
     */

    #[Route('/{id}/', name: 'ethical_clearance_cert')]
    public function index(Application $app, EntityManagerInterface $entityManager)
    {

        $this->denyAccessUnlessGranted('ROLE_USER');
        // $file = $this->imageToBase64($this->getParameter('kernel.project_dir') . "/uploads/files/site_setting/ephi.png");
        $reviewAssignment = $entityManager->getRepository(ReviewAssignment::class)->findBy(['application' => $app->getId()]);
        $irb_review_checklist_group = $entityManager->getRepository(ReviewChecklistGroup::class)->findAll();
        // $image = "https://ephi.gov.et/wp-content/uploads/2021/03/ephi-logo-name-new-3.png";
        // $fullLocalpath = $this->getParameter('kernel.project_dir')."/uploads/files/site_setting/ephi.png";
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $pdfOptions->set('dpi', '120');
        $pdfOptions->set("isPhpEnabled", true);
        $pdfOptions->set('tempDir', '/tmp');
        $pdfOptions->set("isHtml5ParserEnabled", true);
        ob_get_clean();
        //barcode
        $srringToGenerate = "CERT" . $app->getTitle();
        $options = array(
            'code'   => $srringToGenerate,
            'type'   => 'qrcode',
            'format' => 'html',
            'code'   => 'string to encode',
            // 'type'   => 'datamatrix',
            'format' => 'png',
            'width'  => 10,
            'height' => 10,
            'color'  => array(127, 127, 127),
        );
        $generator = new QRGenerator();
        $barcode = $generator->generate($options);

        $image = $this->getParameter('project_dir') . "public/files/site_setting/ephi.png";

        // Read image path, convert to base64 encoding
        $imageData = base64_encode(file_get_contents($image));

        // Format the image SRC:  data:{mime};base64,{data};
        $src = 'data:' . mime_content_type($image) . ';base64,' . $imageData;


        $data = [
            // 'orglogos'  => $this->imageToBase64($image), //->imageToBase64("http://127.0.0.1:8008/files/site_setting/ephi.png"),
            'title'         => $app->getTitle(),
            'irb_review_checklist_group' => $irb_review_checklist_group,
            'review_assignment' => $reviewAssignment,
            'appdetail' => $app,
            'application' => $app,
            'orglogos' => $src,
            // 'orglogos' => base64_encode(file_get_contents($this->getParameter('site_setting'))),
            // 'orglogos'=> $this->imageToBase64($this->getParameter('site_setting')),
            // 'orglogos' =>  '<img src="data:image/png;base64, '.$this->imageToBase64($image).'">',

        ];
        $html =  $this->renderView('sero/application/cert2.html.twig', $data);
        // $html =  $this->renderView('sero/application/app_sections/certnew.html.twig', $data);
        $dompdf = new Dompdf(array('enable_remote' => true));
        $dompdf->set_option("isPhpEnabled", true);
        $dompdf->loadHtml($html);
        $dompdf->setPaper("A4", "portrait");
        $dompdf->render();
        // Instantiate canvas instance
        $canvas = $dompdf->getCanvas();
        $fontMetrics = new FontMetrics($canvas, $pdfOptions);
        $w = $canvas->get_width();
        $h = $canvas->get_height();
        $font = $fontMetrics->getFont('sans');
        $text = "Ethical Clearance";
        $txtHeight = $fontMetrics->getFontHeight($font, 2);
        $textWidth = $fontMetrics->getTextWidth($text, $font, 2);
        $canvas->set_opacity(.0022);
        $x = (($w - $textWidth) / 2);
        $y = (($h - $txtHeight) / 2);
        $canvas->text($x, $y, $text, $font, size: 36, color: [0, 0, 0], word_space: 0.0, char_space: 0.0, angle: -45);
        // $canvas = $dompdf->getCanvas();
        // Get height and width of page
        // $w = $canvas->get_width();
        // $h = $canvas->get_height();
        // Specify watermark image
        // $imageURL = $this->getParameter('kernel.project_dir').'/public/files/profile_pictures/defaultuser.png'; 
        // $imgWidth = 200;
        // $imgHeight = 20;
        // $canvas->set_opacity(.5);
        // $x = (($w-$imgWidth)/2);
        // $y = (($h-$imgHeight)/2);
        // $canvas->image($imageURL, $x, $y, $imgWidth, $imgHeight); 

        return new Response(
            $dompdf->stream('SERO-Ethical Clearance Certificate', ["Attachment" => 1]),
            Response::HTTP_OK,
            ['Content-Type' => 'application/pdf']
        );
    }

    private function imageToBase64($path)
    {
        $path = $path;
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        return $base64;
    }


    #[Route('/{id}/clearance', name: 'clearance', methods: ['GET'])]
    public function clearance(Application $app, EntityManagerInterface $em)
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $irbCertificate = $em->getRepository(IrbCertificate::class)->findOneBy(['version' => $app]);

        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $pdfOptions->set('tempDir', '/tmp');
        // $pdfOptions->set("A4", "landscape");
        $pdfOptions->setIsHtml5ParserEnabled(true);
        $dompdf = new Dompdf($pdfOptions);
        $dompdf->set_option("isPhpEnabled", true);
        $srringToGenerate = "CERT" . $app->getTitle();
        $options = array(
            'code'   => $srringToGenerate,
            'type'   => 'qrcode',
            'format' => 'html',
            'code'   => 'string to encode',
            // 'type'   => 'datamatrix',
            'format' => 'png',
            'width'  => 10,
            'height' => 10,
            'color'  => array(127, 127, 127),
        );

        $srringToGenerate = "Researcher:";

        $qrCode = Builder::create()
            ->writer(new PngWriter())
            ->writerOptions([])
            ->data($srringToGenerate)
            ->encoding(new Encoding('UTF-8'))
            ->size(300)
            ->margin(10)
            ->build();

        $fundname =  "name";
        ob_get_clean();

        $image = $this->getParameter('project_dir') . "public/files/site_setting/ephi.png";

        // Read image path, convert to base64 encoding
        $imageData = base64_encode(file_get_contents($image));

        // Format the image SRC:  data:{mime};base64,{data};
        $src = 'data:' . mime_content_type($image) . ';base64,' . $imageData;


        $html = $this->renderView('sero/cert/cert.html.twig', [

            'orglogos' => $src,
            'application' => $app,
            // 'barcode' => $barcode,
            'qr_code' => $qrCode->getDataUri(),

            'fundName' => $fundname,
            'fund_transactions' => 'dsd',

        ]);
        $dompdf->loadHtml($html);
        // $dompdf->setPaper('A4', 'landscape');
        $dompdf->render();

        // ob_end_clean();
        $filename = "mee";

        $dompdf->stream($filename . "- cert.pdf", [
            "Attachment" => false,
        ]);
    }

    // #[Route('/{id}/reviewerResponse', name: 'oldreviewerResponse', methods: ['GET'])]
    // public function reviewerResponse(ReviewAssignment $revAssignment, EntityManagerInterface $em): Response
    // {

    //     $this->denyAccessUnlessGranted('ROLE_USER');
    //     $pdfOptions = new Options();
    //     $pdfOptions->set('defaultFont', 'Arial');
    //     $pdfOptions->set('isRemoteEnabled', true);
    //     $pdfOptions->set('tempDir', '/tmp');
    //     // $pdfOptions->setIsHtml5ParserEnabled(true);
    //     $dompdf = new Dompdf($pdfOptions);
    //     $dompdf->set_option("isPhpEnabled", true);

    //     // Start output buffering
    //     ob_start();

    //     $irb_review_checklist_group = $em->getRepository(ReviewChecklistGroup::class)->findAll();
    //     try {

    //         $html = $this->renderView('sero/review_checklist/tabs/pdfresponses.html.twig', [
    //             'irb_review_checklist_group' => $irb_review_checklist_group,
    //             'review_assignment' => $revAssignment
    //         ]);
    //         $dompdf->loadHtml($html);
    //         $dompdf->setPaper('A4', 'portrait'); // Correct typo
    //         $dompdf->render();
    //         $filename = "Reviewer Response -" . $revAssignment->getIrbreviewer();
    //         $dompdf->stream($filename . "-.pdf", [
    //             "Attachment" => true,
    //         ]);
    //     } catch (Exception $e) {
    //         // Log the exception for debugging
    //         // $this->getLogger()->error('Error generating PDF: ' . $e->getMessage());
    //         // Handle the exception in a more appropriate way, e.g., display an error message to the user
    //         return new Response('An error occurred while generating the PDF.');
    //     } finally {
    //         // Clean up the output buffer
    //         ob_end_clean();
    //     }

    //     return true;
    // }

    #[Route('/{id}/reviewer-response-pdf', name: 'reviewerResponse')]
    public function generatePdf(EntityManagerInterface $em,   ReviewAssignment $revAssignment)
    {
        $this->denyAccessUnlessGranted('ROLE_USER');

        $irb_review_checklist_group = $em->getRepository(ReviewChecklistGroup::class)->findAll();

        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $pdfOptions->setIsHtml5ParserEnabled(true);
        $html = ob_get_contents();
        $dompdf = new Dompdf($pdfOptions);
        $dompdf->set_option("isPhpEnabled", true);
//	$image = new imagick();
        $image = $this->getParameter('site_setting') ;// . "/".$this->getParameter('site_logo');
        $signature = $this->getParameter('signatures') . "/" . $revAssignment->getIrbreviewer()->getProfile()->getSignature();
        // $signature = $this->getParameter('project_dir') . "public/uploads/files/profile_pictures/" . $revAssignment->getIrbreviewer()->getProfile()->getSignature();

        // Read image path, convert to base64 encoding
        $signatureData = base64_encode(file_get_contents($signature));
        $imageData = base64_encode(file_get_contents($image));

        // Format the image SRC:  data:{mime};base64,{data};
        $src = 'data:' . mime_content_type($image) . ';base64,' . $imageData;
        $chairmanSign = 'data:' . mime_content_type($signature) . ';base64,' . $signatureData;

        // Retrieve the HTML generated in our twig file
        $html = $this->renderView('sero/review_checklist/tabs/pdfresponses.html.twig', [
            'title' => "Welcome to our PDF Test",
            'orglogos' => $src,
            'chairmanSign' => $chairmanSign,
            'irb_review_checklist_group' => $irb_review_checklist_group,
            'review_assignment' => $revAssignment
        ]);

        // Load HTML to Dompdf
        $dompdf->loadHtml($html);

        // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
        $dompdf->setPaper('A4', 'portrait');

        // Render the HTML as PDF
        $dompdf->render();
        ob_get_clean();
        // Output the generated PDF to Browser (force download)
        $dompdf->stream("Reviewers response export.pdf", [
            "Attachment" => true
        ]);
    }



    #[Route('/{id}/generateCertPdf', name: 'generate_cert_pdf')]
    public function generateCertPdf(EntityManagerInterface $em, IrbCertificate $cert)
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $pdfOptions->setIsHtml5ParserEnabled(true);
        $html = ob_get_contents();

        $dompdf = new Dompdf($pdfOptions);
        $dompdf->set_option("isPhpEnabled", true);
        //##$image = $this->getParameter('project_dir') . "public/files/site_setting/ephi.png";
//	$image = $this->getParameter('site_setting'); // . "/ephi.png"; //.$this->getParameter('sit');
        $image = $this->getParameter('site_setting') ;// . "/".$this->getParameter('site_logo');
	$image = $this->getParameter('site_setting');

        $chair = $em->getRepository(BoardMember::class)->findOneBy(['role' => "CHAIR"]);
        $directorGeneral = $em->getRepository(BoardMember::class)->findOneBy(['role' => "Director General"]);
        $signature = $this->getParameter('signatures') . "/" . $chair->getUser()->getProfile()->getSignature();
        $directorSign = $this->getParameter('signatures') . "/" . $directorGeneral->getUser()->getProfile()->getSignature();

        // Read image path, convert to base64 encoding
        $signatureData = base64_encode(file_get_contents($signature));
        $imageData = base64_encode(file_get_contents($image));
        $dirSignatureData = base64_encode(file_get_contents($directorSign));

        // Format the image SRC:  data:{mime};base64,{data};
        $src = 'data:' . mime_content_type($image) . ';base64,' . $imageData;
        $chairmanSign = 'data:' . mime_content_type($signature) . ';base64,' . $signatureData;

        $directorGeneralSign = 'data:' . mime_content_type($directorSign) . ';base64,' . $dirSignatureData;

        $qrCode = Builder::create()
            ->writer(new PngWriter())
            ->writerOptions([])
            ->data($cert->getCertificateCode())
            ->encoding(new Encoding('UTF-8'))
            ->size(300)
            ->margin(10)
            ->build();

        // Retrieve the HTML generated in our twig file
        $html = $this->renderView('sero/cert/certPdf.html.twig', [
             'orglogos' => $src,
            'chairmanSign' => $chairmanSign,
            'directorGeneralSign' => $directorGeneralSign,
            'irb' => $cert,
            'qr_code' => $qrCode->getDataUri(),
            'app_url' => $this->getParameter('app_url'),

        ]);

        // Load HTML to Dompdf
        $dompdf->loadHtml($html);

        // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
        $dompdf->setPaper('A4', 'portrait');

        // Render the HTML as PDF
        $dompdf->render();

        ////// watermark

        $canvas = $dompdf->getCanvas();

        // Get height and width of page 
        $w = $canvas->get_width();
        $h = $canvas->get_height();

        // Specify watermark image 
        // $imageURL = $src; 
        $imgWidth = 300;
        $imgHeight = 300;
        // Set image opacity 
        $canvas->set_opacity(0.0225);

        // Specify horizontal and vertical position 
        $x = (($w - $imgWidth) / 2);
        $y = (($h - $imgHeight) / 2);

        // Add an image to the pdf 

	      $canvas->image($image, $x, $y, $imgWidth, $imgHeight);

        /////////////////////
        ob_get_clean();
        // Output the generated PDF to Browser (force download)
        $dompdf->stream("CERT-" . $cert->getCertificateCode() . ".pdf", [
            "Attachment" => true
        ]);
    }

    // return Response('');

}
