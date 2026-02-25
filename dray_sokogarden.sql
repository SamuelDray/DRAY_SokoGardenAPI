-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2026 at 09:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dray_sokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_category`, `product_cost`, `product_image`) VALUES
(1, 'Oppo F11', '16GB RAM, 128GB Storage, Black in Color, android 15', 'Electronics', 2000, 'Oppo F11.avif'),
(2, 'Iphone 17 pro max', '20GB RAM, 256GB Storage, White in Color, iOS', 'Electronics', 230000, 'iphone 17 pro max.avif'),
(3, 'Infinix Note 60 Ultra', '20GB RAM, 256GB Storage, Black in Color, iOS', 'Electronics', 200000, 'Infinix Note Ultra.jpeg'),
(4, 'Infinix Note 60 Edge', '20GB RAM, 256GB Storage, Black in Color, iOS', 'Electronics', 210000, 'Infinix Note 60 Edge.jpeg'),
(5, 'Samsung S25 Ultra', '20GB RAM, 256GB Storage, White in Color, iOS', 'Electronics', 230000, 'Samsung S25 Ultra.jpeg'),
(6, 'Buggy Sweatpants', 'Oversized pants, Grey in Color', 'Clothes, Pants', 800, 'Buggy Sweatpants.jpeg'),
(7, 'Buggy Sweatpants for Men', 'Oversized pants, Grey in Color', 'Clothes, Pants', 800, 'Buggy sweat pants for Men.jpeg.jpeg'),
(8, 'Buggy Sweatpants for Women', 'Oversized pants, Grey in Color', 'Clothes, Pants', 800, 'Buggy sweat pants for women.jpeg'),
(9, 'Grey Cargo pants', 'Oversized pants, Grey in Color', 'Clothes, Pants', 1500, 'Grey Cargo Pants.jpeg'),
(10, 'Grey Sweatpants', 'Oversized pants, Grey in Color', 'Clothes, Pants', 1000, 'Grey Sweatpants.jpeg'),
(11, 'Baggy jeans for Women', 'Oversized jeans, blue in Color', 'Clothes, Pants', 1000, 'High Waist Buggy Jeans.jpeg'),
(12, 'Cargopants for Women', 'Oversized pants, Grey in Color', 'Clothes, Pants', 1000, 'Mens Cargo Pants.jpeg'),
(13, 'OG baggy jeans for Women', 'Oversized jeans, blue in Color', 'Clothes, Pants', 1500, 'OG baggy jeans for women.jpeg'),
(14, 'Sidepocket Cargopants', 'Oversized pants, Grey in Color', 'Clothes, Pants', 1500, 'Side pockets Cargo pants.jpeg'),
(15, 'Baggy Jeans', 'Baggy Jeans, blue in Color', 'Clothes, Pants', 1500, 'Wash Baggy jeans.jpeg'),
(16, 'Oversized Cargopants for women', 'Baggy Jeans, Jungle Brown in Color', 'Clothes, Pants', 1500, 'Women Oversized Cargo pants.jpeg'),
(17, 'Jordan 4', 'Red and Black in color', 'Shoes', 3800, 'J4.jpeg'),
(18, 'Jordan 3', 'Neon coloured', 'Shoes', 3800, 'J3.jpeg'),
(19, 'Parada designer shoes', 'Black in color', 'Shoes', 3800, 'Prada designer shoes.jpeg'),
(20, 'Louis Vitton Shoes', 'Blue and white in color', 'Shoes', 3800, 'Louis Vitton Shoes .jpeg'),
(21, 'Air maxShoes', 'Dark Grey in color', 'Shoes', 3800, 'Air Max.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`) VALUES
(2, 'Maurine', 'qwert@gmail.com', '0745869321', '258144634');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
