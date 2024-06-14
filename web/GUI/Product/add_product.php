<section class="wrapper">
    <div class="form-w3layouts">
        <!-- page start-->
        
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading">
                        Form validations
                        <span class="tools pull-right">
                            <a class="fa fa-chevron-down" href="javascript:;"></a>
                            <a class="fa fa-cog" href="javascript:;"></a>
                            <a class="fa fa-times" href="javascript:;"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                        <div class="form">

                            <form class="cmxform form-horizontal" id="commentForm" method="post">

                                <div class="form-group">
                                    <label for="MaSP" class="control-label col-lg-3">Mã Sản Phẩm</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="MaSP" type="text" name="MaSP" required="" readonly>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="TenSP" class="control-label col-lg-3">Tên Sản Phẩm</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="TenSP" type="text" name="TenSP" required="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="HinhAnh" class="control-label col-lg-3">Hình Ảnh</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="HinhAnh" type="text" name="HinhAnh" required="" onchange="changeImage()">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-lg-offset-3 col-lg-6">
                                        <img id="previewImage" src="" alt="Preview Image" style="max-width: 100px; max-height: 100px;">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-lg-offset-3 col-lg-6">
                                        <button class="btn btn-primary" type="submit">Save</button>
                                        <button class="btn btn-default" type="button">Cancel</button>
                                    </div>
                                </div>
                                <?php
                                    // Kiểm tra xem có dữ liệu được gửi từ form hay không
                                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                        // Nhận dữ liệu từ form
                                        $MaSP = $_POST['MaSP'];
                                        $TenSP = $_POST['TenSP'];
                                        $HinhAnh = $_POST['HinhAnh'];

                                        // Thực hiện kết nối đến cơ sở dữ liệu
                                        $servername = "localhost";
                                        $db_username = "root";
                                        $password = "";
                                        $dbname = "dataappbanhangonl";

                                        $conn = new mysqli($servername, $db_username, $password, $dbname);

                                        // Kiểm tra kết nối
                                        if ($conn->connect_error) {
                                            die("Connection failed: " . $conn->connect_error);
                                        }

                                        // Chuẩn bị câu lệnh SQL để thêm sản phẩm vào cơ sở dữ liệu
                                        $sql = "INSERT INTO `sanpham`(`MaSP`, `TenSP`, `HinhAnh`)
                                                VALUES ('$MaSP','$TenSP','$HinhAnh')";

                                        // Thực hiện câu lệnh SQL
                                        if ($conn->query($sql) === TRUE) {
                                            echo "<center><p class='text-success'>Thêm sản phẩm thành công.</p></center>";
                                            echo "<script>window.location.href = '?act=AddProduct';</script>";
                                        } else {
                                            echo "<center><p class='text-danger'>Lỗi khi thêm sản phẩm: " . $conn->error . "</p></center>";
                                            echo "<script>window.location.href = '?act=AddProduct';</script>";
                                        }

                                        // Đóng kết nối
                                        $conn->close();
                                    }
                                ?>
                            </form>

                            <script>
                                function changeImage() {
                                    var imageUrl = document.getElementById("HinhAnh").value;
                                    document.getElementById("previewImage").src = imageUrl;
                                }
                            </script>

                        </div>

                    </div>
                </section>
            </div>
        </div>
        
        <!-- page end-->
    </div>
</section>
