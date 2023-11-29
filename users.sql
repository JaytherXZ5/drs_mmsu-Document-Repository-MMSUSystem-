-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 04:00 AM
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
-- Database: `drs_mmsu2`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `degree_id` int(11) UNSIGNED NOT NULL,
  `institution_id` int(11) NOT NULL,
  `psv_area_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_office_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `degree_id`, `institution_id`, `psv_area_id`, `role_id`, `isAdmin`, `created_at`, `updated_at`, `admin_office_id`) VALUES
(1, 'Jayther Jann Bua-ay', 'JaytherXZ52', 'jayther@gmail.com', '$2y$10$9rcp8kThDa.zTkscnhdOFesIQLRpJQtg54gt1upYtrMyrAIeRg5GO', 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 'Janung Pugi', 'Janung123', 'janung@gmaail.com', '$2y$10$hJLXX9hobA.MPr42O7Mxre1b34gxWN.OpoC2jLdoZzmXYoZQuH3g2', 182, 0, 0, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 'Aldrin Galut', 'Aldrin123', 'jayther@gmail.com', '$2y$10$vNRbeCKQnP1qpN19bR/FJOXaiQtpG86bZW93LkVuxAwiwsZ.TRQ76', 182, 0, 0, 4, 0, '2023-11-27 09:28:58', '2023-11-27 09:28:58', 0),
(9, 'Torjak Galut', 'Torjak123', 'torjak@gmail.com', '$2y$10$3UOOF9hkXJiq6dQzbKHCgemC0FSkDTo2eL8LQm3dZCrkCfvhAEhS2', 0, 0, 0, 1, 0, '2023-11-27 21:49:14', '2023-11-27 21:49:14', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_office_id` (`admin_office_id`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `psv_area_id` (`psv_area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`admin_office_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`psv_area_id`) REFERENCES `psv_areas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
