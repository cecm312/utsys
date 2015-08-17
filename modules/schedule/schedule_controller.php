<?php
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_model.php';
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_view.php';

$objSchedule=new Schedule();
$objScheduleView=new ScheduleView(SYSTEM_MODULE_DIR.'/views/html/');


switch ($action){
    case "default":
        $html= $objScheduleView->print_layout();
        break;
}

?>


