<?php

include_once 'Controller.php';
include_once '../api/repository/ProductRepository.php';

class ProductController extends Controller
{
    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/delete-product.php?id=' . $id);
        }
    }

    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/edit-product.php?id=' . $id);
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
                'provider_id' => (int)$_POST['provider_id'],
                'quantity' => (int)$_POST['quantity'],
                'price' => (float)$_POST['price'],
                'saleable_qty' => (int)$_POST['quantity'],
                'status' => (int)$_POST['status'],
                'point' => (int)$_POST['point'],
                'description' => $_POST['description'],
                'created_at' => date("Y-m-d"),
            ];
            $productRepository = new ProductRepository();
            $productRepository->create($data);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/product-list.php');
        }
    }

    public function execute()
    {
        if (isset($_REQUEST['action'])) {
            $action = $_REQUEST['action'];
            $this->$action();
        }
    }

    public function update()
    {
        $id = $_POST['id'] ?? '';
        if (!$_FILES['image']['name']
            && !$_FILES['image']['type']
            && !$_FILES['image']['tmp_name']
            && !$_FILES['image']['size']
            && isset($_POST['old-image'])
        ) {
            $image = $_POST['old-image'];
        } else {
            $image = $this->uploadFile();
        }

        if ($id) {
            if (isset($_POST['name'])) {
                $data = [
                    'name' => $_POST['name'],
                    'image' => $image,
                    'category_id' => (int)$_POST['category_id'],
                    'provider_id' => (int)$_POST['provider_id'],
                    'quantity' => (int)$_POST['quantity'],
                    'price' => (float)$_POST['price'],
                    'point' => (int)$_POST['point'],
                    'status' => (int)$_POST['status'],
                    'description' => $_POST['description'],
                    'updated_at' => date("Y-m-d"),
                ];
                $productRepository = new ProductRepository();
                $productRepository->update($id, $data);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/product-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/product/product-list.php');
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