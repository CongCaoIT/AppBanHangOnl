<?php
include "connect.php";
$token = $_POST['token'];
$iddonhang = $_POST['id'];

$query = "UPDATE `donhang` SET `zalopaytoken` ='$token' WHERE `id`= '{$iddonhang}'";
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