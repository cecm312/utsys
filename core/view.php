<?php

class View {
    private $views_dir;
    function __construct($views_dir) {
        $this->views_dir = $views_dir;
    }

    public function create_options($arrayOptions, $selected = "") {
        $html = "";
        foreach ($arrayOptions as $option => $value) {
            $sel = ($selected == $option) ? "selected" : "";
            $html.="<option value='$option' $sel>$value</option>";
        }
        return $html;
    }

    public function print_template($template, $keys="") {
        $file = $this->views_dir . $template . '.html';
        $html =file_get_contents($file);
        if($keys!="" and is_array($keys)){
            $html=$this->render_data($html,$keys);
        }
        return $html;
    }
    
    public function render_data($html,$keys){
        foreach ($keys as $clave => $valor) {
            $html = str_replace('{' . $clave . '}', $valor, $html);
        }
        return $html;
    }
    
    public function print_table($template,$arrayData){
        $keys=array(
            "ROWS"=>$this->print_rows_table($template."_row", $arrayData)
        );
        return $this->print_template($template, $keys);        
    }

    public function print_rows_table($template, $arrayData) {
        $html = "";
        if(is_array($arrayData) and count($arrayData)>0){
            foreach ($arrayData as $array) {
                $html.= $this->print_template($template, $array);
            }
        }else{
            $html="<tr><td colspan='100%'>Sin datos<td></tr>";
        }
         return $html;
    }
    
    public function createWhere($params,$fields){
        
    }
    
    public function getAllClients($where,$next,$columnSize){
        
    }

}
