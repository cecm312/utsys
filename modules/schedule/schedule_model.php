<?php

class Schedule extends DBModel{
    
    function __construct() {}
    protected function delete() {}
    protected function edit() {}
    protected function get() {}
    protected function set() {}
    
    public function save_module($params){
        foreach ($params as $field=>$valor){
            $$field=$valor;
        }
        $result=false;
        $idmodule="";
        if(isset($hora_inicio) and isset($hora_fin)){
            $keys=array(
                "hora_inicio"=>$hora_inicio,
                "hora_fin"=>$hora_fin
            );
            $result=$this->insert_update($keys, "modulo");
            if($result!=false){
                $idmodule=$result;
                $result=true;
            }
        }
        return array("result"=>$result,"idmodule"=>$idmodule);
    }
    public function get_schedule($params){
        
        return array(array( "title"  => 'event1',
            "start"  => '2015-08-17T08:20'));
    }
    
    public function save_schedule($params){
        foreach ($params as $field=>$valor){
            $$field=$valor;
        }
        $result=false;
        $idhorario="";
        if(isset($iddia) and isset($idmateria) and isset($idmodulo) and isset($idprofesor) and isset($idgrupo)){
            $keys=array(
                "iddia"=>$iddia,
                "idmateria"=>$idmateria,
                "idmodulo"=>$idmodulo,
                "idprofesor"=>$idprofesor,
                "idgrupo"=>$idgrupo,
            );
            $result=$this->insert_update($keys, "horario");
            if($result!=false){
                $idhorario=$result;
                $result=true;
            }
        }
        return array("result"=>$result,"idhorario"=>$idhorario);
    }
    
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
        $query="SELECT *,CONCAT(TIME_FORMAT( hora_inicio, '%H:%i' ),' - ',TIME_FORMAT( hora_fin, '%H:%i' )) as tiempo FROM modulo ORDER BY hora_inicio";
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