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
        $arraytemp=array();
        if(isset($params["idprofesor"]) and $params["idprofesor"]!=""){
            $where=  $this->create_where($params);
            $this->query="SELECT ".
                "d.iddia, ".
                "m.hora_inicio, ".
                "m.hora_fin, ".
                "mat.nombre as materia, ".
                "per.nombre as profesor, ".
                "g.nombre as grupo ".
            "FROM ".
                "horario AS h ".
                "INNER JOIN dia AS d ON h.iddia = d.iddia ".
                "INNER JOIN modulo AS m ON h.idmodulo = m.idmodulo ".
                "INNER JOIN profesor AS p ON h.idprofesor = p.idperfil ".
                "INNER JOIN materia AS mat ON h.idmateria = mat.idmateria ".
                "INNER JOIN perfil AS per ON p.idperfil = per.idperfil ".
                "INNER JOIN grupo AS g ON h.idgrupo = g.idgrupo".$where;
            $this->get_all_results_query();
            $monday= date_create(date("Y-m-d"));
            $int = intval(date("w"))-1;
            $intervalo=new DateInterval("P".$int."D");
            $intervalo->invert=1;
            $monday->add($intervalo);
            $intervalo=new DateInterval("P1D");
            for($i=1;$i<=6;$i++){
                foreach ($this->rows as $key => $value) {
                    if($i==$value["iddia"]){
                        array_push($arraytemp,array(
                            "title"=>$value["grupo"]." - ".$value["materia"],
                            "start"=>  date_format($monday,"Y-m-d")."T".$value["hora_inicio"],
                            "end"=>date_format($monday,"Y-m-d")."T".$value["hora_fin"]
                        ));
                    }
                }
                $monday->add($intervalo);
            }
        }
        return $arraytemp;
    }
    public function create_where($params){
        $filterarray=array();
        if(isset($params["idprofesor"]) and $params["idprofesor"]!=""){
            array_push($filterarray, "h.idprofesor='". $params["idprofesor"]."'");
        }
        if(isset($params["idmateria"]) and $params["idmateria"]!=""){
            array_push($filterarray, "h.idmateria='". $params["idmateria"]."'");
        }
        if(isset($params["idgrupo"]) and $params["idgrupo"]!=""){
            array_push($filterarray, "h.idgrupo='". $params["idgrupo"]."'");
        }
        if(isset($params["iddia"]) and $params["iddia"]!=""){
           array_push($filterarray, "h.iddia='". $params["iddia"]."'");
        }
        if(isset($params["idmodulo"]) and $params["idmodulo"]!=""){
           array_push($filterarray, "h.idmodulo='". $params["idmodulo"]."'");
        }
        $where="";
        if(count($filterarray)>0){
            $where=" WHERE ".implode(" and ", $filterarray);
        }
        return $where;
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