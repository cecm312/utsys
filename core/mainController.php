<?php

session_start();

$document_root = $_SERVER['DOCUMENT_ROOT'];
$document_root = str_replace("\\", "/", $document_root);
$actual_directory = getcwd();
$actual_directory = str_replace("\\", "/", $actual_directory);
$appDir = str_replace($document_root, "", $actual_directory);
$appDir = str_replace("\\", "", $appDir);
$appDir = str_replace("/", "", $appDir);
$appDir = "/" . $appDir . "/";

define("MODULES_DIR", $appDir . "modules/");
define("LIBS_DIR", $appDir . "libs/");
define("UPLOADS_DIR", $appDir . "uploads/");

define("SYSTEM_ROOT_DIR", $actual_directory);
define("SYSTEM_SITE_DIR", $actual_directory . "/site/");
define("SYSTEM_MODULES_DIR", $actual_directory . "/modules/");
define("SYSTEM_LIBS_DIR", $actual_directory . "/libs/");
define("SYSTEM_UPLOADS_DIR", $actual_directory . "/uploads/");

include_once("view.php");
include_once("dbModel.php");
include_once(SYSTEM_MODULES_DIR . "profile/profile_model.php");

$sitio = "compu";

$systemObjView = new View(SYSTEM_SITE_DIR . $sitio . "/");

if (isset($_SESSION["idprofile"])) {
    $idprofile = $_SESSION["idprofile"];
} else {
    $idprofile = 1;
}
$objProfile = new Profile($idprofile);
$template = "front";
$page = "index";

if(!isset($_REQUEST["module"])){
    $_REQUEST["module"]="dashboard";
}

$action = isset($_REQUEST["action"]) ? $_REQUEST["action"] : "default";

if(isset($_REQUEST["login"])){
    $moduleName="web_site";
    $template="login";
}else if(isset($_REQUEST["logout"])){
    $moduleName = "dashboard";
    $template = "login";
    session_destroy();
}else if (isset($_REQUEST["module"])) {
    $moduleName = $_REQUEST["module"];
    include_once(SYSTEM_MODULES_DIR . "/module/module_model.php");
    $objModule = new Module($moduleName);
    $tipo=($objProfile->tipo>3)?3:$objProfile->tipo;
    switch ($tipo) {
        case 1:
            if ($objModule->guestAccess == 1) {
                $template = "login";
                $accesModule = true;
            } else {
                $accesModule = false;
                $template = "login";
                $arraytemp=array();
                foreach ($_GET as $key=>$value){
                    array_push($arraytemp, "$key=$value");
                }
                $_SESSION["redirectLocation"]="$appDir?".implode("&", $arraytemp);
            }
            break;
        case 2:
            $template = "front";
            if ($objModule->guestAccess == 1) {
                $template = "front";
                $accesModule = true;
            } else {
                $accesModule = false;
                $template = "login";
                $arraytemp=array();
                foreach ($_GET as $key=>$value){
                    array_push($arraytemp, "$key=$value");
                }
                $_SESSION["redirectLocation"]="$appDir?".implode("&", $arraytemp);
            }
            break;
        case 3:
            $template = "back";
            $accesModule = true;
            break;
    }
    if (!$accesModule) {
        $moduleName = "dashboard";
    }
} else {
    $moduleName = "dashboard";
    $template = "login";
}

define("SYSTEM_MODULE_DIR", SYSTEM_MODULES_DIR . $moduleName);
define("MODULE_CSS_DIR", MODULES_DIR . $moduleName . "/views/css/");
define("MODULE_JS_DIR", MODULES_DIR . $moduleName . "/views/js/");
define("MODULE_IMG_DIR", MODULES_DIR . $moduleName . "/views/img/");
define("MODULE_HTML_DIR", SYSTEM_MODULE_DIR . "/views/html/");

define("SITE_JS_DIR", $appDir ."site/$sitio/js/");
define("SITE_CSS_DIR", $appDir ."site/$sitio/css/");
define("SITE_IMG_DIR", $appDir ."site/$sitio/img/");



include_once(SYSTEM_MODULE_DIR . "/" . $moduleName . "_controller.php");
if (isset($html)) {
    if ($template == "back" and isset($_REQUEST["notemplate"])) {
        $web_page=$html;
    } else {
        $web_page = $systemObjView->print_template($template,array("CONTAINER"=>$html));
    }
    $keys = array(
            "SITE_IMG_DIR"=>SITE_IMG_DIR,
            "SITE_CSS_DIR"=>SITE_IMG_DIR,
            "SITE_JS_DIR"=>SITE_IMG_DIR,
            "MODULE_IMG_DIR" => MODULE_IMG_DIR,
            "MODULE_JS_DIR" => MODULE_JS_DIR, 
            "MODULE_CSS_DIR" => MODULE_CSS_DIR, 
            "MODULES_DIR" => MODULES_DIR, 
            "LIBS_DIR" => LIBS_DIR,
            "UPLOADS_DIR" => UPLOADS_DIR,
            "SITE_JS_DIR"=>SITE_JS_DIR,
            "SITE_CSS_DIR"=>SITE_CSS_DIR,
            "SITE_IMG_DIR"=>SITE_IMG_DIR,
        );
        print $systemObjView->render_data($web_page, $keys);
}






