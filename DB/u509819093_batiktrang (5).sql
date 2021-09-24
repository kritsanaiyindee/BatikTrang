-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 24, 2021 at 04:41 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u509819093_batiktrang`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `shop_id` int(8) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `rating` double(10,2) NOT NULL,
  `isready` tinyint(1) DEFAULT NULL,
  `isFavourite` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `shop_id`, `name`, `description`, `code`, `image_url`, `price`, `rating`, `isready`, `isFavourite`) VALUES
(7, 1, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100001', '/shop1/1.jpg', 9000.00, 4.00, 1, 1),
(8, 1, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100002', '/shop1/2.jpg', 9002.00, 4.00, 1, 0),
(9, 1, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100003', '/shop1/3.jpg', 9003.00, 4.00, 1, 0),
(10, 1, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100004', '/shop1/4.jpg', 9004.00, 4.00, 1, 0),
(11, 1, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100005', '/shop1/5.jpg', 9500.00, 4.00, 1, 1),
(20, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100001', '/shop2/1.jpg', 1000.00, 4.00, 1, 0),
(21, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100002', '/shop2/2.jpg', 2000.00, 4.00, 1, 1),
(22, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100003', '/shop2/3.jpg', 500.00, 4.00, 1, 0),
(23, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100004', '/shop2/4.jpg', 5000.00, 4.00, 1, 0),
(24, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100005', '/shop2/5.jpg', 390.00, 4.00, 1, 0),
(25, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100006', '/shop2/6.jpg', 290.00, 4.00, 1, 0),
(26, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100007', '/shop2/7.jpg', 300.00, 4.00, 1, 1),
(27, 2, 'ผ้าบาติก', 'ผ้าบาติกตรัง', '100008', '/shop2/8.jpg', 900.00, 4.00, 1, 0),
(32, 1, 'xxhsjxjs', 'dhshd', 'dhshd', '/shop1/scaled_image_picker5314938675649786977.jpg', 1234.00, 0.00, 1, 0),
(34, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(36, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(38, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(40, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(42, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(43, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker8737871348200443286.jpg', 199.00, 0.00, 1, 0),
(44, 1, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker6087373357643244228.jpg', 199.00, 0.00, 1, 0),
(45, 4, 'producg1', 'productaaaa', 'productaaaa', '/shop1/scaled_image_picker2018291744350875560.jpg', 199.00, 0.00, 1, 0),
(46, 2, 'producg1', 'productaaaa', 'productaaaa', '/shop2/scaled_image_picker6087373357643244228.jpg', 199.00, 0.00, 1, 0),
(47, 1, 'jjjj', 'dhdhs', 'dhdhs', '/shop1/scaled_image_picker770381369089414229.jpg', 99.00, 0.00, 1, 0),
(48, 4, 'สินค้า1', 'jfjwhs', 'jfjwhs', '/shop4/1.jpg', 11.00, 0.00, 1, 0),
(49, 4, 'สินค้า2', 'jfjwhs', 'jfjwhs', '/shop4/2.jpg', 12.00, 0.00, 1, 0),
(50, 4, 'สินค้า3', 'jfjwhs', 'jfjwhs', '/shop4/3.jpg', 31.00, 0.00, 1, 0),
(51, 4, 'สินค้า4', 'jfjwhs', 'jfjwhs', '/shop4/4.jpg', 0.99, 0.00, 1, 0),
(52, 4, 'สินค้า5', 'สินค้า5', 'สินค้า5', '/shop4/5.jpg', 12.00, 0.00, 1, 0),
(55, 4, '4444', '4444', '4444', '/shop4/scaled_image_picker3224232842287164932.jpg', 45.00, 0.00, 1, 0),
(56, 4, '4444', '4444', '4444', '/shop4/scaled_image_picker3224232842287164932.jpg', 45.00, 0.00, 1, 0),
(57, 4, '4444', '4444', '4444', '/shop4/scaled_image_picker3224232842287164932.jpg', 45.00, 0.00, 1, 0),
(58, 4, '4444', '4444', '4444', '/shop4/scaled_image_picker3224232842287164932.jpg', 45.00, 0.00, 1, 0),
(59, 1, 'gddd', 'xkdjw', 'xkdjw', '/shop1/scaled_image_picker1516990563293649018.jpg', 60.00, 0.00, 1, 0),
(60, 1, 'tttt', 'gttrrr', 'gttrrr', '/shop1/scaled_image_picker1516990563293649018.jpg', 4.00, 0.00, 1, 0),
(63, 3, ':bbbbbbbxxxx', 'jjjjhhhffeee', 'jjjjhhh', '/shop1/scaled_image_picker393669618207568273.jpg', 23.00, 0.00, 1, 0),
(64, 1, 'พพพพ', 'พพพ', 'พพพ', '/shop1/scaled_image_picker8760032002964367069.jpg', 3.00, 0.00, 1, 0),
(65, 1, 'ะะะ', 'พพพ', 'พพพ', '/shop1/scaled_image_picker6419113338457788100.jpg', 89.00, 0.00, 1, 0),
(66, 1, 'ะะะ', 'พพพ', 'พพพ', '/shop1/scaled_image_picker2180692209088017952.jpg', 5.00, 0.00, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registeredAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `address`, `description`, `mobile`, `email`, `registeredAt`) VALUES
(1, 'กลุ่มโชคกมลรัตน์ผ้าบาติก', NULL, 'กลุ่มโชคกมลรัตน์ผ้าบาติก', NULL, NULL, '0000-00-00 00:00:00'),
(2, 'กลุ่มโต๊ะเมืองบาติก', NULL, 'กลุ่มโต๊ะเมืองบาติก', NULL, NULL, '0000-00-00 00:00:00'),
(3, 'กลุ่มพญาบาติก', NULL, 'กลุ่มพญาบาติก', NULL, NULL, '0000-00-00 00:00:00'),
(4, 'กลุ่มพีเจบาติก', NULL, 'กลุ่มพีเจบาติก', NULL, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shop_user`
--

