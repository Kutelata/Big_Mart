<?php include_once './../../services/controller/CheckLoginController.php'; ?>
<?php include_once '../../services/api/repository/CustomerRepository.php'; ?>
<?php
$customerRepository = new CustomerRepository();
$customerList = $customerRepository->getAll();
$nameValue = isset($_GET['name']) ? $_GET['name'] : '';
$emailValue = isset($_GET['email']) ? $_GET['email'] : '';
$phoneValue = isset($_GET['phone']) ? $_GET['phone'] : '';
$idValue = isset($_GET['id']) ? $_GET['id'] : '';
$statusValue = isset($_GET['status']) ? $_GET['status'] : '';
$genderValue = isset($_GET['gender']) ? $_GET['gender'] : '';
if ($nameValue) {
    foreach ($customerList as $key => $customer) {
        if (strpos($customer['name'], $nameValue) === false) {
            unset($customerList[$key]);
        }
    }
}
if ($idValue) {
    foreach ($customerList as $key => $customer) {
        if ($customer['id'] != $idValue) {
            unset($customerList[$key]);
        }
    }
}
if ($statusValue) {
    foreach ($customerList as $key => $customer) {
        if ($customer['status'] != $statusValue) {
            unset($customerList[$key]);
        }
    }
}
if ($genderValue) {
    foreach ($customerList as $key => $customer) {
        if ($customer['gender'] != $statusValue) {
            unset($customerList[$key]);
        }
    }
}
if ($emailValue) {
    foreach ($customerList as $key => $customer) {
        if (strpos($customer['email'], $emailValue) === false) {
            unset($customerList[$key]);
        }
    }
}
if ($phoneValue) {
    foreach ($customerList as $key => $customer) {
        if (strpos($customer['phone'], $phoneValue) === false) {
            unset($customerList[$key]);
        }
    }
}
$customerCount = count($customerList);
$itemPerPage = isset($_GET['item']) ? (int)$_GET['item'] : 5;
$page = ceil($customerCount / $itemPerPage);
$currentPage = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$currentPage = $currentPage > $page || $currentPage <= 1 ? 1 : $currentPage;
$offSet = $itemPerPage * ($currentPage - 1);

