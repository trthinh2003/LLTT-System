-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 04:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ql_lich_th`
--

-- --------------------------------------------------------

--
-- Table structure for table `cauhinhmay`
--

CREATE TABLE `cauhinhmay` (
  `MACAUHINH` char(15) NOT NULL,
  `CPU` varchar(50) DEFAULT NULL,
  `RAM` varchar(15) DEFAULT NULL,
  `SSD` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `cauhinhmay`
--

INSERT INTO `cauhinhmay` (`MACAUHINH`, `CPU`, `RAM`, `SSD`) VALUES
('CH01', 'Intel Core i3-9100', '8GB', '512GB'),
('CH02', 'Intel Core i5-11400', '16GB', '1TB'),
('CH03', 'Intel Core i7-12700', '32GB', '1TB');

-- --------------------------------------------------------

--
-- Table structure for table `giangvien`
--

CREATE TABLE `giangvien` (
  `GIANGVIEN_ID` int(11) NOT NULL,
  `HOTENGIANGVIEN` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `SODIENTHOAI` varchar(15) NOT NULL,
  `GIOITINH` char(10) NOT NULL,
  `MAKHOA` varchar(15) NOT NULL,
  `LYLICH_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `giangvien`
--

INSERT INTO `giangvien` (`GIANGVIEN_ID`, `HOTENGIANGVIEN`, `EMAIL`, `SODIENTHOAI`, `GIOITINH`, `MAKHOA`, `LYLICH_ID`) VALUES
(1, 'Vũ Đức Minh', 'vducminh@ctu.edu.vn', '0912567891', 'Nam', 'CNTT', 1),
(2, 'Trần Ngọc Khả Hân', 'khahan@ctu.edu.vn', '0973573577', 'Nữ', 'ATTT', 2),
(3, 'Lâm Trần Anh Khôi', 'anhkhoi96@ctu.edu.vn', '0917537565', 'Nam', 'HTTT', 4),
(4, 'Nguyễn Ngọc Ngạn', 'ngocngan@ctu.edu.vn', '02933567789', 'Nam', 'KTPM', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hocki`
--

CREATE TABLE `hocki` (
  `HOCKI` varchar(10) NOT NULL,
  `NAMHOC` varchar(20) NOT NULL,
  `NGAYBATDAU` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hocki`
--

INSERT INTO `hocki` (`HOCKI`, `NAMHOC`, `NGAYBATDAU`) VALUES
('1', '2023-2024', NULL),
('2', '2023 - 2024', '2024-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `hocphan`
--

CREATE TABLE `hocphan` (
  `MAHOCPHAN` char(15) NOT NULL,
  `TENHOCPHAN` varchar(40) NOT NULL,
  `SOTINCHI` int(11) DEFAULT NULL,
  `SOGIOTH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `hocphan`
--

INSERT INTO `hocphan` (`MAHOCPHAN`, `TENHOCPHAN`, `SOTINCHI`, `SOGIOTH`) VALUES
('CT101', 'Lập trình căn bản A', 4, NULL),
('CT112', 'Mạng máy tính', 3, NULL),
('CT175', 'Lý thuyết đồ thị', 3, NULL),
('CT179', 'Quản trị hệ thống', 3, NULL),
('CT180', 'Cơ sở dữ liệu', 3, NULL),
('CT202', 'Nguyên lý máy học', 3, NULL),
('CT296', 'Phân tích thiết kế HTTT', 3, NULL),
('CT299', 'Phát triển hệ thống Web', 3, NULL),
('CT430', 'Phân tích hệ thống HĐT', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `MAKHOA` varchar(15) NOT NULL,
  `TENKHOA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`MAKHOA`, `TENKHOA`) VALUES
('ATTT', 'An Toàn Thông Tin'),
('CNTT', 'Công Nghệ Thông Tin'),
('HTTT', 'Hệ Thống Thông Tin'),
('KHMT', 'Khoa Học Máy Tính'),
('KTPM', 'Kỹ Thuật Phần Mềm'),
('MMT', 'Mạng Máy Tính Và Truyền Thông Dữ Liệu');

-- --------------------------------------------------------

--
-- Table structure for table `lichthuchanh`
--

CREATE TABLE `lichthuchanh` (
  `MAPHONGHOC` char(15) NOT NULL,
  `MAHOCPHAN` char(15) NOT NULL,
  `HOCKI` varchar(10) NOT NULL,
  `NAMHOC` varchar(20) NOT NULL,
  `TENNHOM` int(11) NOT NULL,
  `NGAYHOC` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lophocphan`
--

CREATE TABLE `lophocphan` (
  `MAHOCPHAN` char(15) NOT NULL,
  `HOCKI` varchar(10) NOT NULL,
  `NAMHOC` varchar(20) NOT NULL,
  `TENNHOM` int(11) NOT NULL,
  `THU` int(11) DEFAULT NULL,
  `SISO` int(11) DEFAULT NULL,
  `BUOIHOC` varchar(15) DEFAULT NULL,
  `GIANGVIEN_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `lophocphan`
--

INSERT INTO `lophocphan` (`MAHOCPHAN`, `HOCKI`, `NAMHOC`, `TENNHOM`, `THU`, `SISO`, `BUOIHOC`, `GIANGVIEN_ID`) VALUES
('CT101', '2', '2023 - 2024', 1, 2, 40, 'Sáng', 2),
('CT112', '2', '2023 - 2024', 4, 3, 40, 'Sáng', 1),
('CT175', '2', '2023 - 2024', 1, 3, 40, 'Chiều', 2),
('CT179', '2', '2023 - 2024', 1, 3, 40, 'Sáng', 3),
('CT179', '2', '2023 - 2024', 2, 4, 80, 'Chiều', 2),
('CT180', '2', '2023 - 2024', 1, 2, 40, 'Sáng', 3),
('CT180', '2', '2023 - 2024', 2, 5, 40, 'Sáng', 3),
('CT180', '2', '2023 - 2024', 3, 2, 40, 'Chiều', 1),
('CT202', '2', '2023 - 2024', 1, 2, 40, 'Sáng', 4),
('CT202', '2', '2023 - 2024', 2, 2, 40, 'Sáng', 1),
('CT296', '2', '2023 - 2024', 1, 2, 40, 'Sáng', 4),
('CT296', '2', '2023 - 2024', 2, 3, 40, 'Sáng', 4),
('CT299', '2', '2023 - 2024', 1, 6, 40, 'Chiều', 3),
('CT299', '2', '2023 - 2024', 2, 2, 40, 'Sáng', 1),
('CT430', '2', '2023 - 2024', 1, 4, 40, 'Chiều', 4);

-- --------------------------------------------------------

--
-- Table structure for table `lylichkhoahoc`
--

CREATE TABLE `lylichkhoahoc` (
  `LYLICH_ID` int(11) NOT NULL,
  `TRINHDOCHUYENMON` varchar(40) DEFAULT NULL,
  `HOCHAM` varchar(50) DEFAULT NULL,
  `NGACHVIENCHUC` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `lylichkhoahoc`
--

INSERT INTO `lylichkhoahoc` (`LYLICH_ID`, `TRINHDOCHUYENMON`, `HOCHAM`, `NGACHVIENCHUC`) VALUES
(2, 'Tiến sĩ', NULL, 'Giảng viên'),
(3, 'Tiến sĩ', NULL, 'Giảng viên chính'),
(4, 'Tiến sĩ', 'Giáo sư', 'Giảng viên cao cấp'),
(1, 'Tiến sĩ', 'Phó giáo sư', 'Giảng viên cao cấp');

-- --------------------------------------------------------

--
-- Table structure for table `phanmem`
--

CREATE TABLE `phanmem` (
  `PHANMEM_ID` int(11) NOT NULL,
  `TENPHANMEM` varchar(30) DEFAULT NULL,
  `PHIENBAN` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `phanmem`
--

INSERT INTO `phanmem` (`PHANMEM_ID`, `TENPHANMEM`, `PHIENBAN`) VALUES
(4, 'DevC++', '4.0'),
(8, 'Eclipse IDE', '2024-03'),
(6, 'OracleDB', '21c'),
(3, 'PowerDesigner', '16.1'),
(9, 'PyCharm', '2021.3.3'),
(5, 'SQL Server', '2022'),
(1, 'StarUML', '6.1.0'),
(7, 'VirtualBox', '7.0.14'),
(2, 'VS Code', '1.64');

-- --------------------------------------------------------

--
-- Table structure for table `phanmem_phonghoc`
--

CREATE TABLE `phanmem_phonghoc` (
  `MAPHONGHOC` char(15) NOT NULL,
  `PHANMEM_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `phanmem_phonghoc`
--

INSERT INTO `phanmem_phonghoc` (`MAPHONGHOC`, `PHANMEM_ID`) VALUES
('P101', 1),
('P101', 2),
('P101', 3),
('P101', 4),
('P101', 7),
('P101', 8),
('P102', 1),
('P102', 2),
('P102', 3),
('P102', 4),
('P102', 7),
('P102', 8),
('P102', 9),
('P103', 1),
('P103', 3),
('P103', 5),
('P103', 6),
('P103', 7),
('P103', 8),
('P104', 1),
('P104', 2),
('P104', 4),
('P104', 5),
('P104', 7),
('P104', 8),
('P105', 3),
('P105', 4),
('P105', 5),
('P105', 6),
('P105', 7),
('P105', 8),
('P106', 1),
('P106', 2),
('P106', 3),
('P106', 4),
('P106', 8),
('P107', 1),
('P107', 5),
('P107', 6),
('P107', 8),
('P108', 1),
('P108', 2),
('P108', 3),
('P108', 6),
('P108', 7),
('P108', 8),
('P109', 1),
('P109', 2),
('P109', 4),
('P109', 5),
('P109', 7),
('P109', 8),
('P110', 1),
('P110', 2),
('P110', 4),
('P110', 5),
('P110', 7),
('P110', 8),
('P111', 1),
('P111', 4),
('P111', 5),
('P111', 6),
('P111', 7),
('P111', 8),
('P201', 1),
('P201', 2),
('P201', 3),
('P201', 4),
('P201', 5),
('P201', 6),
('P201', 7),
('P201', 8),
('P202', 1),
('P202', 2),
('P202', 3),
('P202', 4),
('P202', 5),
('P202', 6),
('P202', 7),
('P202', 8),
('P203', 1),
('P203', 2),
('P203', 3),
('P203', 4),
('P203', 5),
('P203', 6),
('P203', 7),
('P203', 8),
('P204', 1),
('P204', 2),
('P204', 3),
('P204', 4),
('P204', 5),
('P204', 6),
('P204', 7),
('P204', 8),
('P205', 1),
('P205', 2),
('P205', 3),
('P205', 4),
('P205', 5),
('P205', 6),
('P205', 7),
('P205', 8),
('P206', 1),
('P206', 2),
('P206', 3),
('P206', 4),
('P206', 5),
('P206', 6),
('P206', 7),
('P206', 8),
('P207', 1),
('P207', 2),
('P207', 3),
('P207', 4),
('P207', 5),
('P207', 6),
('P207', 7),
('P207', 8),
('P208', 1),
('P208', 2),
('P208', 3),
('P208', 4),
('P208', 5),
('P208', 6),
('P208', 7),
('P208', 8),
('P209', 1),
('P209', 2),
('P209', 3),
('P209', 4),
('P209', 5),
('P209', 6),
('P209', 7),
('P209', 8),
('P210', 1),
('P210', 2),
('P210', 3),
('P210', 4),
('P210', 5),
('P210', 6),
('P210', 7),
('P210', 8),
('P211', 1),
('P211', 2),
('P211', 3),
('P211', 4),
('P211', 5),
('P211', 6),
('P211', 7),
('P211', 8),
('P212', 1),
('P212', 2),
('P212', 3),
('P212', 4),
('P212', 5),
('P212', 6),
('P212', 7),
('P212', 8),
('P213', 1),
('P213', 2),
('P213', 3),
('P213', 4),
('P213', 5),
('P213', 6),
('P213', 7),
('P213', 8),
('P214', 1),
('P214', 2),
('P214', 3),
('P214', 4),
('P214', 5),
('P214', 6),
('P214', 7),
('P214', 8),
('P215', 1),
('P215', 2),
('P215', 3),
('P215', 4),
('P215', 5),
('P215', 6),
('P215', 7),
('P215', 8),
('P217', 1),
('P217', 2),
('P217', 3),
('P217', 4),
('P217', 5),
('P217', 6),
('P217', 7),
('P217', 8),
('P218', 1),
('P218', 2),
('P218', 3),
('P218', 4),
('P218', 5),
('P218', 6),
('P218', 7),
('P218', 8),
('P219', 1),
('P219', 2),
('P219', 3),
('P219', 4),
('P219', 5),
('P219', 6),
('P219', 7),
('P219', 8),
('P220', 1),
('P220', 2),
('P220', 3),
('P220', 4),
('P220', 5),
('P220', 6),
('P220', 7),
('P220', 8),
('P221', 1),
('P221', 2),
('P221', 3),
('P221', 4),
('P221', 5),
('P221', 6),
('P221', 7),
('P221', 8);

-- --------------------------------------------------------

--
-- Table structure for table `phonghoc`
--

CREATE TABLE `phonghoc` (
  `MAPHONGHOC` char(15) NOT NULL,
  `MACAUHINH` char(15) NOT NULL,
  `SUCCHUA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `phonghoc`
--

INSERT INTO `phonghoc` (`MAPHONGHOC`, `MACAUHINH`, `SUCCHUA`) VALUES
('P101', 'CH01', 40),
('P102', 'CH01', 40),
('P103', 'CH01', 40),
('P104', 'CH01', 40),
('P105', 'CH01', 40),
('P106', 'CH01', 40),
('P107', 'CH01', 40),
('P108', 'CH01', 40),
('P109', 'CH01', 40),
('P110', 'CH01', 40),
('P111', 'CH01', 40),
('P201', 'CH02', 40),
('P202', 'CH02', 40),
('P203', 'CH02', 40),
('P204', 'CH02', 50),
('P205', 'CH02', 50),
('P206', 'CH02', 50),
('P207', 'CH02', 50),
('P208', 'CH02', 50),
('P209', 'CH02', 50),
('P210', 'CH02', 50),
('P211', 'CH02', 50),
('P212', 'CH02', 50),
('P213', 'CH02', 50),
('P214', 'CH02', 50),
('P215', 'CH02', 50),
('P217', 'CH02', 50),
('P218', 'CH02', 50),
('P219', 'CH03', 40),
('P220', 'CH03', 40),
('P221', 'CH03', 50);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TAIKHOAN_ID` int(11) NOT NULL,
  `TENDANGNHAP` varchar(30) DEFAULT NULL,
  `matkhau` varchar(50) NOT NULL,
  `ROLE` int(11) DEFAULT NULL,
  `GIANGVIEN_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`TAIKHOAN_ID`, `TENDANGNHAP`, `matkhau`, `ROLE`, `GIANGVIEN_ID`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 1, NULL),
(2, 'ducminh', 'd9331c0b37a823f1da56e10c9ef21771', 2, 1),
(3, 'anhkhoi', 'cb45a43710784451cee2992b63fe745e', 2, 3),
(4, 'khahan', 'cc12c12ad0189ae831f7e289592ebbda', 2, 2),
(5, 'ngocngan', '685d77ba6b0877c55008a16e3d1a8802', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `yeucau`
--

CREATE TABLE `yeucau` (
  `YEUCAU_ID` int(11) NOT NULL,
  `MAHOCPHAN` char(15) DEFAULT NULL,
  `HOCKI` varchar(10) DEFAULT NULL,
  `NAMHOC` varchar(20) DEFAULT NULL,
  `TENNHOM` int(11) DEFAULT NULL,
  `PHANMEM_ID` int(11) DEFAULT NULL,
  `GIANGVIEN_ID` int(11) DEFAULT NULL,
  `TUANHOC` int(11) DEFAULT NULL,
  `NGAYYEUCAU` datetime DEFAULT current_timestamp(),
  `TRANGTHAI` varchar(40) DEFAULT 'Chờ duyệt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `yeucau`
--

INSERT INTO `yeucau` (`YEUCAU_ID`, `MAHOCPHAN`, `HOCKI`, `NAMHOC`, `TENNHOM`, `PHANMEM_ID`, `GIANGVIEN_ID`, `TUANHOC`, `NGAYYEUCAU`, `TRANGTHAI`) VALUES
(1, 'CT179', '2', '2023 - 2024', 2, 7, 2, 1, '2024-04-22 08:54:37', 'Chờ duyệt'),
(2, 'CT179', '2', '2023 - 2024', 2, 7, 2, 2, '2024-04-22 08:54:37', 'Chờ duyệt'),
(3, 'CT179', '2', '2023 - 2024', 2, 7, 2, 5, '2024-04-22 08:54:37', 'Chờ duyệt'),
(4, 'CT179', '2', '2023 - 2024', 2, 7, 2, 4, '2024-04-22 08:54:37', 'Chờ duyệt'),
(5, 'CT179', '2', '2023 - 2024', 2, 7, 2, 3, '2024-04-22 08:54:37', 'Chờ duyệt'),
(6, 'CT202', '2', '2023 - 2024', 1, 9, 4, 1, '2024-04-22 09:31:37', 'Chờ duyệt'),
(7, 'CT202', '2', '2023 - 2024', 2, 9, 1, 1, '2024-04-22 09:32:04', 'Chờ duyệt'),
(8, 'CT179', '2', '2023 - 2024', 1, 7, 3, 1, '2024-04-11 19:54:24', 'Chờ duyệt'),
(9, 'CT179', '2', '2023 - 2024', 1, 7, 3, 2, '2024-04-11 19:54:24', 'Chờ duyệt'),
(10, 'CT179', '2', '2023 - 2024', 1, 7, 3, 5, '2024-04-11 19:54:24', 'Chờ duyệt'),
(11, 'CT179', '2', '2023 - 2024', 1, 7, 3, 3, '2024-04-11 19:54:24', 'Chờ duyệt'),
(12, 'CT179', '2', '2023 - 2024', 1, 7, 3, 4, '2024-04-11 19:54:24', 'Chờ duyệt'),
(13, 'CT180', '2', '2023 - 2024', 1, 6, 3, 3, '2024-04-11 19:54:48', 'Chờ duyệt'),
(14, 'CT180', '2', '2023 - 2024', 1, 6, 3, 1, '2024-04-11 19:54:48', 'Chờ duyệt'),
(15, 'CT180', '2', '2023 - 2024', 1, 6, 3, 5, '2024-04-11 19:54:48', 'Chờ duyệt'),
(16, 'CT180', '2', '2023 - 2024', 1, 6, 3, 4, '2024-04-11 19:54:48', 'Chờ duyệt'),
(17, 'CT180', '2', '2023 - 2024', 1, 6, 3, 2, '2024-04-11 19:54:48', 'Chờ duyệt'),
(18, 'CT112', '2', '2023 - 2024', 4, 7, 1, 1, '2024-04-11 19:55:27', 'Chờ duyệt'),
(19, 'CT112', '2', '2023 - 2024', 4, 7, 1, 3, '2024-04-11 19:55:27', 'Chờ duyệt'),
(20, 'CT112', '2', '2023 - 2024', 4, 7, 1, 5, '2024-04-11 19:55:27', 'Chờ duyệt'),
(21, 'CT112', '2', '2023 - 2024', 4, 7, 1, 2, '2024-04-11 19:55:27', 'Chờ duyệt'),
(22, 'CT112', '2', '2023 - 2024', 4, 7, 1, 4, '2024-04-11 19:55:27', 'Chờ duyệt'),
(23, 'CT101', '2', '2023 - 2024', 1, 4, 2, 1, '2024-04-11 19:56:10', 'Chờ duyệt'),
(24, 'CT101', '2', '2023 - 2024', 1, 4, 2, 2, '2024-04-11 19:56:10', 'Chờ duyệt'),
(25, 'CT101', '2', '2023 - 2024', 1, 4, 2, 4, '2024-04-11 19:56:10', 'Chờ duyệt'),
(26, 'CT101', '2', '2023 - 2024', 1, 4, 2, 3, '2024-04-11 19:56:10', 'Chờ duyệt'),
(27, 'CT101', '2', '2023 - 2024', 1, 4, 2, 5, '2024-04-11 19:56:10', 'Chờ duyệt'),
(28, 'CT175', '2', '2023 - 2024', 1, 4, 2, 2, '2024-04-11 19:56:22', 'Chờ duyệt'),
(29, 'CT175', '2', '2023 - 2024', 1, 4, 2, 1, '2024-04-11 19:56:22', 'Chờ duyệt'),
(30, 'CT175', '2', '2023 - 2024', 1, 4, 2, 5, '2024-04-11 19:56:22', 'Chờ duyệt'),
(31, 'CT175', '2', '2023 - 2024', 1, 4, 2, 3, '2024-04-11 19:56:22', 'Chờ duyệt'),
(32, 'CT175', '2', '2023 - 2024', 1, 4, 2, 4, '2024-04-11 19:56:22', 'Chờ duyệt'),
(33, 'CT296', '2', '2023 - 2024', 1, 3, 4, 5, '2024-04-11 20:33:32', 'Chờ duyệt'),
(34, 'CT296', '2', '2023 - 2024', 1, 3, 4, 4, '2024-04-11 20:33:32', 'Chờ duyệt'),
(35, 'CT296', '2', '2023 - 2024', 1, 3, 4, 1, '2024-04-11 20:33:32', 'Chờ duyệt'),
(36, 'CT296', '2', '2023 - 2024', 1, 3, 4, 3, '2024-04-11 20:33:32', 'Chờ duyệt'),
(37, 'CT296', '2', '2023 - 2024', 1, 3, 4, 2, '2024-04-11 20:33:32', 'Chờ duyệt'),
(38, 'CT296', '2', '2023 - 2024', 2, 3, 4, 1, '2024-04-11 20:33:45', 'Chờ duyệt'),
(39, 'CT296', '2', '2023 - 2024', 2, 3, 4, 3, '2024-04-11 20:33:45', 'Chờ duyệt'),
(40, 'CT296', '2', '2023 - 2024', 2, 3, 4, 2, '2024-04-11 20:33:45', 'Chờ duyệt'),
(41, 'CT296', '2', '2023 - 2024', 2, 3, 4, 5, '2024-04-11 20:33:45', 'Chờ duyệt'),
(42, 'CT296', '2', '2023 - 2024', 2, 3, 4, 4, '2024-04-11 20:33:45', 'Chờ duyệt'),
(43, 'CT430', '2', '2023 - 2024', 1, 1, 4, 2, '2024-04-11 20:33:59', 'Chờ duyệt'),
(44, 'CT430', '2', '2023 - 2024', 1, 1, 4, 1, '2024-04-11 20:33:59', 'Chờ duyệt'),
(45, 'CT430', '2', '2023 - 2024', 1, 1, 4, 4, '2024-04-11 20:33:59', 'Chờ duyệt'),
(46, 'CT430', '2', '2023 - 2024', 1, 1, 4, 3, '2024-04-11 20:33:59', 'Chờ duyệt'),
(47, 'CT430', '2', '2023 - 2024', 1, 1, 4, 5, '2024-04-11 20:33:59', 'Chờ duyệt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cauhinhmay`
--
ALTER TABLE `cauhinhmay`
  ADD PRIMARY KEY (`MACAUHINH`);

--
-- Indexes for table `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`GIANGVIEN_ID`),
  ADD UNIQUE KEY `HOTENGIANGVIEN` (`HOTENGIANGVIEN`,`EMAIL`,`SODIENTHOAI`,`GIOITINH`,`MAKHOA`),
  ADD KEY `MAKHOA` (`MAKHOA`,`LYLICH_ID`),
  ADD KEY `LYLICH_ID` (`LYLICH_ID`);

--
-- Indexes for table `hocki`
--
ALTER TABLE `hocki`
  ADD PRIMARY KEY (`HOCKI`,`NAMHOC`);

--
-- Indexes for table `hocphan`
--
ALTER TABLE `hocphan`
  ADD PRIMARY KEY (`MAHOCPHAN`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`MAKHOA`);

--
-- Indexes for table `lichthuchanh`
--
ALTER TABLE `lichthuchanh`
  ADD PRIMARY KEY (`MAPHONGHOC`,`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`,`NGAYHOC`),
  ADD KEY `FK_LICHTH_LOPHP` (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`);

--
-- Indexes for table `lophocphan`
--
ALTER TABLE `lophocphan`
  ADD PRIMARY KEY (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`),
  ADD KEY `FK_LOPHP_HKNH` (`HOCKI`,`NAMHOC`),
  ADD KEY `GIANGVIEN_ID` (`GIANGVIEN_ID`);

--
-- Indexes for table `lylichkhoahoc`
--
ALTER TABLE `lylichkhoahoc`
  ADD PRIMARY KEY (`LYLICH_ID`),
  ADD UNIQUE KEY `TRINHDOCHUYENMON` (`TRINHDOCHUYENMON`,`HOCHAM`,`NGACHVIENCHUC`);

--
-- Indexes for table `phanmem`
--
ALTER TABLE `phanmem`
  ADD PRIMARY KEY (`PHANMEM_ID`),
  ADD UNIQUE KEY `TENPHANMEM` (`TENPHANMEM`,`PHIENBAN`);

--
-- Indexes for table `phanmem_phonghoc`
--
ALTER TABLE `phanmem_phonghoc`
  ADD PRIMARY KEY (`MAPHONGHOC`,`PHANMEM_ID`),
  ADD KEY `MAPHONGHOC` (`MAPHONGHOC`,`PHANMEM_ID`),
  ADD KEY `PHANMEM_ID` (`PHANMEM_ID`);

--
-- Indexes for table `phonghoc`
--
ALTER TABLE `phonghoc`
  ADD PRIMARY KEY (`MAPHONGHOC`),
  ADD KEY `FK_CHMAY_PH` (`MACAUHINH`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TAIKHOAN_ID`),
  ADD UNIQUE KEY `TENDANGNHAP` (`TENDANGNHAP`),
  ADD KEY `GIANGVIEN_ID` (`GIANGVIEN_ID`);

--
-- Indexes for table `yeucau`
--
ALTER TABLE `yeucau`
  ADD PRIMARY KEY (`YEUCAU_ID`),
  ADD UNIQUE KEY `MAHOCPHAN_2` (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`,`TUANHOC`),
  ADD KEY `PHANMEM_ID` (`PHANMEM_ID`),
  ADD KEY `GIANGVIEN_ID` (`GIANGVIEN_ID`),
  ADD KEY `MAHOCPHAN` (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`,`TUANHOC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `GIANGVIEN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lylichkhoahoc`
--
ALTER TABLE `lylichkhoahoc`
  MODIFY `LYLICH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `phanmem`
--
ALTER TABLE `phanmem`
  MODIFY `PHANMEM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `TAIKHOAN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `yeucau`
--
ALTER TABLE `yeucau`
  MODIFY `YEUCAU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`),
  ADD CONSTRAINT `giangvien_ibfk_2` FOREIGN KEY (`LYLICH_ID`) REFERENCES `lylichkhoahoc` (`LYLICH_ID`);

--
-- Constraints for table `lichthuchanh`
--
ALTER TABLE `lichthuchanh`
  ADD CONSTRAINT `FK_LICHTH_LOPHP` FOREIGN KEY (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`) REFERENCES `lophocphan` (`MAHOCPHAN`, `HOCKI`, `NAMHOC`, `TENNHOM`),
  ADD CONSTRAINT `FK_LICHTH_PHONGHOC` FOREIGN KEY (`MAPHONGHOC`) REFERENCES `phonghoc` (`MAPHONGHOC`);

--
-- Constraints for table `lophocphan`
--
ALTER TABLE `lophocphan`
  ADD CONSTRAINT `FK_LOPHP_HKNH` FOREIGN KEY (`HOCKI`,`NAMHOC`) REFERENCES `hocki` (`HOCKI`, `NAMHOC`),
  ADD CONSTRAINT `FK_LOPHP_HP` FOREIGN KEY (`MAHOCPHAN`) REFERENCES `hocphan` (`MAHOCPHAN`),
  ADD CONSTRAINT `lophocphan_ibfk_1` FOREIGN KEY (`GIANGVIEN_ID`) REFERENCES `giangvien` (`GIANGVIEN_ID`);

--
-- Constraints for table `phanmem_phonghoc`
--
ALTER TABLE `phanmem_phonghoc`
  ADD CONSTRAINT `phanmem_phonghoc_ibfk_1` FOREIGN KEY (`PHANMEM_ID`) REFERENCES `phanmem` (`PHANMEM_ID`),
  ADD CONSTRAINT `phanmem_phonghoc_ibfk_2` FOREIGN KEY (`MAPHONGHOC`) REFERENCES `phonghoc` (`MAPHONGHOC`);

--
-- Constraints for table `phonghoc`
--
ALTER TABLE `phonghoc`
  ADD CONSTRAINT `FK_CHMAY_PH` FOREIGN KEY (`MACAUHINH`) REFERENCES `cauhinhmay` (`MACAUHINH`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`GIANGVIEN_ID`) REFERENCES `giangvien` (`GIANGVIEN_ID`);

--
-- Constraints for table `yeucau`
--
ALTER TABLE `yeucau`
  ADD CONSTRAINT `FK_YC_LHP` FOREIGN KEY (`MAHOCPHAN`,`HOCKI`,`NAMHOC`,`TENNHOM`) REFERENCES `lophocphan` (`MAHOCPHAN`, `HOCKI`, `NAMHOC`, `TENNHOM`),
  ADD CONSTRAINT `yeucau_ibfk_1` FOREIGN KEY (`PHANMEM_ID`) REFERENCES `phanmem` (`PHANMEM_ID`),
  ADD CONSTRAINT `yeucau_ibfk_2` FOREIGN KEY (`GIANGVIEN_ID`) REFERENCES `giangvien` (`GIANGVIEN_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
