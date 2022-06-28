<?php

include_once 'Controller.php';
include_once '../api/UnitRepository.php';

class UnitController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/edit-unit.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $unitRepository = new UnitRepository();
            $unitRepository->deleteUnit($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/unit-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $data = [
                'name' => $_POST['name'],
                'value' => $_POST['value']
            ];
            $unitRepository = new UnitRepository();
            $unitRepository->createUnit($data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/unit-list.php');
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if ($id) {
            $data = [
                'name' => $_POST['name'],
                'value' => $_POST['value']
            ];
            $unitRepository = new UnitRepository();
            $unitRepository->updateUnit($id, $data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/unit-list.php');
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

$unitController = new UnitController();
$unitController->execute();