<?php
include_once './../../services/controller/CheckLoginController.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $userRepository = new UserRepository();
    $userRepository->delete($id);
    header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/user-list.php');
}
?>