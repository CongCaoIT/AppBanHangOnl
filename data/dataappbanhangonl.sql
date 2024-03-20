-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 20, 2024 lúc 11:10 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dataappbanhangonl`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
(13, 24, 1, '27399000'),
(14, 22, 1, '6000000'),
(15, 22, 1, '6000000'),
(16, 25, 1, '2399000'),
(17, 7, 1, '2399000'),
(18, 6, 1, '27399000'),
(19, 25, 1, '2399000'),
(19, 24, 1, '27399000'),
(20, 25, 1, '2399000'),
(20, 24, 1, '27399000'),
(22, 25, 1, '2399000'),
(22, 24, 1, '27399000'),
(24, 12, 1, '27399000'),
(25, 24, 1, '27399000'),
(25, 25, 1, '2399000'),
(26, 21, 1, '12000000'),
(27, 21, 1, '12000000'),
(28, 24, 1, '27399000'),
(29, 24, 1, '27399000'),
(32, 25, 2, '4798000'),
(33, 25, 2, '4798000'),
(33, 24, 1, '27399000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` text NOT NULL,
  `sodienthoai` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`) VALUES
(13, 1, '17B', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(14, 1, 'hwl', '0362111265', 'caotancong2003@gmail.com', 1, '6000000'),
(15, 1, 'fgh', '0362111265', 'caotancong2003@gmail.com', 1, '6000000'),
(16, 1, 'jsbs', '0362111265', 'caotancong2003@gmail.com', 1, '2399000'),
(17, 0, 'xsd', '', '', 1, '2399000'),
(18, 1, 'HN khgl', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(19, 1, 'aaa', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(20, 1, 'ada', '0362111265', 'caotancong2003@gmail.com', 0, '27399000'),
(21, 1, 'sadfa', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(22, 1, 'fa', '0362111265', 'caotancong2003@gmail.com', 0, '27399000'),
(23, 1, 'a', '0362111265', 'caotancong2003@gmail.com', 1, '6000000'),
(24, 1, 'aaa', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(25, 1, 'aaa', '0362111265', 'caotancong2003@gmail.com', 2, '29798000'),
(26, 1, 'qqq', '0362111265', 'caotancong2003@gmail.com', 1, '12000000'),
(27, 1, 'rrr', '0362111265', 'caotancong2003@gmail.com', 1, '12000000'),
(28, 1, 'aa', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(29, 1, 'qqq', '0362111265', 'caotancong2003@gmail.com', 1, '27399000'),
(30, 1, 'aa', '0362111265', 'caotancong2003@gmail.com', 1, '2399000'),
(31, 1, 'aa', '0362111265', 'caotancong2003@gmail.com', 1, '6000000'),
(32, 7, 'kkk', '0362111265', 'caocong123@gmail.com', 2, '9596000'),
(33, 7, '88', '0362111265', 'caocong123@gmail.com', 3, '36995000'),
(34, 8, '0099', '0362111265', 'cao123@gmail.com', 1, '2399000'),
(35, 8, 'uu', '0362111265', 'cao123@gmail.com', 2, '29798000'),
(36, 8, 'c', '0362111265', 'cao123@gmail.com', 1, '27399000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(100) NOT NULL,
  `HinhAnh` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `HinhAnh`) VALUES
(1, 'Trang chủ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpKKWRnKE-VcrXk05c8y5QvzwQsW_ZR_8CsA&usqp=CAU'),
(2, 'Điện thoại', 'https://phucanhcdn.com/media/product/250_52659_dien_thoai_thong_minh_apple_iphone_15_pro_max_white_5.jpg'),
(3, 'Lap Top', 'https://phucanhcdn.com/media/product/250_50198_laptop_hp_pavilion_14_dv2073tu_7c0p2pa_5.jpg'),
(4, 'Đơn hàng', 'https://phucanhcdn.com/media/product/250_50198_laptop_hp_pavilion_14_dv2073tu_7c0p2pa_5.jpg'),
(5, 'Liên hệ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeTnfBNX78-X4K0CD1NH4vf6FnZRQi6XABOg&usqp=CAU'),
(6, 'Thông tin', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiSvZckBhDmeSJq-n_1tSbhGXnBH9aDXD6gw&usqp=CAU'),
(10, 'Quản lý', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiSvZckBhDmeSJq-n_1tSbhGXnBH9aDXD6gw&usqp=CAU'),
(11, 'Đăng xuất', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiSvZckBhDmeSJq-n_1tSbhGXnBH9aDXD6gw&usqp=CAU');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `MaSPMoi` int(11) NOT NULL,
  `TenSP` varchar(255) NOT NULL,
  `GiaSP` varchar(100) NOT NULL,
  `HinhAnh` text NOT NULL,
  `MoTa` text NOT NULL,
  `Loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphammoi`
--

INSERT INTO `sanphammoi` (`MaSPMoi`, `TenSP`, `GiaSP`, `HinhAnh`, `MoTa`, `Loai`) VALUES
(1, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2),
(2, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(5, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2),
(6, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1),
(7, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1),
(8, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2),
(9, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2),
(10, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(11, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2),
(12, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1),
(13, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1),
(14, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2),
(15, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2),
(16, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(17, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2),
(18, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1),
(19, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1),
(20, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2),
(21, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2),
(22, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1),
(23, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2),
(24, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1),
(25, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1),
(27, 'aaa', '1000', '27.jpg', 'jwsbb', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `uid` text NOT NULL,
  `token` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `mobile`, `uid`, `token`, `status`) VALUES
(7, 'caocong123@gmail.com', '123456', 'TaoProIT', '0362111265', 'HBO7TXpmrvZK52tziEtYVNgbjkC2', 'cu2ocUGbQAeWOg6_-gi-Av:APA91bFhsQqs9znxB5a_4iT2nNINpVoI7iUa5iEGrC5MlKSLRR72C0Dq45NEHNUvtY48jOz-iPImgi4EQPi-wGSCg5cmVIMPYxAcrKgUOQ_GncFCDyjZTAT0REJcS_xklx5QmnlQXu3w', 1),
(8, 'cao123@gmail.com', '123456', 'taoproo', '0362111265', 'o94FjbESUYYCYKsOTkmQ5eUQrtt1', 'fto2xdQjRICAL7KGRuL0Y1:APA91bE_wCKPHEsSPY61KLsCq-Ny1kN6Pv9rAGh_lWH5cNKXMw_-jSw1gO-A7THfRe9V48Vz3v7Q3EqPN9W5Hnl1NBz4P2Vs1KR8S0eLjac_FRid6vnJ6NRM-HRxQetOt_gM8RnrU1ht', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`);

--
-- Chỉ mục cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`MaSPMoi`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `MaSPMoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
