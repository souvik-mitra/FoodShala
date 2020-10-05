-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2020 at 11:58 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodshala`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_menu`
--

CREATE TABLE `tbl_add_menu` (
  `id` bigint(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `menu_type` int(1) DEFAULT NULL COMMENT '0=veg,1=non-veg,null=both',
  `photo` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `fk_rest_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_add_menu`
--

INSERT INTO `tbl_add_menu` (`id`, `menu_name`, `menu_type`, `photo`, `price`, `fk_rest_id`) VALUES
(1, 'Chicken Momo', 1, '', '70.00', 1),
(2, 'Special Handi Biriyani', 1, '2290_pic6.jpg', '340.00', 1),
(3, 'Paneer Thukpa', 0, '', '90.00', 1),
(4, 'Makhmali Alu Tikka', 0, '', '240.00', 1),
(5, 'chicken chowmin', 1, '', '130.00', 1),
(6, 'chilli fish', 1, '', '260.00', 1),
(7, 'Butter Omlete', 1, '', '60.00', 2),
(8, 'Veg Cheese Burger', 0, '6325_pic5.jpg', '95.00', 2),
(9, 'Egg Chicken Shami Roll', 1, '', '80.00', 2),
(10, 'Dal Makhni', 0, '', '115.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` bigint(11) NOT NULL,
  `fk_user_id` bigint(11) NOT NULL,
  `fk_add_menu_id` bigint(11) NOT NULL,
  `qty` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_reg`
--

CREATE TABLE `tbl_cust_reg` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `address` text NOT NULL,
  `preference` int(1) NOT NULL COMMENT '0=veg, 1=non-veg , 2=both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cust_reg`
--

INSERT INTO `tbl_cust_reg` (`id`, `name`, `email`, `phone_no`, `address`, `preference`) VALUES
(1, 'Koushik Mitra', 'koushik@gmail.com', 8918403178, 'barasat', 2),
(2, 'Manasi Mitra', 'manasi@gmail.com', 8670940433, 'colony bazaar', 0),
(3, 'Pankaj Mitra', 'pankaj@gmail.com', 9434693318, 'haldia,west bengal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` bigint(11) NOT NULL,
  `fk_user_id` bigint(11) NOT NULL,
  `username` bigint(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_type` char(1) NOT NULL COMMENT 'R=Restuarant, C=Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `fk_user_id`, `username`, `password`, `user_type`) VALUES
(1, 1, 7076377029, 'Arpita123', 'R'),
(2, 2, 8967724807, 'Souvik123', 'R'),
(3, 1, 8918403178, 'Koushik123', 'C'),
(4, 2, 8670940433, 'Manasi123', 'C'),
(5, 3, 9434693318, 'Pankaj123', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` bigint(11) NOT NULL,
  `fk_rest_id` bigint(11) NOT NULL,
  `fk_user_id` bigint(11) NOT NULL,
  `fk_menu_id` bigint(11) NOT NULL,
  `qty` int(1) NOT NULL,
  `order_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `fk_rest_id`, `fk_user_id`, `fk_menu_id`, `qty`, `order_date_time`) VALUES
(1, 2, 2, 10, 2, '2020-04-08 08:27:08'),
(2, 1, 3, 1, 2, '2020-04-08 12:10:11'),
(3, 1, 3, 5, 1, '2020-04-08 08:35:12'),
(4, 1, 3, 6, 3, '2020-04-08 12:53:14'),
(5, 2, 1, 7, 1, '2020-04-08 15:19:18'),
(6, 2, 1, 8, 1, '2020-04-08 10:15:00'),
(7, 1, 2, 3, 1, '2020-04-08 15:24:38'),
(8, 1, 2, 4, 2, '2020-04-08 15:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rest_reg`
--

CREATE TABLE `tbl_rest_reg` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rest_reg`
--

INSERT INTO `tbl_rest_reg` (`id`, `name`, `phone_no`, `email`, `photo`, `address`, `description`) VALUES
(1, 'Horroz', 7076377029, 'arpita@gmail.com', '7034_pic1.jpg', 'durgachak', 'biriyani special restuarant'),
(2, 'Aala', 8967724807, 'souvikmitra563@gmail.com', '6223_pic3.jpg', 'Durgachak Uttar Paschim Palli', 'fast food center');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_add_menu`
--
ALTER TABLE `tbl_add_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rest_id` (`fk_rest_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_add_menu_id` (`fk_add_menu_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `tbl_cust_reg`
--
ALTER TABLE `tbl_cust_reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_id` (`fk_menu_id`),
  ADD KEY `fk_rest_id` (`fk_rest_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `tbl_rest_reg`
--
ALTER TABLE `tbl_rest_reg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_add_menu`
--
ALTER TABLE `tbl_add_menu`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_cust_reg`
--
ALTER TABLE `tbl_cust_reg`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_rest_reg`
--
ALTER TABLE `tbl_rest_reg`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_add_menu`
--
ALTER TABLE `tbl_add_menu`
  ADD CONSTRAINT `tbl_add_menu_ibfk_1` FOREIGN KEY (`fk_rest_id`) REFERENCES `tbl_rest_reg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`fk_add_menu_id`) REFERENCES `tbl_add_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_cart_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_cust_reg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`fk_menu_id`) REFERENCES `tbl_add_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`fk_rest_id`) REFERENCES `tbl_rest_reg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_cust_reg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
