-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2022 at 11:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigmart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `name`, `description`, `image`) VALUES
(1, 'Đệm', '', 'dem.png'),
(2, 'Bim Bim', '', 'bim_bim.png'),
(3, 'Bếp', '', 'bep.png'),
(4, 'Bàn chải', '', 'ban_chai.png'),
(5, 'Cốc', '', 'coc.png'),
(6, 'Sữa chua', '', 'sua_chua.png'),
(7, 'Sữa', '', 'sua.png'),
(8, 'Nước tăng lực', '', 'nuoc_tang_luc.png'),
(9, 'Nước giải khát', '', 'nuoc_giai_khat.png'),
(10, 'Nước lọc', '', 'nuoc_loc.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `gender` int(11) DEFAULT 1,
  `birthday` date DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`id`, `name`, `gender`, `birthday`, `phone`, `address`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Ngọc Thúy', 0, '1990-11-23', '0832536199', 'Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội', 'nguyenngocthuy@gmail.com', 1, '2022-06-09', '0000-00-00'),
(2, 'Đáo Đức Thành', 1, '1991-11-23', '0832536200', 'Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội', 'daoducthanh@gmail.com', 0, '2022-06-09', '0000-00-00'),
(3, 'Tô Nghị', 2, '1992-11-23', '0832536201', 'Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'tonghi@gmail.com', 1, '2022-06-09', '0000-00-00'),
(4, 'Nguyễn Lê Tuấn', 0, '1993-11-23', '0832536202', '81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'nguyenletuan@gmail.com', 0, '2022-06-09', '0000-00-00'),
(5, 'Trần Thị Thu', 1, '1994-11-23', '0832536203', '6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội', 'tranthithu@gmail.com', 1, '2022-06-09', '0000-00-00'),
(6, 'Phạm Duy Hồng', 2, '1995-11-23', '0832536204', '65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'phamduyhong@gmail.com', 0, '2022-06-09', '0000-00-00'),
(7, 'Lê Hồng Nguyên', 0, '1996-11-23', '0832536205', '51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội', 'lehongnguyen@gmail.com', 1, '2022-06-09', '0000-00-00'),
(8, 'Hồ Cung Đạt Nhân', 1, '1997-11-23', '0832536206', 'Hàng Bột, Đống Đa, Hà Nội', 'hocungdatnhan@gmail.com', 0, '2022-06-09', '0000-00-00'),
(9, 'Chu Văn Nam', 2, '1998-11-23', '0832536207', '9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'chuvannam@gmail.com', 1, '2022-06-09', '0000-00-00'),
(10, 'Huỳnh Đức Long', 0, '1999-11-23', '0832536208', '88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội', 'huynhduclong@gmail.com', 0, '2022-06-09', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `gender` int(11) DEFAULT 1,
  `birthday` date NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `salary` float DEFAULT 0,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`id`, `name`, `gender`, `birthday`, `phone`, `email`, `address`, `role_id`, `salary`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Võ Thị Thanh Thảo', 0, '1990-11-23', '0832536199', 'vothithanhthao@gmail.com', '', 1, 1000, 'vothithanhthao', 'vothithanhthao', 1, '2022-06-09', '0000-00-00'),
(2, 'Lày A Cẩu', 1, '1991-11-23', '0832536200', 'layacau@gmail.com', '', 2, 2000, 'layacau', 'layacau', 1, '2022-06-09', '0000-00-00'),
(3, 'Bùi Mạnh Quốc Huy', 2, '1992-11-23', '0832536201', 'buimanhquochuy@gmail.com', '', 3, 3000, 'buimanhquochuy', 'buimanhquochuy', 1, '2022-06-09', '0000-00-00'),
(4, 'Lê Thị Mai', 0, '1993-11-23', '0832536202', 'lethimai@gmail.com', '', 4, 4000, 'lethimai', 'lethimai', 1, '2022-06-09', '0000-00-00'),
(5, 'Trần Kim Ngọc', 1, '1994-11-23', '0832536203', 'trankimngoc@gmail.com', '', 5, 5000, 'trankimngoc', 'trankimngoc', 1, '2022-06-09', '0000-00-00'),
(6, 'Lai Như Quỳnh', 2, '1995-11-23', '0832536204', 'lainhuquynh@gmail.com', '', 6, 6000, 'lainhuquynh', 'lainhuquynh', 1, '2022-06-09', '0000-00-00'),
(7, 'Đặng Ngọc Thanh Loan', 0, '1996-11-23', '0832536205', 'dangngocthanhloan@gmail.com', '', 1, 1000, 'dangngocthanhloan', 'dangngocthanhloan', 1, '2022-06-09', '0000-00-00'),
(8, 'Lê Thị Đào', 1, '1997-11-23', '0832536206', 'lethidao@gmail.com', '', 2, 2000, 'lethidao', 'lethidao', 1, '2022-06-09', '0000-00-00'),
(9, 'Phạm Đoàn Minh Hiếu', 2, '1998-11-23', '0832536207', 'phamdoanminhhieu@gmail.com', '', 3, 3000, 'phamdoanminhhieu', 'phamdoanminhhieu', 1, '2022-06-09', '0000-00-00'),
(10, 'Cao Ngọc Phương Trinh', 0, '1999-11-23', '0832536208', 'caongocphuongtrinh@gmail.com', '', 4, 4000, 'caongocphuongtrinh', 'caongocphuongtrinh', 1, '2022-06-09', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tblgiftpoint`
--

CREATE TABLE `tblgiftpoint` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblgiftpoint`
--

INSERT INTO `tblgiftpoint` (`id`, `customer_id`, `content`, `point`, `created_at`) VALUES
(1, 1, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 1, '2022-06-09'),
(2, 2, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 2, '2022-06-09'),
(3, 3, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 3, '2022-06-09'),
(4, 4, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 4, '2022-06-09'),
(5, 5, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 5, '2022-06-09'),
(6, 6, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 6, '2022-06-09'),
(7, 7, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 7, '2022-06-09'),
(8, 8, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 8, '2022-06-09'),
(9, 9, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 9, '2022-06-09'),
(10, 10, 'Đây là phần quà dành cho bạn, cảm ơn đã mua hàng của chúng tôi', 10, '2022-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `ship_at` datetime DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `addredd_ship` varchar(128) NOT NULL,
  `phone_ship` int(11) NOT NULL,
  `note` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `created_at`, `ship_at`, `shipment_id`, `payment_id`, `customer_id`, `employee_id`, `status`, `addredd_ship`, `phone_ship`, `note`) VALUES
(1, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 1, 1, 1, 'Ng. 102 Trường Chinh, Phương Đình, Đống Đa, Hà Nội', 832536199, ''),
(2, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 2, 2, 0, '43 P.Hàm Long, Hàng Bài, Hoàn Kiếm, Hà Nội', 832535200, ''),
(3, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 3, 3, 1, '1A Ng. 165 P. Thái Hà, Láng Hạ, Đống Đa, Hà Nội', 832535201, ''),
(4, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 4, 4, 0, '140 P. Vũ Thạnh, Chợ Dừa, Đống Đa, Hà Nội', 832535202, ''),
(5, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 5, 5, 1, '380 P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội', 832535203, ''),
(6, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 6, 6, 0, '1 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội', 832535204, ''),
(7, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 7, 7, 1, '378B P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội', 832535205, ''),
(8, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 8, 8, 0, 'Số 8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội', 832535206, ''),
(9, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 9, 9, 1, 'Bà Triệu, Nguyễn Du, Hai Bà Trưng, Hà Nội', 832535207, ''),
(10, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 10, 10, 0, '8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội', 832535208, '');

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoicedetail`
--

CREATE TABLE `tblinvoicedetail` (
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `export_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinvoicedetail`
--

INSERT INTO `tblinvoicedetail` (`invoice_id`, `product_id`, `number`, `export_price`) VALUES
(1, 1, 1, 1500),
(2, 2, 1, 2500),
(3, 3, 1, 3500),
(4, 4, 1, 4500),
(5, 5, 1, 5500),
(6, 6, 1, 6500),
(7, 7, 1, 7500),
(8, 8, 1, 8500),
(9, 9, 1, 9500),
(10, 10, 1, 10500);

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

CREATE TABLE `tblpayment` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpayment`
--

INSERT INTO `tblpayment` (`id`, `name`, `note`, `status`) VALUES
(1, 'Thanh toán tiền mặt tại quầy', '', 1),
(2, 'Thanh toán bằng thẻ ngân hàng', '', 0),
(3, 'Chuyển khoản ngân hàng', '', 1),
(4, 'Ship COD', '', 0),
(5, 'Thanh toán tích điểm', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT 0,
  `import_price` float DEFAULT 0,
  `export_price` float DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`id`, `name`, `image`, `category_id`, `unit_id`, `provider_id`, `number`, `import_price`, `export_price`, `created_at`, `updated_at`) VALUES
(1, 'Đệm Everon', 'dem_everon.png', 1, 1, 1, 10, 1000, 1500, '2022-06-09', '0000-00-00'),
(2, 'Bim Bim Oishi', 'bim_bim_oishi.png', 2, 1, 2, 20, 2000, 2500, '2022-06-09', '0000-00-00'),
(3, 'Bếp hồng ngoại', 'bep_hong_ngoai.png', 3, 1, 3, 30, 3000, 3500, '2022-06-09', '0000-00-00'),
(4, 'Bàn chải điện', 'ban_chai_dien.png', 4, 1, 4, 40, 4000, 4500, '2022-06-09', '0000-00-00'),
(5, 'Cốc viễn đông', 'coc_vien_dong.png', 5, 1, 5, 50, 5000, 5500, '2022-06-09', '0000-00-00'),
(6, 'Sữa chua trân châu', 'sua_chua_tran_chau.png', 6, 1, 6, 60, 6000, 6500, '2022-06-09', '0000-00-00'),
(7, 'Sữa tiệt trùng vinamilk', 'sua_tiet_trung_vinamilk.png', 7, 1, 7, 70, 7000, 7500, '2022-06-09', '0000-00-00'),
(8, 'Sting', 'sting.png', 8, 1, 8, 80, 8000, 8500, '2022-06-09', '0000-00-00'),
(9, 'Trà xanh không độ', 'tra_xanh_khong_do.png', 9, 1, 9, 90, 9000, 9500, '2022-06-09', '0000-00-00'),
(10, 'Lavie', 'lavie.png', 10, 1, 10, 100, 10000, 10500, '2022-06-09', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tblprovider`
--

CREATE TABLE `tblprovider` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblprovider`
--

INSERT INTO `tblprovider` (`id`, `name`, `address`, `phone`, `email`, `status`) VALUES
(1, 'Công ty Cổ phần an ninh an toàn thông tin CMC', 'Tầng 4, tòa nhà CMC, phố Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Thành phố Hà Nội', '0832536199', 'tahoanglinh@gmail.com', 1),
(2, 'Công ty Cổ phần Thương mại Tin học và Viễn thông Sao Việt', 'Số 16, Ngách 82/5, Ngõ 651, Phố Minh Khai, Phường Thanh Lương, Quận Hai Bà Trưng, Thành phố Hà Nội', '0832536201', 'leminhhai@gmail.com', 0),
(3, 'Công ty Cổ phần công nghệ truyền thông DTS', 'Số 287B Điện Biên Phủ, Phường 7, Quận 3, Thành phố Hồ Chí Minh', '0832536202', 'tohuyhoang@gmail.com', 1),
(4, 'Tập đoàn Bưu chính Viễn thông Việt Nam', 'Số 57 phố Huỳnh Thúc Kháng, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam', '0832536203', 'phamduclong@gmail.com', 0),
(5, 'Công ty Cổ phần Dịch vụ Công nghệ Tin học HPT', 'Tầng 9 Tòa nhà Paragon, số 3 Nguyễn Lương Bằng, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', '0832536204', 'dinhhaduylinh@gmail.com', 1),
(6, 'Công ty Cổ phần giải pháp công nghệ SAVIS Việt Nam', 'Số 22, lô 1C, đường Trung Yên, 11C, KĐT Trung Yên, Phường Trung Hòa, Quận Cầu Giấy, Thành phố Hà Nội, Việt Nam', '0832536205', 'hoangnguyenvan@gmail.com', 0),
(7, 'Công ty TNHH Thông tin NTT (Việt Nam)', 'Tòa nhà Vincom, số 72 đường Lê Thánh Tôn, phường Bến Nghé, quận 1, thành phố Hồ Chí Minh, Việt Nam', '0832536206', 'kinyahasegawa@gmail.com', 1),
(8, 'Công ty Cổ phần Công nghệ Mạng và Truyền thông', 'Số 36 phố Trúc Khê, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam', '0832536207', 'lengoctu@gmail.com', 0),
(9, 'Công ty TNHH Hệ thống thông tin FPT', 'Tầng 22 tòa nhà Keangnam Landmark72, E6, đường Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, thành phố Hà Nội, Việt Nam', '0832536208', 'phamminhtuan@gmail.com', 1),
(10, 'Công ty Cổ phần An ninh mạng Việt Nam', 'Biệt thự số 26 – BT2 – khu đô thị Văn Quán, Phường Văn Quán, Quận Hà Đông, Thành phố Hà Nội, Việt Nam', '0832536209', 'truongducluong@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblrole`
--

CREATE TABLE `tblrole` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `position` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblrole`
--

INSERT INTO `tblrole` (`id`, `name`, `position`) VALUES
(1, 'Toàn bộ', 'Chủ cửa hàng'),
(2, 'Phụ trách thu chi', 'Kế toán'),
(3, 'Phụ trách kho hàng', 'Quản lý kho'),
(4, 'Phụ trách sản phẩm', 'Thu mua'),
(5, 'Phụ trách đơn hàng', 'Bán hàng'),
(6, 'Phụ trách nhân sự', 'Quản lý nhân viên');

-- --------------------------------------------------------

--
-- Table structure for table `tblshipment`
--

CREATE TABLE `tblshipment` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblshipment`
--

INSERT INTO `tblshipment` (`id`, `name`, `note`, `status`) VALUES
(1, 'Giao hàng nhanh', 'GHN', 1),
(2, 'Giao hàng tiết kiệm', 'GHTK', 0),
(3, 'Viettel Post', '', 1),
(4, 'J&T Express', '', 0),
(5, 'Ahamove', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblstore`
--

CREATE TABLE `tblstore` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `open_time` int(11) DEFAULT NULL,
  `close_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblstore`
--

INSERT INTO `tblstore` (`id`, `name`, `address`, `phone`, `employee_id`, `open_time`, `close_time`) VALUES
(1, 'Big Mart 1', 'Số 349 đường 3/2, TT. Đức Tài, H. Đức Linh, T. Bình Thuận (Đối diện bến xe Đức Tài)', '0832536199', 1, 7, 19),
(2, 'Big Mart 2', 'Tiểu khu 7, Thị Trấn Thuận Châu, Huyện Thuận Châu, Tỉnh Sơn La', '0832536200', 2, 7, 19),
(3, 'Big Mart 3', 'Số 473, đường Tô Hiệu, TT. Ít Ong, H. Mường La, T. Sơn La', '0832536201', 3, 7, 19),
(4, 'Big Mart 4', 'Tổ 9, Phường Tân Phong, Thành Phố Lai Châu, Tỉnh Lai Châu', '0832536202', 4, 7, 19),
(5, 'Big Mart 5', 'Số 69 Đường Hồng Bàng, P. Sở Dầu, Q. Hồng Bàng, TP. Hải Phòng', '0832536203', 5, 7, 19),
(6, 'Big Mart 6', 'Quốc lộ 27, Thôn Hạnh Trí 1, X. Quảng Sơn, H. Ninh Sơn, T. Ninh Thuận (gần chợ Quảng Sơn)', '0832536204', 6, 7, 19),
(7, 'Big Mart 7', 'Phố Ba Mỏ, TT. Thanh Sơn, H. Thanh Sơn, T. Phú Thọ (Gần ngã tư bến xe Thanh Sơn)', '0832536205', 7, 7, 19),
(8, 'Big Mart 8', '485 Hùng Vương, TT. Vạn Giã, H. Vạn Ninh, T. Khánh Hòa', '0832536206', 8, 7, 19),
(9, 'Big Mart 9', '226 Trần Hưng Đạo, Phường Nam Lý, Thành phố Đồng Hới, Tỉnh Quảng Bình', '0832536207', 9, 7, 19),
(10, 'Big Mart 10', 'Quốc Lộ 1A, Thôn Dinh Mười, X. Gia Ninh, H. Quảng Ninh, T. Quảng Bình', '0832536208', 10, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tblunit`
--

CREATE TABLE `tblunit` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `note` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblunit`
--

INSERT INTO `tblunit` (`id`, `name`, `note`) VALUES
(1, 'Việt Nam đồng', 'VND'),
(2, 'Đô la Mỹ', 'USD'),
(3, 'đồng EURO', 'EUR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblgiftpoint`
--
ALTER TABLE `tblgiftpoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblinvoicedetail`
--
ALTER TABLE `tblinvoicedetail`
  ADD PRIMARY KEY (`invoice_id`,`product_id`);

--
-- Indexes for table `tblpayment`
--
ALTER TABLE `tblpayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblprovider`
--
ALTER TABLE `tblprovider`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblrole`
--
ALTER TABLE `tblrole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblshipment`
--
ALTER TABLE `tblshipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstore`
--
ALTER TABLE `tblstore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `tblunit`
--
ALTER TABLE `tblunit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblgiftpoint`
--
ALTER TABLE `tblgiftpoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpayment`
--
ALTER TABLE `tblpayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblprovider`
--
ALTER TABLE `tblprovider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblrole`
--
ALTER TABLE `tblrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblshipment`
--
ALTER TABLE `tblshipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblstore`
--
ALTER TABLE `tblstore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblunit`
--
ALTER TABLE `tblunit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
