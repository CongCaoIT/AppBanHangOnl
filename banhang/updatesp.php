<?php
include "connect.php";
$tensp = $_POST['tensp'];
$gia = $_POST['gia'];
$hinhanh = $_POST['hinhanh'];
$mota = $_POST['mota'];
$loai = $_POST['loai'];
$id = $_POST['MaSP'];

//check data - 2001210289 - Huỳnh Công Huy - Bài 41
$query = "UPDATE `sanpham` SET `TenSP`='$tensp', `GiaSP`='$gia', `HinhAnh`='$hinhanh', `MoTa`='$mota', `Loai`='$loai' WHERE `MaSP` = '$id'";
$data = mysqli_query($conn, $query);

if ($data == true) {
    $arr = [
        'succes' => true,
        'message' => "Sửa thành công"
    ];
} else {
    $arr = [
        'succes' => false,
        'message' => "Sửa không thành công"
    ];
}

print_r(json_encode($arr));
