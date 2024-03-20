<?php
    include "connect.php";
    $token = $_POST['token'];
    $id = $_POST['id'];

    //check data - 2001210289 - Huỳnh Công Huy - Bài 41
    $query = "UPDATE `user` SET `token`='$token' WHERE `id`= '$id'";
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
?>