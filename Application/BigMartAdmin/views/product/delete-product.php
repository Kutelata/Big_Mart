<?php
include_once './../../services/controller/CheckLoginController.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $productRepository = new ProductRepository();
    $productRepository->delete($id);
    header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/product-list.php');
}
?>