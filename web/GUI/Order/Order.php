<section class="wrapper">
    <div class="table-agile-info">
        <div class="panel panel-default">
            <div class="panel-heading">
                Đơn Hàng
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

            // Tạo câu truy vấn SQL để lấy dữ liệu từ bảng chi tiết đơn hàng và sản phẩm
            $sql = "SELECT donhang.id, donhang.iduser, donhang.diachi, donhang.sodienthoai, donhang.email, chitietdonhang.soluong, chitietdonhang.gia, sanpham.TenSP, donhang.tongtien 
        FROM donhang 
        INNER JOIN chitietdonhang ON donhang.id = chitietdonhang.iddonhang 
        INNER JOIN sanpham ON chitietdonhang.idsp = sanpham.MaSP
        ORDER BY donhang.id";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $previous_id = null;
                $total_price = 0;
            ?>
                <div style="text-align: center !important;">
                    <table class="table" ui-jq="footable" ui-options="">
                        <thead>
                            <tr>
                                <th style="text-align: center !important;" data-breakpoints="xs">Mã hóa đơn</th>
                                <th style="text-align: center !important;">Mã khách hàng</th>
                                <th style="text-align: center !important;">Địa chỉ</th>
                                <th style="text-align: center !important;">Điện thoại</th>
                                <th style="text-align: center !important;">Email</th>
                                <th style="text-align: center !important;">Tên sản phẩm</th>
                                <th style="text-align: center !important;">Số lượng</th>
                                <th style="text-align: center !important;">Giá</th>
                                <th style="text-align: center !important;">Tồng tiền hóa đơn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while ($row = $result->fetch_assoc()) {
                                if ($previous_id !== $row["id"]) {
                                    // In thông tin chung của đơn hàng nếu là đơn hàng mới
                            ?>
                                    <tr data-expanded="true">
                                        <td><?php echo $row["id"]; ?></td>
                                        <td><?php echo $row["iduser"]; ?></td>
                                        <td style="text-align: left;"><?php echo $row["diachi"]; ?></td>
                                        <td><?php echo $row["sodienthoai"]; ?></td>
                                        <td><?php echo $row["email"]; ?></td>
                                        <td style="text-align: left;"><?php echo $row["TenSP"]; ?></td>
                                        <td><?php echo $row["soluong"]; ?></td>
                                        <td style="text-align: right;"><?php echo number_format($row["gia"], 0, ',', '.') . ' VND'; ?></td>
                                        <td style="color: red; text-align: right; font-size: 16px;"><?php echo number_format($row["tongtien"], 0, ',', '.') . ' VND'; ?></td>
                                    </tr>
                                <?php
                                    // Cập nhật lại mã hóa đơn trước đó
                                    $previous_id = $row["id"];
                                } else {
                                    // In thông tin sản phẩm nếu là sản phẩm trong cùng đơn hàng
                                ?>
                                    <tr data-expanded="true">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: left;"><?php echo $row["TenSP"]; ?></td>
                                        <td><?php echo $row["soluong"]; ?></td>
                                        <td style="text-align: right"><?php echo number_format($row["gia"], 0, ',', '.') . ' VND'; ?></td>
                                    </tr>
                            <?php
                                }
                                // Cập nhật tổng tiền cho mỗi đơn hàng
                                $total_price += $row["soluong"] * $row["gia"];
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7" style="text-align:right;">Tổng tiền:</td>
                                <td style="color: red; font-size: 20px;"><?php echo number_format($total_price, 0, ',', '.') . ' VND'; ?></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            <?php
            } else {
                echo "0 results";
            }

            // Đóng kết nối
            $conn->close();
            ?>

        </div>
    </div>
</section>