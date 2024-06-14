<section class="wrapper">
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                User
            </div>

            <?php
            // Thông tin kết nối đến CSDL
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "dataappbanhangonl"; // Thay tên CSDL của bạn vào đây

            // Tạo kết nối đến CSDL
            $conn = new mysqli($servername, $username, $password, $dbname);

            // Kiểm tra kết nối
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Tạo câu truy vấn SQL để lấy dữ liệu từ bảng người dùng
            $sql = "SELECT id, email, pass, username, mobile, SUBSTRING(token, 1, 10) as short_token, status FROM user";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
            ?>
                <div style="text-align: center !important;">
                    <table class="table" ui-jq="footable" ui-options="">
                        <thead>
                            <tr>
                                <th style="text-align: center !important;" data-breakpoints="xs">Mã khách hàng</th>
                                <th style="text-align: center !important;">Email</th>
                                <th style="text-align: center !important;">Tên đăng nhập</th>
                                <th style="text-align: center !important;">Điện thoại</th>
                                <th style="text-align: center !important;">Quyền</th>
                                <th style="text-align: center !important;">Hoạt động</th> <!-- Thêm cột action -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr data-expanded="true">
                                    <td><?php echo $row["id"]; ?></td>
                                    <td style="text-align: left;"><?php echo $row["email"]; ?></td>
                                    <td style="text-align: left;"><?php echo $row["username"]; ?></td>
                                    <td><?php echo $row["mobile"]; ?></td>
                                    <td><?php echo $row["status"] == 1 ? "Admin" : "Khách hàng"; ?></td>
                                    <td>
                                        <a href="../../Layout/_LayoutView/LayoutView.php?act=AddUser&id=<?php echo $row['id'] ?>" class="btn btn-primary btn-sm">Cấp quyền</a>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            <?php
            } else {
                echo "0 results";
            }

            // Đóng kết nối
            $conn->close();
            ?>

            <script>
                function editUser(UserId) {
                    window.location.href = "../../User/edit_user.php?id=" + UserId;
                }

                function deleteUser(UserId) {
                    window.location.href = "../../User/delete_user.php?id=" + UserId;
                }
            </script>

        </div>
    </div>
</section>