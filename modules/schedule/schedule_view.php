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
        global $objProfile;
        $html="";
        echo $objProfile->tipo;
        if(in_array($objProfile->tipo, $this->userAsignationGranted)){
            $keys=array("LAYOUT"=>"");
            $html=$this->print_template("panel_asignation", $keys);
        }
        return $html;    
    }
    
   
    
   
    
    
    
    
}


