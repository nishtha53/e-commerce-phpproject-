-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2023 at 11:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `prod_no` int(4) NOT NULL,
  `cart_no` int(4) NOT NULL,
  `qty_odered` int(4) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `fname` varchar(20) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `lname` varchar(20) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `contact` int(10) NOT NULL,
  `message` varchar(50) COLLATE utf8mb4_unicode_nopad_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`fname`, `lname`, `email`, `contact`, `message`) VALUES
('Nishtha', 'thakkar', 'nishthathakkar0503@gmail.com', 0, 'working '),
('Nishtha', 'thakkar', 'nishthathakkar0503@gmail.com', 0, 'query submitted'),
('Nishtha', 'thakkar', 'nishthathakkar0503@gmail.com', 0, 'hiii working'),
('Nishtha', 'thakkar', 'nishthathakkar0503@gmail.com', 0, 'submitted');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_no` int(4) NOT NULL,
  `prod_no` int(4) NOT NULL,
  `qty_odered` int(10) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_no` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_no` int(4) NOT NULL,
  `prod_name` varchar(20) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_no`, `prod_name`, `description`, `unit`, `price`, `image`) VALUES
(1, 'tshirt', 'men,women', '2 piece', 100, 'assets/img/product-2.jpg'),
(2, 'shirt', 'men ', '1', 100, 'assets/img/product-4.jpg'),
(3, 'prod', 'ncbcn', '2', 120, 'assets/img/product-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `contact_no` int(10) NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_nopad_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_nopad_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `contact_no`, `address`, `email`) VALUES
(1, 'nish', 'nish', 2147483647, NULL, 'nishthathakkar0503@g'),
(2, 'user', 'nish', 2147483647, NULL, 'nishtha@gmail.com'),
(4, 'abc', 'nish', 2147483647, NULL, 'abc@gmail.com'),
(5, 'nish', 'nish', 13225154, NULL, 'nish12@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_no`),
  ADD KEY `prod_no` (`prod_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `od` (`order_no`),
  ADD KEY `prod` (`prod_no`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_no` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_no` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `prod_no` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `od` FOREIGN KEY (`order_no`) REFERENCES `order_table` (`order_no`),
  ADD CONSTRAINT `prod` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`);

--
-- Constraints for table `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
