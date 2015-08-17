<?php
include_once SYSTEM_MODULE_DIR.'/profile_model.php';
include_once SYSTEM_MODULE_DIR.'/profile_view.php';

$objProfileView=new ProfileView(SYSTEM_MODULE_DIR.'/views/html/');

switch ($action){
    case "addClient":
        $params=$_POST;
       echo json_encode($objProfile->setClient($_POST));
        break;
    case "printLayoutAddClient":
        echo json_encode($objProfileView->printLayoutAddClient());
        break;
}

?>


