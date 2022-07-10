<?php

include_once 'Controller.php';
include_once '../api/repository/PaymentRepository.php';

class PaymentController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/payment/edit-payment.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $paymentRepository = new PaymentRepository();
            $paymentRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/payment/payment-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $paymentData = [
                'name' => $_POST['name'],
                'code' => $_POST['code'],
                'status' => (int)$_POST['status'],
                'price' => (float)$_POST['price'],
            ];
            $paymentRepository = new PaymentRepository();
            $paymentRepository->create($paymentData);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/payment/payment-list.php');
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if ($id) {
            if (isset($_POST['name'])) {
                $paymentData = [
                    'name' => $_POST['name'],
                    'code' => $_POST['code'],
                    'status' => (int)$_POST['status'],
                    'price' => (float)$_POST['price'],
                ];
                $paymentRepository = new PaymentRepository();
                $paymentRepository->update($id, $paymentData);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/payment/payment-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/payment/payment-list.php');
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }
}

$paymentController = new PaymentController();
$paymentController->execute();