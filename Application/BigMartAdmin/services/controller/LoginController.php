<?php

include './Controller.php';
include '../api/EmployeeRepository.php';

class LoginController extends Controller
{
    public function login()
    {
        $params = $this->getParams();
        if (!empty($params['email']) && !empty($params['password'])) {
            $employeeRepository = new EmployeeRepository();
            $employeeList = $employeeRepository->getAllEmployees();
            if ($employeeList && is_array($employeeList)) {
                foreach ($employeeList as $employee) {
                    if ($employee['username'] == $params['email']
                        && $employee['password'] == $params['password']) {
                        session_start();
                        $_SESSION['timeout'] = time();
                        $_SESSION['session_id'] = session_id();
                        $_SESSION["email"] = $params['email'];
                        $_SESSION["password"] = $params['password'];
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