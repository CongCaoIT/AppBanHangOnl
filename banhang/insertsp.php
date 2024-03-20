<?php
    include "connect.php";
    $tensp = $_POST['tensp'];
    $gia = $_POST['gia'];
    $hinhanh = $_POST['hinhanh'];
    $mota = $_POST['mota'];
    $loai = $_POST['loai'];

    //check data - 2001210289 - Huỳnh Công Huy - Bài 39
    $query = "INSERT INTO `sanphammoi`(`TenSP`, `GiaSP`, `HinhAnh`, `MoTa`, `Loai`) VALUES ('$tensp', $gia, '$hinhanh', '$mota', $loai)";
    $data = mysqli_query($conn, $query);

    if ($data == true) {
        $arr = [
            'succes' => true,
            'message' => "Thành công"
        ];
    } else {
        $arr = [
            'succes' => false,
            'message' => "Không thành công"
        ];
    }

    print_r(json_encode($arr));
?>