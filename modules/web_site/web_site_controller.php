<?php

include_once(SYSTEM_MODULE_DIR."/".$moduleName."_view.php");
include_once(SYSTEM_MODULES_DIR."/mail/mail_model.php");

$objView=new View_WebSite(MODULE_HTML_DIR);
$page=isset($_REQUEST["page"])?$_REQUEST["page"]:"index";

if(isset($_POST["sendMessage"])){
    $action="sendMessage";
}

switch ($action){
    case "default":
        $html=$objView->print_template($page);
        break;
    case "sendMessage":
        $correo=$_POST["correo"];
        $mensaje=$_POST["mensaje"];
        $nombre=$_POST["nombre"];
        
        $objMail=new Mail($correo);
        $cuerpo="<h1>Contacto</h1>";
        $cuerpo.="<h2>De:$nombre - $correo </h2>";
        $cuerpo.="<p>$mensaje</p>";
        echo json_encode($objMail->sendMail("cecm312@hotmail.com", "Carlos Chan", "Contacto Cliente", $cuerpo));
        break;
}