<?php

include_once 'Controller.php';
include_once '../api/ProductRepository.php';

class ProductController extends Controller
{
    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $productRepository = new ProductRepository();
            $productRepository->deleteProduct($id);
        }
    }

    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $productRepository = new ProductRepository();
            echo '<pre>';
            var_dump($productRepository->getProductById($id));
            echo '</pre>';
            die;
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $image = $this->uploadFile();
            $data = [
                'name' => $_POST['name'],
                'image' => $image,
                'category_id' => (int)$_POST['category_id'],
                'unit_id' => (int)$_POST['unit_id'],
                'provider_id' => (int)$_POST['provider_id'],
                'quantity' => (int)$_POST['quantity'],
                'price' => (float)$_POST['price'],
                'saleable_qty' => (int)$_POST['quantity'],
                'status' => (int)$_POST['status'],
                'description' => $_POST['description'],
                'created_at' => date("Y-m-d"),
            ];
            $productRepository = new ProductRepository();
            $productRepository->createProduct($data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product-list.php');
        }
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }

    protected function uploadFile()
    {
        $target_dir = "../../../BigMartImage/Product/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Check if image file is a actual image or fake image
        if (isset($_POST["submit"])) {
            $check = getimagesize($_FILES["image"]["tmp_name"]);
            if ($check !== false) {
                echo "File is an image - " . $check["mime"] . ".";
                $uploadOk = 1;
            } else {
                echo "File is not an image.";
                $uploadOk = 0;
            }
        }

        // Allow certain file formats
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif") {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo "Sorry, your file was not uploaded.";
            // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                echo "The file " . htmlspecialchars(basename($_FILES["image"]["name"])) . " has been uploaded.";
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
        return $_FILES["image"]["name"];
    }
}

$productController = new ProductController();
$productController->execute();