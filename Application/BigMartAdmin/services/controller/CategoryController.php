<?php

include_once 'Controller.php';
include_once '../api/repository/CategoryRepository.php';

class CategoryController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/edit-category.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $categoryRepository = new CategoryRepository();
            $categoryRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/category-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $image = $this->uploadFile();
            $categoryData = [
                'name' => $_POST['name'],
                'status' => (int)$_POST['status'],
                'image' => $image,
            ];
            $categoryRepository = new CategoryRepository();
            $categoryRepository->create($categoryData);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/category-list.php');
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
                $categoryData = [
                    'name' => $_POST['name'],
                    'status' => (int)$_POST['status'],
                    'image' => $image,
                ];
                $categoryRepository = new CategoryRepository();
                $categoryRepository->update($id, $categoryData);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/category-list.php');
            }
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/category/category-list.php');
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
        $target_dir = "../../../BigMartImage/Category/";
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

$categoryController = new CategoryController();
$categoryController->execute();