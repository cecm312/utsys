<?php

class ProfileView extends View{
    
    public function __construct($views_dir) {
        parent::__construct($views_dir);
    }
    
    public function printLayout($layout="list",$req=array()){
        $html="";
        switch($layout){
            case "list":
                $html=$this->print_list($req);
                break;
        }
        $keys=array("LAYOUT"=>$html);
        return $this->print_template("container", $keys);
    }
    
    public function printLayoutAddClient(){
        return array("html"=>$this->print_template("newClient"));
    }
    
   
    
    
    
    
}


