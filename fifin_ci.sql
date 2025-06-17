-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 07:38 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fifin_ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id_sales` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nama_sales` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id_sales`, `id`, `nama_sales`) VALUES
(1, 3, 'fifin'),
(2, 4, 'Samsul'),
(3, 5, 'Hidayat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text,
  `no_hp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `id`, `nama`, `alamat`, `no_hp`, `created_at`) VALUES
(1, 1, 'Stevy', 'Perumahan Griya Sepatan Blok E No. 97', '087799885520', '2025-06-15 08:09:25'),
(2, 1, 'Fahrul Muarif', 'Perumahan Elok Jaya Bersama Abadi Blok CC No. 88', '081245669988', '2025-06-15 08:10:12'),
(3, 1, 'Nunu Muarif', 'Jl. Raya Sepatan, Kp. Sepatan ', '085923457789', '2025-06-15 08:10:53'),
(4, 1, 'Amestha', 'Karawaci', '085789457760', '2025-06-15 08:13:03'),
(5, 1, 'Gustian Yoga', 'Tigaraksa', '089749772003', '2025-06-15 08:13:39'),
(6, 1, 'Arif', 'Karawaci', '088897892013', '2025-06-15 08:14:05'),
(7, 1, 'Rahma Ayu', 'Jl. Aria Santika No. 99', '082156879713', '2025-06-15 08:15:11'),
(8, 1, 'Ade', 'Pasar Kemis', '087777895620', '2025-06-15 08:36:54'),
(9, 1, 'Dio', 'Rajeg', '081212489950', '2025-06-15 08:37:59'),
(10, 1, 'angga', 'Sumur Daon', '087899105489', '2025-06-15 08:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `kode_produk` varchar(50) NOT NULL,
  `nama_produk` varchar(250) NOT NULL,
  `harga_produk` decimal(10,2) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `id`, `kode_produk`, `nama_produk`, `harga_produk`, `stok_produk`, `create_at`) VALUES
