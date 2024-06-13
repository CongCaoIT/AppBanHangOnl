-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 13, 2024 lúc 09:10 AM
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
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(255) NOT NULL,
  `GiaSP` varchar(100) NOT NULL,
  `HinhAnh` text NOT NULL,
  `MoTa` text NOT NULL,
  `Loai` int(11) NOT NULL,
  `LinkVideo` text NOT NULL,
  `DaXoa` int(11) NOT NULL,
  `SoLuongTon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `GiaSP`, `HinhAnh`, `MoTa`, `Loai`, `LinkVideo`, `DaXoa`, `SoLuongTon`) VALUES
(1, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(2, 'Samsung Galaxy A23 6GB', '12000000', '7up_lon.jpeg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 100),
(5, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(6, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(7, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 100),
(8, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(9, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(10, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 100),
(11, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(12, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(13, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 100),
(14, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(15, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(16, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 99),
(17, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(18, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(19, 'Máy Điện Thoại Alcatel H3P', '2399000', 'https://hanoicomputercdn.com/media/product/68239_may_dien_thoai_alcatel_h3p__2_.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 100),
(20, 'Laptop HP Pavilion 15-eg2057TU', '14999000', 'https://hanoicomputercdn.com/media/product/67297_laptop_hp_pavilion_15_10.jpeg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(21, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(22, 'Samsung Galaxy A23 6GB', '6000000', 'https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_100/https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-thumb-new-1-600x600.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 85),
(23, 'Laptop HP Pavilion 14-eg2033TU', '16299000', 'https://hanoicomputercdn.com/media/product/68296_aaaaaaa_0004_layer_2.png', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(24, 'iPhone 13 Pro 128GB Vàng', '27399000', 'https://hanoicomputercdn.com/media/product/64690_iphone_13_pro_max_2.png', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 66),
(28, 'Iphone 15 Pro Max', '32000000', '26.jpg', 'Điện thoại xịn', 1, '', 1, 100),
(31, 'Iphone 15 plus', '25000000', '32.jpg', 'Màu hồng', 1, '', 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `FK_sanpham_danhmuc` (`Loai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_sanpham_danhmuc` FOREIGN KEY (`Loai`) REFERENCES `danhmuc` (`MaDM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
