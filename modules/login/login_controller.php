<?php

include SYSTEM_MODULE_DIR."/login_model.php";


$objLogin=new Login();

switch($action){
    case "checkUser":
        echo json_encode($objLogin->checkUser($_REQUEST));
        break;
}
?>


