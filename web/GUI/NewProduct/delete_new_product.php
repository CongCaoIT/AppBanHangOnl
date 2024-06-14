<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa Sản Phẩm</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/style-responsive.css">
    <link rel="stylesheet" href="../../css/font.css">
    <link rel="stylesheet" href="../../css/font-awesome.css">
</head>

<body>
    <section id="container">
        <header class="header fixed-top clearfix">
            <div class="brand">
                <a href="index.html" class="logo">SHOPPING</a>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars"></div>
                </div>
            </div>
            <div class="nav notify-row" id="top_menu">
                <!-- Notifications and messages -->
            </div>
            <div class="top-nav clearfix">
                <!-- User profile and search bar -->
            </div>
        </header>
        <?php
        include("../Layout/SideBar/SidebarStart1.php");
        ?>
        <section id="main-content">
            <section class="wrapper">
                <div class="table-agile-info">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Sản Phẩm
                        </div>
                        <div class="panel-body">
                            <?php
                            if (isset($_GET['id'])) {
                                $productId = $_GET['id'];
                                $servername = "localhost";
                                $username = "root";
                                $password = "";
                                $dbname = "dataappbanhangonl";
                                $conn = new mysqli($servername, $username, $password, $dbname);
                                if ($conn->connect_error) {
                                    die("Connection failed: " . $conn->connect_error);
                                }
                                $sql = "SELECT * FROM sanpham WHERE MaSP = $productId";
                                $result = $conn->query($sql);
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                            ?>
                                        <div class="card">
                                            <?php if (filter_var($row["HinhAnh"], FILTER_VALIDATE_URL)) : ?>
                                                <img src="<?= $row["HinhAnh"] ?>" alt="Product Image" class="img-fluid" style="width: 100px; height: 100px; object-fit: cover;">
                                            <?php else : ?>
                                                <img src="../../banhang/images/<?php echo $row["HinhAnh"] ?>" alt="Product Image" class="img-fluid" style="width: 100px; height: 100px; object-fit: cover;">
                                            <?php endif; ?>
                                            <div class="card-body">
                                                <h5 class="card-title"><?php echo $row["TenSP"]; ?></h5>
                                                <p class="card-text">Mã SP: <?php echo $row["MaSP"]; ?></p>
                                                <p class="card-text">Giá: <?php echo number_format($row["GiaSP"], 0, ',', '.') . ' VND'; ?></p>
                                                <p class="card-text">Mô tả: <?php echo $row["MoTa"]; ?></p>
                                                <p class="card-text">Loại: <?php echo $row["Loai"]; ?></p>
                                                <form action="" method="POST">
                                                    <input type="hidden" name="productId" value="<?php echo $row["MaSP"]; ?>">
                                                    <button type="submit" class="btn btn-danger" name="delete">Xóa</button>
                                                </form>
                                            </div>
                                        </div>
                            <?php
                                    }
                                } else {
                                    echo "<p>Không có sản phẩm nào có id là $productId</p>";
                                }
                                if (isset($_POST['delete'])) {
                                    $productIdToDelete = $_POST['productId'];
                                    $deleteSql = "UPDATE sanpham SET DaXoa = 1 WHERE MaSP = $productIdToDelete";
                                    if ($conn->query($deleteSql) === TRUE) {
                                        echo "<p class='text-success'>Xóa sản phẩm thành công.</p>";
                                        echo "<script>window.location.href = '../Layout/_LayoutView/LayoutView.php?act=NewProduct';</script>";
                                    } else {
                                        echo "<p class='text-danger'>Lỗi khi xóa sản phẩm: " . $conn->error . "</p>";
                                    }
                                }
                                $conn->close();
                            } else {
                                echo "<p>Không có id sản phẩm được cung cấp</p>";
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </section>
            <!-- footer -->
            <div class="footer">
                <div class="wthree-copyright">
                    <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
                </div>
            </div>
            <!-- / footer -->
        </section>
    </section>
    <script src="js/jquery2.0.3.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/jquery.scrollTo.js"></script>
</body>

</html>