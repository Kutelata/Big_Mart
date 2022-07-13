<?php
include_once './../../services/controller/CheckLoginController.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $roleRepository = new RoleRepository();
    $roleRepository->delete($id);
    header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/role/role-list.php');
}
?>