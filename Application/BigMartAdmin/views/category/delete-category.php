<?php
include_once './../../services/controller/CheckLoginController.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $categoryRepository = new CategoryRepository();
    $categoryRepository->delete($id);
    header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/category-list.php');
}
?>