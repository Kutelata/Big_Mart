<?php

include_once 'Controller.php';
include_once '../api/repository/ShippingRepository.php';

class ShippingController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/shipping/edit-shipping.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $shippingRepository = new ShippingRepository();
            $shippingRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/shipping/shipping-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $shippingData = [
                'name' => $_POST['name'],
                'code' => $_POST['code'],
                'status' => (int)$_POST['status'],
                'price' => (float)$_POST['price'],
            ];
            $shippingRepository = new ShippingRepository();
            $shippingRepository->create($shippingData);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/shipping/shipping-list.php');
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if ($id) {
            if (isset($_POST['name'])) {
                $shippingData = [
                    'name' => $_POST['name'],
                    'code' => $_POST['code'],
                    'status' => (int)$_POST['status'],
                    'price' => (float)$_POST['price'],
                ];
                $shippingRepository = new ShippingRepository();
                $shippingRepository->update($id, $shippingData);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/shipping/shipping-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/shipping/shipping-list.php');
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }
}

$shippingController = new ShippingController();
$shippingController->execute();