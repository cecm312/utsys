<?php

date_default_timezone_set('America/Mexico_City');

require SYSTEM_LIBS_DIR . '/phpmailer/PHPMailerAutoload.php';

class Mail extends DBModel {
    public $mail;
    public function sendMail($correoDestinatario,$nombreDestinatario,$asunto,$mensaje){
        $this->mail->Subject = $asunto;
        $this->mail->msgHTML($mensaje);
        $this->mail->addAddress($correoDestinatario, $nombreDestinatario);
        
        if (!$this->mail->send()) {
            $status=0;
            $error=$this->mail->ErrorInfo;
        } else {
             $status=1;
             $error="";
        } 
        return array("status"=>$status,"error"=>$error);
    }
    function __construct($remitenteCorreo) {
        //Create a new PHPMailer instance
        $this->mail = new PHPMailer;
        $this->mail->isSMTP();
        $this->mail->SMTPDebug = 0;
        $this->mail->Debugoutput = 'html';
        $this->mail->Host = 'smtp.gmail.com';
        $this->mail->Port = 587;
        $this->mail->SMTPSecure = 'tls';
        $this->mail->Mailer="smtp";
        $this->mail->SMTPAuth = true;
        $this->mail->Username = "cecm312@gmail.com";
        $this->mail->Password = "saalfara312";
        $this->mail->setFrom($remitenteCorreo,"Administracion");
    }

    public function delete() {
        
    }

    public function edit() {
        
    }

    public function get() {
        
    }

    protected function set() {
        
    }

}