if ($customerCount > $itemPerPage) {
    $customerList = array_slice($customerList, $offSet, $itemPerPage, true);
}
$prePage = $currentPage > 1 ? $currentPage - 1 : false;
$nextPage = $itemPerPage < $customerCount && $currentPage < $page ? $currentPage + 1 : false;
?>
<?php include_once './../common/header.php' ?>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <?php include_once './../common/side-bar.php'; ?>
        <div class="layout-page">
            <?php include_once './../common/nav-bar.php'; ?>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span>Customers</span></h4>
                    <div class="card">
                        <h5 class="card-header"><?= $customerCount . ' records found' ?></h5>
                        <div class="container">
                            <form id="search" method="POST">
                                <div class="mb-3">
                                    <label for="id" class="form-label">Id</label>
                                    <input type="text" class="form-control" name="id" value="<?= $idValue ?>">
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="name" value="<?= $nameValue ?>">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="text" class="form-control" name="email"
                                           value="<?= $emailValue ?>">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" class="form-control" name="phone"
                                           value="<?= $phoneValue ?>">
                                </div>
                                <div class="mb-3">
                                    <label for="gender" class="form-label">Gender</label>
                                    <select class="form-select form-select-lg mb-3" name="status">
                                        <?php if ($genderValue == 1) {
                                            echo '<option></option><option value="1" selected>Male</option><option value="2">Female</option>';
                                        } else if ($genderValue == 2) {
                                            echo '<option></option><option value="1">Male</option><option value="2" selected>Female</option>';
                                        } else {
                                            echo '<option selected></option><option value="1">Male</option><option value="2">Female</option>';
                                        } ?>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-select form-select-lg mb-3" name="status">
                                        <?php if ($statusValue == 1) {
                                            echo '<option></option><option value="1" selected>Active</option><option value="2">Inactive</option>';
                                        } else if ($statusValue == 2) {
                                            echo '<option></option><option value="1">Active</option><option value="2" selected>Inactive</option>';
                                        } else {
                                            echo '<option selected></option><option value="1">Active</option><option value="2">Inactive</option>';
                                        } ?>
                                    </select>
                                </div>
                                <a id="reset" class="btn btn-gray">Reset</a>
                                <button type="submit" class="btn btn-primary">Apply</button>
                            </form>
                        </div>
                        <div class="container paging-group">
                            <div class="input-group my-data--in-page" style="width: 100px">
                                <input type="text" class="form-control" value="<?= $itemPerPage ?>" id="item-per-page">
                                <div class="dropdown">
                                    <button class="my-btn__dropdown--group btn btn-secondary dropdown-toggle"
                                            type="button" id="dropdownItemPerPage" data-bs-toggle="dropdown"></button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownItemPerPage">
                                        <li><a class="dropdown-item item-per-page" data-value="5">5</a></li>
                                        <li><a class="dropdown-item item-per-page" data-value="10">10</a></li>
                                        <li><a class="dropdown-item item-per-page" data-value="20">20</a></li>
                                        <li><a class="dropdown-item item-per-page" data-value="50">50</a></li>
                                        <li><a class="dropdown-item item-per-page" data-value="100">100</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="my-input-group">
                                <?php if ($prePage) { ?>
                                    <button id="pre-page" data-value="<?= $prePage ?>" class="btn btn-danger">
                                        <
                                    </button>
                                <?php } ?>
                                <input type="text" class="form-control" value="<?= $currentPage ?>" id="page">
                                <span><?= 'of ' . $page ?></span>
                                <?php if ($nextPage) { ?>
                                    <button id="next-page" data-value="<?= $nextPage ?>" class="btn btn-danger">>
                                    </button>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Birthday</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <?php foreach ($customerList as $customer) { ?>
                                    <tr>
                                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
                                            <strong><?= $customer['id'] ?></strong>
                                        </td>
                                        <td><?= $customer['name'] ?></td>
                                        <td>
                                            <?php if ($customer['gender'] == 1) : ?>
                                                <span class="badge bg-label-primary me-1">Male</span>
                                            <?php else : ?>
                                                <span class="badge bg-label-success me-1">Female</span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?= $customer['birthday'] ?></td>
                                        <td><?= $customer['phone'] ?></td>
                                        <td><?= $customer['address'] ?></td>
                                        <td><?= $customer['email'] ?></td>
                                        <td>
                                            <?php if ($customer['status'] == 1) : ?>
                                                <span class="badge bg-label-primary me-1">Active</span>
                                            <?php else : ?>
                                                <span class="badge bg-label-success me-1">Inactive</span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                        data-bs-toggle="dropdown">
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item"
                                                       href="../../services/controller/CustomerController.php?action=getById&id=<?= $customer['id'] ?>">
                                                        <i class="bx bx-edit-alt me-1"></i> Edit</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
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
<script>
    $(document).ready(function () {
        var queryParams = new URLSearchParams(window.location.search);
        queryParams.set("page", $('#page').val());
        history.replaceState(null, null, "?" + queryParams.toString());
        $('#search').on('submit', function (e) {
            e.preventDefault();
            var data = $(this).serializeArray();
            $.each(data, function (key, val) {
                queryParams.set(val.name, val.value);
            });
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('#reset').on('click', function (e) {
            e.preventDefault();
            queryParams.set('id', '');
            queryParams.set('name', '');
            queryParams.set('email', '');
            queryParams.set('status', '');
            queryParams.set('phone', '');
            queryParams.set('gender', '');
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('#page').on('change', function () {
            var page = this.value;
            if (!page || Math.floor(page) != page || !$.isNumeric(page)) {
                page = 1;
            }
            queryParams.set("page", page);
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('#pre-page').on('click', function (e) {
            e.preventDefault();
            var page = $(this).data('value');
            if (!page || Math.floor(page) != page || !$.isNumeric(page)) {
                page = 1;
            }
            queryParams.set("page", page);
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('#next-page').on('click', function (e) {
            e.preventDefault();
            var page = $(this).data('value');
            if (!page || Math.floor(page) != page || !$.isNumeric(page)) {
                page = 1;
            }
            queryParams.set("page", page);
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('#item-per-page').on('change', function () {
            var item = this.value;
            if (!item || Math.floor(item) != item || !$.isNumeric(item)) {
                item = 10;
            }
            queryParams.set("item", item);
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
        $('.item-per-page').on('click', function () {
            var item = $(this).data('value');
            if (!item || Math.floor(item) != item || !$.isNumeric(item)) {
                item = 10;
            }
            queryParams.set("item", item);
            history.replaceState(null, null, "?" + queryParams.toString());
            window.location.href = window.location.href;
        });
    })
</script>
</body>
</html>