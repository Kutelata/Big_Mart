<?php

include 'Controller.php';

class CheckLoginController extends Controller
{
    public function isLoggedIn()
    {
        session_start();
        if (isset($_SESSION['session_id'])
//            && isset($_SESSION['timeout'])
//            && ($_SESSION['timeout'] + 10 * 60 >= time())
        ) {
            return true;
        }

        return false;
    }

    public function redirectToLoginPage()
    {
        if (!$this->isLoggedIn()) {
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/login.php');
        }
    }
}

$checkLoginController = new CheckLoginController();
$checkLoginController->redirectToLoginPage();