<?php
include "connect.php";
$email = $_POST['email'];
$pass = $_POST['pass'];
$username = $_POST['username'];
$mobile = $_POST['mobile'];
//check data
$query = "SELECT * FROM `user` WHERE `email` = '{$email}'";
$data = mysqli_query($conn, $query);
$numrow = mysqli_num_rows($data);
if ($numrow > 0) {
    $arr = [
        'succes' => false,
        'message' => "Email da ton tai"
    ];
} else {
    //insert
    $query = "INSERT INTO `user`(`email`, `pass`, `username`, `mobile`) VALUES ('{$email}','{$pass}','{$username}','{$mobile}')";

    $data = mysqli_query($conn, $query);

    if ($data == true) {
        $arr = [
            'succes' => true,
            'message' => "thanh cong"
        ];
    } else {
        $arr = [
            'succes' => false,
            'message' => "khong thanh cong"
        ];
    }
}
print_r(json_encode($arr));