(1, 1, '1120', 'AC Panasonik 1 PK', '3500000.00', 8, '2025-06-15 03:01:24'),
(2, 1, '1121', 'AC LG 1/2 PK', '2500000.00', 4, '2025-06-15 03:01:49'),
(3, 1, '1222', 'TV Samsung 30"', '7000000.00', 6, '2025-06-15 03:02:34'),
(4, 1, '1223', 'Mesin Cuci electrolux 9.5 Kg', '5000000.00', 2, '2025-06-15 03:05:00'),
(5, 1, '1224', 'Mesin cuci samsung 8 Kg', '5500000.00', 3, '2025-06-15 03:05:31'),
(6, 1, '1225', 'Dispenser ', '250000.00', 14, '2025-06-15 03:33:55'),
(7, 1, '1226', 'Rice Cooker', '300000.00', 14, '2025-06-15 03:34:20'),
(8, 1, '1227', 'Laptop Samsung', '8000000.00', 18, '2025-06-15 03:34:46'),
(9, 1, '1228', 'Laptop Hp', '6500000.00', 8, '2025-06-15 03:35:05'),
(10, 1, '1229', 'Laptop Lenovo', '7500000.00', 14, '2025-06-15 03:35:29'),
(11, 1, '1230', 'Hp samsung ', '7000000.00', 18, '2025-06-15 03:36:00'),
(12, 1, '1231', 'Tablet samsung', '10000000.00', 9, '2025-06-15 03:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_so`
--

CREATE TABLE `tbl_so` (
  `id_so` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status` enum('draft','dikirim','selesai','dibatalkan') DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_so`
--

INSERT INTO `tbl_so` (`id_so`, `id_sales`, `id_pelanggan`, `id_produk`, `jumlah`, `total_harga`, `status`, `created_at`) VALUES
(1, 1, 1, 8, 2, '16000000.00', 'selesai', '2025-06-15 03:40:19'),
(2, 1, 2, 1, 1, '3500000.00', 'selesai', '2025-06-15 03:40:46'),
(3, 1, 4, 11, 1, '7000000.00', 'selesai', '2025-06-15 03:40:59'),
(4, 1, 6, 4, 1, '5000000.00', 'selesai', '2025-06-15 03:41:19'),
(5, 1, 3, 3, 1, '7000000.00', 'dikirim', '2025-06-15 03:41:35'),
(6, 2, 8, 12, 2, '20000000.00', 'selesai', '2025-06-15 03:43:53'),
(7, 2, 10, 9, 1, '6500000.00', 'selesai', '2025-06-15 03:44:08'),
(8, 2, 7, 12, 3, '30000000.00', 'selesai', '2025-06-15 03:44:18'),
(9, 2, 5, 5, 1, '5500000.00', 'dikirim', '2025-06-15 03:44:30'),
(10, 2, 9, 6, 5, '1250000.00', 'selesai', '2025-06-15 03:44:43'),
(11, 3, 4, 11, 1, '7000000.00', 'selesai', '2025-06-15 03:45:59'),
(12, 3, 4, 12, 1, '10000000.00', 'selesai', '2025-06-15 03:46:11'),
(13, 3, 2, 1, 1, '3500000.00', 'selesai', '2025-06-15 03:46:22'),
(14, 3, 2, 2, 1, '2500000.00', 'dikirim', '2025-06-15 03:46:31'),
(15, 3, 6, 7, 1, '300000.00', 'selesai', '2025-06-15 03:46:44'),
(16, 3, 5, 9, 1, '6500000.00', 'selesai', '2025-06-15 03:46:57'),
(17, 3, 1, 3, 1, '7000000.00', 'dikirim', '2025-06-15 03:47:16'),
(18, 1, 9, 11, 5, '35000000.00', 'dibatalkan', '2025-06-15 03:53:30'),
(19, 1, 2, 12, 2, '20000000.00', 'dibatalkan', '2025-06-16 01:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` enum('admin','manajer','sales') NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `create_at`) VALUES
(1, 'admin', '$2y$10$UZ5stpHUqfromQO2K.uXCem91sVZGZ7HuwIHks0GXYtyS1yGl/0gS', 'admin', '2025-06-15 07:59:13'),
(2, 'manajer', '$2y$10$sqxbRmO7KEQiLYGO739qluCQTpXFZhgOY95Kyp1msbGLPTjFW0Fi2', 'manajer', '2025-06-15 08:06:39'),
(3, 'sales', '$2y$10$YtzmjEzAfqAYHIU2zgSyh.GqwqXxsOz5ECYUXL73uLKhYDlf9CPsu', 'sales', '2025-06-15 08:07:11'),
(4, 'sales2', '$2y$10$tBqT59n3d7IUQIBATZaBWOU6xVph5l9Z8DxXcjeRcnAHLTDbnJSva', 'sales', '2025-06-15 08:43:25'),
(5, 'sales3', '$2y$10$cn4n5TAEwTc25Qt0c/usTez/bIwAlxS7YXZYYQVhczUqBw4lgewnG', 'sales', '2025-06-15 08:45:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_sales`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `kode_produk` (`kode_produk`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_so`
--
ALTER TABLE `tbl_so`
  ADD PRIMARY KEY (`id_so`),
  ADD KEY `id_sales` (`id_sales`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id_sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_so`
--
ALTER TABLE `tbl_so`
  MODIFY `id_so` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD CONSTRAINT `tbl_pelanggan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD CONSTRAINT `tbl_produk_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_so`
--
ALTER TABLE `tbl_so`
  ADD CONSTRAINT `tbl_so_ibfk_1` FOREIGN KEY (`id_sales`) REFERENCES `sales` (`id_sales`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_so_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tbl_pelanggan` (`id_pelanggan`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_so_ibfk_3` FOREIGN KEY (`id_produk`) REFERENCES `tbl_produk` (`id_produk`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
