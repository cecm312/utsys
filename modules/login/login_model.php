<?php

class Login extends DBModel {

    function __construct() {
        
    }
    public function checkUser($params){
        $redirectLocation="";
        foreach ($params as $key=>$value){
            $$key=$value;
        }
        
        if(isset($cuenta) and isset($contrasena) and $cuenta!="" and $contrasena!=""){
            $contrasena=md5($contrasena);
            $this->query="SELECT idperfil FROM cuenta WHERE usuario='$cuenta' and contrasena='$contrasena'";
            $this->get_all_results_query();
            if(count($this->rows)>0 and count($this->rows)<2){
                $valido=true;
                $mensaje="Usuario Valido";
                $_SESSION["idprofile"]=$this->rows[0]["idperfil"];
                $redirectLocation=isset($_SESSION["redirectLocation"])?$_SESSION["redirectLocation"]:"";
            }else{
                $valido=false;
                $mensaje="Datos de acceso no validos";
            }
        }else{
            $valido=false;
            $mensaje="Datos incompletos";
        }
        return array(
            "valido"=>$valido,
            "mensaje"=>$mensaje,
            "redirectLocation"=>$redirectLocation
        );
        
    }

    protected function delete() {  
    }

    protected function edit() { 
    }

    protected function get() {
    }

    protected function set() {
    }

}

