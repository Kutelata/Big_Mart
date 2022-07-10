<?php

include_once 'Controller.php';
include_once '../api/repository/CustomerRepository.php';

class CustomerController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/customer/edit-customer.php?id=' . $id);
        }
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }

    public function update()
    {
        $id = isset($_POST['id']) ? (int)$_POST['id'] : false;
        if ($id) {
            if (isset($_POST['name'])) {
                $data = [
                    'name' => $_POST['name'],
                    'gender' => (int)$_POST['gender'],
                    'birthday' => $_POST['birthday'],
                    'phone' => $_POST['phone'],
                    'address' => $_POST['address'],
                    'email' => $_POST['email'],
                    'status' => (int)$_POST['status'],
                ];
                $customerRepository = new CustomerRepository();
                $customerRepository->update($id, $data);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/customer/customer-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/customer/customer-list.php');
    }
}

$customerController = new CustomerController();
$customerController->execute();