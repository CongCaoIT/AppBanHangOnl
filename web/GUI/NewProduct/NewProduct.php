<section class="wrapper">
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Danh Sách Sản Phẩm Điện thoại
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

            // Tạo câu truy vấn SQL để lấy dữ liệu từ bảng sản phẩm mới
            $sql = "SELECT * FROM sanpham WHERE Loai = 1 AND DaXoa = 0";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
            ?>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Hình</th>
                                <td>Số lượng tồn</td>
                                <th>Mô tả</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <td><?= $row["MaSP"] ?></td>
                                    <td style="width: 200px;"><?= $row["TenSP"] ?></td>
                                    <td style="width: 150px;"><?= number_format($row["GiaSP"], 0, ',', '.') . ' VND' ?></td>
                                    <td>
                                        <?php if (filter_var($row["HinhAnh"], FILTER_VALIDATE_URL)) : ?>
                                            <img src="<?= $row["HinhAnh"] ?>" alt="Product Image" class="img-fluid" style="width: 100px; height: 100px; object-fit: cover;">
                                        <?php else : ?>
                                            <img src="../../../banhang/images/<?php echo $row["HinhAnh"] ?>" alt="Product Image" class="img-fluid" style="width: 100px; height: 100px; object-fit: cover;">
                                        <?php endif; ?>
                                    </td>
                                    <td><?php echo $row["SoLuongTon"] ?></td>
                                    <td><?= $row["MoTa"] ?></td>
                                    <td class="mt-1">
                                        <button class="btn btn-primary btn-sm mb-2 d-block" style="margin-bottom: 20px;" onclick="editNewProduct(<?= $row['MaSP'] ?>)">Sửa</button>
                                        <a class="btn btn-danger btn-sm" href="../../NewProduct/delete_new_product.php?id=<?php echo $row['MaSP'] ?>">Xóa</a>
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
            ?>
                <div class='alert alert-info text-center'>Không có sản phẩm nào.</div>
            <?php
            }

            // Đóng kết nối
            $conn->close();
            ?>

            <!-- Delete Confirmation Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa sản phẩm này không?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function editNewProduct(newProductId) {
                    window.location.href = "../../NewProduct/edit_new_product.php?id=" + newProductId;
                }
            </script>
        </div>
    </div>
</section>