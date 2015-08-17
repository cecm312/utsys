<?php

class ScheduleView extends View{
    private $userAsignationGranted=array(3,5);
    
    public function __construct($views_dir) {
        parent::__construct($views_dir);
    }
    
    public function print_layout($layout="index",$req=array()){
        $html="";
        switch($layout){
            case "index":
                $html=$this->print_panel_asignation();
                break;
        }
        $keys=array("PANEL_ASIGNATION"=>$html);
        return $this->print_template("container", $keys);
    }
    
    public function print_panel_asignation(){
        global $objProfile,$objSchedule;
        $html="";
        if(in_array($objProfile->tipo, $this->userAsignationGranted)){
            $keys=array(
                "OPTIONS_TEACHERS"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_teachers(),"idperfil","nombre")),
                "OPTIONS_SUBJECT"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_subjects(),"idmateria","nombre")),
                "OPTIONS_GROUPS"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_groups(),"idgrupo","nombre")),
                "OPTIONS_DAYS"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_days(),"iddia","nombre")),
                "OPTIONS_MODULE"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_modules(),"idmodulo","tiempo"))
                );
            $html=$this->print_template("panel_asignation", $keys);
        }
        return $html;    
    }
    
   
    
   
    
    
    
    
}


