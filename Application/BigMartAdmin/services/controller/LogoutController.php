<?php

include './Controller.php';

class LogoutController extends Controller
{
    public function execute()
    {
        session_start();
        session_destroy();
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/login.php');
    }
}

$controller = new LogoutController();
$controller->execute();