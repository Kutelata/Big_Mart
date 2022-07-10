<?php include_once './../services/controller/CheckLoginController.php'; ?>
<?php
$userData = $_SESSION['data'];
?>
<?php include_once './common/header.php' ?>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <?php include_once './common/side-bar.php'; ?>
        <div class="layout-page">
            <?php include_once './common/nav-bar.php'; ?>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4">Edit user</h4>
                    <div class="row">
                        <?php if (isset($_GET['update']) && $_GET['update'] == 1) : ?>
                            <div class="mb-3">
                                <div class="alert alert-success" role="alert">Update successfully!!!</div>
                            </div>
                        <?php elseif (isset($_GET['update']) && $_GET['update'] == 0) : ?>
                            <div class="mb-3">
                                <div class="alert alert-danger" role="alert">Update fail!!!</div>
                            </div>
                        <?php endif; ?>
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="../services/controller/UserController.php?action=selfUpdate"
                                          method="POST" enctype="multipart/form-data" id="self-update">
                                        <input type="hidden" class="form-control" id="id" name="id"
                                               value="<?= $userData['id'] ?>"/>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Account</label>
                                            <input type="text" class="form-control" id="account" name="account"
                                                   value="<?= $userData['account'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Name</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                   value="<?= $userData['name'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="image">Image</label>
                                            <input type="file" class="form-control" id="image"
                                                   name="image"/>
                                            <input type="hidden" name="old-image"
                                                   value="<?= $userData['image'] ?>"/>
                                            <img src="../../BigMartImage/User/<?= $userData['image'] ?>"
                                                 width="200" height="200">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">New Password</label>
                                            <input type="password" class="form-control" id="new_password"
                                                   name="new_password"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Password Confirmation</label>
                                            <input type="password" class="form-control" id="password_confirmation"
                                                   name="password_confirmation"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Your Password (*)</label>
                                            <input type="password" class="form-control" id="your_password"
                                                   name="your_password"/>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<script src="./assets/vendor/libs/jquery/jquery.js"></script>
<script src="./assets/vendor/libs/jquery/jquery.validate.min.js"></script>
<script src="./assets/vendor/libs/popper/popper.js"></script>
<script src="./assets/vendor/js/bootstrap.js"></script>
<script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="./assets/vendor/js/menu.js"></script>
<script src="./assets/js/main.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script>
    $(document).ready(function () {
        $("#self-update").validate({
            rules: {
                your_password: {
                    required: true
                },
                account: {
                    required: true
                },
                name: {
                    required: true
                },
                new_password: {
                    required: false,
                    rangelength: [5, 16]
                },
                password_confirmation: {
                    required: false,
                    equalTo: "#new_password"
                }
            },
            messages: {
                your_password: {
                    required: "Please enter your password!"
                },
                account: {
                    required: "Please enter your account!"
                },
                name: {
                    required: "Please enter your name!",
                },
                new_password: {
                    rangelength: "Your password must be between 5 and 16 characters!"
                },
                password_confirmation: {
                    equalTo: "Please enter the same password as above!"
                }
            },
        });
    });
</script>
</body>
</html>
