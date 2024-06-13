<?php
include "connect.php";
$id = $_POST['MaSP'];
$query = "UPDATE `sanpham` SET `DaXoa` = 1 WHERE `MaSP` = '$id'";
$data = mysqli_query($conn, $query);

if ($data == true) {
    $arr = [
        'succes' => true,
        'message' => "Xóa thành công"
    ];
} else {
    $arr = [
        'succes' => false,
        'message' => "Xóa không thành công"
    ];
}

print_r(json_encode($arr));