CREATE TABLE `shop_user` (
  `id` bigint(20) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordHash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `vendor` tinyint(1) NOT NULL DEFAULT 0,
  `registeredAt` datetime NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `intro` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_user`
--

INSERT INTO `shop_user` (`id`, `shop_id`, `firstName`, `middleName`, `lastName`, `mobile`, `email`, `passwordHash`, `admin`, `vendor`, `registeredAt`, `lastLogin`, `intro`, `profile`) VALUES
(1, 0, 'Kritsanai', NULL, 'Yindeesook', '0618515533', 'admin@batik.com', 'Krit1234', 1, 1, '2021-09-14 11:18:51', '2021-09-14 11:18:51', NULL, NULL),
(3, 0, 'BATIK Admin', NULL, NULL, '0618515544', 'admin@admin.com', 'Krit1234', 1, 1, '2021-09-14 11:18:51', '2021-09-14 11:18:51', NULL, NULL),
(5, 0, 'djdj', NULL, 'bzbbx', '9/8', 's1@batik.com', 'Krit1234', 0, 0, '2021-09-15 00:00:00', '2021-09-15 00:00:00', NULL, NULL),
(7, 0, 'kit', NULL, 'test', '0648515533', 'kritsanai@harmonious.co.th', 'Krit1234', 0, 0, '2021-09-15 00:00:00', '2021-09-15 00:00:00', NULL, NULL),
(8, 0, 'bbb', NULL, '110059.krit2@hms-cloud.com ', '142536789', 'b@b.com', 'b1234', 0, 0, '2021-09-15 00:00:00', '2021-09-15 00:00:00', NULL, NULL),
(9, 0, 'dds', NULL, 'xdds', '45574155', 'bb@bb.com', '12345', 0, 0, '2021-09-16 00:00:00', '2021-09-16 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_cart_item`
--

CREATE TABLE `user_cart_item` (
  `id` bigint(20) NOT NULL,
  `user_id` int(8) NOT NULL,
  `product_id` int(8) NOT NULL,
  `price_by` double(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `updateat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cart_item`
--

INSERT INTO `user_cart_item` (`id`, `user_id`, `product_id`, `price_by`, `qty`, `updateat`) VALUES
(4, 1, 21, 2000.00, 6, '2021-09-24 00:00:00'),
(5, 1, 10, 9004.00, 1, '2021-09-24 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_mobile` (`mobile`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- Indexes for table `user_cart_item`
--
ALTER TABLE `user_cart_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_cart_item`
--
ALTER TABLE `user_cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
