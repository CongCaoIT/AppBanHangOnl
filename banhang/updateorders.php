<?php
include "connect.php";
$id = $_POST['id'];
$trangthai = $_POST['trangthai'];

//check data - 2001210289 - Huỳnh Công Huy - Bài 41
$query = "UPDATE `donhang` SET `trangthai` = '{$trangthai}' WHERE `id` = '{$id}'";

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
