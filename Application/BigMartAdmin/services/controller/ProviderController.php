<?php

include_once 'Controller.php';
include_once '../api/repository/ProviderRepository.php';

class ProviderController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/edit-provider.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $providerRepository = new ProviderRepository();
            $providerRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/provider-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $status = isset($_POST['status']) && (int)$_POST['status'] == 1 ? 1 : 2;
            $data = [
                'name' => $_POST['name'],
                'address' => $_POST['address'],
                'phone' => $_POST['phone'],
                'status' => $status,
                'email' => $_POST['email'],
            ];
            $providerRepository = new ProviderRepository();
            $providerRepository->create($data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/provider-list.php');
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
            $providerRepository->update($id, $data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/provider-list.php');
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/provider-list.php');
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