<section class="wrapper">
    <div class="form-w3layouts">
        <!-- page start-->

        <div class="panel-body">
            <form class="cmxform form-horizontal" id="commentForm" method="post">

                <?php
                // Thực hiện kết nối đến cơ sở dữ liệu và truy vấn dữ liệu người dùng cần chỉnh sửa
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "dataappbanhangonl";

                $conn = new mysqli($servername, $username, $password, $dbname);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $id_to_edit = $_GET['id']; // Lấy ID của người dùng cần chỉnh sửa từ URL

                $sql = "SELECT * FROM user WHERE id = $id_to_edit";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $email = $row['email'];
                    $pass = $row['pass'];
                    $username = $row['username'];
                    $mobile = $row['mobile'];
                    $status = $row['status'];
                } else {
                    echo "0 results";
                }

                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    // Lấy dữ liệu từ form
                    $status = $_POST['status'];

                    // Thực hiện cập nhật vào cơ sở dữ liệu
                    $sql = "UPDATE user SET status='$status' WHERE id='$id_to_edit'";

                    if ($conn->query($sql) === TRUE) {
                        // Trả về mã JavaScript để chuyển hướng
                        echo "<script>window.location.href = '../_LayoutView/LayoutView.php?act=User';</script>";
                    } else {
                        // Trả về thông báo lỗi
                        echo "Lỗi: " . $conn->error;
                    }
                    // Kết thúc quá trình xử lý PHP
                    exit();
                }

                $conn->close();
                ?>

                <section class="wrapper">
                    <div class="form-w3layouts">
                        <!-- page start-->

                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Cấp quyền
                                        <span class="tools pull-right">
                                            <a class="fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="fa fa-cog" href="javascript:;"></a>
                                            <a class="fa fa-times" href="javascript:;"></a>
                                        </span>
                                    </header>
                                    <div class="panel-body">
                                        <form class="" id="commentForm" method="post">
                                            <div class="form-group">
                                                <label for="cemail" class="control-label col-lg-3">E-Mail (required)</label>
                                                <div class="col-lg-6">
                                                    <input class="form-control" id="cemail" type="email" name="email" required="" value="<?php echo $email; ?>" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="cpass" class="control-label col-lg-3">Password (required)</label>
                                                <div class="col-lg-6">
                                                    <input class="form-control" id="cpass" type="password" name="pass" required="" value="<?php echo $pass; ?>" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="cusername" class="control-label col-lg-3">Username</label>
                                                <div class="col-lg-6">
                                                    <input class="form-control" id="cusername" type="text" name="username" value="<?php echo $username; ?>" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="cmobile" class="control-label col-lg-3">Mobile</label>
                                                <div class="col-lg-6">
                                                    <input class="form-control" id="cmobile" type="text" name="mobile" value="<?php echo $mobile; ?>" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-lg-3">Quyền</label>
                                                <div class="col-lg-6">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="status" value="0" <?php if ($status == 0) echo 'checked'; ?>> Khách hàng
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="status" value="1" <?php if ($status == 1) echo 'checked'; ?>> Admin
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-offset-3 col-lg-6">
                                                    <button class="btn btn-primary" type="submit">Lưu</button>
                                                    <button class="btn btn-default" type="button" onclick="window.history.back()">Hủy</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </section>
                            </div>
                        </div>

                        <!-- page end-->
                    </div>
                </section>
            </form>
        </div>

        <!-- page end-->
    </div>
</section>