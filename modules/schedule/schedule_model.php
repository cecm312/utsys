<?php

class Schedule extends DBModel{
    
    function __construct() {}
    protected function delete() {}
    protected function edit() {}
    protected function get() {}
    protected function set() {}
    
    public function get_groups(){
        $query="SELECT * FROM grupo";
        $this->query=$query;
        $this->get_all_results_query();
        return $this->rows;
    }
    public function get_teachers(){
        $query="SELECT p.* FROM perfil as p INNER JOIN profesor as pro ON p.idperfil=pro.idperfil";
        $this->query=$query;
        $this->get_all_results_query();
        return $this->rows;
    }
    public function get_days(){
        $query="SELECT * FROM dia";
        $this->query=$query;
        $this->get_all_results_query();
        return $this->rows;
    }
    public function get_modules(){
        $query="SELECT * FROM modulo ORDER BY hora_inicio";
        $this->query=$query;
        $this->get_all_results_query();
        return $this->rows;
    }
    public function get_subjects(){
        $query="SELECT * FROM materia";
        $this->query=$query;
        $this->get_all_results_query();
        return $this->rows;
    }
    public function get_select_data($array,$idfield,$valuefield){
        $arraytemp=array();
        foreach ($array as $key => $value) {
            $arraytemp[$value[$idfield]]=$value[$valuefield];
        }
        return $arraytemp;
    }
}