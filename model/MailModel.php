<?php
class MailModel {

    private $mail;
    public function __construct($mail) {
        $this->mail = $mail;
    }

    public function enviarCorreoVerificacion($email, $link, $nombre) {
        try {
            $mail = $this->mail->crear();
            $mail->addAddress($email, $nombre);
            $mail->Subject = "Activacion de cuenta en Preguntados";

            $mail->Body = "
                <h2>Bienvenido a Preguntados</h2>
                <p>Para activar tu cuenta hacé click en el botón:</p>

                <a href='{$link}' style='
                    display:inline-block;
                    padding:12px 20px;
                    background:#2d89ef;
                    color:white;
                    text-decoration:none;
                    border-radius:5px;
                '>
                    Activar cuenta
                </a>
            ";

            return $mail->send();

        } catch (Exception $e) {
            Log::error('Error enviando correo: ' .$mail->ErrorInfo);
            return false;
        }
    }
    
}
