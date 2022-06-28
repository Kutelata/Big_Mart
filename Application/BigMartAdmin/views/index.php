<?php include_once './../services/controller/CheckLoginController.php' ?>
<?php include_once './common/header.php' ?>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <?php include_once './common/side-bar.php'; ?>
        <div class="layout-page">
            <?php include_once './common/nav-bar.php'; ?>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <?php if (isset($_GET['login']) && $_GET['login'] == 1) : ?>
                            <div class="mb-3">
                                <div class="alert alert-success" role="alert">Login successfully!!!</div>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<script src="./assets/vendor/libs/jquery/jquery.js"></script>
<script src="./assets/vendor/libs/popper/popper.js"></script>
<script src="./assets/vendor/js/bootstrap.js"></script>
<script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="./assets/vendor/js/menu.js"></script>
<script src="./assets/js/main.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>