-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2024 lúc 06:36 PM
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
-- Cơ sở dữ liệu: `db`
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
(76, 24, 1, '27399000'),
(77, 24, 2, '27399000'),
(78, 24, 1, '27399000'),
(79, 22, 1, '6000000'),
(80, 28, 1, '30000000'),
(81, 28, 1, '30000000'),
(82, 28, 1, '30000000'),
(82, 31, 1, '25000000'),
(83, 28, 1, '30000000'),
(84, 10, 5, '30000000'),
(85, 24, 1, '27399000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDM` int(11) NOT NULL,
  `TenSP` varchar(100) NOT NULL,
  `HinhAnh` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`MaDM`, `TenSP`, `HinhAnh`) VALUES
(1, 'Trang chủ', 'https://tcshop.id.vn/banhang/images/home.png'),
(2, 'Điện thoại', 'https://tcshop.id.vn/banhang/images/phone.png'),
(3, 'Lap Top', 'https://tcshop.id.vn/banhang/images/laptop.png');

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
  `tongtien` varchar(255) NOT NULL,
  `ThoiGianDatHang` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`, `ThoiGianDatHang`, `trangthai`) VALUES
(76, 7, '17B TanTru', '0786505911', 'caocong123@gmail.com', 1, '27399000', '2024-06-02 01:50:18', 1),
(77, 7, '17B TanTru', '0786505911', 'caocong123@gmail.com', 2, '54798000', '2024-05-22 01:50:40', 4),
(78, 7, 'qs', '0786505911', 'caocong123@gmail.com', 1, '27399000', '2024-06-02 20:41:07', 0),
(79, 7, 'n', '0786505911', 'caocong123@gmail.com', 1, '6000000', '2024-06-02 20:41:34', 0),
(80, 7, 'uh', '0786505911', 'caocong123@gmail.com', 1, '30000000', '2024-06-03 11:10:33', 0),
(81, 7, 'GV g', '0786505911', 'caocong123@gmail.com', 1, '30000000', '2024-06-03 11:16:45', 0),
(82, 7, 'jdn', '0786505911', 'caocong123@gmail.com', 2, '55000000', '2024-06-03 11:29:30', 0),
(83, 7, 'uhh', '0786505911', 'caocong123@gmail.com', 1, '30000000', '2024-06-03 13:38:54', 0),
(84, 7, '17B', '0786505911', 'caocong123@gmail.com', 5, '150000000', '2024-06-03 13:59:00', 0),
(85, 7, 'tức', '0786505911', 'caocong123@gmail.com', 1, '27399000', '2024-06-03 14:13:37', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `meetingId` varchar(250) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `meeting`
--

INSERT INTO `meeting` (`id`, `meetingId`, `token`) VALUES
(1, '3ci9-v43c-n7nn', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzI3Mzk4MCwiZXhwIjoxNzE3ODc4NzgwfQ.XG7yWceek8pMNc9bg0KR0FI-cBG0Kd-u5VmdUIfLCEA'),
(2, 'k9g2-td4g-gxfd', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzI3Mzk4MCwiZXhwIjoxNzE3ODc4NzgwfQ.XG7yWceek8pMNc9bg0KR0FI-cBG0Kd-u5VmdUIfLCEA'),
(3, 'yn5b-oxpk-dbak', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzI3Mzk4MCwiZXhwIjoxNzE3ODc4NzgwfQ.XG7yWceek8pMNc9bg0KR0FI-cBG0Kd-u5VmdUIfLCEA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(255) NOT NULL,
  `GiaSP` varchar(100) NOT NULL,
  `HinhAnh` text NOT NULL,
  `MoTa` text NOT NULL,
  `Loai` int(11) NOT NULL,
  `LinkVideo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `GiaSP`, `HinhAnh`, `MoTa`, `Loai`, `LinkVideo`) VALUES
(1, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U'),
(2, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U'),
(5, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U'),
(6, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U'),
(7, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U'),
(8, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U'),
(9, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U'),
(10, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U'),
(11, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U'),
(12, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U'),
(13, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U'),
(14, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U'),
(15, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U'),
(16, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U'),
(17, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U'),
(18, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U'),
(19, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U'),
(20, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U'),
(21, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U'),
(22, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U'),
(23, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U'),
(24, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U'),
(25, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U'),
(28, 'Iphone 15 Pro Max', '32000000', '26.jpg', 'Điện thoại xịn', 1, ''),
(31, 'Iphone 15 plus', '25000000', '32.jpg', 'Màu hồng', 1, '');

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
  `status` int(2) NOT NULL DEFAULT 0,
  `ImageUser` text NOT NULL DEFAULT '\'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png\''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `mobile`, `uid`, `token`, `status`, `ImageUser`) VALUES
(7, 'caocong123@gmail.com', '123456', 'Cong cao', '0786505911', 'HBO7TXpmrvZK52tziEtYVNgbjkC2', 'dpFii2-MQQ6A37XM0kKMR7:APA91bGZUbRAumL0P4tmsNM9pe4U41l1lfTswN7RhUqVHS4_xwav8SV2qMoxLdFKVgFOh5bdfkfvxlMY4bDuNa9G3CjCK45GncurH-AoQBo1i0CK6CpyZJD-j2GP-gUn0DG1qsuBko2W', 1, '/storage/emulated/0/Pictures/Zalo/IMG_20240525_120541.jpg'),
(8, 'cao123@gmail.com', '123456', 'taoproo', '0362111265', 'o94FjbESUYYCYKsOTkmQ5eUQrtt1', 'fI-j6080R-6De6bsMTwNNg:APA91bHhXUwWED65uFRakUuCup8ln94WhaIMBFAB8sa8KtacVzN1_oeIzGyKOSknDrfffCyn3lTtVWypdpEbvz4f0x0FJ-DXwqTwSs6iFtePCm-SQRyeV8MkcJgZrKKAh6TrI40F1tJT', 0, 'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png'),
(9, 'caotancong2003@gmail.com', '123456', 'TaoPro26', '0362111265', 'keOK0trDa1VHegShbAoafT3g9zA2', 'fI-j6080R-6De6bsMTwNNg:APA91bHhXUwWED65uFRakUuCup8ln94WhaIMBFAB8sa8KtacVzN1_oeIzGyKOSknDrfffCyn3lTtVWypdpEbvz4f0x0FJ-DXwqTwSs6iFtePCm-SQRyeV8MkcJgZrKKAh6TrI40F1tJT', 0, '/storage/emulated/0/DCIM/Camera/IMG_20240518_204351.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`iddonhang`,`idsp`),
  ADD KEY `FK_CHITIETDONHANG_SANPHAM` (`idsp`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDM`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_dh_user` (`iduser`);

--
-- Chỉ mục cho bảng `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `FK_sanpham_danhmuc` (`Loai`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `MaDM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `FK_CHITIETDONHANG_DONHANG` FOREIGN KEY (`iddonhang`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `FK_CHITIETDONHANG_SANPHAM` FOREIGN KEY (`idsp`) REFERENCES `sanpham` (`MaSP`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `FK_dh_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_sanpham_danhmuc` FOREIGN KEY (`Loai`) REFERENCES `danhmuc` (`MaDM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
