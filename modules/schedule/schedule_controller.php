<?php
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_model.php';
include_once SYSTEM_MODULE_DIR.'/'.$moduleName.'_view.php';

$objSchedule=new Schedule();
$objScheduleView=new ScheduleView(SYSTEM_MODULE_DIR.'/views/html/');


switch ($action){
    case "default":
        $html= $objScheduleView->print_layout();
        break;
    case "saveModule":
        echo json_encode($objSchedule->save_module($_POST));
        break;
    case "saveSchedule":
        echo json_encode($objSchedule->save_schedule($_POST));
        break;
    case "getSchedule":
        echo json_encode($objSchedule->get_schedule($_POST));
        break;
}

?>


