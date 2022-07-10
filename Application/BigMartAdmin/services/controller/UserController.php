<?php

include_once 'Controller.php';
include_once '../api/repository/UserRepository.php';

class userController extends Controller
{
    public function getById()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/edit-user.php?id=' . $id);
        }
    }

    public function delete()
    {
        if (isset($_REQUEST['id'])) {
            $id = $_REQUEST['id'];
            $userRepository = new UserRepository();
            $userRepository->delete($id);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/user-list.php');
        }
    }

    public function create()
    {
        if (isset($_POST['name'])) {
            $image = $this->uploadFile();
            $userData = [
                'name' => $_POST['name'],
                'role_id' => $_POST['role_id'],
                'account' => $_POST['account'],
                'password' => md5($_POST['password']),
                'image' => $image,
            ];
            $userRepository = new UserRepository();
            $userRepository->create($userData);
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/user-list.php');
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
                $userData = [
                    'name' => $_POST['name'],
                    'role_id' => $_POST['role_id'],
                    'account' => $_POST['account'],
                    'image' => $image,
                ];
                $userRepository = new UserRepository();
                $userRepository->update($id, $userData);
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/user-list.php');
            }
        }
    }

    public function selfUpdate()
    {
        session_start();
        $id = $_POST['id'] ?? '';
        $password = $_SESSION['data']['password'];
        if ($id && md5($_POST['your_password']) == $password) {
            if (isset($_POST['name'])) {
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

                $userData = [
                    'name' => $_POST['name'],
                    'account' => $_POST['account'],
                    'image' => $image,
                ];

                if ($_POST['new_password'] == $_POST['password_confirmation']) {
                    $userData['password'] = md5($_POST['password_confirmation']);
                    $password = $userData['password'];
                }

                $userRepository = new UserRepository();
                $userRepository->update($id, $userData);
                $_SESSION['data']['name'] = $_POST['name'];
                $_SESSION['data']['account'] = $_POST['account'];
                $_SESSION['data']['image'] = $image;
                $_SESSION['data']['password'] = $password;
                header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/profile.php?update=1');
            }
        } else {
            header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/profile.php?update=0');
        }
    }

    public function index()
    {
        header('Location: ' . $this->getBaseUrl() . '/Big_Mart/Application/BigMartAdmin/views/user/user-list.php');
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
        $target_dir = "../../../BigMartImage/User/";
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

$userController = new UserController();
$userController->execute();