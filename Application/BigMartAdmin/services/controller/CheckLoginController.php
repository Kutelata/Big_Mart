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
        } else {
            $this->redirectToDenyPage();
        }
    }

    public function redirectToDenyPage()
    {
        if (!$this->authorize()) {
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/authorize_role.php');
        }
    }

    public function authorize()
    {
        $data = json_decode($_SESSION['data']['role_id']['resource'], true);
        $type = $data['type'];
        if ($type == 'all') {
            return true;
        }

        $selectedResources = $data['resource'];
        $currentPage = explode('/', $_SERVER['SCRIPT_NAME']);
        $currentPage = end($currentPage);
        if (in_array($currentPage, $selectedResources) && strpos($currentPage, '.php') !== false) {
            return true;
        }

        return false;
    }

    public function getResources()
    {
        $resources = scandir('./../');
        $excludeFolders = ['.', '..', 'assets', 'common', 'login.php', 'authorize_role.php'];
        $data = [];
        foreach ($resources as $key => $resource) {
            if (in_array($resource, $excludeFolders)) {
                unset($resources[$key]);
                continue;
            }
            if (strpos($resource, '.php') !== false) {
                $data[] = $resource;
            } else {
                $resourceFolder = scandir('../' . $resource);
                unset($resourceFolder[0]);
                unset($resourceFolder[1]);
                if (is_array($resourceFolder)) {
                    foreach ($resourceFolder as $value) {
                        $data[] = $value;
                    }
                }
            }
        }

        return $data;
    }
}

$checkLoginController = new CheckLoginController();
$checkLoginController->redirectToLoginPage();
$resources = $checkLoginController->getResources();