<?php

class DashboardView extends View{
    
    public function __construct($views_dir) {
        parent::__construct($views_dir);
    }
    
    public function printLayout($layout="default"){
        $html="";
        switch($layout){
            case "default":
                $html="";
                break;
        }
        $keys=array();
        return $this->print_template("container", $keys);
    }
    
    
   
    
    
    
    
}


