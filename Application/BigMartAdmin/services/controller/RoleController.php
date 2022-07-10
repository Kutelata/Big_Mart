<?php

include_once 'Controller.php';
include_once '../api/repository/RoleRepository.php';

class RoleController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/edit-role.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $roleRepository = new RoleRepository();
            $roleRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/role-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $roleData = [
                'name' => $_POST['name']
            ];
            $roleRepository = new RoleRepository();
            $roleRepository->create($roleData);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/role-list.php');
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if ($id) {
            if (isset($_POST['name'])) {
                $roleData = [
                    'name' => $_POST['name']
                ];
                $roleRepository = new RoleRepository();
                $roleRepository->update($id, $roleData);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/role-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/role-list.php');
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }
}

$roleController = new RoleController();
$roleController->execute();