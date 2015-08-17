<?php
include_once SYSTEM_MODULE_DIR.'/dashboard_model.php';
include_once SYSTEM_MODULE_DIR.'/dashboard_view.php';

$objDasboardView=new DashboardView(SYSTEM_MODULE_DIR.'/views/html/');

switch ($action){
    case "default":
        $html=$objDasboardView->printLayout();
        break;
}

?>


