-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2022 at 06:21 AM
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
-- Table structure for table `tblchungloai`
--

CREATE TABLE `tblchungloai` (
  `id` int(11) NOT NULL,
  `ten` varchar(64) NOT NULL,
  `mota` varchar(128) DEFAULT NULL,
  `anhminhhoa` varchar(256) NOT NULL,
  `ngaytao` date DEFAULT NULL,
  `ngaycapnhat` date DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblchungloai`
--

INSERT INTO `tblchungloai` (`id`, `ten`, `mota`, `anhminhhoa`, `ngaytao`, `ngaycapnhat`, `trangthai`) VALUES
(1, 'Đệm', '', 'dem.png', '2022-06-09', '0000-00-00', '1'),
(2, 'Bim Bim', '', 'bim_bim.png', '2022-06-09', '0000-00-00', '0'),
(3, 'Bếp', '', 'bep.png', '2022-06-09', '0000-00-00', '1'),
(4, 'Bàn chải', '', 'ban_chai.png', '2022-06-09', '0000-00-00', '0'),
(5, 'Cốc', '', 'coc.png', '2022-06-09', '0000-00-00', '1'),
(6, 'Sữa chua', '', 'sua_chua.png', '2022-06-09', '0000-00-00', '0'),
(7, 'Sữa', '', 'sua.png', '2022-06-09', '0000-00-00', '1'),
(8, 'Nước tăng lực', '', 'nuoc_tang_luc.png', '2022-06-09', '0000-00-00', '0'),
(9, 'Nước giải khát', '', 'nuoc_giai_khat.png', '2022-06-09', '0000-00-00', '1'),
(10, 'Nước lọc', '', 'nuoc_loc.png', '2022-06-09', '0000-00-00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblcuahang`
--

CREATE TABLE `tblcuahang` (
  `id` int(11) NOT NULL,
  `tencuahang` varchar(128) NOT NULL,
  `diachi` varchar(128) NOT NULL,
  `sdt` varchar(11) NOT NULL,
  `idnhanvien` int(11) DEFAULT NULL,
  `giomocua` tinyint(4) DEFAULT NULL,
  `giodongcua` tinyint(4) DEFAULT NULL,
  `ghichu` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcuahang`
--

INSERT INTO `tblcuahang` (`id`, `tencuahang`, `diachi`, `sdt`, `idnhanvien`, `giomocua`, `giodongcua`, `ghichu`) VALUES
(1, 'Big Mart 1', 'Số 349 đường 3/2, TT. Đức Tài, H. Đức Linh, T. Bình Thuận (Đối diện bến xe Đức Tài)', '0832536199', 1, 7, 19, 'Cửa hàng thứ nhất'),
(2, 'Big Mart 2', 'Tiểu khu 7, Thị Trấn Thuận Châu, Huyện Thuận Châu, Tỉnh Sơn La', '0832536200', 2, 7, 19, 'Cửa hàng thứ hai'),
(3, 'Big Mart 3', 'Số 473, đường Tô Hiệu, TT. Ít Ong, H. Mường La, T. Sơn La', '0832536201', 3, 7, 19, 'Cửa hàng thứ ba'),
(4, 'Big Mart 4', 'Tổ 9, Phường Tân Phong, Thành Phố Lai Châu, Tỉnh Lai Châu', '0832536202', 4, 7, 19, 'Cửa hàng thứ tư'),
(5, 'Big Mart 5', 'Số 69 Đường Hồng Bàng, P. Sở Dầu, Q. Hồng Bàng, TP. Hải Phòng', '0832536203', 5, 7, 19, 'Cửa hàng thứ năm'),
(6, 'Big Mart 6', 'Quốc lộ 27, Thôn Hạnh Trí 1, X. Quảng Sơn, H. Ninh Sơn, T. Ninh Thuận (gần chợ Quảng Sơn)', '0832536204', 6, 7, 19, 'Cửa hàng thứ sáu'),
(7, 'Big Mart 7', 'Phố Ba Mỏ, TT. Thanh Sơn, H. Thanh Sơn, T. Phú Thọ (Gần ngã tư bến xe Thanh Sơn)', '0832536205', 7, 7, 19, 'Cửa hàng thứ bảy'),
(8, 'Big Mart 8', '485 Hùng Vương, TT. Vạn Giã, H. Vạn Ninh, T. Khánh Hòa', '0832536206', 8, 7, 19, 'Cửa hàng thứ tám'),
(9, 'Big Mart 9', '226 Trần Hưng Đạo, Phường Nam Lý, Thành phố Đồng Hới, Tỉnh Quảng Bình', '0832536207', 9, 7, 19, 'Cửa hàng thứ chín'),
(10, 'Big Mart 10', 'Quốc Lộ 1A, Thôn Dinh Mười, X. Gia Ninh, H. Quảng Ninh, T. Quảng Bình', '0832536208', 10, 7, 19, 'Cửa hàng thứ mười');

-- --------------------------------------------------------

--
-- Table structure for table `tbldiemthuong`
--

CREATE TABLE `tbldiemthuong` (
  `id` int(11) NOT NULL,
  `idkhachhang` int(11) DEFAULT NULL,
  `noidung` varchar(128) DEFAULT NULL,
  `diem` smallint(6) DEFAULT NULL,
  `ngaytao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldiemthuong`
--

INSERT INTO `tbldiemthuong` (`id`, `idkhachhang`, `noidung`, `diem`, `ngaytao`) VALUES
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
-- Table structure for table `tbldonvitinh`
--

CREATE TABLE `tbldonvitinh` (
  `id` int(11) NOT NULL,
  `tendonvi` varchar(32) NOT NULL,
  `ghichu` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldonvitinh`
--

INSERT INTO `tbldonvitinh` (`id`, `tendonvi`, `ghichu`) VALUES
(1, 'Việt Nam đồng', 'VND'),
(2, 'Đô la Mỹ', 'USD'),
(3, 'đồng EURO', 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `tblhanghoa`
--

CREATE TABLE `tblhanghoa` (
  `id` int(11) NOT NULL,
  `ten` varchar(128) NOT NULL,
  `idchungloai` int(11) DEFAULT NULL,
  `iddonvitinh` int(11) DEFAULT NULL,
  `idnhacc` int(11) DEFAULT NULL,
  `soluong` float DEFAULT 0,
  `gianhap` float DEFAULT 0,
  `giaxuat` float DEFAULT 0,
  `ngaytao` date DEFAULT NULL,
  `ngaycapnhat` date DEFAULT NULL,
  `ghichu` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblhanghoa`
--

INSERT INTO `tblhanghoa` (`id`, `ten`, `idchungloai`, `iddonvitinh`, `idnhacc`, `soluong`, `gianhap`, `giaxuat`, `ngaytao`, `ngaycapnhat`, `ghichu`) VALUES
(1, 'Đệm Everon', 1, 1, 1, 10, 1000, 1500, '2022-06-09', '0000-00-00', ''),
(2, 'Bim Bim Oishi', 2, 1, 2, 20, 2000, 2500, '2022-06-09', '0000-00-00', ''),
(3, 'Bếp hồng ngoại', 3, 1, 3, 30, 3000, 3500, '2022-06-09', '0000-00-00', ''),
(4, 'Bàn chải điện', 4, 1, 4, 40, 4000, 4500, '2022-06-09', '0000-00-00', ''),
(5, 'Cốc viễn đông', 5, 1, 5, 50, 5000, 5500, '2022-06-09', '0000-00-00', ''),
(6, 'Sữa chua trân châu', 6, 1, 6, 60, 6000, 6500, '2022-06-09', '0000-00-00', ''),
(7, 'Sữa tiệt trùng vinamilk', 7, 1, 7, 70, 7000, 7500, '2022-06-09', '0000-00-00', ''),
(8, 'Sting', 8, 1, 8, 80, 8000, 8500, '2022-06-09', '0000-00-00', ''),
(9, 'Trà xanh không độ', 9, 1, 9, 90, 9000, 9500, '2022-06-09', '0000-00-00', ''),
(10, 'Lavie', 10, 1, 10, 100, 10000, 10500, '2022-06-09', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblhinhanh`
--

CREATE TABLE `tblhinhanh` (
  `id` int(11) NOT NULL,
  `idhanghoa` int(11) DEFAULT NULL,
  `ghichu` varchar(64) DEFAULT NULL,
  `sothutu` tinyint(4) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblhinhanh`
--

INSERT INTO `tblhinhanh` (`id`, `idhanghoa`, `ghichu`, `sothutu`, `trangthai`) VALUES
(1, 1, 'dem_everon.png', 1, '1'),
(2, 2, 'bim_bim_oishi.png', 1, '1'),
(3, 3, 'bep_hong_ngoai.png', 1, '1'),
(4, 4, 'ban_chai_dien.png', 1, '1'),
(5, 5, 'coc_vien_dong.png', 1, '1'),
(6, 6, 'sua_chua_tran_chau.png', 1, '1'),
(7, 7, 'sua_tiet_trung_vinamilk.png', 1, '1'),
(8, 8, 'sting.png', 1, '1'),
(9, 9, 'tra_xanh_khong_do.png', 1, '1'),
(10, 10, 'lavie.png', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblhoadon`
--

CREATE TABLE `tblhoadon` (
  `id` int(11) NOT NULL,
  `ngaytao` datetime DEFAULT NULL,
  `ngaygiaohang` datetime DEFAULT NULL,
  `idvanchuyen` int(11) DEFAULT NULL,
  `idthanhtoan` int(11) DEFAULT NULL,
  `idkhachhang` int(11) DEFAULT NULL,
  `idnhanvien` int(11) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1',
  `diachinhan` varchar(128) NOT NULL,
  `sdtnhan` varchar(11) NOT NULL,
  `ghichu` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblhoadon`
--

INSERT INTO `tblhoadon` (`id`, `ngaytao`, `ngaygiaohang`, `idvanchuyen`, `idthanhtoan`, `idkhachhang`, `idnhanvien`, `trangthai`, `diachinhan`, `sdtnhan`, `ghichu`) VALUES
(1, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 1, 1, '1', 'Ng. 102 Trường Chinh, Phương Đình, Đống Đa, Hà Nội', '0832536199', ''),
(2, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 2, 2, '0', '43 P.Hàm Long, Hàng Bài, Hoàn Kiếm, Hà Nội', '0832535200', ''),
(3, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 3, 3, '1', '1A Ng. 165 P. Thái Hà, Láng Hạ, Đống Đa, Hà Nội', '0832535201', ''),
(4, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 4, 4, '0', '140 P. Vũ Thạnh, Chợ Dừa, Đống Đa, Hà Nội', '0832535202', ''),
(5, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 5, 5, '1', '380 P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội', '0832535203', ''),
(6, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 6, 6, '0', '1 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội', '0832535204', ''),
(7, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 7, 7, '1', '378B P. Xã Đàn, Nam Đồng, Đống Đa, Hà Nội', '0832535205', ''),
(8, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 8, 8, '0', 'Số 8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội', '0832535206', ''),
(9, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 9, 9, '1', 'Bà Triệu, Nguyễn Du, Hai Bà Trưng, Hà Nội', '0832535207', ''),
(10, '2022-06-09 00:00:00', '2022-06-10 00:00:00', 1, 1, 10, 10, '0', '8 Ngh. 180/29 P. Kim Hoa, Phương Liên, Đống Đa, Hà Nội', '0832535208', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblhoadonchitiet`
--

CREATE TABLE `tblhoadonchitiet` (
  `idhoadon` int(11) NOT NULL,
  `idhanghoa` int(11) NOT NULL,
  `soluong` float DEFAULT NULL,
  `giaban` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblhoadonchitiet`
--

INSERT INTO `tblhoadonchitiet` (`idhoadon`, `idhanghoa`, `soluong`, `giaban`) VALUES
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
-- Table structure for table `tblkhachhang`
--

CREATE TABLE `tblkhachhang` (
  `id` int(11) NOT NULL,
  `ten` varchar(64) NOT NULL,
  `gioitinh` tinyint(4) DEFAULT 1,
  `ngaysinh` date DEFAULT NULL,
  `dienthoai` varchar(11) NOT NULL,
  `diachi` varchar(128) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `ngaytao` date DEFAULT NULL,
  `ngaycapnhat` date DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblkhachhang`
--

INSERT INTO `tblkhachhang` (`id`, `ten`, `gioitinh`, `ngaysinh`, `dienthoai`, `diachi`, `email`, `ngaytao`, `ngaycapnhat`, `trangthai`) VALUES
(1, 'Nguyễn Ngọc Thúy', 0, '1990-11-23', '0832536199', 'Khu tập thể A3 Nam Đồng, A1P49, Phố P. Hồ Đắc Di, Nam Đồng, Đống Đa, Hà Nội', 'nguyenngocthuy@gmail.com', '2022-06-09', '0000-00-00', '1'),
(2, 'Đáo Đức Thành', 1, '1991-11-23', '0832536200', 'Tòa nhà C´Land, 156 Ng. Xã Đàn 2, Nam Đồng, Đống Đa, Hà Nội', 'daoducthanh@gmail.com', '2022-06-09', '0000-00-00', '0'),
(3, 'Tô Nghị', 2, '1992-11-23', '0832536201', 'Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'tonghi@gmail.com', '2022-06-09', '0000-00-00', '1'),
(4, 'Nguyễn Lê Tuấn', 0, '1993-11-23', '0832536202', '81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'nguyenletuan@gmail.com', '2022-06-09', '0000-00-00', '0'),
(5, 'Trần Thị Thu', 1, '1994-11-23', '0832536203', '6 Ng. 84 P. Trần Quang Diệu, Chợ Dừa, Đống Đa, Hà Nội', 'tranthithu@gmail.com', '2022-06-09', '0000-00-00', '1'),
(6, 'Phạm Duy Hồng', 2, '1995-11-23', '0832536204', '65 Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'phamduyhong@gmail.com', '2022-06-09', '0000-00-00', '0'),
(7, 'Lê Hồng Nguyên', 0, '1996-11-23', '0832536205', '51 Đ. Âu Cơ, Tứ Liên, Tây Hồ, Hà Nội', 'lehongnguyen@gmail.com', '2022-06-09', '0000-00-00', '1'),
(8, 'Hồ Cung Đạt Nhân', 1, '1997-11-23', '0832536206', 'Hàng Bột, Đống Đa, Hà Nội', 'hocungdatnhan@gmail.com', '2022-06-09', '0000-00-00', '0'),
(9, 'Chu Văn Nam', 2, '1998-11-23', '0832536207', '9b Nguyễn Đình Thi, Thuỵ Khuê, Tây Hồ, Hà Nội', 'chuvannam@gmail.com', '2022-06-09', '0000-00-00', '1'),
(10, 'Huỳnh Đức Long', 0, '1999-11-23', '0832536208', '88 P.Yên Lãng, Láng Hạ, Đống Đa, Trung Hoà Cầu Giấy Hà Nội', 'huynhduclong@gmail.com', '2022-06-09', '0000-00-00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblnhacungcap`
--

CREATE TABLE `tblnhacungcap` (
  `id` int(11) NOT NULL,
  `tennhacc` varchar(128) NOT NULL,
  `diachi` varchar(128) NOT NULL,
  `sdt` varchar(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `ngaytao` date DEFAULT NULL,
  `ngaycapnhat` date DEFAULT NULL,
  `ghichu` varchar(256) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblnhacungcap`
--

INSERT INTO `tblnhacungcap` (`id`, `tennhacc`, `diachi`, `sdt`, `email`, `ngaytao`, `ngaycapnhat`, `ghichu`, `trangthai`) VALUES
(1, 'Công ty Cổ phần an ninh an toàn thông tin CMC', 'Tầng 4, tòa nhà CMC, phố Duy Tân, phường Dịch Vọng Hậu, quận Cầu Giấy, Thành phố Hà Nội', '0832536199', 'tahoanglinh@gmail.com', '2022-06-09', '0000-00-00', '', '1'),
(2, 'Công ty Cổ phần Thương mại Tin học và Viễn thông Sao Việt', 'Số 16, Ngách 82/5, Ngõ 651, Phố Minh Khai, Phường Thanh Lương, Quận Hai Bà Trưng, Thành phố Hà Nội', '0832536201', 'leminhhai@gmail.com', '2022-06-09', '0000-00-00', '', '0'),
(3, 'Công ty Cổ phần công nghệ truyền thông DTS', 'Số 287B Điện Biên Phủ, Phường 7, Quận 3, Thành phố Hồ Chí Minh', '0832536202', 'tohuyhoang@gmail.com', '2022-06-09', '0000-00-00', '', '1'),
(4, 'Tập đoàn Bưu chính Viễn thông Việt Nam', 'Số 57 phố Huỳnh Thúc Kháng, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam', '0832536203', 'phamduclong@gmail.com', '2022-06-09', '0000-00-00', '', '0'),
(5, 'Công ty Cổ phần Dịch vụ Công nghệ Tin học HPT', 'Tầng 9 Tòa nhà Paragon, số 3 Nguyễn Lương Bằng, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', '0832536204', 'dinhhaduylinh@gmail.com', '2022-06-09', '0000-00-00', '', '1'),
(6, 'Công ty Cổ phần giải pháp công nghệ SAVIS Việt Nam', 'Số 22, lô 1C, đường Trung Yên, 11C, KĐT Trung Yên, Phường Trung Hòa, Quận Cầu Giấy, Thành phố Hà Nội, Việt Nam', '0832536205', 'hoangnguyenvan@gmail.com', '2022-06-09', '0000-00-00', '', '0'),
(7, 'Công ty TNHH Thông tin NTT (Việt Nam)', 'Tòa nhà Vincom, số 72 đường Lê Thánh Tôn, phường Bến Nghé, quận 1, thành phố Hồ Chí Minh, Việt Nam', '0832536206', 'kinyahasegawa@gmail.com', '2022-06-09', '0000-00-00', '', '1'),
(8, 'Công ty Cổ phần Công nghệ Mạng và Truyền thông', 'Số 36 phố Trúc Khê, Phường Láng Hạ, Quận Đống Đa, Thành phố Hà Nội, Việt Nam', '0832536207', 'lengoctu@gmail.com', '2022-06-09', '0000-00-00', '', '0'),
(9, 'Công ty TNHH Hệ thống thông tin FPT', 'Tầng 22 tòa nhà Keangnam Landmark72, E6, đường Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, thành phố Hà Nội, Việt Nam', '0832536208', 'phamminhtuan@gmail.com', '2022-06-09', '0000-00-00', '', '1'),
(10, 'Công ty Cổ phần An ninh mạng Việt Nam', 'Biệt thự số 26 – BT2 – khu đô thị Văn Quán, Phường Văn Quán, Quận Hà Đông, Thành phố Hà Nội, Việt Nam', '0832536209', 'truongducluong@gmail.com', '2022-06-09', '0000-00-00', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblnhanvien`
--

CREATE TABLE `tblnhanvien` (
  `id` int(11) NOT NULL,
  `ten` varchar(64) NOT NULL,
  `gioitinh` tinyint(4) DEFAULT 1,
  `ngaysinh` date NOT NULL,
  `ngayvaolam` date DEFAULT NULL,
  `ngaycapnhat` date DEFAULT NULL,
  `sdt` varchar(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `diachi` varchar(128) DEFAULT NULL,
  `idphanquyen` int(11) DEFAULT NULL,
  `luongcoban` float DEFAULT 0,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `ghichu` varchar(256) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblnhanvien`
--

INSERT INTO `tblnhanvien` (`id`, `ten`, `gioitinh`, `ngaysinh`, `ngayvaolam`, `ngaycapnhat`, `sdt`, `email`, `diachi`, `idphanquyen`, `luongcoban`, `username`, `password`, `ghichu`, `trangthai`) VALUES
(1, 'Võ Thị Thanh Thảo', 0, '1990-11-23', '2022-06-09', '0000-00-00', '0832536199', 'vothithanhthao@gmail.com', '', 1, 1000, 'vothithanhthao', 'vothithanhthao', '', '1'),
(2, 'Lày A Cẩu', 1, '1991-11-23', '2022-06-09', '0000-00-00', '0832536200', 'layacau@gmail.com', '', 2, 2000, 'layacau', 'layacau', '', '1'),
(3, 'Bùi Mạnh Quốc Huy', 2, '1992-11-23', '2022-06-09', '0000-00-00', '0832536201', 'buimanhquochuy@gmail.com', '', 3, 3000, 'buimanhquochuy', 'buimanhquochuy', '', '1'),
(4, 'Lê Thị Mai', 0, '1993-11-23', '2022-06-09', '0000-00-00', '0832536202', 'lethimai@gmail.com', '', 4, 4000, 'lethimai', 'lethimai', '', '1'),
(5, 'Trần Kim Ngọc', 1, '1994-11-23', '2022-06-09', '0000-00-00', '0832536203', 'trankimngoc@gmail.com', '', 5, 5000, 'trankimngoc', 'trankimngoc', '', '1'),
(6, 'Lai Như Quỳnh', 2, '1995-11-23', '2022-06-09', '0000-00-00', '0832536204', 'lainhuquynh@gmail.com', '', 6, 6000, 'lainhuquynh', 'lainhuquynh', '', '1'),
(7, 'Đặng Ngọc Thanh Loan', 0, '1996-11-23', '2022-06-09', '0000-00-00', '0832536205', 'dangngocthanhloan@gmail.com', '', 1, 1000, 'dangngocthanhloan', 'dangngocthanhloan', '', '1'),
(8, 'Lê Thị Đào', 1, '1997-11-23', '2022-06-09', '0000-00-00', '0832536206', 'lethidao@gmail.com', '', 2, 2000, 'lethidao', 'lethidao', '', '1'),
(9, 'Phạm Đoàn Minh Hiếu', 2, '1998-11-23', '2022-06-09', '0000-00-00', '0832536207', 'phamdoanminhhieu@gmail.com', '', 3, 3000, 'phamdoanminhhieu', 'phamdoanminhhieu', '', '1'),
(10, 'Cao Ngọc Phương Trinh', 0, '1999-11-23', '2022-06-09', '0000-00-00', '0832536208', 'caongocphuongtrinh@gmail.com', '', 4, 4000, 'caongocphuongtrinh', 'caongocphuongtrinh', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblphanquyen`
--

CREATE TABLE `tblphanquyen` (
  `id` int(11) NOT NULL,
  `tenquyen` varchar(8) NOT NULL,
  `vitri` varchar(64) NOT NULL,
  `ngaytao` date DEFAULT NULL,
  `ghichu` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblphanquyen`
--

INSERT INTO `tblphanquyen` (`id`, `tenquyen`, `vitri`, `ngaytao`, `ghichu`) VALUES
(1, 'Toàn bộ', 'Chủ cửa hàng', '2022-06-09', 'Đây là chủ tịch'),
(2, 'Phụ trác', 'Kế toán', '2022-06-09', 'Đây là kế toán'),
(3, 'Phụ trác', 'Quản lý kho', '2022-06-09', 'Đây là quản lý kho'),
(4, 'Phụ trác', 'Thu mua', '2022-06-09', 'Đây là quản lý cửa hàng'),
(5, 'Phụ trác', 'Bán hàng', '2022-06-09', 'Đây là quản lý hàng hóa'),
(6, 'Phụ trác', 'Quản lý nhân viên', '2022-06-09', 'Đây là quản lý nhân viên');

-- --------------------------------------------------------

--
-- Table structure for table `tblthanhtoan`
--

CREATE TABLE `tblthanhtoan` (
  `id` int(11) NOT NULL,
  `ten` varchar(64) DEFAULT NULL,
  `ghichu` varchar(128) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblthanhtoan`
--

INSERT INTO `tblthanhtoan` (`id`, `ten`, `ghichu`, `trangthai`) VALUES
(1, 'Thanh toán tiền mặt tại quầy', '', '1'),
(2, 'Thanh toán bằng thẻ ngân hàng', '', '0'),
(3, 'Chuyển khoản ngân hàng', '', '1'),
(4, 'Ship COD', '', '0'),
(5, 'Thanh toán tích điểm', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblvanchuyen`
--

CREATE TABLE `tblvanchuyen` (
  `id` int(11) NOT NULL,
  `ten` varchar(64) DEFAULT NULL,
  `ghichu` varchar(128) DEFAULT NULL,
  `trangthai` varchar(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblvanchuyen`
--

INSERT INTO `tblvanchuyen` (`id`, `ten`, `ghichu`, `trangthai`) VALUES
(1, 'Giao hàng nhanh', 'GHN', '1'),
(2, 'Giao hàng tiết kiệm', 'GHTK', '0'),
(3, 'Viettel Post', '', '1'),
(4, 'J&T Express', '', '0'),
(5, 'Ahamove', '', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblchungloai`
--
ALTER TABLE `tblchungloai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcuahang`
--
ALTER TABLE `tblcuahang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sdt` (`sdt`);

--
-- Indexes for table `tbldiemthuong`
--
ALTER TABLE `tbldiemthuong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkhachhang` (`idkhachhang`);

--
-- Indexes for table `tbldonvitinh`
--
ALTER TABLE `tbldonvitinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhanghoa`
--
ALTER TABLE `tblhanghoa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idchungloai` (`idchungloai`),
  ADD KEY `iddonvitinh` (`iddonvitinh`),
  ADD KEY `idnhacc` (`idnhacc`);

--
-- Indexes for table `tblhinhanh`
--
ALTER TABLE `tblhinhanh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idhanghoa` (`idhanghoa`);

--
-- Indexes for table `tblhoadon`
--
ALTER TABLE `tblhoadon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvanchuyen` (`idvanchuyen`),
  ADD KEY `idthanhtoan` (`idthanhtoan`),
  ADD KEY `idkhachhang` (`idkhachhang`),
  ADD KEY `idnhanvien` (`idnhanvien`);

--
-- Indexes for table `tblhoadonchitiet`
--
ALTER TABLE `tblhoadonchitiet`
  ADD PRIMARY KEY (`idhoadon`,`idhanghoa`),
  ADD KEY `idhanghoa` (`idhanghoa`);

--
-- Indexes for table `tblkhachhang`
--
ALTER TABLE `tblkhachhang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dienthoai` (`dienthoai`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblnhacungcap`
--
ALTER TABLE `tblnhacungcap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblnhanvien`
--
ALTER TABLE `tblnhanvien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sdt` (`sdt`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idphanquyen` (`idphanquyen`);

--
-- Indexes for table `tblphanquyen`
--
ALTER TABLE `tblphanquyen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblthanhtoan`
--
ALTER TABLE `tblthanhtoan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvanchuyen`
--
ALTER TABLE `tblvanchuyen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblchungloai`
--
ALTER TABLE `tblchungloai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcuahang`
--
ALTER TABLE `tblcuahang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbldiemthuong`
--
ALTER TABLE `tbldiemthuong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbldonvitinh`
--
ALTER TABLE `tbldonvitinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblhanghoa`
--
ALTER TABLE `tblhanghoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblhinhanh`
--
ALTER TABLE `tblhinhanh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblhoadon`
--
ALTER TABLE `tblhoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblkhachhang`
--
ALTER TABLE `tblkhachhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblnhacungcap`
--
ALTER TABLE `tblnhacungcap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblnhanvien`
--
ALTER TABLE `tblnhanvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblphanquyen`
--
ALTER TABLE `tblphanquyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblthanhtoan`
--
ALTER TABLE `tblthanhtoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblvanchuyen`
--
ALTER TABLE `tblvanchuyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbldiemthuong`
--
ALTER TABLE `tbldiemthuong`
  ADD CONSTRAINT `tbldiemthuong_ibfk_1` FOREIGN KEY (`idkhachhang`) REFERENCES `tblkhachhang` (`id`);

--
-- Constraints for table `tblhanghoa`
--
ALTER TABLE `tblhanghoa`
  ADD CONSTRAINT `tblhanghoa_ibfk_1` FOREIGN KEY (`idchungloai`) REFERENCES `tblchungloai` (`id`),
  ADD CONSTRAINT `tblhanghoa_ibfk_2` FOREIGN KEY (`iddonvitinh`) REFERENCES `tbldonvitinh` (`id`),
  ADD CONSTRAINT `tblhanghoa_ibfk_3` FOREIGN KEY (`idnhacc`) REFERENCES `tblnhacungcap` (`id`);

--
-- Constraints for table `tblhinhanh`
--
ALTER TABLE `tblhinhanh`
  ADD CONSTRAINT `tblhinhanh_ibfk_1` FOREIGN KEY (`idhanghoa`) REFERENCES `tblhanghoa` (`id`);

--
-- Constraints for table `tblhoadon`
--
ALTER TABLE `tblhoadon`
  ADD CONSTRAINT `tblhoadon_ibfk_1` FOREIGN KEY (`idvanchuyen`) REFERENCES `tblvanchuyen` (`id`),
  ADD CONSTRAINT `tblhoadon_ibfk_2` FOREIGN KEY (`idthanhtoan`) REFERENCES `tblthanhtoan` (`id`),
  ADD CONSTRAINT `tblhoadon_ibfk_3` FOREIGN KEY (`idkhachhang`) REFERENCES `tblkhachhang` (`id`),
  ADD CONSTRAINT `tblhoadon_ibfk_4` FOREIGN KEY (`idnhanvien`) REFERENCES `tblnhanvien` (`id`);

--
-- Constraints for table `tblhoadonchitiet`
--
ALTER TABLE `tblhoadonchitiet`
  ADD CONSTRAINT `tblhoadonchitiet_ibfk_1` FOREIGN KEY (`idhoadon`) REFERENCES `tblhoadon` (`id`),
  ADD CONSTRAINT `tblhoadonchitiet_ibfk_2` FOREIGN KEY (`idhanghoa`) REFERENCES `tblhanghoa` (`id`);

--
-- Constraints for table `tblnhanvien`
--
ALTER TABLE `tblnhanvien`
  ADD CONSTRAINT `tblnhanvien_ibfk_1` FOREIGN KEY (`idphanquyen`) REFERENCES `tblphanquyen` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
