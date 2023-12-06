-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 01:11 AM
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
-- Table structure for table `accreditations`
--

CREATE TABLE `accreditations` (
  `id` int(11) NOT NULL,
  `degree_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `institution_id` int(11) NOT NULL DEFAULT 0,
  `psv_area_id` int(11) NOT NULL DEFAULT 0,
  `administrative_id` int(11) NOT NULL DEFAULT 0,
  `accredit_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accreditors`
--

CREATE TABLE `accreditors` (
  `id` int(11) NOT NULL,
  `accreditation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accreditor_areas`
--

CREATE TABLE `accreditor_areas` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `psv_area_id` int(11) NOT NULL,
  `ia_area_id` int(11) NOT NULL,
  `accreditor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `administratives`
--

CREATE TABLE `administratives` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administratives`
--

INSERT INTO `administratives` (`id`, `name`) VALUES
(0, '---'),
(1, 'Administrative');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `area_order` int(11) DEFAULT NULL,
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
(0, 0, '---', '---', 0, NULL, NULL),
(1, 1, 'AREA I', 'VISION, MISSION, GOALS AND OBJECTIVES', 1, NULL, '2023-11-27 21:42:12'),
(2, 2, 'AREA II', 'FACULTY', 0, NULL, '2023-11-20 18:11:58'),
(4, 4, 'AREA IV', 'SUPPORT TO STUDENTS', 1, NULL, '2023-11-27 21:42:07'),
(5, 5, 'AREA V', 'RESEARCH', 1, NULL, '2023-11-20 18:03:32'),
(6, 6, 'AREA VI', 'EXTENSION AND COMMUNITY INVOLVEMENT', 1, NULL, '2023-11-20 18:03:32'),
(7, 7, 'AREA VII', 'LIBRARY', 1, NULL, '2023-11-20 18:03:33'),
(8, 8, 'AREA VIII', 'PHYSICAL PLANT AND FACILITIES', 1, NULL, '2023-11-20 18:03:35'),
(9, 9, 'AREA IX', 'Quality Assurance Culture', 1, NULL, '2023-11-20 18:03:36'),
(14, 3, 'AREA III', 'CURRICULUM AND INSTRUCTION', 0, '2023-11-16 08:01:28', '2023-11-27 21:42:14'),
(22, 10, 'AREA X', 'ADMINISTRATION', 1, '2023-11-20 00:22:40', '2023-11-20 04:58:51'),
(23, 11, 'AREA XI', 'ENHANCEMENT', 1, '2023-11-20 00:23:07', '2023-11-20 04:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `degrees`
--

CREATE TABLE `degrees` (
  `id` int(11) UNSIGNED NOT NULL,
  `college_id` int(10) UNSIGNED NOT NULL,
  `degree` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `years` tinyint(3) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `admission` tinyint(4) DEFAULT NULL,
  `strand_id` tinyint(3) UNSIGNED DEFAULT 4,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degrees`
--

INSERT INTO `degrees` (`id`, `college_id`, `degree`, `abbr`, `type`, `years`, `active`, `admission`, `strand_id`, `created_at`, `updated_at`) VALUES
(0, 0, '-----', '-----', 0, 4, 0, 0, NULL, '0000-00-00 00:00:00', '2020-01-16 02:00:20'),
(1, 2, 'BS in Agriculture', 'BSA', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 05:50:54'),
(2, 6, 'BS in Agricultural Engineering', 'BSAE', 0, 4, 1, 0, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(3, 2, 'BS in Forestry', 'BSForestry', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 05:52:25'),
(4, 2, 'BS in Development Communication', 'BSDC', 0, 4, 1, 1, 3, '0000-00-00 00:00:00', '2019-02-15 05:51:24'),
(5, 2, 'BS in Home Technology', 'BSHT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:37:57'),
(6, 3, 'BS in Marine Biology', 'BSMB', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:52:56'),
(7, 4, 'BS in Mathematics', 'BS MATH', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:55:32'),
(8, 13, 'BS in Computer Science', 'BSCS', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-07-21 07:05:57'),
(9, 4, 'BS in Biology', 'BS BIO', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:55:30'),
(10, 2, 'BS in Environmental Science', 'BS ENVI SCI', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:52:07'),
(11, 4, 'AB in Sociology', 'BA SOCIO', 0, 4, 1, 1, 3, '0000-00-00 00:00:00', '2019-02-15 05:55:12'),
(12, 4, 'AB in English Studies (CA)', 'AB ENGL (CA)', 0, 4, 1, 0, 3, '0000-00-00 00:00:00', '2019-05-27 06:49:02'),
(13, 5, 'BS in Accountancy', 'BS ACCT', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:36'),
(14, 5, 'BS in Economics', 'BS ECON', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:44'),
(15, 5, 'BS in Business Administration (MM)', 'BSBA-MM', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:43'),
(16, 2, 'BS in Agricultural Technology', 'BSAT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-18 03:12:58'),
(17, 5, 'BS in Cooperative Management', 'BSCM', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:41'),
(18, 9, 'Bachelor of Secondary Education (English)', 'BSE (Engl)', 0, 4, 1, 1, 4, '0000-00-00 00:00:00', '2019-02-20 08:45:09'),
(19, 9, 'Bachelor of Elementary Education', 'BEEd', 0, 4, 1, 1, 4, '0000-00-00 00:00:00', '2019-02-15 06:31:51'),
(20, 6, 'BS in Civil Engineering', 'BS CIV ENG', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(21, 6, 'BS in Electrical Engineering', 'BSEE', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(22, 6, 'BS in Mechanical Engineering', 'BS MECH ENG', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(23, 6, 'BS in Chemical Engineering', 'BS CHEM ENG', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(24, 6, 'BS in Ceramic Engineering', 'BS CER ENG', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(25, 6, 'BS in Computer Engineering', 'BS COMP ENG', 0, 5, 1, 1, 2, '0000-00-00 00:00:00', '2023-05-04 06:21:03'),
(26, 6, 'BS in Electronics Engineering', 'BSECE', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(27, 3, 'BS in Fisheries', 'BSF', 0, 4, 1, 1, NULL, '0000-00-00 00:00:00', '2020-01-17 05:29:55'),
(28, 7, 'BS in Nursing', 'BSN', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:56:19'),
(29, 7, 'BS in Physical Therapy', 'BSPT', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2023-02-20 01:41:57'),
(30, 7, 'BS in Pharmacy', 'BS PHARM', 0, 4, 1, 1, 2, '0000-00-00 00:00:00', '2019-02-15 05:56:21'),
(31, 8, 'BS in Industrial Education', 'BSIE', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 8, 'BS in Industrial Technology', 'BSIT', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2016-09-23 06:55:13'),
(33, 1, 'Doctor of Philosophy in Rural Development', 'PhD (Rural Devt)', 2, 2, 1, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:56:38'),
(34, 1, 'Doctor of Education', 'EdD', 2, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:56:42'),
(35, 1, 'Master of Arts in Education', 'MAEd', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:02'),
(36, 1, 'Master of Education', 'MEd', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:05'),
(37, 1, 'Master of Arts in Public Administration', 'MAPA', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:07'),
(38, 1, 'Master in Public Administration', 'MPA', 1, 2, 1, NULL, NULL, '0000-00-00 00:00:00', '2022-03-07 03:07:32'),
(39, 1, 'Master of Science in Rural Development', 'MSRD', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:09'),
(40, 1, 'Master of Rural Development', 'MRD', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:10'),
(41, 1, 'Master of Arts in Nursing', 'MAN', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:13'),
(42, 1, 'Master in Nursing', 'MN', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:14'),
(43, 1, 'Master of Science in Agriculture', 'MSA', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:15'),
(44, 1, 'Master of Agriculture', 'MAgri', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:17'),
(45, 1, 'Master of Science in Agroforestry', 'MSAgroF', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:18'),
(46, 1, 'Graduate Diploma', 'GD', 1, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2017-07-27 05:57:19'),
(47, 9, 'Short-Term Programs', 'STP', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 2, 'Bachelor of Agricultural Technology', 'BAT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-18 03:12:20'),
(49, 2, 'Diploma of Agricultural Technology', 'DAT', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '2020-12-06 09:41:19'),
(50, 2, 'Forest Ranger', 'FR', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 2, 'Technical Homemaking', 'TH', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 2, 'Associate  in Home Technology', 'AHT', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 2, 'Associate in Technical Homemaking', 'ATH', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 4, 'BS in Chemistry', 'BSChem', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 8, 'Diploma of Technology', 'DT', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 8, 'General Radio Communication Operator', 'GRCO', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 8, 'Certificate of Technology', 'CT', 0, 2, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 5, 'BS in Accounting Technology', 'BSAT', 0, 4, 1, 0, 1, '0000-00-00 00:00:00', '2019-02-16 12:51:00'),
(59, 4, 'AB in English Language', 'ABEL', 0, 4, 1, 1, 3, '0000-00-00 00:00:00', '2019-02-15 05:53:01'),
(60, 5, 'BS in Entrepreneurship', 'BS ENTREP', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:46'),
(61, 5, 'BS in Business Administration (HRDM)', 'BSBA-HRDM', 0, 4, 1, 0, 1, '0000-00-00 00:00:00', '2019-02-19 08:39:56'),
(62, 5, 'BS in Tourism Management', 'BSTM', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2020-01-16 01:58:52'),
(63, 5, 'BS in Hospitality Management', 'BSHM', 0, 4, 1, 1, 1, '0000-00-00 00:00:00', '2019-02-15 05:55:47'),
(64, 8, 'Bachelor in Automotive Technology', 'BAT', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 05:58:19'),
(65, 8, 'B Technical Teachers Education', 'BTTE', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 9, 'Bachelor of Secondary Education (Filipino)', 'BSE (Fil)', 0, 4, 1, 1, 4, '0000-00-00 00:00:00', '2019-02-15 06:33:21'),
(67, 9, 'Bachelor of Secondary Education (MAPEH)', 'BSE (MAPEH)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:44:48'),
(68, 9, 'Bachelor of Secondary Education (SocStud)', 'BSE (SocStud)', 0, 4, 1, 1, 4, '0000-00-00 00:00:00', '2019-02-15 06:33:27'),
(69, 9, 'Bachelor of Secondary Education (TLE)', 'BSE (TLE)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:45:10'),
(70, 9, 'Bachelor of Secondary Education (BioSci)', 'BSE (BioSci)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:44:43'),
(71, 9, 'Bachelor of Secondary Education (Math)', 'BSE (Math)', 0, 4, 1, 1, 4, '0000-00-00 00:00:00', '2019-02-15 06:33:23'),
(72, 9, 'Bachelor in Secondary Education (PhysSc)', 'BSE (PhysSc)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:44:57'),
(73, 4, 'AB English Studies', 'BA ENGL', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2016-09-28 01:13:12'),
(74, 10, 'Bachelor of Laws', 'LB', 0, 4, 1, NULL, NULL, '0000-00-00 00:00:00', '2019-06-27 06:16:22'),
(75, 5, 'BS in Business Administration (TM)', 'BSBA-TM', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 5, 'BS in Business Administration (M)', 'BSBA-MGT', 0, 4, 0, 0, NULL, '0000-00-00 00:00:00', '2020-01-16 01:59:22'),
(77, 5, 'BS in Business Administration (MA)', 'BSBA-MA', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 5, 'BS in Business Administration (Entrep)', 'BSBA-Entrep', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 6, 'BS in Meteorology Engineering', 'BSMetEng', 0, 5, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 4, 'AB in English Studies (ESL)', 'AB ENGL (ESL)', 0, 4, 1, 0, 3, '0000-00-00 00:00:00', '2019-05-27 06:49:07'),
(81, 5, 'BS in Tourism Management (International Services Mgt)', 'BSTM-ISM', 0, 4, 1, 0, 1, '0000-00-00 00:00:00', '2020-01-16 01:59:06'),
(82, 5, 'BS in Tourism Management (Travel and Tour Mgt)', 'BSTM-TTM', 0, 4, 1, 0, 1, '0000-00-00 00:00:00', '2020-01-16 01:59:05'),
(83, 4, 'AB Communication', 'ABCOM', 0, 4, 1, 1, 3, '0000-00-00 00:00:00', '2019-02-15 05:53:01'),
(84, 8, 'BS in Industrial Technology (Computer Technology)', 'BSIT-CT', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 05:58:23'),
(85, 8, 'BS in Industrial Technology (Garments Technology)', 'BSIT-GT', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-05-24 06:03:39'),
(86, 8, 'BS in Industrial Technology (Food Technology)', 'BSIT-FT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:42:46'),
(87, 8, 'BS in Industrial Technology (Civil Technology)', 'BSIT-CivTech', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:42:15'),
(88, 8, 'BS in Industrial Technology (Electrical Technology)', 'BSIT-ELT', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 06:31:32'),
(89, 8, 'BS in Industrial Technology (Electronics Technology)', 'BSIT-ELXT', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 06:31:32'),
(90, 8, 'Bachelor of Technical Teacher Education (Garments, Fashion and Design)', 'BTTE-GFD', 0, 4, 1, 0, NULL, '0000-00-00 00:00:00', '2018-02-14 05:41:11'),
(91, 8, 'Bachelor of Technical Teacher Education (Drafting Technology)', 'BTTE-Drafting', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:41:16'),
(92, 8, 'Bachelor of Technical Teacher Education (Computer Technology)', 'BTTE-CompTech', 0, 4, 1, 0, NULL, '0000-00-00 00:00:00', '2018-02-14 05:41:12'),
(93, 8, 'Bachelor of Technical Teacher Education (Electronics Technology)', 'BTTE-ElectoTech', 0, 4, 1, 0, NULL, '0000-00-00 00:00:00', '2018-02-14 05:41:13'),
(94, 8, 'Bachelor of Technical Teacher Education (Food and Service Management)', 'BTTE-FSM', 0, 4, 1, 0, NULL, '0000-00-00 00:00:00', '2018-02-14 05:41:32'),
(95, 8, 'Bachelor of Technical Teacher Education (Automotive Technology)', 'BTTE-AT', 0, 4, 1, 0, NULL, '0000-00-00 00:00:00', '2018-02-14 05:41:18'),
(97, 3, 'BS in Fisheries Major in Aquaculture', 'BSF-Aqua', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-01-17 05:29:57'),
(98, 3, 'BS in Fisheries Major in Marine Fisheries', 'BSF-MF', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-01-17 05:29:57'),
(99, 3, 'BS in Fisheries Major in Fish Processing', 'BSF-FP', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-01-17 05:29:59'),
(100, 2, 'Bachelor of Agriculture Tech. Major in Animal Production', 'BAgriT-AP', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 2, 'Bachelor of Agriculture Tech. Major in Crop Production', 'BAgriT-CP', 0, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 2, 'BS in Agri Business', 'BSAB', 0, 4, 1, 1, 7, '0000-00-00 00:00:00', '2019-02-15 05:50:52'),
(103, 9, 'Bachelor in Elementary Education (SpEd)', 'BEEd (SpEd)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:43:19'),
(104, 9, 'Bachelor in Elementary Education (Pre-School Ed)', 'BEEd (PSEd)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:43:18'),
(105, 9, 'Bachelor of Elementary Education (Generalist)', 'BEEd (Gen)', 0, 4, 1, 0, 4, '0000-00-00 00:00:00', '2019-02-19 08:44:26'),
(106, 8, 'BS in Industrial Technology (Ref AC Technology)', 'BSIT (RACT)', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:42:57'),
(108, 2, 'BS in Agriculture (Agricultural Ext)', 'BSA-AG EXT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-06-17 07:15:34'),
(109, 2, 'BS in Agriculture (Animal Science)', 'BSA-AS', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-06-17 07:15:31'),
(110, 2, 'BS in Agriculture (Horticulture)', 'BSA-HORT', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-06-17 07:15:30'),
(111, 2, 'BS in Agriculture (Agronomy)', 'BSA-AGRO', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2020-06-17 07:15:29'),
(112, 2, 'BS in Agriculture (Soil Science)', 'BSA-SS', 0, 4, 1, 0, 7, '0000-00-00 00:00:00', '2019-02-19 08:37:11'),
(113, 2, 'BS in Agriculture (Crop Protection)', 'BSA-CP', 0, 4, 1, 0, 7, NULL, '2020-12-06 09:41:16'),
(114, 11, 'Doctor of Medicine', 'MD', 2, 4, 1, NULL, NULL, NULL, '2018-07-18 08:14:37'),
(115, 8, 'BS in Industrial Technology (Ceramics Technology)', 'BSIT-CERT', 0, 4, 1, 0, 7, NULL, '2019-02-19 08:41:45'),
(116, 8, 'BS in Industrial Technology (Electornics and Comm Tech)', 'BSIT-ECT', 0, 4, 1, 0, 7, NULL, '2019-02-19 08:42:28'),
(117, 8, 'BS in Industrial Technology (Drafting Technology)', 'BSIT-Drafting', 0, 4, 1, 0, 7, NULL, '2019-02-19 08:42:23'),
(118, 8, 'Bachelor of Technical Teacher Education (Electrical Technology)', 'BTTE-ELEC', 0, 4, 1, 0, NULL, NULL, '2018-02-14 05:41:33'),
(119, 9, 'Professional Education', 'ProfEd', 0, 4, 1, NULL, NULL, NULL, '2016-12-07 01:35:56'),
(120, 9, 'TCP', 'TCP', 0, 5, 1, 0, 4, NULL, '2019-02-19 08:47:52'),
(121, 2, 'BS in Food Technology', 'BSFT', 0, 4, 1, 1, 2, NULL, '2019-02-15 05:52:15'),
(122, 1, 'Doctor of Education Major in Educational Management', 'EdD (Educ Mgt)', 2, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:21'),
(123, 1, 'Doctor of Philosophy in Linguistics (Specialization:Applied Linguistics)', 'PhD (Lingustics)', 2, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:22'),
(124, 1, 'Master in Science Major in Rural Development', 'MSRD', 1, 2, 1, NULL, NULL, NULL, '2017-07-27 05:57:24'),
(125, 1, 'Master in Information Technology', 'MIT', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:25'),
(126, 1, 'Master in Management Major in Strategic Management', 'MM (SM)', 1, 2, 1, NULL, NULL, NULL, '2017-07-27 05:57:26'),
(127, 1, 'Master in Management Major in Financial Management', 'MM (FM)', 1, 2, 1, NULL, NULL, NULL, '2017-07-27 05:57:28'),
(128, 1, 'Master of Arts in English Language and Literature', 'MAELL', 1, 2, 1, NULL, NULL, NULL, '2023-04-17 03:40:11'),
(129, 1, 'Master of Arts in Mathematics', 'MA (Math)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:30'),
(130, 1, 'Master of Arts in Public Administration', 'MAPA', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:30'),
(131, 1, 'Master of Arts in Education Major in Biology', 'MAEd (Bio)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:31'),
(132, 1, 'Master of Arts in Education Major in Chemistry', 'MAEd (Chem)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:33'),
(133, 1, 'Master of Arts in Education Major in  Educational Management', 'MAEd (EdMgt)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:38'),
(134, 1, 'Master of Arts in Education Major in  Ilokano Studies', 'MAEd (IS)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:40'),
(135, 1, 'Master of Arts in Education Major in Language and Literature', 'MAEd (LL)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:40'),
(136, 1, 'Master of Arts in Education Major in Guidance Counseling', 'MAEd (GC)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:41'),
(137, 1, 'Master of Arts in Education Major in Mathematics', 'MAEd (Math)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:42'),
(138, 1, 'Master of Arts in Education Major in Physics', 'MAEd (Phys)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:43'),
(139, 1, 'Master of Arts in Education Major in Science Education', 'MAEd (SciEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-11-24 02:18:09'),
(140, 1, 'Master of Science in Engineering Major in Soil and Water Resources Engineering', 'MSE (SWRE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:45'),
(141, 1, 'Master of Science in Engineering Major in Agricultural Engineering', 'MSE (AgEng)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:49'),
(142, 1, 'Master of Education Major in Early Childhood Education', 'MEd (EarlyCE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:47'),
(143, 1, 'Master of Education Major in Wika at Panitikan', 'MEd (Wika)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:50'),
(144, 1, 'Master of Education Major in Library and Information Management', 'MEd (LIM)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:51'),
(145, 1, 'Master of Education Major in MSEPP / MSEPPK / PEHM', 'MEd (MSEP)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:52'),
(146, 1, 'Master of Education Major in Social Studies', 'MEd (SocSt)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:53'),
(147, 1, 'Master of Education Major in Technical-Vocational Education', 'MEd (TVE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-12-28 08:09:27'),
(148, 1, 'Master of Education Major in Special Education', 'MEd (SpEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:56'),
(149, 1, 'Master of Education Major in Technology and Home Economics', 'MEd (THE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:57'),
(150, 1, 'Master of Education Major in Technician Education', 'MEd (TechEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:58'),
(151, 1, 'Master of Arts in Nursing Major in Medical and Surgical Nursing', 'MAN (MSN)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:59'),
(152, 1, 'Master of Arts in Nursing Major in Maternal and Child Health Nursing', 'MAN (MCHN)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:57:59'),
(153, 1, 'Master of Nursing Major in Medical - Surgical Nursing', 'MN (MSN)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2022-11-24 00:13:29'),
(154, 1, 'Master of Nursing Major in Maternal - Child Nursing', 'MN (MCN)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2022-11-24 00:13:42'),
(155, 1, 'Master of Science in Biology', 'MSBio', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:02'),
(156, 1, 'Master of Science in Mathematics', 'MSMath', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:03'),
(157, 1, 'Master of Science in Crop Science', 'MSCrpS', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:04'),
(158, 1, 'Master of Science in Animal Science', 'MSAS', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:09'),
(159, 1, 'Master of Agriculture Major in Crop Science', 'MAgri (CS)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:11'),
(160, 1, 'Master of Agriculture Major in Animal Science', 'MAgri (AS)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:12'),
(161, 1, 'Professional Science Masters (Renewable Energy Engineering)', 'ProfSM', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-11-24 02:35:13'),
(162, 1, 'Master of Arts in Education Major in Early Childhood Education', 'MAEd (EarlyCE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:13'),
(163, 1, 'Master of Arts in Education Major in Wika at Panitikan', 'MAEd (Wika)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:14'),
(164, 1, 'Master of Arts in Education Major in Library and Information Management', 'MAEd (LIM)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:17'),
(165, 1, 'Master of Arts in Education Major in MSEPP / MSEPPK / PEHM', 'MAEd (MSEPP)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:17'),
(166, 1, 'Master of Arts in Education Major in Social Studies', 'MAEd (SocSt)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:18'),
(167, 1, 'Master of Arts in Education Major in Technical-Vocational Education', 'MAEd (TVEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2018-11-08 01:41:35'),
(168, 1, 'Master of Arts in Education Major in Special Education', 'MAEd (SpEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:20'),
(169, 1, 'Master of Arts in Education Major in Technology and Home Economics', 'MAEd (THE)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:21'),
(170, 1, 'Master of Arts in Education Major in Technician Education', 'MAEd (TechEd)', 1, 2, 1, 0, NULL, '2017-07-18 06:39:55', '2017-07-27 05:58:22'),
(171, 1, 'Master of Science in Agriculture Major in Crop Science', 'MSA-CrpS', 1, 2, 1, 0, NULL, NULL, '2018-06-13 06:53:11'),
(172, 1, 'Master of Science in Agriculture Major in Animal Science', 'MSA-AS', 1, 2, 1, 0, NULL, NULL, '2018-06-13 06:53:13'),
(173, 1, 'Master in Animal Science', 'MAS', 1, 2, 1, 0, NULL, NULL, '2018-02-14 05:37:40'),
(174, 1, 'Master in Crop Science', 'MCrpS', 1, 2, 1, 0, NULL, NULL, '2018-02-14 05:37:41'),
(175, 9, 'Bachelor of Culture and Arts Education', 'BCAEd', 0, 4, 1, 1, 4, NULL, '2019-02-15 06:31:43'),
(176, 9, 'Bachelor of Physical Education', 'BPEd', 0, 4, 1, 1, 6, NULL, '2019-07-02 03:09:36'),
(177, 9, 'Bachelor of Technical-Vocational Teacher Education (Drafting)', 'BTVTEd-Drafting', 0, 4, 1, 0, 7, NULL, '2019-02-19 08:45:49'),
(178, 9, 'Bachelor of Technology and Livelihood Education (Agri and Fishery Arts)', 'BTLE-AFA', 0, 4, 1, 1, 7, NULL, '2019-02-19 08:47:24'),
(179, 9, 'Bachelor of Special Needs Education', 'BSNE', 0, 4, 1, 1, 4, NULL, '2019-02-15 06:33:31'),
(180, 9, 'Bachelor of Early Childhood Education', 'BECE', 0, 4, 1, 1, 4, NULL, '2019-02-15 06:31:45'),
(181, 4, 'Bachelor of Science in Meteorology', 'BSMet', 0, 4, 1, 1, 2, NULL, '2019-02-15 05:55:28'),
(182, 13, 'Bachelor of Science in Information Technology', 'BSInfoTech', 0, 4, 1, 1, 2, NULL, '2023-07-21 07:05:57'),
(183, 9, 'Bachelor of Technical-Vocational Teacher Education (Automotive Tech)', 'BTVTEd-AT', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:33:53'),
(184, 9, 'Bachelor of Technical-Vocational Teacher Education (Garments and Fashion Design Tech)', 'BTVTEd-GFDT', 0, 4, 1, 1, 7, NULL, '2019-02-19 08:47:05'),
(185, 9, 'Bachelor of Technical-Vocational Teacher Education (FSMT)', 'BTVTEd-FSMT', 0, 4, 1, 1, 7, NULL, '2020-04-17 03:59:57'),
(186, 9, 'Bachelor of Technical-Vocational Teacher Education (Comp. Hardware Servicing)', 'BTVTEd-COMHS', 0, 4, 1, 1, 7, NULL, '2019-02-19 08:46:32'),
(187, 9, 'Bachelor of Technical-Vocational Teacher Education (Electronics)', 'BTVTEd-Electronics', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:33:55'),
(188, 9, 'Bachelor of Technical-Vocational Teacher Education (Electrical)', 'BTVTEd-Electrical', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:33:54'),
(189, 9, 'Bachelor of Technology and Livelihood Education (ICT)', 'BTLE-ICT', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:33:59'),
(190, 9, 'Bachelor of Technology and Livelihood Education (Industrial Arts)', 'BTLE-IA', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:34:02'),
(191, 9, 'Bachelor of Technology and Livelihood Education (Home Economics)', 'BTLE-HE', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:33:58'),
(192, 9, 'Bachelor of Secondary Education (Science)', 'BSE (Science)', 0, 4, 1, 1, 4, NULL, '2019-02-15 06:33:26'),
(193, 9, 'Bachelor of Secondary Education (Values Education)', 'BSE (VEd)', 0, 4, 1, 1, 4, NULL, '2019-02-15 06:33:30'),
(194, 6, 'BS in Agricultural and Biosystems Engineering', 'BSABE', 0, 4, 1, 1, 2, NULL, '2019-02-15 05:55:54'),
(195, 5, 'BS in Business Administration (HRM)', 'BSBA-HRM', 0, 4, 1, 1, 1, NULL, '2019-02-15 05:55:39'),
(196, 8, 'BS in Industrial Technology (Civil and Drafting Tech)', 'BSIT-CDT', 0, 4, 1, 1, 7, NULL, '2019-02-15 05:58:22'),
(197, 8, 'BS in Industrial Technology (Food Processing and Service Mngt)', 'BSIT-FPSM', 0, 4, 1, 1, 7, NULL, '2019-02-15 06:31:32'),
(198, 10, 'Juris Doctor', 'JD', 2, 4, 1, NULL, NULL, '0000-00-00 00:00:00', '2019-06-27 06:18:00'),
(199, 9, 'Early Childhood Education Program', 'ECEP', 1, 1, 1, 1, NULL, NULL, NULL),
(200, 4, 'BS Psychology', 'BSPsy', 0, 4, 1, 1, 3, '2022-01-07 00:49:51', '2022-01-07 00:49:55'),
(201, 12, 'Doctor of Veterinary Medicine', 'VetMed', 0, 6, 1, 1, 4, NULL, '2023-01-24 08:48:47'),
(202, 100, 'Cross Enrollee', 'CE', 0, 1, 1, 0, 4, '2022-10-24 03:06:26', '2023-01-10 06:22:15'),
(203, 1, 'Master of Arts in Guidance Counseling', 'GS (MAGC)', 1, 4, 1, 0, 0, NULL, '2023-09-12 01:30:35');

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
  `name` varchar(255) NOT NULL,
  `name_generate` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `size` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `folder_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `name_generate`, `type`, `size`, `timestamp`, `folder_id`, `user_id`) VALUES
(141, 'CRYPHTOGRAPHY WEB.txt', '1701758621_656ec69d139a1.txt', 'txt', 2577, '2023-12-05 06:43:41', 17, 2),
(142, 'ctf tools.txt', '1701758621_656ec69d17480.txt', 'txt', 11, '2023-12-05 06:43:41', 17, 2),
(143, 'e sig.png', '1701758621_656ec69d18312.png', 'png', 19234, '2023-12-05 06:43:41', 17, 2),
(144, 'e_sig-png.png', '1701758621_656ec69d192c2.png', 'png', 31514, '2023-12-05 06:43:41', 17, 2),
(145, 'Bua-ay, Jayther Jann F. - Waiver.pdf', '1701784126_656f2a3ec629d.pdf', 'pdf', 183878, '2023-12-05 13:48:47', 33, 9),
(146, 'CRYPHTOGRAPHY WEB.txt', '1701784127_656f2a3f14678.txt', 'txt', 2577, '2023-12-05 13:48:47', 33, 9),
(147, 'ctf tools.txt', '1701784127_656f2a3f15c41.txt', 'txt', 11, '2023-12-05 13:48:47', 33, 9);

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `institution_id` int(11) DEFAULT 0,
  `degree_id` int(10) UNSIGNED DEFAULT 0,
  `administrative_id` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `institution_id`, `degree_id`, `administrative_id`, `user_id`, `timestamp`) VALUES
(1, 'ddssadwd', 0, NULL, NULL, 2, '2023-11-23 02:53:17'),
(2, 'ddssadwd', 0, NULL, NULL, 2, '2023-11-23 02:54:27'),
(11, 'dwaddscdvvsss', 0, 0, NULL, 2, '2023-11-23 03:32:57'),
(13, 'ajanung', 0, 182, NULL, 2, '2023-11-23 03:39:00'),
(17, 'Aldrin', 0, 182, NULL, 2, '2023-11-23 18:48:28'),
(18, 'Jayther', 0, 182, NULL, 2, '2023-11-23 18:48:40'),
(22, 'almdlwmd', 0, 182, NULL, NULL, '2023-11-23 19:25:59'),
(23, 'dawdasss', 0, 182, NULL, 2, '2023-11-30 05:11:15'),
(24, 'adss', 0, 182, NULL, 2, '2023-11-30 08:25:50'),
(25, 'kafd', 0, 182, NULL, 2, '2023-11-30 08:26:39'),
(26, 'daiwhrifawknfknakf', 0, 182, NULL, 2, '2023-11-30 08:27:25'),
(27, 'adawdsdasd', 0, 182, NULL, 2, '2023-11-30 08:27:53'),
(28, 'lenaard', 0, 182, NULL, 2, '2023-11-30 08:31:01'),
(29, 'ajdwkd', 0, 182, NULL, 2, '2023-12-02 15:00:29'),
(30, 'hsaksd', 0, 182, NULL, 2, '2023-12-02 15:00:44'),
(32, 'janfs', 0, 0, NULL, 9, '2023-12-05 08:46:40'),
(33, 'ajanf', 0, 0, 1, 9, '2023-12-05 08:56:41'),
(34, 'kong', 1, 0, 0, 12, '2023-12-05 12:58:15'),
(35, 'kong', 0, 0, 1, 9, '2023-12-05 13:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `ia_areas`
--

CREATE TABLE `ia_areas` (
  `id` int(11) NOT NULL,
  `area_order` int(11) DEFAULT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ia_areas`
--

INSERT INTO `ia_areas` (`id`, `area_order`, `area_name`, `area_description`, `created_at`, `updated_at`) VALUES
(0, NULL, '---', '---', NULL, NULL),
(1, 1, 'AREA I', 'Governance and Management', NULL, NULL),
(2, 2, 'AREA II', 'Teaching, Learning and Evaluation', NULL, NULL),
(3, 3, 'AREA III', 'Faculty and Staff', NULL, NULL),
(4, 4, 'AREA IV', 'Research', NULL, NULL),
(5, 5, 'AREA V', 'Extension and Consultancy and Linkages', NULL, NULL),
(6, 6, 'AREA VI', 'Support to Students', NULL, NULL),
(7, 7, 'AREA VII', 'Library', NULL, NULL),
(8, 8, 'AREA VIII', 'Infrastructure and Learning Resources', NULL, NULL),
(9, 9, 'AREA IX', 'Quality Assurance Culture', NULL, NULL),
(11, 11, 'dawdwd', 'dwdwdwd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

CREATE TABLE `institutions` (
  `id` int(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`id`, `name`) VALUES
(0, '---'),
(1, 'MMSU BATAC'),
(2, 'MMSU Laoag'),
(3, 'MMSU Curimmao'),
(4, 'MMSU Dingras');

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
(76, 'App\\Models\\User', 3, '1700794361', '06e8a994665ddf20a1025a8bed1af9d342868e22b7076a3c46d36e22b8ce1868', '[\"*\"]', NULL, NULL, '2023-11-23 18:52:41', '2023-11-23 18:52:41'),
(112, 'App\\Models\\User', 1, '1701784990', '921ae43f3f1f5abb5ae33901462d054bb2f8d60ceecf00e232bc07bbc0562efd', '[\"*\"]', NULL, NULL, '2023-12-05 06:03:10', '2023-12-05 06:03:10'),
(113, 'App\\Models\\User', 1, '1701817586', '2fdf1a6e3b7cfbac54cb51fc9f895d756c2ee2f6b62345e9bcf36c39b267b0b8', '[\"*\"]', NULL, NULL, '2023-12-05 15:06:26', '2023-12-05 15:06:26');

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
(0, 0, '---', '---', 0, NULL, NULL),
(1, 1, 'AREA I', 'VISION, MISSION, GOALS AND OBJECTIVES', 0, NULL, '2023-12-05 07:13:34'),
(2, 2, 'AREA II', 'FACULTY', 1, NULL, '2023-11-21 00:30:28'),
(3, 3, 'AREA III', 'CURRICULUM AND INSTRUCTION', 1, NULL, '2023-11-21 00:23:41'),
(4, 4, 'AREA IV', 'SUPPORT TO STUDENTS', 1, NULL, NULL),
(5, 5, 'AREA V', 'RESEARCH', 1, NULL, NULL),
(6, 6, 'AREA VI', 'EXTENSION AND COMMUNITY INVOLVEMENT', 1, NULL, NULL),
(7, 7, 'AREA VII', 'LIBRARY', 1, NULL, NULL),
(8, 8, 'AREA VIII', 'PHYSICAL PLANT AND FACILITIES', 1, NULL, NULL),
(9, 9, 'AREA IX', 'LABORATORIES', 1, NULL, NULL),
(10, 10, 'AREA X', 'ADMINISTRATION', 1, NULL, '2023-11-21 00:23:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(0, '---'),
(1, 'Administrative'),
(2, 'Program Accreditor'),
(3, 'Institution'),
(4, 'Program'),
(5, 'Institution Accreditor'),
(6, 'PSV'),
(7, 'PSV Accreditor');

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
  `administrative_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `degree_id`, `institution_id`, `psv_area_id`, `role_id`, `isAdmin`, `created_at`, `updated_at`, `administrative_id`) VALUES
(1, 'Jayther Jann Bua-ay', 'JaytherXZ52', 'jayther@gmail.com', '$2y$10$9rcp8kThDa.zTkscnhdOFesIQLRpJQtg54gt1upYtrMyrAIeRg5GO', 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 'Janung Pugi', 'Janung123', 'janung@gmaail.com', '$2y$10$hJLXX9hobA.MPr42O7Mxre1b34gxWN.OpoC2jLdoZzmXYoZQuH3g2', 182, 0, 0, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(9, 'Torjak Galut', 'Torjak123', 'torjak@gmail.com', '$2y$10$3UOOF9hkXJiq6dQzbKHCgemC0FSkDTo2eL8LQm3dZCrkCfvhAEhS2', 0, 0, 0, 1, 0, '2023-11-27 21:49:14', '2023-11-27 21:49:14', 1),
(12, 'Gojira', 'kinggojira', 'gojira@gmail.com', '$2y$10$vTqvPBJsAkYW.p6HIi7fV.wgsf8hXG9mLNFH2t0X9820xZog/PTmy', 0, 1, 0, 3, 0, '2023-12-05 04:57:45', '2023-12-05 04:57:45', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `administrative_id` (`administrative_id`),
  ADD KEY `psv_area_id` (`psv_area_id`);

--
-- Indexes for table `accreditors`
--
ALTER TABLE `accreditors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `accreditation_id` (`accreditation_id`);

--
-- Indexes for table `accreditor_areas`
--
ALTER TABLE `accreditor_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `accreditor_id` (`accreditor_id`);

--
-- Indexes for table `administratives`
--
ALTER TABLE `administratives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `degrees_college_id_foreign` (`college_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_office_id` (`administrative_id`);

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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_office_id` (`administrative_id`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `institution_id` (`institution_id`),
  ADD KEY `psv_area_id` (`psv_area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditations`
--
ALTER TABLE `accreditations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accreditors`
--
ALTER TABLE `accreditors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accreditor_areas`
--
ALTER TABLE `accreditor_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administratives`
--
ALTER TABLE `administratives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ia_areas`
--
ALTER TABLE `ia_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `psv_areas`
--
ALTER TABLE `psv_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD CONSTRAINT `accreditations_ibfk_1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  ADD CONSTRAINT `accreditations_ibfk_2` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `accreditations_ibfk_3` FOREIGN KEY (`administrative_id`) REFERENCES `administratives` (`id`),
  ADD CONSTRAINT `accreditations_ibfk_4` FOREIGN KEY (`psv_area_id`) REFERENCES `psv_areas` (`id`);

--
-- Constraints for table `accreditors`
--
ALTER TABLE `accreditors`
  ADD CONSTRAINT `accreditors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `accreditors_ibfk_2` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`);

--
-- Constraints for table `accreditor_areas`
--
ALTER TABLE `accreditor_areas`
  ADD CONSTRAINT `accreditor_areas_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `accreditor_areas_ibfk_2` FOREIGN KEY (`accreditor_id`) REFERENCES `accreditors` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`),
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_ibfk_1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  ADD CONSTRAINT `folders_ibfk_2` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `folders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `folders_ibfk_4` FOREIGN KEY (`administrative_id`) REFERENCES `administratives` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`administrative_id`) REFERENCES `administratives` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`psv_area_id`) REFERENCES `psv_areas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
