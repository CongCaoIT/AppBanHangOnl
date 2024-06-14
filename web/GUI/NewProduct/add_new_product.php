<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm</title>
    <!-- Bao gồm các thư viện CSS của bạn ở đây -->
    <link rel="stylesheet" href="path_to_your_css_file.css">
</head>

<body>
    <section class="wrapper">
        <div class="form-w3layouts">
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Thêm sản phẩm
                            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
                                <a class="fa fa-cog" href="javascript:;"></a>
                                <a class="fa fa-times" href="javascript:;"></a>
                            </span>
                        </header>
                        <div class="panel-body">
                            <?php
                            $servername = "localhost";
                            $username = "root";
                            $password = "";
                            $dbname = "dataappbanhangonl";

                            $conn = new mysqli($servername, $username, $password, $dbname);

                            if ($conn->connect_error) {
                                die("Connection failed: " . $conn->connect_error);
                            }

                            if (isset($_POST['add'])) {
                                $productName = $_POST['productName'];
                                $productPrice = $_POST['productPrice'];
                                $productDescription = $_POST['productDescription'];
                                $productCategory = $_POST['productCategory'];
                                $productLink = $_POST['productLink'];
                                $anh = $_FILES['productImage']['name'];

                                // Handle image upload
                                if (!empty($_FILES['productImage']['name'])) {
                                    $targetDir = "../../../banhang/images/";
                                    $targetFile = $targetDir . basename($_FILES['productImage']['name']);
                                    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
                                    $uploadOk = 1;

                                    // Check if image file is a actual image or fake image
                                    $check = getimagesize($_FILES['productImage']['tmp_name']);
                                    if ($check !== false) {
                                        $uploadOk = 1;
                                    } else {
                                        echo "<p class='text-danger'>File is not an image.</p>";
                                        $uploadOk = 0;
                                    }

                                    // Check file size
                                    if ($_FILES['productImage']['size'] > 500000) {
                                        echo "<p class='text-danger'>Sorry, your file is too large.</p>";
                                        $uploadOk = 0;
                                    }

                                    // Allow certain file formats
                                    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
                                        echo "<p class='text-danger'>Sorry, only JPG, JPEG, PNG & GIF files are allowed.</p>";
                                        $uploadOk = 0;
                                    }

                                    // Check if $uploadOk is set to 0 by an error
                                    if ($uploadOk == 0) {
                                        echo "<p class='text-danger'>Sorry, your file was not uploaded.</p>";
                                    } else {
                                        if (move_uploaded_file($_FILES['productImage']['tmp_name'], $targetFile)) {
                                            $productImage = basename($_FILES['productImage']['name']);
                                        } else {
                                            echo "<p class='text-danger'>Sorry, there was an error uploading your file.</p>";
                                        }
                                    }
                                }

                                $insertSql = "
                                INSERT INTO `sanpham` (`TenSP`, `GiaSP`, `HinhAnh`, `MoTa`, `Loai`, `LinkVideo`)
                                VALUES ('$productName', '$productPrice', '$productImage', '$productDescription', '$productCategory', '$productLink')
                            ";

                                if ($conn->query($insertSql) === TRUE) {
                                    echo "<p class='text-success'>Thêm sản phẩm thành công.</p>";
                                    echo "<script>window.location.href = '../_LayoutView/LayoutView.php?act=Product';</script>";
                                } else {
                                    echo "<p class='text-danger'>Lỗi khi thêm sản phẩm: " . $conn->error . "</p>";
                                }
                            }

                            $conn->close();
                            ?>
                            <form action="" method="POST" enctype="multipart/form-data" class="container">
                                <div class="form-group">
                                    <label for="productName">Tên Sản Phẩm:</label>
                                    <input type="text" class="form-control" id="productName" name="productName" required>
                                </div>
                                <div class="form-group">
                                    <label for="productPrice">Giá Sản Phẩm:</label>
                                    <input type="text" class="form-control" id="productPrice" name="productPrice" required>
                                </div>
                                <div class="form-group">
                                    <label for="productImage">Đường Dẫn Hình Ảnh:</label><br>
                                    <input type="file" class="form-control" id="productImage" name="productImage"><br>
                                </div>
                                <div class="form-group">
                                    <label for="productDescription">Mô Tả:</label>
                                    <textarea style="height: 200px;" class="form-control" id="productDescription" name="productDescription" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="productCategory">Loại:</label>
                                    <select class="form-control" id="productCategory" name="productCategory" required>
                                        <option value="1">Điện thoại</option>
                                        <option value="2">LapTop</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="productLink">Link Video Youtube:</label>
                                    <input type="text" class="form-control" id="productLink" name="productLink"><br>
                                </div>
                                <button type="submit" class="btn btn-primary" name="add">Thêm sản phẩm</button>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
            <!-- page end-->
        </div>
    </section>
    <!-- Bao gồm các thư viện JS của bạn ở đây -->
    <script src="path_to_your_js_file.js"></script>
</body>

</html>