-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 12:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` smallint(6) NOT NULL,
  `customer_id` smallint(6) NOT NULL,
  `cashier_id` smallint(6) NOT NULL,
  `bill_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `customer_id`, `cashier_id`, `bill_time`) VALUES
(1, 1, 1, '2023-05-01 17:12:50'),
(2, 4, 2, '2023-05-05 10:20:10'),
(3, 2, 1, '2023-05-08 12:20:12'),
(4, 5, 3, '2023-05-01 08:12:02'),
(5, 3, 3, '2023-04-04 12:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` smallint(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'Đỗ Minh Đức', 'dominhduc@gmail.com', '0338671587', 'Cầu Giấy - Hà Nội'),
(2, 'Trương Minh Đức', 'truongminhduc@gmail.com', '0165273187', 'Nam Từ Liêm - Hà Nội'),
(3, 'Phùng Huy Hoàng', 'phunghuyhoang@gmail.com', '01675243836', 'Cầu Giấy - Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` smallint(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'Phạm Văn Đồng', 'phamvandong@gmail.com', '0123456789', 'Cầu Giấy - Hà Nội'),
(2, 'Lê Xuân Tài', 'lexuantai@gmail.com', '9875463210', 'Hoàng Mai-Hà Nội'),
(3, 'Nguyễn Thị Kim', 'nguyenthikim@gmail.com', '8877665500', 'Thanh Xuân - Hà Nội'),
(4, 'Nguyễn Văn Phương', 'nguyenvanphuong@gmail.com', '1023456789', 'Hà Đông - Hà Nội'),
(5, 'Đỗ Minh Anh', 'dominhanh@gmail.com', '0165524338', 'Ba Đình - Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `goods_id` smallint(6) NOT NULL,
  `goods_name` varchar(45) NOT NULL,
  `goods_cost` int(20) NOT NULL,
  `amount` smallint(6) NOT NULL,
  `MFG` date NOT NULL,
  `EXP` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`goods_id`, `goods_name`, `goods_cost`, `amount`, `MFG`, `EXP`) VALUES
(1, 'nước xả vải', 320000, 100, '2023-05-03', '2026-05-03'),
(2, 'nước rửa bát', 50000, 120, '2023-01-01', '2026-01-01'),
(3, 'mì tôm hảo hảo', 3500, 500, '2023-03-03', '2024-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `list_bill`
--

CREATE TABLE `list_bill` (
  `list_bill_id` int(6) NOT NULL,
  `bill_id` smallint(6) NOT NULL,
  `goods_id` smallint(6) NOT NULL,
  `amount` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `list_bill`
--

INSERT INTO `list_bill` (`list_bill_id`, `bill_id`, `goods_id`, `amount`) VALUES
(1, 1, 3, 4),
(2, 1, 2, 3),
(3, 2, 3, 2),
(4, 2, 1, 2),
(5, 2, 2, 1),
(6, 3, 1, 3),
(7, 3, 1, 2),
(8, 4, 3, 4),
(9, 5, 1, 2),
(10, 5, 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `aff` (`customer_id`),
  ADD KEY `gfd` (`cashier_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indexes for table `list_bill`
--
ALTER TABLE `list_bill`
  ADD PRIMARY KEY (`list_bill_id`),
  ADD KEY `b` (`goods_id`),
  ADD KEY `abc` (`bill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `aff` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `gfd` FOREIGN KEY (`cashier_id`) REFERENCES `cashier` (`cashier_id`);

--
-- Constraints for table `list_bill`
--
ALTER TABLE `list_bill`
  ADD CONSTRAINT `abc` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `b` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
