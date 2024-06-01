<?php
include "connect.php";
$email = $_GET["email"];
$username = $_GET["username"];
$mobile = $_GET["mobile"];
$ImageUser = $_GET["ImageUser"];

//check data - 2001210289 - Huỳnh Công Huy - Bài 41
$query = "UPDATE `user` SET `username`='$username', `mobile`='$mobile', `ImageUser`='$ImageUser' WHERE `email` = '$email'";
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
