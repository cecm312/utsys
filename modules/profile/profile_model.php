<?php

class Profile extends DBModel{
    public $tipo;//tipo de usuario=1-invitado,2-cliente,3-administrador
    public $imagen;
    public $nombre;
    

    function __construct($idprofile) {
        $this->get($idprofile);
    }
    
    protected function delete() {
        
    }

    protected function edit() {
        
    }
    
    public function setClient($array){
        $result=false;
        foreach ($array as $campo=>$value){
            $$campo=$value;
        }
        $keys=array(
            "nombre"=>$nombre,
            "apellido"=>$apellido,
            "fech_nac"=>$fech_nac,
            "correo"=>$correo,
            "domicilio"=>$domicilio,
            "telefono"=>$telefono,
            "tipo"=>2
        );
        
        $idperfil=$this->insert_update($keys, "perfil");
        
        if($idperfil){
            $keys=array(
                "cuenta"=>$cuenta,
                "contrasena"=>  md5($contrasena),
                "idprofile"=>$idperfil
            );
            $result=$this->insert_update($keys, "cuenta");
            if($result==0){
                $result=true;
                $_SESSION["idprofile"]=$idperfil;
            }
        }
        return array("result"=>$result);
    }
    
    

    protected function get($idprofile="") {
        if($idprofile!=""){
            $query="SELECT p.* FROM perfil as p INNER JOIN tipo_perfil as tp ON p.tipo=tp.idtipo_perfil WHERE idperfil='$idprofile' ";
            $this->query=$query;
            $this->get_result_query();
            foreach($this->rows as $row=>$value){
                $this->$row=$value;
            }
        }
    }

    protected function set($array="") {
        
    }
}