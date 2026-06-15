<?php

require_once "vendor/phpmailer/src/Exception.php";
require_once "vendor/phpmailer/src/PHPMailer.php";
require_once "vendor/phpmailer/src/SMTP.php";

use PHPMailer\PHPMailer\PHPMailer;

class MyMail {
    private $host;
    private $username;
    private $password;
    private $port;
    private $fromName;

    public function __construct($host, $username, $fromName, $password, $port) {
        $this->host = $host;
        $this->username = $username;
        $this->fromName = $fromName;
        $this->password = $password;
        $this->port = $port;
    }

    public function crear() {
        $mail = new PHPMailer(true);

        $mail->isSMTP();
        $mail->Host = $this->host;
        $mail->SMTPAuth = true;
        $mail->Username = $this->username;
        $mail->Password = $this->password;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = $this->port;

        $mail->setFrom($this->username, $this->fromName);
        $mail->isHTML(true);

        return $mail;
    }
}
