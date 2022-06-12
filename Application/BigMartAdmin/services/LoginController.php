<?php 

include './controller/Controller.php';

class LoginController extends Controller {
    public function login() 
    {
        $params = $this->getParams();
        if(!empty($params['email']) && !empty($params['password'])) {
            session_start();
            $_SESSION["email"] = $params['email'];
            $_SESSION["password"] = $params['password'];
            return true;
        } 

        return false;
    }

    public function execute() {
        if($this->login()) {
            header('Location: ' . $this->getBaseUrl() . '/BigMartAdmin/views/index.php?login=1');
        } else {
            header('Location: ' . $this->getBaseUrl() . '/BigMartAdmin/views/login.php?login=0');
        }
    }

    public function getBaseUrl() {
        return $_SERVER['HTTP_ORIGIN'];
    }
}

$controller = new LoginController();
$controller->execute();