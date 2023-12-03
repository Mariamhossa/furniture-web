-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 10:58 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniture`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categ_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categ_id`, `category_name`) VALUES
(1, 'chairs'),
(2, 'Living room'),
(5, 'Bed room'),
(7, ' Accessories'),
(9, 'kids furniture'),
(14, 'lamps');

-- --------------------------------------------------------

--
-- Table structure for table `furniture_items`
--

CREATE TABLE `furniture_items` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `small` varchar(100) DEFAULT NULL,
  `large` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `active` varchar(50) DEFAULT NULL,
  `categ_id` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `date` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `furniture_items`
--

INSERT INTO `furniture_items` (`id`, `title`, `description`, `small`, `large`, `price`, `active`, `categ_id`, `image`, `date`) VALUES
(1, 'sofa', 'black, wide modern sofa', '90x30cm', '100*50cm', 8000, 'yes', 2, '12.jpg', '31/10/2023'),
(3, 'corner table', 'classic table, available in white and dark brown', '50*50cm', '60*60cm', 3000, 'yes', 2, '8.jpg', '31/10/2023'),
(4, 'royal bed', 'comfy, wide bed ', '120*80cm ', '140*90cm', 25000, 'No', 5, '5.jpg', '31/10/2023'),
(5, 'classic bed', 'single bed available in dark brown and beige', '80*60cm', '90*70cm', 15000, 'No', 5, '14.jpg', '31/10/2023'),
(6, 'baby bed', 'small cute bed with borders', '50*30', 'not available', 5555, 'yes', 9, 'cat-img-03.jpg', '31/10/2023'),
(7, 'chair', 'single lunch table chair', '30*30cm', 'not available', 700, 'yes', 1, '2.jpg', '31/10/2023'),
(9, 'garden chair', 'available in grey and white', '50*30', 'not available', 5555, 'yes', 1, '6.jpg', '31/10/2023'),
(10, 'chair2', 'living room chair', 'not available', '70*50cm', 2000, 'No', 1, '13.jpg', '31/10/2023'),
(11, 'chair3', 'yellow and green', '50*30', 'not available', 1155, 'yes', 1, '11.jpg', '01/11/2023'),
(12, 'chair4', 'blue suitable for shales', '20*30', '30*22', 700, 'No', 1, '4.jpg', '01/11/2023'),
(13, 'classic chair 2', 'old, antique style', 'not available', '30*40', 2555, 'No', 1, '3.jpg', '01/11/2023'),
(17, '4 colored lamps ', 'suitable for american  kitchen', '20cm', '40cm', 2000, 'yes', 14, 'product-img-04.jpg', '04/11/2023');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `active` varchar(50) DEFAULT NULL,
  `date` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `password`, `active`, `date`) VALUES
(1, 'Mariam hossam', 'mariam10', 'mariamhossam710@gmail.com', '1234Mh#', 'no', NULL),
(6, 'ahmed ali', 'ahmed', 'ahmedali10@gmail.com', '1255A.a=', 'no', NULL),
(7, 'seif mohames', 'seif', 'seifmohamed30@gmail.com', '4569*Ss', 'yes', NULL),
(8, 'zeina sherif', 'zozo', 'zeinasherif44@gmail.com', '7896*Zs', 'yes', NULL),
(11, 'soha amr', 'soha', 'sohaamr10@gmail.com', '1456Sa#', 'yes', '24/10/2023'),
(12, 'menna mohamed', 'menna12', 'menna88@gmail.com', '45632Mm@', 'yes', '25/10/2023'),
(15, 'samy rageb', 'samy98', 'samyrageb85@gmail.com', '123Sr#', 'no', '25/10/2023'),
(16, 'seif mohamed', 'seif25', 'seifmohamed@gmail.com', '1254Sm#', 'yes', '29/10/2023'),
(17, 'rana ali ', 'rana27', 'ranaali27@gmail.com', '25458Ra@', 'yes', '04/11/2023'),
(18, 'ibrahim mohamedi', 'ibrahim33', 'ibrahim33@gmail.com', '6666Ibm#', 'yes', '04/11/2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indexes for table `furniture_items`
--
ALTER TABLE `furniture_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `furniture_items`
--
ALTER TABLE `furniture_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
