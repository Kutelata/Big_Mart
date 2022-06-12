<?php 

require_once './dao/ControllerInterface.php';

class Controller implements ControllerInterface {
    public function getParams() 
    {
        return $_POST;
    }
}