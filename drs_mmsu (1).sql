-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 04:29 AM
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
-- Database: `drs_mmsu`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area_order` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `area_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area_order`, `area_name`, `area_description`, `area_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'AREA I', 'VISION, MISSION, GOALS AND OBJECTIVES', 1, NULL, '2020-09-16 18:26:03'),
(2, 2, 'AREA II', 'FACULTY', 1, NULL, '2023-11-13 21:17:29'),
(4, 4, 'AREA IV', 'SUPPORT TO STUDENTS', 1, NULL, NULL),
(5, 5, 'AREA V', 'RESEARCH', 1, NULL, NULL),
(6, 6, 'AREA VI', 'EXTENSION AND COMMUNITY INVOLVEMENT', 1, NULL, NULL),
(7, 7, 'AREA VII', 'LIBRARY', 1, NULL, NULL),
(8, 8, 'AREA VIII', 'PHYSICAL PLANT AND FACILITIES', 1, NULL, NULL),
(9, 9, 'AREA IX', 'LABORATORIES', 1, NULL, NULL),
(10, 10, 'AREA X', 'ADMINISTRATION', 1, NULL, NULL),
(11, 11, 'AREA XI', 'ENHANCEMENT', 1, '2023-07-12 00:57:18', '2023-07-12 00:57:18'),
(12, 12, 'testing 12', 'dfgd', 1, '2023-07-12 01:10:46', '2023-07-12 01:15:55'),
(13, 13, 'SECTOR 7', 'JANUNG THE GREAT', 1, '2023-11-09 17:02:41', '2023-11-09 17:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_generate` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `name_generate`, `type`, `size`, `folder_id`, `created_at`, `updated_at`) VALUES
(1, 'file 1', NULL, 'svg', NULL, NULL, '2023-10-13 06:13:38', '2023-10-13 06:13:38'),
(2, 'file 2', NULL, 'png', NULL, NULL, '2023-10-13 06:13:51', '2023-10-13 06:13:51'),
(3, 'file 3', NULL, 'jpg', NULL, NULL, '2023-10-13 06:16:56', '2023-10-13 06:16:56'),
(4, 'file dhwakhdk', NULL, 'svg', NULL, NULL, '2023-10-13 07:34:45', '2023-10-13 07:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Jayther', '2023-10-12 07:48:33', '2023-10-12 07:48:33'),
(2, 'Jayther Jann', '2023-10-12 08:01:40', '2023-10-12 08:01:40'),
(5, 'jut', '2023-10-13 07:34:19', '2023-10-13 07:34:19'),
(6, 'AREA 51', '2023-11-13 02:26:12', '2023-11-13 02:26:12'),
(7, 'CLASSIFIED', '2023-11-13 02:26:46', '2023-11-13 02:26:46'),
(8, 'gg', '2023-11-16 01:59:37', '2023-11-16 01:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `ia_areas`
--

CREATE TABLE `ia_areas` (
  `id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ia_areas`
--

INSERT INTO `ia_areas` (`id`, `area_name`, `area_description`, `created_at`, `updated_at`) VALUES
(1, 'AREA I', 'Governance and Management', NULL, NULL),
(2, 'AREA II', 'Teaching, Learning and Evaluation', NULL, NULL),
(3, 'AREA III', 'Faculty and Staff', NULL, NULL),
(4, 'AREA IV', 'Research', NULL, NULL),
(5, 'AREA V', 'Extension and Consultancy and Linkages', NULL, NULL),
(6, 'AREA VI', 'Support to Students', NULL, NULL),
(7, 'AREA VII', 'Library', NULL, NULL),
(8, 'AREA VIII', 'Infrastructure and Learning Resources', NULL, NULL),
(9, 'AREA IX', 'Quality Assurance Culture', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`id`, `name`) VALUES
(1, 'CCIS'),
(2, 'CAS'),
(3, 'CAFSD'),
(4, 'COE');

-- --------------------------------------------------------

--
-- Table structure for table `level_3_phase_2_areas`
--

CREATE TABLE `level_3_phase_2_areas` (
  `id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `compliance_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level_3_phase_2_areas`
--

INSERT INTO `level_3_phase_2_areas` (`id`, `area_name`, `area_description`, `compliance_description`, `created_at`, `updated_at`) VALUES
(1, 'Instruction', 'Academic Excellence', 'Area III-Curriculum and Instruction', '2020-11-13 17:50:40', '2020-11-13 17:50:40'),
(2, 'Extension', 'High Impact and Transformative Extension and Outreach Program', 'Area VI-Extension and Community Involvement', '2020-11-13 17:50:40', '2020-11-13 17:50:40'),
(3, 'Research', 'Creative, Relevant, and Innovative Research Programs', 'Area V-Research', '2020-11-13 17:50:40', '2020-11-13 17:50:40'),
(4, 'Faculty Development', 'N/A', 'Area II-Faculty', '2020-11-13 17:50:40', '2020-11-13 17:50:40'),
(5, 'Consortia or Linkages', 'External and Strengthened Linkages and Partnerships', 'particularly those related to linkages and partnerships', '2020-11-13 17:50:40', '2020-11-13 17:50:40'),
(6, 'Library', 'N/A', 'Area VII-Library', '2020-11-13 17:50:40', '2020-11-13 17:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `level_4_phase_2_areas`
--

CREATE TABLE `level_4_phase_2_areas` (
  `id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level_4_phase_2_areas`
--

INSERT INTO `level_4_phase_2_areas` (`id`, `area_name`, `area_description`, `created_at`, `updated_at`) VALUES
(1, 'Performance of Graduates', 'Academic Excellence', NULL, NULL),
(2, 'Research', 'Creative, Relevant, and Innovative Research Programs', NULL, NULL),
(3, 'Community Service', 'High Impact and Transformative Extension and Outreach Program', NULL, NULL),
(4, 'International Linkages and Consortia', 'External and Strengthened Linkages and Partnerships', NULL, NULL),
(5, 'Well-Developed Planning Processes', 'Effective and Efficient Management System', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(36, 'App\\Models\\User', 2, '1700022553', '34aaba65b7d4e0902bec44afcb351da2f0370df92afba5cc3d682d8bc9564e33', '[\"*\"]', NULL, NULL, '2023-11-14 20:29:13', '2023-11-14 20:29:13'),
(37, 'App\\Models\\User', 3, '1700024280', 'ce510fa56253136377c7829309dc03e531b830c592f49f127f30df974ef05ccb', '[\"*\"]', NULL, NULL, '2023-11-14 20:58:00', '2023-11-14 20:58:00'),
(42, 'App\\Models\\User', 1, '1700100868', '37ec1dfdbe8ef4f7f6c8d8d1aafbe582d179f75b1894763d9c92acdbe7bab1d8', '[\"*\"]', NULL, NULL, '2023-11-15 18:14:28', '2023-11-15 18:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `psv_areas`
--

CREATE TABLE `psv_areas` (
  `id` int(11) NOT NULL,
  `area_order` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `area_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psv_areas`
--

INSERT INTO `psv_areas` (`id`, `area_order`, `area_name`, `area_description`, `area_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'AREA I', 'VISION, MISSION, GOALS AND OBJECTIVES', 1, NULL, '2020-09-16 18:26:03'),
(2, 2, 'AREA II', 'FACULTY', 1, NULL, NULL),
(3, 3, 'AREA III', 'CURRICULUM AND INSTRUCTION', 1, NULL, NULL),
(4, 4, 'AREA IV', 'SUPPORT TO STUDENTS', 1, NULL, NULL),
(5, 5, 'AREA V', 'RESEARCH', 1, NULL, NULL),
(6, 6, 'AREA VI', 'EXTENSION AND COMMUNITY INVOLVEMENT', 1, NULL, NULL),
(7, 7, 'AREA VII', 'LIBRARY', 1, NULL, NULL),
(8, 8, 'AREA VIII', 'PHYSICAL PLANT AND FACILITIES', 1, NULL, NULL),
(9, 9, 'AREA IX', 'LABORATORIES', 1, NULL, NULL),
(10, 10, 'AREA X', 'ADMINISTRATION', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `isAdmin` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `institution_id`, `user_role_id`, `created_at`, `updated_at`, `isAdmin`) VALUES
(1, 'Jayther Jann Bua-ay', 'jayther@gmail.com', '$2y$10$rFIC35R9mAqHOS98Y9TP/ee9doEFgpfvcYzC1dmIHh.0xpU50SUX2', 1, 1, '2023-11-14 21:57:46', '2023-11-14 21:57:46', 1),
(2, 'Janung Pugi', 'janung@gmail.com', '$2y$10$3B8BUb3arrl9CK3KTXy2iuavfuftyDyTxi8Wm7L/ivw8eZQOcliKq', 2, 2, '2023-11-14 21:58:22', '2023-11-14 21:58:22', 0),
(3, 'Aldrin Galut', 'aldrin@gmail.com', '$2y$10$nCxeZeUmV37OCcryJoA0k.ndjQ4Da8s0us8.cYrkfW2oqcnfMx1n6', 3, 3, '2023-11-15 17:42:46', '2023-11-15 17:42:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`) VALUES
(1, 'Dean'),
(2, 'Faculty'),
(3, 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ia_areas`
--
ALTER TABLE `ia_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_3_phase_2_areas`
--
ALTER TABLE `level_3_phase_2_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_4_phase_2_areas`
--
ALTER TABLE `level_4_phase_2_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `psv_areas`
--
ALTER TABLE `psv_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ia_areas`
--
ALTER TABLE `ia_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level_3_phase_2_areas`
--
ALTER TABLE `level_3_phase_2_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `level_4_phase_2_areas`
--
ALTER TABLE `level_4_phase_2_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `psv_areas`
--
ALTER TABLE `psv_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
