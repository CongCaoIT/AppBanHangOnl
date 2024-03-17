<?php
include "connect.php";
$iduser = $_POST['iduser'];

$query = "SELECT * FROM `donhang` WHERE `iduser` = '{$iduser}'";
$data = mysqli_query($conn, $query);
$result = array();

while ($row = mysqli_fetch_assoc($data)) {
    $query1 = "SELECT * FROM `chitietdonhang` INNER JOIN sanphammoi ON chitietdonhang.idsp = sanphammoi.MaSPMoi WHERE chitietdonhang.iddonhang  = '{$row['id']}'";
    $data1 = mysqli_query($conn, $query1);
    $item = array();
    while ($row1 = mysqli_fetch_assoc($data1)){
        $item[] = $row1;
    }
    $row['item'] = $item;

    $result[] = ($row);
}

if (!empty($result)) {
    $arr = [
        'succes' => true,
        'message' => "thanh cong",
        'result' => $result
    ];
} else {
    $arr = [
        'succes' => false,
        'message' => "khong thanh cong",
        'result' => $result
    ];
}
print_r(json_encode($arr));
