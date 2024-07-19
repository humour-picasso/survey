<?php

namespace app\common\library;

use Endroid\QrCode\QrCode as EndroidQrCode;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\LabelAlignment;

class QRCode
{
    /**
     * Generate a QR code for a given URL.
     *
     * @param string $url The URL to encode in the QR code.
     * @param string $path The file path to save the generated QR code image.
     * @param int $size The size of the QR code.
     * @param int $margin The margin of the QR code.
     * @return void
     */
    public static function generate($url, $path, $size = 300, $margin = 10)
    {
        // Create a basic QR code
        $qrCode = new EndroidQrCode($url);
        $qrCode->setSize($size);
        $qrCode->setMargin($margin); 

        // Set advanced options
        $qrCode->setWriterByName('png');
        $qrCode->setEncoding('UTF-8');
        $qrCode->setErrorCorrectionLevel(ErrorCorrectionLevel::HIGH());
        $qrCode->setForegroundColor(['r' => 0, 'g' => 0, 'b' => 0, 'a' => 0]);
        $qrCode->setBackgroundColor(['r' => 255, 'g' => 255, 'b' => 255, 'a' => 0]);
        $qrCode->setValidateResult(false);

        // Set additional writer options (SvgWriter example)
        $qrCode->setWriterOptions(['exclude_xml_declaration' => true]);

        // Directly output the QR code
        header('Content-Type: '.$qrCode->getContentType());

        // Save it to a file
        $qrCode->writeFile($path);

    }
}