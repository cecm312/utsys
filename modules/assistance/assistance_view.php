<?php

class AssistanceView extends View{
    
    public function __construct($views_dir) {
        parent::__construct($views_dir);
    }
    
    public function print_layout($layout="index",$req=array()){
        global $objSchedule;
        $html="";
        switch($layout){
            case "index":
                $html="";
                break;
        }
        $keys=array("OPTIONS_GRUPOS"=>$this->create_options($objSchedule->get_select_data($objSchedule->get_groups(),"idgrupo","nombre")));
        return $this->print_template("container", $keys);
    }
    
    
    
   
    
   
    
    
    
    
}


