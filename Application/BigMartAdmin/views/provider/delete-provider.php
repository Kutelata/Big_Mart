<?php
include_once './../../services/controller/CheckLoginController.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $providerRepository = new ProviderRepository();
    $providerRepository->delete($id);
    header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/provider/provider-list.php');
}
?>