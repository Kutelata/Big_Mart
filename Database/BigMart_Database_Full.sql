-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2022 at 04:21 PM
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
  `image` varchar(256) NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `name`, `image`, `status`) VALUES
(1, 'Đệm', 'dem.png', 0),
(2, 'Bim Bim', 'bim_bim.png', 1),
(3, 'Bếp', 'bep.png', 0),
(4, 'Bàn chải', 'ban_chai.png', 1),
(5, 'Cốc', 'coc.png', 0),
(6, 'Sữa chua', 'sua_chua.png', 1),
(7, 'Sữa', 'sua.png', 0),
(8, 'Nước tăng lực', 'nuoc_tang_luc.png', 1),
(9, 'Nước giải khát', 'nuoc_giai_khat.png', 0),
(10, 'Nước lọc', 'nuoc_loc.png', 1);

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
  `password` varchar(64) NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`id`, `name`, `gender`, `birthday`, `phone`, `address`, `email`, `password`, `status`) VALUES
(1, 'Nguyễn Ngọc Thúy', 0, '1990-11-23', '0832536199', 'Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội', 'nguyenngocthuy@gmail.com', '123', 1),
(2, 'Đáo Đức Thành', 1, '1991-11-23', '0832536200', 'Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội', 'daoducthanh@gmail.com', '123', 0),
(3, 'Tô Nghị', 2, '1992-11-23', '0832536201', 'Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'tonghi@gmail.com', '123', 1),
(4, 'Nguyễn Lê Tuấn', 0, '1993-11-23', '0832536202', '81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'nguyenletuan@gmail.com', '123', 0),
(5, 'Trần Thị Thu', 1, '1994-11-23', '0832536203', '6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội', 'tranthithu@gmail.com', '123', 1),
(6, 'Phạm Duy Hồng', 2, '1995-11-23', '0832536204', '65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'phamduyhong@gmail.com', '123', 0),
(7, 'Lê Hồng Nguyên', 0, '1996-11-23', '0832536205', '51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội', 'lehongnguyen@gmail.com', '123', 1),
(8, 'Hồ Cung Đạt Nhân', 1, '1997-11-23', '0832536206', 'Hàng Bột, Đống Đa, Hà Nội', 'hocungdatnhan@gmail.com', '123', 0),
(9, 'Chu Văn Nam', 2, '1998-11-23', '0832536207', '9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'chuvannam@gmail.com', '123', 1),
(10, 'Huỳnh Đức Long', 0, '1999-11-23', '0832536208', '88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội', 'huynhduclong@gmail.com', '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` float DEFAULT 0,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `shipment_id`, `payment_id`, `customer_id`, `total`, `status`) VALUES
(1, 1, 1, 1, 10000, 1),
(2, 1, 1, 2, 20000, 0),
(3, 1, 1, 3, 30000, 1),
(4, 1, 1, 4, 40000, 0),
(5, 1, 1, 5, 50000, 1),
(6, 1, 1, 6, 60000, 0),
(7, 1, 1, 7, 70000, 1),
(8, 1, 1, 8, 80000, 0),
(9, 1, 1, 9, 90000, 1),
(10, 1, 1, 10, 100000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoicedetail`
--

CREATE TABLE `tblinvoicedetail` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `row_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinvoicedetail`
--

INSERT INTO `tblinvoicedetail` (`id`, `invoice_id`, `product_id`, `quantity`, `row_total`) VALUES
(1, 1, 1, 1, 1500),
(2, 2, 2, 1, 2500),
(3, 3, 3, 1, 3500),
(4, 4, 4, 1, 4500),
(5, 5, 5, 1, 5500),
(6, 6, 6, 1, 6500),
(7, 7, 7, 1, 7500),
(8, 8, 8, 1, 8500),
(9, 9, 9, 1, 9500),
(10, 10, 10, 1, 10500);

-- --------------------------------------------------------

--
-- Table structure for table `tblpayment`
--

CREATE TABLE `tblpayment` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `price` float DEFAULT 0,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpayment`
--

INSERT INTO `tblpayment` (`id`, `name`, `code`, `price`, `status`) VALUES
(1, 'Thanh toán tiền mặt tại quầy', 'HERE', 1000, 1),
(2, 'Thanh toán bằng thẻ ngân hàng', 'CARD', 2000, 0),
(3, 'Chuyển khoản ngân hàng', 'CKNH', 3000, 1),
(4, 'Ship COD', 'SSS', 4000, 0),
(5, 'Thanh toán tích điểm', 'TTTD', 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` float DEFAULT 0,
  `saleable_qty` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `description` varchar(128) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`id`, `name`, `image`, `category_id`, `provider_id`, `quantity`, `price`, `saleable_qty`, `point`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Đệm Everon', 'dem_everon.png', 1, 1, 10, 1000, 15, 1, 1, '', '2022-06-09', '0000-00-00'),
(2, 'Bim Bim Oishi', 'bim_bim_oishi.png', 2, 2, 20, 2000, 25, 2, 0, '', '2022-06-09', '0000-00-00'),
(3, 'Bếp hồng ngoại', 'bep_hong_ngoai.png', 3, 3, 30, 3000, 35, 3, 1, '', '2022-06-09', '0000-00-00'),
(4, 'Bàn chải điện', 'ban_chai_dien.png', 4, 4, 40, 4000, 45, 4, 0, '', '2022-06-09', '0000-00-00'),
(5, 'Cốc viễn đông', 'coc_vien_dong.png', 5, 5, 50, 5000, 55, 5, 1, '', '2022-06-09', '0000-00-00'),
(6, 'Sữa chua trân châu', 'sua_chua_tran_chau.png', 6, 6, 60, 6000, 65, 6, 0, '', '2022-06-09', '0000-00-00'),
(7, 'Sữa tiệt trùng vinamilk', 'sua_tiet_trung_vinamilk.png', 7, 7, 70, 7000, 75, 7, 1, '', '2022-06-09', '0000-00-00'),
(8, 'Sting', 'sting.png', 8, 8, 80, 8000, 85, 8, 0, '', '2022-06-09', '0000-00-00'),
(9, 'Trà xanh không độ', 'tra_xanh_khong_do.png', 9, 9, 90, 9000, 95, 9, 1, '', '2022-06-09', '0000-00-00'),
(10, 'Lavie', 'lavie.png', 10, 10, 100, 10000, 105, 10, 0, '', '2022-06-09', '0000-00-00');

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
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblrole`
--

INSERT INTO `tblrole` (`id`, `name`) VALUES
(1, 'Chủ cửa hàng'),
(2, 'Kế toán'),
(3, 'Kho'),
(4, 'Nhập hàng'),
(5, 'Bán hàng'),
(6, 'Nhân sự');

-- --------------------------------------------------------

--
-- Table structure for table `tblshipment`
--

CREATE TABLE `tblshipment` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `price` float DEFAULT 0,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblshipment`
--

INSERT INTO `tblshipment` (`id`, `name`, `code`, `price`, `status`) VALUES
(1, 'Giao hàng nhanh', 'GHN', 1000, 1),
(2, 'Giao hàng tiết kiệm', 'GHTK', 2000, 0),
(3, 'Viettel Post', 'VP', 3000, 1),
(4, 'J&T Express', 'JE', 4000, 0),
(5, 'Ahamove', 'AM', 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `account` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `name`, `image`, `account`, `password`, `role_id`) VALUES
(1, 'Võ Thị Thanh Thảo', '', 'vothithanhthao', 'vothithanhthao', 1),
(2, 'Lày A Cẩu', '', 'layacau', 'layacau', 2),
(3, 'Bùi Mạnh Quốc Huy', '', 'buimanhquochuy', 'buimanhquochuy', 3),
(4, 'Lê Thị Mai', '', 'lethimai', 'lethimai', 4),
(5, 'Trần Kim Ngọc', '', 'trankimngoc', 'trankimngoc', 5),
(6, 'Lai Như Quỳnh', '', 'lainhuquynh', 'lainhuquynh', 6),
(7, 'Đặng Ngọc Thanh Loan', '', 'dangngocthanhloan', 'dangngocthanhloan', 7),
(8, 'Lê Thị Đào', '', 'lethidao', 'lethidao', 8),
(9, 'Phạm Đoàn Minh Hiếu', '', 'phamdoanminhhieu', 'phamdoanminhhieu', 9),
(10, 'Cao Ngọc Phương Trinh', '', 'caongocphuongtrinh', 'caongocphuongtrinh', 10);

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
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblinvoicedetail`
--
ALTER TABLE `tblinvoicedetail`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
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
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblinvoicedetail`
--
ALTER TABLE `tblinvoicedetail`
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
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
