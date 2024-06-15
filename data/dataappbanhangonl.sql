-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 14, 2024 lúc 05:40 PM
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
  `trangthai` int(11) NOT NULL,
  `zalopaytoken` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(3, 'yn5b-oxpk-dbak', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzI3Mzk4MCwiZXhwIjoxNzE3ODc4NzgwfQ.XG7yWceek8pMNc9bg0KR0FI-cBG0Kd-u5VmdUIfLCEA'),
(4, '003c-fzvr-0bed', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4'),
(5, 'yeei-0dry-4gnn', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4'),
(6, 'hdax-k3lc-q4de', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4'),
(7, 'tad1-r71p-xfc5', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4'),
(8, '5hpu-g51z-58n4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4'),
(9, 'q92p-3fut-fe7y', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0OWNlMjM4MS0wMTBkLTRjNDctYjFiZS04MGI4YTg4NGQzZTUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxODA5NjkxOSwiZXhwIjoxODc1ODg0OTE5fQ.SO_HQ0xcT3ji_Le4WHisQTki_1OYFDvKijqeR0gkPy4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `promotion`
--

INSERT INTO `promotion` (`id`, `url`, `information`) VALUES
(1, 'https://mauweb.monamedia.net/thegioididong/wp-content/uploads/2017/12/banner-Le-hoi-phu-kien-800-300.png', 'Lễ hội Phụ kiện - Bùng nổ ưu đãi, sắm thả ga không lo giá!\r\nBạn đang tìm kiếm những món phụ kiện điện thoại, laptop chất lượng với giá cả phải chăng? Đừng bỏ lỡ Lễ hội Phụ kiện hoành tráng tại shop của chúng tôi!\r\n\r\nTừ ngày 01/06/2024 đến ngày 30/06/2024, bạn sẽ được tận hưởng hàng loạt ưu đãi cực kỳ hấp dẫn:\r\n\r\nGiảm giá đến 50% cho tất cả các phụ kiện điện thoại, laptop chính hãng.\r\nMua 1 tặng 1 với nhiều sản phẩm phụ kiện độc đáo.\r\nFlashsale mỗi ngày với giá siêu rẻ, số lượng có hạn.\r\nMiễn phí ship cho đơn hàng từ [Số tiền] trở lên.\r\nTặng voucher giảm giá cho khách hàng thân thiết.\r\nLễ hội Phụ kiện là cơ hội tuyệt vời để bạn sắm sửa những món đồ yêu thích với mức giá tiết kiệm nhất. Hãy đến ngay shop [Tên shop] để khám phá kho tàng phụ kiện phong phú và tận hưởng những ưu đãi vô cùng hấp dẫn!\r\n\r\nNgoài ra, shop còn có:\r\n\r\nĐội ngũ nhân viên tư vấn nhiệt tình, sẵn sàng giải đáp mọi thắc mắc của bạn.\r\nChính sách đổi trả linh hoạt trong vòng 120 ngày.\r\nHình thức thanh toán đa dạng, tiện lợi.\r\nĐừng bỏ lỡ cơ hội mua sắm tuyệt vời này!'),
(2, 'https://mauweb.monamedia.net/thegioididong/wp-content/uploads/2017/12/banner-HC-Tra-Gop-800-300.png', 'Trả góp - Sắm máy mới, rinh ngàn ưu đãi!\r\nBạn đang có nhu cầu mua sắm điện thoại, laptop mới nhưng e ngại về giá cả? Đừng lo lắng, đã có chúng tôi mang đến chương trình Trả góp với hàng loạt ưu đãi hấp dẫn, giúp bạn dễ dàng sở hữu sản phẩm mong muốn mà không lo về gánh nặng tài chính!\r\n\r\nTừ ngày 01/06/2024 đến ngày 30/06/2024, khi mua trả góp điện thoại, laptop tại đây, bạn sẽ được hưởng:\r\n\r\nLãi suất 0% cho tất cả các sản phẩm trả góp qua thẻ tín dụng.\r\nTrả trước 0 đồng hoặc chỉ cần thanh toán 10% giá trị sản phẩm.\r\nKỳ hạn trả góp linh hoạt từ 6 tháng đến 24 tháng.\r\nHỗ trợ thủ tục nhanh chóng, đơn giản.\r\nMiễn phí phí duy trì thẻ trong suốt thời gian trả góp.\r\nĐặc biệt, khi mua trả góp laptop, bạn còn được:\r\n\r\nTặng kèm bộ quà tặng phụ kiện trị giá [Số tiền].\r\nNâng cấp RAM/SSD miễn phí.\r\nCài đặt phần mềm miễn phí.\r\nTrả góp tại shoo của chúng tôi là lựa chọn thông minh giúp bạn:\r\n\r\nSở hữu sản phẩm chính hãng với giá cả phải chăng.\r\nGiảm áp lực tài chính, dễ dàng quản lý chi tiêu.\r\nTận hưởng những ưu đãi hấp dẫn và quà tặng độc đáo.\r\nNhanh tay đến ngay cửa hàng của chúng tôi để mua sắm trả góp và rinh ngàn ưu đãi!'),
(3, 'https://mauweb.monamedia.net/thegioididong/wp-content/uploads/2017/12/banner-big-ky-nguyen-800-300.jpg', 'Big Kỷ Nguyên - Mua sắm thả ga, ưu đãi cực đã!\r\nBạn đang tìm kiếm những sản phẩm điện thoại, laptop chất lượng với giá cả phải chăng? Đừng bỏ lỡ chương trình Big Kỷ Nguyên hoành tráng tại shop của chúng tôi!\r\n\r\nTừ ngày 01/06/2024 đến ngày 30/06/2024, bạn sẽ được tận hưởng hàng loạt ưu đãi cực kỳ hấp dẫn:\r\n\r\nGiảm giá đến 50% cho tất cả các sản phẩm điện thoại, laptop chính hãng.\r\nMua 1 tặng 1 với nhiều sản phẩm phụ kiện độc đáo.\r\nFlashsale mỗi ngày với giá siêu rẻ, số lượng có hạn.\r\nMiễn phí ship cho đơn hàng từ 500.000 đồng trở lên.\r\nTặng voucher giảm giá cho khách hàng thân thiết.\r\nBig Kỷ Nguyên là cơ hội tuyệt vời để bạn sắm sửa những món đồ yêu thích với mức giá tiết kiệm nhất. Hãy đến ngay shop của chúng tôi để khám phá kho tàng sản phẩm phong phú và tận hưởng những ưu đãi vô cùng hấp dẫn!\r\n\r\nNgoài ra, shop còn có:\r\n\r\nĐội ngũ nhân viên tư vấn nhiệt tình, sẵn sàng giải đáp mọi thắc mắc của bạn.\r\nChính sách đổi trả linh hoạt trong vòng 30 ngày.\r\nHình thức thanh toán đa dạng, tiện lợi.\r\nĐừng bỏ lỡ cơ hội mua sắm tuyệt vời này!'),
(4, 'https://d3design.vn/uploads/5495874fhgtrty567.jpg', 'Chương trình khuyến mãi mùa hè');

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
(1, 'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U/8GB/256GB/Win11', '12000000', 'lenovo-ideapad-3-15iau7-i3-82rk00rwvn-1.jpg', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(2, 'Điện thoại iPhone 14 Pro Max 128GB', '12000000', 'iphone-14-pro-max-purple-1.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 100),
(5, 'Laptop Apple MacBook Air 13 inch M3 8GB/256GB', '27000000', 'macbook-air-13-inch-m3-2024-1-3.jpg', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(6, 'iPhone 13 Pro 128GB Vàng', '11000000', 'iphone-13-pro-max-1-1.jpg', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(7, 'Điện thoại OPPO Find N2 Flip 5G', '1000000', 'oppo-reno10-pro-tim-1-2.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 100),
(8, 'Laptop Apple MacBook Pro 14 inch M3 8GB/512GB', '38690000', 'macbook-pro-14-inch-m3-2023-asd-1.jpg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(9, 'Laptop Dell Vostro 3520', '12000000', 'https://hanoicomputercdn.com/media/product/69589_laptop_dell_vostro_3520_25.png', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(10, 'Điện thoại vivo V27e', '6000000', 'vivo-y02-den-1.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 100),
(11, 'Laptop Acer Gaming Aspire 5 A515 58GM 51LB i5 13420H/16GB/512GB/4GB RTX2050/Win11', '16299000', 'acer-aspire-5-a515-58gm-51lb-i5-nxkq4sv002-glr-1.jpg', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(12, 'Điện thoại Samsung Galaxy Z Fold5 5G 1TB', '27399000', 'samsung-galaxy-flip4-glr-tim-1.jpg', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(13, 'Điện thoại Xiaomi 12 5G', '1399000', 'xiaomi-redmi-note-12s-xanh-1.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 99),
(14, 'Laptop Asus Vivobook Go 15 E1504FA R5 7520U/16GB/512GB/Chuột/Win11', '14999000', 'asus-vivobook-go-15-e1504fa-r5-nj776w-glr-1.jpg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(15, 'Laptop MSI Modern 15 B12MO i7 1255U/16GB/512GB/Win11', '12000000', 'msi-modern-15-b12mo-i7-487vn-1-1.jpg', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(16, 'Điện thoại Xiaomi Redmi Note 12 Pro 128GB', '9000000', 'xiami-redmi-12-pro-xam-1.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 99),
(17, 'Laptop MSI Gaming GF63 Thin 12VE i5 12450H/8GB/512GB/6GB RTX4050/144Hz/Win11', '26299000', 'msi-gaming-gf63-thin-12ve-i5-460vn-glr-1.jpg', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(18, 'Điện thoại vivo V25 Pro 5G', '7399000', 'vivo-y02-tim-1.jpg', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 100),
(19, 'Điện thoại Samsung Galaxy Z Flip4 5G 256GB', '1399000', 'samsung-galaxy-zfold5-xanh-256gb-1-1.jpg', '\"Màn hình 6.78 inch, AMOLED, FHD+, 2448 x 1080 Pixels\r\nCamera sau 50.0 MP + 13.0 MP + 5.0 MP\r\nCamera Selfie 12.0 MP\r\nRAM 12 GB\r\nBộ nhớ trong 256 GB\r\nCPU Snapdragon 8+ Gen 1\"', 1, 'lQ-5KG7l-6U', 0, 100),
(20, 'Laptop Asus TUF Gaming A15 FA506NF R5 7535HS/16GB/512GB/4GB RTX2050/144Hz/Win11', '17999000', 'asus-tuf-gaming-a15-fa506nf-r5-hn012w-glr-1.jpg', 'CPU: Intel® Core™ i5-1240P (upto 4.40 GHz, 16MB)\r\nRAM: 8GB (2 x 4GB) DDR4-3200 MHz ( 2 khe)\r\nỔ cứng: 256GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel®iris XE\r\nMàn hình: 15.6 inch FullHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Bạc', 2, 'lQ-5KG7l-6U', 0, 100),
(21, 'Laptop Asus Vivobook 15 OLED A1505VA i5 13500H/16GB/512GB/Chuột/Win11', '17000000', 'asus-vivobook-15-oled-a1505va-i5-l1341w-1.jpg', 'CPU: Intel Core i5 1235U (upto 4.4Ghz/12MB cache)\r\nRAM: 8GB DDR4 2666Mhz (1*8GB)\r\nỔ cứng: 512GB PCIe NVMe SSD\r\nVGA: Intel UHD Graphics\r\nMàn hình: 15.6 inch FHD (1920 x 1080) 250 nits WVA Anti-Glare LED Backlit\r\nMàu sắc: Xám', 2, 'lQ-5KG7l-6U', 0, 100),
(22, 'Điện thoại Xiaomi Redmi Note 12S', '8000000', 'xiaomi-redmi-note-12s-1-1.jpg', '\"Kích thước màn hình 6.9 inches\r\nCông nghệ màn hình Dynamic AMOLED\r\nCamera sau 108 MP, f/1.8, 26mm (wide), 1/1.33\"\", 0.8µm, PDAF, Laser AF, OIS\r\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\r\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\"\", 1.4µm\r\nCamera trước 10 MP, f/2.2, 26mm (wide), 1/3.2\"\", 1.22µm, Dual Pixel PDAF\r\nChipset Exynos 990 (7 nm+)\r\nDung lượng RAM 12 GB\"', 1, 'lQ-5KG7l-6U', 0, 85),
(23, 'Laptop Apple MacBook Air 15 inch M2 8GB/512GB', '26299000', 'apple-macbook-air-15-inch-m2-2023-gray-1.jpg', 'CPU: Intel® Core™ i5-1235U (3.30 GHz upto 4.40 GHz, 12MB)\r\nRAM: 8GB DDR4-3200 MHz RAM (2 x 4 GB)\r\nỔ cứng: 512GB PCIe® NVMe™ M.2 SSD\r\nVGA: Intel® Iris® Xᵉ Graphics\r\nMàn hình: 14 inch FHD (1920 x 1080), IPS, 250 nits, 45% NTSC\r\nMàu sắc: Vàng', 2, 'lQ-5KG7l-6U', 0, 100),
(24, 'Điện thoại iPhone 15 Pro Max 256GB', '30099000', 'iphone-15-pro-max-blue-1-1.jpg', 'Công nghệ màn hình: OLED\r\nĐộ phân giải: 1170 x 2532 Pixels, 2 camera 12 MP, 12 MP\r\nMàn hình rộng: 6.1\"\r\nHệ điều hành: iOS 14\r\nChip xử lý (CPU): Apple A14 Bionic 6 nhân\r\nBộ nhớ trong (ROM): 128GB', 1, 'lQ-5KG7l-6U', 0, 56),
(28, 'Iphone 15 Pro Max', '32000000', '26.jpg', 'Điện thoại xịn', 1, '', 1, 100),
(31, 'Iphone 15 plus', '25000000', '32.jpg', 'Màu hồng', 1, '', 1, 0),
(34, 'Điện thoại Samsung Galaxy S23 Ultra 5G 8GB/256GB', '20299000', 'samsung-galaxy-s23-ultra-xanh-1.jpg', 'Màn hình: Dynamic AMOLED 2X6.8\"Quad HD+ (2K+)\r\nHệ điều hành: Android 13\r\nCamera sau: Chính 200 MP & Phụ 12 MP, 10 MP, 10 MP\r\nCamera trước: 12 MP\r\nChip: Snapdragon 8 Gen 2 for Galaxy\r\nRAM: 8 GB\r\nDung lượng lưu trữ: 256 GB\r\nSIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc: 5000 mAh45 W', 1, '121251234', 0, 0);

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
(11, 'thanhdai.vn03@gmail.com', 'onfibase', ' Giáo sư', '0362111265', 'TJNaj4FN4qThLVPrPyslNZmvUgl2', 'czQTPGIDQA2C74E0mzcrVJ:APA91bGnCGvxdSn2zh8nP7Zb4e6qe6LRd-CTwxGdxu97H9cXxvpQcgO_3cqaaHso4vp94t4ut8wjUmdOKjDR_IW9DMfdoOFHy2rrbQioBdd18Oc7pDuA666YIc_Xo1mmYAPOu2z1a7FF', 0, 'https://firebasestorage.googleapis.com/v0/b/appbanhang-b762c.appspot.com/o/images%2F20240504_140310.jpg?alt=media&token=a220e16f-346f-49ee-ac1c-ad3a2aa9b85e'),
(12, 'caotancong2003@gmail.com', 'onfibase', 'admin', '0362111265', 'i2vc1oLaIdU8jZE0RJ3oDBNjwH03', 'fI-j6080R-6De6bsMTwNNg:APA91bGnp-URyAzjlAqE7afOp3b8Tj-rLdG-RanX5YRObg6eY0gWztd59exeUPFAdNQV_XtPvDMqNCpeUb1nVl7VDik4reCixd8HZisedXk0ME0fzDwEYfEOVQRh2NvweFhcc8VZx_uP', 1, 'https://firebasestorage.googleapis.com/v0/b/appbanhang-b762c.appspot.com/o/images%2FIMG_20240506_024832.jpg?alt=media&token=477fce26-28e2-4ad6-bd3a-96389af4c3ef'),
(13, 'caotancong123456@gmail.com', 'onfibase', 'Thầy Huy', '0362111265', '77KUOVsiulfuARI5KkMcnJTNSwm1', 'eF6pfF9WQp-wJLFOLZlJvt:APA91bF8vFnpLntTsaxpW0yB75u_6fbTDOdcITiRdcgp1UQdfJiWqS1SatqzQBhrfluk4elFxU9ivMdYk4bdytaNoFwT7GfMkSVBMvVD9wIFbdMulg_wbfZJv-Lvw6l9ZBDQizeeiGJj', 0, 'https://firebasestorage.googleapis.com/v0/b/appbanhang-b762c.appspot.com/o/images%2F20240612_102654.jpg?alt=media&token=5154c65c-ed5d-4edb-92f0-7ae2de68e456');

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
-- Chỉ mục cho bảng `promotion`
--
ALTER TABLE `promotion`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT cho bảng `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
