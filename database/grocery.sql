-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Apr 03, 2023 at 10:01 AM
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
-- Database: `grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`) VALUES
(1, 'Teresa', '$2y$10$Ls/98aXN2xgLLI1CP8lquO7XHhZgfdzY1QZ0aiAtfpwjM.MzgrWAy', 'Zarin', 'Teresa', '20210606_173058.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codpayment`
--

CREATE TABLE `codpayment` (
  `c_id` int(100) NOT NULL,
  `c_name` text NOT NULL,
  `c_email` varchar(100) NOT NULL,
  `c_address` varchar(250) NOT NULL,
  `c_phone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `codpayment`
--

INSERT INTO `codpayment` (`c_id`, `c_name`, `c_email`, `c_address`, `c_phone`) VALUES
(1964, 'teresa', 'zarin.teresa10@gmail.com', 'dhaka', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(6) UNSIGNED NOT NULL,
  `Uni_ID` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `Hall` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `Uni_ID`, `username`, `email`, `Hall`, `password`, `phone`) VALUES
(9, '20193650225', 'bushra', 'bushra@gmail.com', 'SHH', 'bushra', '01234567'),
(11, '20193650224', 'teresa', 'zarin.teresa10@gmail.com', '18 No Hall', 'teresa', '01556312437'),
(12, '20193650287', 'dhrubo', 'sakifdhrubo1997@gmail.com', 'BBH', 'dhrubo', '01792400720'),
(14, '447821', 'masud', 'masud@gmail.com', 'BBH', 'masud', '01793395080');

-- --------------------------------------------------------

--
-- Table structure for table `onlinepayment`
--

CREATE TABLE `onlinepayment` (
  `cus_id` int(50) NOT NULL,
  `cus_name` varchar(50) NOT NULL,
  `cus_mail` varchar(50) NOT NULL,
  `cus_addr` varchar(50) NOT NULL,
  `cus_phone` int(15) NOT NULL,
  `mob_type` varchar(10) NOT NULL,
  `trans_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `onlinepayment`
--

INSERT INTO `onlinepayment` (`cus_id`, `cus_name`, `cus_mail`, `cus_addr`, `cus_phone`, `mob_type`, `trans_no`) VALUES
(12, 'teresa', 'teresa@gmail.com', 'dhaka', 1234, 'bkash', '0123456791234');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `ven_ID` varchar(30) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` varchar(1000) NOT NULL,
  `vendor_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `ven_ID`, `product_title`, `product_price`, `product_desc`, `product_image`, `vendor_name`) VALUES
(237, '20193650224', 'book', '120', 'Nearly new', 'images/download (3).jpg', 'zarin.teresa10@gmail.com'),
(238, '20193650224', 'Dreamcatcher', '350', 'Handmade product and it is nice, 18inches', 'images/dreamcatcher.jpg', 'zarin.teresa10@gmail.com'),
(239, '20193650287', 'MPI book', '90', 'Used for 6 months', 'images/mpibook.jpg', 'dhrubo@gmail.com'),
(240, '20193650287', 'Headphones', '200', 'Used 3 years, still good sound quality', 'images/headphones.jpg', 'dhrubo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `temp_customer`
--

CREATE TABLE `temp_customer` (
  `id` int(6) NOT NULL,
  `Uni_ID` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Hall` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_vendor`
--

CREATE TABLE `temp_vendor` (
  `id` int(11) NOT NULL,
  `Uni_ID` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `hall` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) UNSIGNED NOT NULL,
  `Uni_ID` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `hall` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `Uni_ID`, `username`, `email`, `hall`, `password`, `phone`) VALUES
(1, '20193650287', 'dhrubo', 'dhrubo@gmail.com', 'bbh', 'dhrubo', '0156618892982'),
(2, '20193650228', 'Mayesha', 'mayesha@gmail.com', 'SHH', ',ayesha', '01222333441'),
(3, '1964', 'Teresa', 'zarin.teresa10@gmail.com', '18 No Hall', 'teresa', '01556312437');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `codpayment`
--
ALTER TABLE `codpayment`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `onlinepayment`
--
ALTER TABLE `onlinepayment`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `temp_customer`
--
ALTER TABLE `temp_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_vendor`
--
ALTER TABLE `temp_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `codpayment`
--
ALTER TABLE `codpayment`
  MODIFY `c_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1965;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `onlinepayment`
--
ALTER TABLE `onlinepayment`
  MODIFY `cus_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `temp_customer`
--
ALTER TABLE `temp_customer`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `temp_vendor`
--
ALTER TABLE `temp_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
