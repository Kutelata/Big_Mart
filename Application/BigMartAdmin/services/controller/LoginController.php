<?php

include 'Controller.php';
include '../api/repository/UserRepository.php';

class LoginController extends Controller
{
    public function login()
    {
        $params = $this->getParams();
        if (!empty($params['email']) && !empty($params['password'])) {
            $userRepository = new UserRepository();
            $userList = $userRepository->getAll();
            if ($userList && is_array($userList)) {
                foreach ($userList as $user) {
                    if ($user['account'] == $params['email']
                        && $user['password'] == md5($params['password'])) {
                        session_start();
                        $_SESSION['timeout'] = time();
                        $_SESSION['session_id'] = session_id();
                        $_SESSION["data"] = $user;
                        return true;
                    }
                }
            }
        }

        return false;
    }

    public function execute()
    {
        if ($this->login()) {
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/index.php?login=1');
        } else {
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/login.php?login=0');
        }
    }
}

$controller = new LoginController();
$controller->execute();