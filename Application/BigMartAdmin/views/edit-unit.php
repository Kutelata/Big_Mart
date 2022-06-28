<?php include_once './../services/controller/CheckLoginController.php'; ?>
<?php
include_once '../services/api/UnitRepository.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $unitRepository = new UnitRepository();
    $data = $unitRepository->getUnitById($id);
}
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
                    <h4 class="fw-bold py-3 mb-4">Edit Unit
                        <a href="unit-list.php" class="btn btn-primary">Back</a>
                    </h4>
                    <div class="row">
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="../services/controller/UnitController.php?action=update"
                                          method="POST" enctype="multipart/form-data">
                                        <input type="hidden" class="form-control" id="id" name="id"
                                               value="<?= $data['id'] ?>"/>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Name</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                   value="<?= $data['name'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="value">Symbol</label>
                                            <input type="text" class="form-control" id="value"
                                                   name="value" value="<?= $data['value'] ?>"/>
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
<script src="./assets/vendor/libs/popper/popper.js"></script>
<script src="./assets/vendor/js/bootstrap.js"></script>
<script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="./assets/vendor/js/menu.js"></script>
<script src="./assets/js/main.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
