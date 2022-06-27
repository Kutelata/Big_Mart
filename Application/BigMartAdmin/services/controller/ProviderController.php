<?php

include_once 'Controller.php';
include_once '../api/ProviderRepository.php';

class ProviderController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/edit-provider.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $providerRepository = new ProviderRepository();
            $providerRepository->deleteProvider($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider-list.php');
        }
    }

    public function create()
    {
        $address = isset($_POST['address']) ? $_POST['address'] : '';
        $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $status = isset($_POST['status']) && (int)$_POST['status'] == 1 ? 1 : 2;
        if (isset($_POST['name'])) {
            $data = [
                'name' => $_POST['name'],
                'address' => $address,
                'phone' => $phone,
                'status' => $status,
                'email' => $email,
            ];
            $providerRepository = new ProviderRepository();
            $providerRepository->createProvider($data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider-list.php');
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if ($id) {
            $status = isset($_POST['status']) && (int)$_POST['status'] == 1 ? 1 : 2;
            $data = [
                'name' => $_POST['name'],
                'address' => $_POST['address'],
                'phone' => $_POST['phone'],
                'status' => $status,
                'email' => $_POST['email'],
            ];
            $providerRepository = new ProviderRepository();
            $providerRepository->updateProvider($id, $data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider-list.php');
        }
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }
}

$providerController = new ProviderController();
$providerController->execute();