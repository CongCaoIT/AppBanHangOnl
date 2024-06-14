<section class="wrapper">
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Chi Tiết Đơn Hàng
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

            // Tạo câu truy vấn SQL để lấy dữ liệu từ bảng chi tiết đơn hàng
            $sql = "SELECT * FROM chitietdonhang";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo '<div style="text-align: center !important;">
                                        <table class="table" ui-jq="footable" ui-options="">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center !important;" data-breakpoints="xs">Order Id</th>
                                                    <th style="text-align: center !important;">Product Id</th>
                                                    <th style="text-align: center !important;">Quantity</th>
                                                    <th style="text-align: center !important;">Price</th>
                                                    <th style="text-align: center !important;">Actions</th> <!-- Thêm cột Actions -->
                                                </tr>
                                            </thead>
                                            <tbody>';

                while ($row = $result->fetch_assoc()) {
                    echo '<tr data-expanded="true">
                                            <td>' . $row["iddonhang"] . '</td>
                                            <td>' . $row["idsp"] . '</td>
                                            <td>' . $row["soluong"] . '</td>
                                            <td>' . $row["gia"] . '</td>
                                            <td> <!-- Thêm cột Actions -->
                                                <button class="btn btn-primary btn-sm" onclick="editOrderDetails(' . $row["iddonhang"] . ')">Edit</button> <!-- Nút sửa -->
                                                <br><br>
                                                <button class="btn btn-danger btn-sm" onclick="deleteOrderDetails(' . $row["iddonhang"] . ')">Delete</button> <!-- Nút xóa -->
                                            </td>
                                        </tr>';
                }

                echo '</tbody>
                                    </table>
                                    </div>';
            } else {
                echo "0 results";
            }

            // Đóng kết nối
            $conn->close();
            ?>

            <script>
                function editOrderDetails(Id) {
                    window.location.href = "../../DetailsOrder/edit_order_details.php?id=" + Id;
                }

                function deleteOrderDetails(Id) {
                    window.location.href = "../../DetailsOrder/delete_order_details.php?id=" + Id;
                }
            </script>

        </div>
    </div>
</section>