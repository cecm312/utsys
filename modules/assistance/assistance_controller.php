<?php
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_model.php';
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_view.php';
include_once SYSTEM_MODULES_DIR.'/schedule/schedule_model.php';

$objAssistance=new Assistance();
$objAssistanceView=new AssistanceView(SYSTEM_MODULE_DIR.'/views/html/');
$objSchedule=new Schedule();

switch ($action){
    case "default":
        $html= $objAssistanceView->print_layout();
        break;
}

?>


