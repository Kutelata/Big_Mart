<?php include_once './../../services/controller/CheckLoginController.php'; ?>
<?php include_once './../common/header.php' ?>
<?php
include_once '../../services/api/repository/ProductRepository.php';
if (isset($_REQUEST['id'])) {
    $id = $_REQUEST['id'];
    $productRepository = new ProductRepository();
    $productData = $productRepository->getById($id);
}
?>
<?php include_once '../../services/api/repository/CategoryRepository.php';
$categoryRepository = new CategoryRepository();
$categoryList = $categoryRepository->getAll();
foreach ($categoryList as $key => $category) {
    if ($category['status'] != 1) {
        unset($categoryList[$key]);
    }
}
?>
<?php include_once '../../services/api/repository/ProviderRepository.php';
$providerRepository = new ProviderRepository();
$providerList = $providerRepository->getAll();
foreach ($providerList as $key => $provider) {
    if ($provider['status'] != 1) {
        unset($providerList[$key]);
    }
}
?>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <?php include_once './../common/side-bar.php'; ?>
        <div class="layout-page">
            <?php include_once './../common/nav-bar.php'; ?>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4">Edit Product
                        <a href="product-list.php" class="btn btn-primary">Back</a>
                    </h4>
                    <div class="row">
                        <div class="col-xl">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="../../services/controller/ProductController.php?action=update"
                                          method="POST" enctype="multipart/form-data">
                                        <input type="hidden" class="form-control" id="id" name="id"
                                               value="<?= $productData['id'] ?>"/>
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Name</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                   value="<?= $productData['name'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="quantity">Quantity</label>
                                            <input type="text" class="form-control" id="quantity" name="quantity"
                                                   value="<?= $productData['quantity'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="price">Price</label>
                                            <input type="text" class="form-control" id="price" name="price"
                                                   value="<?= $productData['price'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="point">Point</label>
                                            <input type="text" class="form-control" id="point" name="point"
                                                   value="<?= $productData['point'] ?>"/>
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Status</label>
                                            <select class="form-select form-select-lg mb-3" name="status">
                                                <?php if ($productData['status'] == 1) : ?>
                                                    <option value="1" selected>Active</option>
                                                    <option value="2">Inactive</option>
                                                <?php else: ?>
                                                    <option value="1">Active</option>
                                                    <option value="2" selected>Inactive</option>
                                                <?php endif; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="category" class="form-label">Category</label>
                                            <select class="form-select form-select-lg mb-3" name="category_id">
                                                <?php foreach ($categoryList as $category) : ?>
                                                    <?php if ((int)$productData['category_id']['id'] == (int)$category['id']) : ?>
                                                        <option value="<?= $category['id'] ?>"
                                                                selected><?= $category['name'] ?></option>
                                                    <?php else: ?>
                                                        <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="provider" class="form-label">Provider</label>
                                            <select class="form-select form-select-lg mb-3" name="provider_id">
                                                <?php foreach ($providerList as $provider) : ?>
                                                    <?php if ((int)$productData['provider_id']['id'] == (int)$provider['id']) : ?>
                                                        <option value="<?= $provider['id'] ?>"
                                                                selected><?= $provider['name'] ?></option>
                                                    <?php else: ?>
                                                        <option value="<?= $provider['id'] ?>"><?= $provider['name'] ?></option>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="description">Description</label>
                                            <input type="text" class="form-control" id="description"
                                                   value="<?= $productData['description'] ?>" name="description"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="image">Image</label>
                                            <input type="file" class="form-control" id="image"
                                                   name="image"/>
                                            <input type="hidden" name="old-image"
                                                   value="<?= $productData['image'] ?>"/>
                                            <img src="../../../BigMartImage/Product/<?= $productData['image'] ?>"
                                                 width="200" height="300">
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
<script src="./../assets/vendor/libs/jquery/jquery.js"></script>
<script src="./../assets/vendor/libs/popper/popper.js"></script>
<script src="./../assets/vendor/js/bootstrap.js"></script>
<script src="./../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="./../assets/vendor/js/menu.js"></script>
<script src="./../assets/js/main.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
