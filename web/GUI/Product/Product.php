<section class="wrapper">
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Sản Phẩm
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

            // Tạo câu truy vấn SQL để lấy dữ liệu từ bảng sản phẩm
            $sql = "SELECT * FROM sanpham";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo '<div style="text-align: center !important;">
                                        <table class="table" ui-jq="footable" ui-options="">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center !important;" data-breakpoints="xs">Product Id</th>
                                                    <th style="text-align: center !important;">Product Name</th>
                                                    <th style="text-align: center !important;">Images</th>
                                                    <th style="text-align: center !important;">Actions</th> <!-- Thêm cột chức năng -->
                                                </tr>
                                            </thead>
                                            <tbody>';

                while ($row = $result->fetch_assoc()) {
                    echo '<tr data-expanded="true">
                                            <td>' . $row["MaSP"] . '</td>
                                            <td>' . $row["TenSP"] . '</td>
                                            <td><img src="' . $row["HinhAnh"] . '" style="width: 100px; height: 100px;"></td>
                                            <td>
                                                <button class="btn btn-primary btn-sm" onclick="editProduct(' . $row["MaSP"] . ')">Edit</button> <!-- Nút sửa -->
                                                <button class="btn btn-danger btn-sm" onclick="deleteProduct(' . $row["MaSP"] . ')">Delete</button> <!-- Nút xóa -->
                                            </td>
                                        </tr>';
                }

                echo '</tbody>
                                    </table>
                                    </div>';
            } else {
                echo "0 results";
            }
            ?>

            <script>
                function editProduct(productId) {
                    window.location.href = "../../Product/edit_product.php?id=" + productId;
                }

                function deleteProduct(productId) {
                    window.location.href = "../../Product/delete_product.php?id=" + productId;
                }
            </script>

        </div>
    </div>
</section>