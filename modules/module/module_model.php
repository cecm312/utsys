<?php

class Module extends DBModel {

    public $name;
    public $guestAccess;

    function __construct($name) {
        $this->get($name);
    }

    public function delete() {
        
    }

    public function edit() {
        
    }

    public function get($name = "") {
        $this->query = "SELECT name,guest_access as guestAccess FROM system_module WHERE name='$name'";
        $result = $this->get_result_query();
        if ($result) {
            foreach ($this->rows as $row => $value) {
                $this->$row = $value;
            }
        }
    }

    protected function set() {
        
    }

}
