<?php
    include "connect.php";
    $id = $_POST['MaSPMoi'];

    //check data - 2001210289 - Huỳnh Công Huy - Bài 39
    $query = "DELETE FROM `sanphammoi` WHERE `MaSPMoi` = '$id'";
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
?>