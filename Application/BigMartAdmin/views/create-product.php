<?php include_once './../services/controller/CheckLoginController.php'; ?>
<?php include_once './common/header.php' ?>
<?php
include_once './../services/api/UnitRepository.php';
$unitRepository = new UnitRepository();
$unitList = $unitRepository->getAllUnits();
?>
<?php include_once './../services/api/CategoryRepository.php';
$categoryRepository = new CategoryRepository();
$categoryList = $categoryRepository->getAllCategories();
?>
<?php include_once './../services/api/ProviderRepository.php';
$providerRepository = new ProviderRepository();
$providerList = $providerRepository->getAllProviders();
?>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <?php include_once './common/side-bar.php'; ?>
        <div class="layout-page">
            <?php include_once './common/nav-bar.php'; ?>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4">Create Product
                        <a href="product-list.php" class="btn btn-primary">Back</a>
                    </h4>
                    <div class="row">
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="../services/controller/ProductController.php?action=create"
                                          method="POST" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Name</label>
                                            <input type="text" class="form-control" id="name" name="name"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="quantity">Quantity</label>
                                            <input type="text" class="form-control" id="quantity" name="quantity"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="price">Price</label>
                                            <input type="text" class="form-control" id="price" name="price"/>
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Status</label>
                                            <select class="form-select form-select-lg mb-3" name="status">
                                                <option value="1">Active</option>
                                                <option value="2">Inactive</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Category</label>
                                            <select class="form-select form-select-lg mb-3" name="category_id">
                                                <?php foreach ($categoryList as $category) : ?>
                                                    <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Unit</label>
                                            <select class="form-select form-select-lg mb-3" name="unit_id">
                                                <?php foreach ($unitList as $unit) : ?>
                                                    <option value="<?= $unit['id'] ?>"><?= $unit['name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Provider</label>
                                            <select class="form-select form-select-lg mb-3" name="provider_id">
                                                <?php foreach ($providerList as $provider) : ?>
                                                    <option value="<?= $provider['id'] ?>"><?= $provider['name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="description">Description</label>
                                            <input type="text" class="form-control" id="description"
                                                   name="description"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="image">Image</label>
                                            <input type="file" class="form-control" id="image"
                                                   name="image"/>
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
