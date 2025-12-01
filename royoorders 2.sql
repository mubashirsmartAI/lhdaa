-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 18, 2025 at 12:37 PM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royoorders`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_options`
--

CREATE TABLE `addon_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_id` bigint UNSIGNED NOT NULL,
  `position` smallint NOT NULL DEFAULT '1',
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `addon_option_translations`
--

CREATE TABLE `addon_option_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_opt_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `addon_sets`
--

CREATE TABLE `addon_sets` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_select` tinyint NOT NULL DEFAULT '1',
  `max_select` tinyint NOT NULL DEFAULT '1',
  `position` smallint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 - pending, 1 - active, 2 - blocked',
  `is_core` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no, 1 - yes',
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `addon_set_translations`
--

CREATE TABLE `addon_set_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone_number`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@cbl.com', NULL, '2021-06-24 11:33:38', '$2y$10$nVCHcr9j2VCPHOH4aBxMzOafzjjjsSN6wfCfTqWU7vw2a9PEXo6Me', 'dyjzY7vTGKzOZUkoTYtlOUC2FaLhpWLMLpBEOPue2Eui4fpDT14XuhiXNn9B', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `models` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_stylings`
--

CREATE TABLE `app_stylings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '1-Text, 2-Option, 3-Option Images, 4-Color',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_styling_options`
--

CREATE TABLE `app_styling_options` (
  `id` bigint UNSIGNED NOT NULL,
  `app_styling_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_selected` tinyint NOT NULL DEFAULT '1' COMMENT '1-yes, 2-no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint UNSIGNED NOT NULL,
  `old_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'created', 'App\\Models\\Client', 411, '[]', '{\"name\":\"QSeek\",\"phone_number\":\"96567078976\",\"company_name\":\"QSeek\",\"company_address\":\"Dubai\",\"custom_domain\":null,\"sub_domain\":\"qseek\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@qseek.com\",\"database_name\":\"qseek\",\"password\":\"$2y$10$IZRQckOpYKJMsyostD2\\/D.2ySEKoGAqojmQM9UEWEZx1KcZwxoOdy\",\"encpass\":\"eyJpdiI6InU3SERPNEs3aGEvODBRQXBPRm5ZTmc9PSIsInZhbHVlIjoiOTlyZnFBL3BUbEs2UzlndU9UNjB3dz09IiwibWFjIjoiMmFlYjM0YWZlZjk1NWJhMGM5ZjljNzYyMmY5NjVhZGQ5NjI0ZDY3YzE3MDYwY2E5ZmM1MmJjZTgzMjM0ODJmNCIsInRhZyI6IiJ9\",\"code\":\"a1ffe8\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-03-16 11:12:23\",\"created_at\":\"2022-03-16 11:12:23\",\"id\":411}', 'http://god.rostaging.com/godpanel/client', '172.31.38.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', NULL, '2022-03-16 11:12:23', '2022-03-16 11:12:23'),
(2, NULL, NULL, 'created', 'App\\Models\\Client', 412, '[]', '{\"name\":\"Bua\",\"phone_number\":\"+353872121013\",\"company_name\":\"Bua\",\"company_address\":\"Europe\",\"custom_domain\":null,\"sub_domain\":\"bua\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@bua.com\",\"database_name\":\"bua\",\"password\":\"$2y$10$mOHrN.mKwZrpnx93LLu5Re877JGgu5dgisU5W80HUjo6TfmZJHg5a\",\"encpass\":\"eyJpdiI6Ikw1bmc5cDU2TkIzcEpkM3RSWGM2Rmc9PSIsInZhbHVlIjoiTFdvczl4cVFNVDdhVUhtakczT051QT09IiwibWFjIjoiZTgzNDY1YTdjNTJjMjgxYWQ1OGQ1ZmNjZGE3MjMyMjM0MTFjZjQ4YTkyOWVhZDAzMzdlYzQxZjRlMDczNDQ3OCIsInRhZyI6IiJ9\",\"code\":\"132c75\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-03-17 12:00:55\",\"created_at\":\"2022-03-17 12:00:55\",\"id\":412}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', NULL, '2022-03-17 12:00:55', '2022-03-17 12:00:55'),
(3, NULL, NULL, 'created', 'App\\Models\\Client', 413, '[]', '{\"name\":\"912\",\"phone_number\":\"+593999704213\",\"company_name\":\"912\",\"company_address\":\"South America\",\"custom_domain\":null,\"sub_domain\":\"912\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@912.com\",\"database_name\":\"912\",\"password\":\"$2y$10$s0rIvfGgD9uymEOJBYUwWu7mJeQSaTP9FLSqMvG\\/ClWGHBumxRMnS\",\"encpass\":\"eyJpdiI6InFqdVFQTUpnR3NrKzJLdDhGSVA1a1E9PSIsInZhbHVlIjoiWFoyS2VoM0d1NEpqUVNwRkc5dGtSdz09IiwibWFjIjoiODJkZTlkMDA1NjQ2ZTg3ODAyOTZiNTg3YmZmOTRkYjY4N2JmMWEyNTFhNDAxNzVjM2U0ZTlhYjFjMmYwNzhkNSIsInRhZyI6IiJ9\",\"code\":\"f92fea\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-03-22 04:15:39\",\"created_at\":\"2022-03-22 04:15:39\",\"id\":413}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', NULL, '2022-03-22 04:15:39', '2022-03-22 04:15:39'),
(4, NULL, NULL, 'created', 'App\\Models\\Client', 414, '[]', '{\"name\":\"Upstreet\",\"phone_number\":\"+1 (907) 570-8314\",\"company_name\":\"upstreet\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"upstreet\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/sDR3LJgO681qS3ot0c2PSH1MpgoujdnvrvkPx8dm.png\",\"database_path\":\"\",\"email\":\"admin@upstreet.com\",\"database_name\":\"upstreet\",\"password\":\"$2y$10$hsCGcdKbyKzTT3CrFTcw0uMtri.WAVmahGMADyORG6oQGKz\\/pf7ue\",\"encpass\":\"eyJpdiI6InMvcFJGWEx4TWVLNzF6ZXJhazdNS1E9PSIsInZhbHVlIjoiZ0FaNEpvbFYxQTU4MGpHU2NhQkh6Zz09IiwibWFjIjoiNTY3OGRhODRmMzZiOWU1MjJjYzk2ODFkMDAwZmEzZGI1OWUzYmEwNzE3ODg4NTcwNmFiZjU1YmYxOTYyOGJmMyIsInRhZyI6IiJ9\",\"code\":\"260629\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-03-22 09:29:09\",\"created_at\":\"2022-03-22 09:29:09\",\"id\":414}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', NULL, '2022-03-22 09:29:09', '2022-03-22 09:29:09'),
(5, NULL, NULL, 'created', 'App\\Models\\Client', 415, '[]', '{\"name\":\"Airline\'s Recruiter\",\"phone_number\":\"+593999704213\",\"company_name\":\"Airline\'s Recruiter\",\"company_address\":\"Africa\",\"custom_domain\":null,\"sub_domain\":\"airlinesrecruiter\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@airlinesrecruiter.com\",\"database_name\":\"airlinesrecruiter\",\"password\":\"$2y$10$zsZ8iVxw0gH\\/E.Fodk0QDOioQsZTRnpx\\/pybUscYp7xwj.hG\\/Q98m\",\"encpass\":\"eyJpdiI6Ii9mV2lEdXZ5QW5nYnI4NnhtajNNK3c9PSIsInZhbHVlIjoidlgzNG1uRDBCcTRSbGhXaGxQUkZMQT09IiwibWFjIjoiOWQxODhlMDBlMzlkYmRlZGJkNThhYjdlYTMzNzIzNGFlOGFjNjBlYjM3ZWVjNzRmMTgwYzJkM2EwMTMwY2VkNyIsInRhZyI6IiJ9\",\"code\":\"deb34c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-03-22 13:25:19\",\"created_at\":\"2022-03-22 13:25:19\",\"id\":415}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-03-22 13:25:19', '2022-03-22 13:25:19'),
(6, NULL, NULL, 'created', 'App\\Models\\Client', 416, '[]', '{\"name\":\"New York Mini Mart\",\"phone_number\":\"+19103987266\",\"company_name\":\"New York Mini Mart\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"newyorkminimart\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@newyorkminimart.com\",\"database_name\":\"newyorkminimart\",\"password\":\"$2y$10$WkmemJc2pPfAlmuZhtY4COSWy8r8ElrEAum0wAwPV2kF2ndk8Pmdq\",\"encpass\":\"eyJpdiI6Imdod2dNWEdiS1Rnai9EcW9tOTYvOXc9PSIsInZhbHVlIjoidkk0VVlydnFtRStYNHllTkhPbWltUT09IiwibWFjIjoiN2Y0OGZiNzNhMWIyZDI4ZTM5MjAyYWFhMjUxMTZlOWY1N2FmZmE0Y2E5ZDI1ZDE5MGY0Mjg4YmYyM2JkZDk4MiIsInRhZyI6IiJ9\",\"code\":\"5e4b3b\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-03-22 14:20:57\",\"created_at\":\"2022-03-22 14:20:57\",\"id\":416}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-03-22 14:20:57', '2022-03-22 14:20:57'),
(7, NULL, NULL, 'created', 'App\\Models\\Client', 417, '[]', '{\"name\":\"Supermarket\",\"phone_number\":\"8089552028\",\"company_name\":\"supermarket\",\"company_address\":\"India\",\"custom_domain\":null,\"sub_domain\":\"supermarket\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@supermarket.com\",\"database_name\":\"supermarket\",\"password\":\"$2y$10$T3XkeiH\\/AO\\/gWpVnXKjJzebF9hAiHqyu\\/.hY15bGYzuYLaMFY6DZ.\",\"encpass\":\"eyJpdiI6IkEvd0R1SHM3M1UwdzUyL3Z0Q0wvWnc9PSIsInZhbHVlIjoiMjMwTUNXR25HSXBoWVI5TEF4ZjA1Zz09IiwibWFjIjoiY2VkYTE3ZWEwNTA3N2YzYTIyYjczYmRhNDVkODc3MGU4N2RlOWE5NWYyODk2NzUxZDIwMDExNTU1OWE3YjNkOSIsInRhZyI6IiJ9\",\"code\":\"41a3db\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-03-25 07:25:06\",\"created_at\":\"2022-03-25 07:25:06\",\"id\":417}', 'http://god.rostaging.com/godpanel/client', '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', NULL, '2022-03-25 07:25:06', '2022-03-25 07:25:06'),
(8, NULL, NULL, 'updated', 'App\\Models\\Client', 417, '{\"sub_domain\":\"supermarket\",\"updated_at\":\"2022-03-25 07:25:06\"}', '{\"sub_domain\":\"TJJ Hub\",\"updated_at\":\"2022-03-28 10:25:12\"}', 'http://god.rostaging.com/godpanel/client/417', '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', NULL, '2022-03-28 10:25:12', '2022-03-28 10:25:12'),
(9, NULL, NULL, 'updated', 'App\\Models\\Client', 417, '{\"sub_domain\":\"TJJ Hub\",\"updated_at\":\"2022-03-28 10:25:12\"}', '{\"sub_domain\":\"Supermarket\",\"updated_at\":\"2022-03-28 10:26:10\"}', 'http://god.rostaging.com/godpanel/client/417', '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', NULL, '2022-03-28 10:26:10', '2022-03-28 10:26:10'),
(10, NULL, NULL, 'created', 'App\\Models\\Client', 418, '[]', '{\"name\":\"Curbler\",\"phone_number\":\"+1 6782341334\",\"company_name\":\"Curbler LLC\",\"company_address\":\"Jamaica\",\"custom_domain\":null,\"sub_domain\":\"curbler\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@curbler.com\",\"database_name\":\"curbler\",\"password\":\"$2y$10$jMIOViQ0eAAgqKMeFWWEIe7JLw1bLsXLtzvwv4TX7EH\\/ZcojlfBTq\",\"encpass\":\"eyJpdiI6Ii9qK2lXNWR2ajFwV2dZR0RrVGFJeGc9PSIsInZhbHVlIjoidnJNeGMyYmlmTzFJcFYwei9JTFB1QT09IiwibWFjIjoiN2NiZTg2MWMyNGYzZTNkMWM3MTUwZjc2YWM5Y2E2NzYxZGMxN2Y4YjAxZDc2MmJiYzRlZjBjZDg3ZTM1NGQzMiIsInRhZyI6IiJ9\",\"code\":\"7838f8\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-03-28 12:30:16\",\"created_at\":\"2022-03-28 12:30:16\",\"id\":418}', 'http://god.rostaging.com/godpanel/client', '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', NULL, '2022-03-28 12:30:16', '2022-03-28 12:30:16'),
(11, NULL, NULL, 'created', 'App\\Models\\Client', 419, '[]', '{\"name\":\"Lake of the Ozarks Water Taxi\",\"phone_number\":\"+1 (314) 825-0646\",\"company_name\":\"Lake of the Ozarks Water Taxi\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"watertaxi\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/oQhMARH6FiAyaDT1VIuBbxkALNYOyAPddJKpNAcY.png\",\"database_path\":\"\",\"email\":\"admin@watertaxi.com\",\"database_name\":\"watertaxi\",\"password\":\"$2y$10$IFd0S34yI2w6D1w8IivMUOF6KfyzILImSe6o1xfv3czscmaXgn2M2\",\"encpass\":\"eyJpdiI6InpEajVZNE5icW1OaGZzVHZtaUs4bGc9PSIsInZhbHVlIjoiUGZLR1o1UUtDdWlVbk5rNXlCd0RPdz09IiwibWFjIjoiMjNkMWU2MzI0ODIyYjk5ZDBmNWZjZjNkZTU1Njc2ZWQwZThiN2I1MThiYjEyOGYyOTQ1Yjg0Njc4NjFmZWYxZCIsInRhZyI6IiJ9\",\"code\":\"f0f44c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-01 11:27:50\",\"created_at\":\"2022-04-01 11:27:50\",\"id\":419}', 'http://god.rostaging.com/godpanel/client', '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', NULL, '2022-04-01 11:27:50', '2022-04-01 11:27:50'),
(12, NULL, NULL, 'created', 'App\\Models\\Client', 420, '[]', '{\"name\":\"Aau Jaau\",\"phone_number\":\"+447780465252\",\"company_name\":\"Aau Jaau\",\"company_address\":\"Nepal\",\"custom_domain\":null,\"sub_domain\":\"aaujaau\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/zVLIGk9l3AfnzC69hShA6Zcbtr04aq6oXpOLf99T.jpg\",\"database_path\":\"\",\"email\":\"admin@aaujaau.com\",\"database_name\":\"aaujaau\",\"password\":\"$2y$10$qU3oVPz4VkhzofKxkkT9H.6OJvQnCw588Uhz7IWcfKm46FWx8ips6\",\"encpass\":\"eyJpdiI6IkVFUktyY0IrZllUYjAxRjJXOElVK3c9PSIsInZhbHVlIjoiZUtvQmZxbGNLQTdWRS9SdTRkUmFrZz09IiwibWFjIjoiY2U2MDcxMmFmOTk4M2ZmNDdkYTZiNTk1ZTUzZmQ4NmIzMzAwODAwZDM3ZjQ0NTBkYmRlOWIxYjQ3MDU1ZDgzZCIsInRhZyI6IiJ9\",\"code\":\"326d8e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-03 05:12:54\",\"created_at\":\"2022-04-03 05:12:54\",\"id\":420}', 'http://god.rostaging.com/godpanel/client', '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', NULL, '2022-04-03 05:12:54', '2022-04-03 05:12:54'),
(13, NULL, NULL, 'created', 'App\\Models\\Client', 421, '[]', '{\"name\":\"MediPick\",\"phone_number\":\"+12142773305\",\"company_name\":\"MediPick\",\"company_address\":\"USA\",\"custom_domain\":null,\"sub_domain\":\"medipick\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@medipick.com\",\"database_name\":\"medipick\",\"password\":\"$2y$10$hfi2fYYtRfYvhrmW0od3UuVXxuJ93lonInsX5qVChauQgaQLYOiSi\",\"encpass\":\"eyJpdiI6IlNsT3VpSTNncXJleWJlUzZSNEVCa2c9PSIsInZhbHVlIjoiQjMxWXJ0dVB4S2czcE1XWmJKN2NmQT09IiwibWFjIjoiYzVlMDBhMjI0ZmE2NmU0MTBhMWE1ZDI0OTE3NjAxNjhjYjQ1MTU3MDg4ZTYyMzhiMWE0NDRmZDM1N2FjZDA3ZiIsInRhZyI6IiJ9\",\"code\":\"7d00c5\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-05 07:40:04\",\"created_at\":\"2022-04-05 07:40:04\",\"id\":421}', 'http://god.rostaging.com/godpanel/client', '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-05 07:40:04', '2022-04-05 07:40:04'),
(14, NULL, NULL, 'created', 'App\\Models\\Client', 422, '[]', '{\"name\":\"MediPick\",\"phone_number\":\"+12142773305\",\"company_name\":\"MediPick\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"medipick\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@medipick.com\",\"database_name\":\"medipick\",\"password\":\"$2y$10$7oK7hiswseuRIqaq5kgsaeRuiMNq88sdPqQI8eJa\\/rrpyvdSQQaO6\",\"encpass\":\"eyJpdiI6Im02WGxZNDcydUJnLzJyNUlYTGNSZHc9PSIsInZhbHVlIjoiK3JudzlZRXNYV1VFdGVLRk1FSlhoZz09IiwibWFjIjoiZjA5MjM3YjU5MTA4NWQxMmFmZWI4YzE4ZjJhOWU4YmQzNzA2ZWJhM2Q3OGNiMmI3ZjVlOTNjNjUxYjUzMzE3MSIsInRhZyI6IiJ9\",\"code\":\"1319e0\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-05 09:25:17\",\"created_at\":\"2022-04-05 09:25:17\",\"id\":422}', 'http://god.rostaging.com/godpanel/client', '172.31.21.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-05 09:25:17', '2022-04-05 09:25:17'),
(15, NULL, NULL, 'created', 'App\\Models\\Client', 423, '[]', '{\"name\":\"MediPick\",\"phone_number\":\"+12142773305\",\"company_name\":\"MediPick\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"medipick\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@medipick.com\",\"database_name\":\"medipick\",\"password\":\"$2y$10$ZSg5rmuTLua06kXBfR1gfO.TqUxnXMkL5PokwfGhcyVNSOc7KQ0Te\",\"encpass\":\"eyJpdiI6IjNYNXlUVGl4SEtnNnhzYnVwYjlLbXc9PSIsInZhbHVlIjoiUERjMHJMNllPVFM0YWNOT21MYUt6Zz09IiwibWFjIjoiZTBlYzZkOWM0NWUzZDM3OWM4NjQ1NTUyMzdiYmEzZGZkZmFjOGJmZDlmMGY2MGNiNGZmZGZhYzEyNzUwYzM0NSIsInRhZyI6IiJ9\",\"code\":\"b92261\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-05 11:01:31\",\"created_at\":\"2022-04-05 11:01:31\",\"id\":423}', 'http://god.rostaging.com/godpanel/client', '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-05 11:01:31', '2022-04-05 11:01:31'),
(16, NULL, NULL, 'created', 'App\\Models\\Client', 424, '[]', '{\"name\":\"Meltivers\",\"phone_number\":\"+14695513696\",\"company_name\":\"Meltivers\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"meltivers\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@meltivers.com\",\"database_name\":\"meltivers\",\"password\":\"$2y$10$n43xwwLNSIR\\/TI\\/LEwuKReaqMzveNxZEUIVKYFTkjqwN5ibf8MeeW\",\"encpass\":\"eyJpdiI6IldZRTQvZFI5T1lWN0tLcjJLSkIzSkE9PSIsInZhbHVlIjoiR3BDUVlxc0RsQ3NteGdVMmpBdHhnQT09IiwibWFjIjoiYzNkMDVjZGQyZGI4Nzg1NTdiZDI1YjBlNjk2NjRiYjQ2YzlkNjgzMjc0NTQyYjQ4MjI1YTEyNGEzMzI5YmJmNyIsInRhZyI6IiJ9\",\"code\":\"deca6f\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-06 07:30:19\",\"created_at\":\"2022-04-06 07:30:19\",\"id\":424}', 'http://god.rostaging.com/godpanel/client', '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-06 07:30:19', '2022-04-06 07:30:19'),
(17, NULL, NULL, 'created', 'App\\Models\\Client', 425, '[]', '{\"name\":\"ENS\\u014d Digital Agency\",\"phone_number\":\"+1 (570) 244-7952\",\"company_name\":\"ENS\\u014d Digital Agency\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"Ensodigitalagency\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/KUzc25OUIlH2IFeQDdXmRkCsEXwjFjOriMO7alie.png\",\"database_path\":\"\",\"email\":\"admin@enso.com\",\"database_name\":\"ensodigitalagency\",\"password\":\"$2y$10$j7F4h6FzIvHMiupMY0USIubJwHXQPqwwQB8tkrHaRbn5MqWVcQHna\",\"encpass\":\"eyJpdiI6IlpKR241YUUwbDVObmlVcmRmL3RnTFE9PSIsInZhbHVlIjoiS1RzTjRsdTllL3VMQUdQWDVSc0tRdz09IiwibWFjIjoiNzhiZDkzOGJiYTM4MjNlZGRhYzQ3OWQwYjBlNGJlYzUyNmYwYzU5MDEzOTdkMDkwMGVkZTVlYTMzYjgwOGQzYiIsInRhZyI6IiJ9\",\"code\":\"419dc9\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-06 07:43:04\",\"created_at\":\"2022-04-06 07:43:04\",\"id\":425}', 'http://god.rostaging.com/godpanel/client', '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', NULL, '2022-04-06 07:43:04', '2022-04-06 07:43:04'),
(18, NULL, NULL, 'created', 'App\\Models\\Client', 426, '[]', '{\"name\":\"Hiper Abasto\",\"phone_number\":\"+525531412332\",\"company_name\":\"Hiper Abasto\",\"company_address\":\"Mexico\",\"custom_domain\":null,\"sub_domain\":\"hiperabasto\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@hiperabasto.com\",\"database_name\":\"hiperabasto\",\"password\":\"$2y$10$LIHfs9a0VctwuCpA3rhCKefX.5dNEBkWy0pfCGopgidK8vmAk4NhC\",\"encpass\":\"eyJpdiI6IjBlZUYwU3kxOWxGaEdWb0JqZ1lUOXc9PSIsInZhbHVlIjoiZlNMZ1hjcE1GTjg5ZnJNaGxYbm5uUT09IiwibWFjIjoiYTE4MmU3NDQyZmUwMzllM2U2ZTBiZmZlMTBiN2M5OGFkMjI1NGFjODU1NTZlMWNkN2VlNWQ3ZmEwNmU3ZWY0ZSIsInRhZyI6IiJ9\",\"code\":\"50cb7f\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-06 09:07:12\",\"created_at\":\"2022-04-06 09:07:12\",\"id\":426}', 'http://god.rostaging.com/godpanel/client', '172.31.21.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-06 09:07:12', '2022-04-06 09:07:12'),
(19, NULL, NULL, 'created', 'App\\Models\\Client', 427, '[]', '{\"name\":\"HandyPickup\",\"phone_number\":\"+12192292932\",\"company_name\":\"HandyPickup\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"handypickup\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@handypickup.com\",\"database_name\":\"handypickup\",\"password\":\"$2y$10$na\\/LTcWstVOkYOLBGB53Lei7IeFMhD0a\\/K5n4lfpib5x2JcTDzV7G\",\"encpass\":\"eyJpdiI6ImpNc1dDQkdWZXFSWVI4c2k1cHF4TEE9PSIsInZhbHVlIjoiTXNmQkxLOUVqdjkyU3dPNHNxMmJxUT09IiwibWFjIjoiNWViZjEwYjdiZmM2OWVmNzEwZDRmNDMzMDJiMWY3OWU4YTYzNmJiNzA2ZDE3YmEwMGFhN2M1OTE0NjNlN2QyOSIsInRhZyI6IiJ9\",\"code\":\"530592\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-07 07:18:38\",\"created_at\":\"2022-04-07 07:18:38\",\"id\":427}', 'http://god.rostaging.com/godpanel/client', '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-07 07:18:38', '2022-04-07 07:18:38'),
(20, NULL, NULL, 'created', 'App\\Models\\Client', 428, '[]', '{\"name\":\"Dropitoffusa\",\"phone_number\":\"+13173549437\",\"company_name\":\"Dropitoffusa\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"dropitoffusa\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@dropitoffusa.com\",\"database_name\":\"dropitoffusa\",\"password\":\"$2y$10$KFMV3IGlGU54J5DyybBKeOLsXzIaFbexDUiwx\\/xxo0WoadfHc2q3y\",\"encpass\":\"eyJpdiI6IndneXQxV1BMcUM3citaQk05MWsvSFE9PSIsInZhbHVlIjoiZU43U25JdkFXUzA2d1R2TUJsZ0JxQT09IiwibWFjIjoiNjAzMWQ2YzhkMDI3YTNmYmExOTY1YjdiMzUxOWE3ZTFmMWYzYjgzZjg4NmFiMjg1Y2UzMGMzNjNmYWM2MDJlYiIsInRhZyI6IiJ9\",\"code\":\"9524c4\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-07 10:03:45\",\"created_at\":\"2022-04-07 10:03:45\",\"id\":428}', 'http://god.rostaging.com/godpanel/client', '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-07 10:03:45', '2022-04-07 10:03:45'),
(21, NULL, NULL, 'created', 'App\\Models\\Client', 429, '[]', '{\"name\":\"UVEN\",\"phone_number\":\"+971522220022\",\"company_name\":\"UVEN\",\"company_address\":\"UAE\",\"custom_domain\":null,\"sub_domain\":\"uven\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@uven.com\",\"database_name\":\"uven\",\"password\":\"$2y$10$Z9XB4drodkqbxk4vxMCJmOHrzJnaJaY\\/yGaV9IOR0ujjtK0sdzKiS\",\"encpass\":\"eyJpdiI6IjRSWVllRGlSRlU1OVVoMGI5cndacXc9PSIsInZhbHVlIjoiRGovQXFzZzNndzNOTHdOUk03b3gwUT09IiwibWFjIjoiOWQxODk4MmZiZjc2NDFkZTExYTNmMmM0YTI4YWIwYzdmMWY2YWY4ZDU3YzNiY2I1NTAzZGIxYzdlMTEyM2Q4MCIsInRhZyI6IiJ9\",\"code\":\"9b8db5\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-08 09:11:26\",\"created_at\":\"2022-04-08 09:11:26\",\"id\":429}', 'http://god.rostaging.com/godpanel/client', '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-08 09:11:26', '2022-04-08 09:11:26'),
(22, NULL, NULL, 'created', 'App\\Models\\Client', 430, '[]', '{\"name\":\"Amjad\",\"phone_number\":\"9633354386\",\"company_name\":\"RedGlee\",\"company_address\":\"India\",\"custom_domain\":null,\"sub_domain\":\"Redglee\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@redglee.com\",\"database_name\":\"redglee\",\"password\":\"$2y$10$9FPbgtFQqVidoqGyMECLKeGp\\/Sh4h\\/e4JK2\\/FWmuNBgDZ3q.Zvjo.\",\"encpass\":\"eyJpdiI6IjZ6dUNjcXpBK3RoaFZKM25paCtxSlE9PSIsInZhbHVlIjoibE5EcE9ia0ErSW1aNENETzRWREFVUT09IiwibWFjIjoiY2UyOWEyNDY2MGRlZmViNzg1NGU0YWUyMTE3N2U4YWZjMGVlNmVhMzE2ZDg1Njg4ODA1ZDQ5YmQ5Y2YwMGY0NiIsInRhZyI6IiJ9\",\"code\":\"9e185e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-10 09:38:51\",\"created_at\":\"2022-04-10 09:38:51\",\"id\":430}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', NULL, '2022-04-10 09:38:51', '2022-04-10 09:38:51'),
(23, NULL, NULL, 'created', 'App\\Models\\Client', 431, '[]', '{\"name\":\"Snabbhem\",\"phone_number\":\"016 34 35 00\",\"company_name\":\"Snabbhem\",\"company_address\":\"Kriebsensgatan 13 Eskilstuna 632 20\",\"custom_domain\":null,\"sub_domain\":\"snabbhemsd\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@snabbhem.com\",\"database_name\":\"snabbhemdb\",\"password\":\"$2y$10$YoyzShb5UnKMC41gpZ5.1uJ5zBl9frgf5A5d0NxyRYMoJD\\/U.GOLW\",\"encpass\":\"eyJpdiI6InlXa3hqNnJFUkNFYy8zK2NQTGpMSXc9PSIsInZhbHVlIjoicFlWdWNEQlVaNXFGdExHek4zSG42dz09IiwibWFjIjoiY2MzMGVlMjRkMGQxZTY5MDVjMTRkYmI4Yzg4OTY2N2FiYmZkYWVkOGNmMzBjOTViMTNlZTVlZGRmNTM1MDVlMiIsInRhZyI6IiJ9\",\"code\":\"bad620\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-11 09:19:31\",\"created_at\":\"2022-04-11 09:19:31\",\"id\":431}', 'http://god.rostaging.com/godpanel/client', '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', NULL, '2022-04-11 09:19:31', '2022-04-11 09:19:31'),
(24, NULL, NULL, 'updated', 'App\\Models\\Client', 431, '{\"sub_domain\":\"snabbhemsd\",\"updated_at\":\"2022-04-11 09:19:31\"}', '{\"sub_domain\":\"snabbhem\",\"updated_at\":\"2022-04-11 09:29:33\"}', 'http://god.rostaging.com/godpanel/client/431', '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', NULL, '2022-04-11 09:29:33', '2022-04-11 09:29:33'),
(25, NULL, NULL, 'created', 'App\\Models\\Client', 432, '[]', '{\"name\":\"Cartnar\",\"phone_number\":\"16146363498\",\"company_name\":\"Cartnar\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"cartnar\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/3mGkMijQjP6Ld8GtJFlhyCyjXq2W2LKTQSiOat8U.jpg\",\"database_path\":\"\",\"email\":\"admin@cartnar.com\",\"database_name\":\"cartnar\",\"password\":\"$2y$10$h3.QQKIQPNnKWZ9IHzitV.LYJClvzEyYWvkWPbxlf\\/kgELSYyFeqy\",\"encpass\":\"eyJpdiI6ImFFa2RubWYwdVhNUTRBejRFdnIyNXc9PSIsInZhbHVlIjoiNVF0TkxDNHljQzBtdkYvYkd0b1lSQT09IiwibWFjIjoiMWY1MzYwYmJkNWRmNGRiYzJmMDVkMWMzNDgwOGQxZjg3ZTE2YTIyNGY5ZGMwZTE4NjMxN2E2ZWUzZmRiZDA3OCIsInRhZyI6IiJ9\",\"code\":\"7b87ed\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-13 06:31:14\",\"created_at\":\"2022-04-13 06:31:14\",\"id\":432}', 'http://god.rostaging.com/godpanel/client', '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', NULL, '2022-04-13 06:31:14', '2022-04-13 06:31:14'),
(26, NULL, NULL, 'created', 'App\\Models\\Client', 433, '[]', '{\"name\":\"Curbler\",\"phone_number\":\"+16782341334\",\"company_name\":\"Curbler\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"curbler\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@curbler.com\",\"database_name\":\"curbler\",\"password\":\"$2y$10$Z547\\/Evx0VyLvlgNkoVX5uA8vNjIYR7oaSzDSOxjkcTFyauoPjncO\",\"encpass\":\"eyJpdiI6IjI5QVpTVFRySmh4V3hiR2JzU3ZuRXc9PSIsInZhbHVlIjoiZXpSZlNsYUJ1YTdNWlZwRVdaR2Yydz09IiwibWFjIjoiZjZlNDQxYTg0ODZkOTExZTgxYzQ4ZDU0OWY1Y2RkNzUzOWEzNGI2NzA1OWZiMmZkOTMwNDExMGNjYjc4YzJhNCIsInRhZyI6IiJ9\",\"code\":\"959ecf\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-04-14 09:28:29\",\"created_at\":\"2022-04-14 09:28:29\",\"id\":433}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-14 09:28:29', '2022-04-14 09:28:29'),
(27, NULL, NULL, 'created', 'App\\Models\\Client', 434, '[]', '{\"name\":\"PAS41\",\"phone_number\":\"13469708867\",\"company_name\":\"PAS41\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"PAS41\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/UL1soKogKAxnZewvewv98f5LetsCs7IukHL6Gcgf.png\",\"database_path\":\"\",\"email\":\"admin@PAS41.com\",\"database_name\":\"pas41\",\"password\":\"$2y$10$Z7O9A3oUrZf9PXzA5b2G7uX9XWHN\\/3UADS9pxVKQ8C944GhqOpkNa\",\"encpass\":\"eyJpdiI6Imx3S1lJN1FNU3Uydkh5b2gxTWtwM3c9PSIsInZhbHVlIjoiZ3YwdVhmY2ZDY0FWeWJ1TlB6aVRXZz09IiwibWFjIjoiYjBmN2M4ZjIwYzI4MGQ2NjNjNGQ2YmQxZWYxMGI1MDhkM2VlYzUzM2U4MTcyY2FhNTQwZWQxYTUxZmJkNDA2OSIsInRhZyI6IiJ9\",\"code\":\"4c0a17\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-14 10:18:55\",\"created_at\":\"2022-04-14 10:18:55\",\"id\":434}', 'http://god.rostaging.com/godpanel/client', '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', NULL, '2022-04-14 10:18:55', '2022-04-14 10:18:55'),
(28, NULL, NULL, 'created', 'App\\Models\\Client', 435, '[]', '{\"name\":\"Muvpod\",\"phone_number\":\"+27824500086\",\"company_name\":\"Muvpod\",\"company_address\":\"Africa\",\"custom_domain\":null,\"sub_domain\":\"muvpod\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@muvpod.com\",\"database_name\":\"muvpod\",\"password\":\"$2y$10$G.ifYjUFHwV1.YvijQxtZ.6o2w8LVh7yF2PA3GJRfLyUfQcxX5lk.\",\"encpass\":\"eyJpdiI6IjZqYWh6ZkxiaS8vZW1RTHZHRzkxVWc9PSIsInZhbHVlIjoibDM2OUVxcksvWXB4eTRiTURIZW9RQT09IiwibWFjIjoiZGVjY2Q1YTViOTA5NDZkMmM1YTZhMzVjMDg1NTMzOGE4ZTdmNmMxY2Y1YzdmOTEyYmNkZGI2NmZhMzU0YWJlMSIsInRhZyI6IiJ9\",\"code\":\"3cc883\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-14 11:47:13\",\"created_at\":\"2022-04-14 11:47:13\",\"id\":435}', 'http://god.rostaging.com/godpanel/client', '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', NULL, '2022-04-14 11:47:13', '2022-04-14 11:47:13'),
(29, NULL, NULL, 'created', 'App\\Models\\Client', 436, '[]', '{\"name\":\"Ryde\",\"phone_number\":\"415912264\",\"company_name\":\"Ryde\",\"company_address\":\"Australia\",\"custom_domain\":null,\"sub_domain\":\"ryde\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/sPrqHn8LyGzm3djvorAazGOqAUzf2J3YP9GIRZ5v.jpg\",\"database_path\":\"\",\"email\":\"admin@ryde.com\",\"database_name\":\"ryde\",\"password\":\"$2y$10$n7XjaGB1mvv.zTUPgoR9g.JgVaA8OLMw34HFzWcuDdyP4VBtj5pFi\",\"encpass\":\"eyJpdiI6ImhjL25rTVpBOEcxNVhKYWVVMHhUR3c9PSIsInZhbHVlIjoic1Q1dU1McWlvWXpZY3pvWHhLaE85QT09IiwibWFjIjoiYTMzYzhlOTY4MjYyYTJhMWUzNWYyZGQxYzcwY2RlNGNjZDY2NDc2NGI0ZjI0ZTA1M2RlZjYxZjQ4NzA1M2E1YiIsInRhZyI6IiJ9\",\"code\":\"309c33\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-14 13:44:09\",\"created_at\":\"2022-04-14 13:44:09\",\"id\":436}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', NULL, '2022-04-14 13:44:09', '2022-04-14 13:44:09'),
(30, NULL, NULL, 'created', 'App\\Models\\Client', 437, '[]', '{\"name\":\"Fresh Farmz\",\"phone_number\":\"+971509031271\",\"company_name\":\"Fresh Farmz\",\"company_address\":\"Dubai\",\"custom_domain\":null,\"sub_domain\":\"freshfarmz\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@freshfarmz.com\",\"database_name\":\"freshfarmz\",\"password\":\"$2y$10$VDVUlOa2j2WUm7sJ21QDjeulP42ZmAoz5I9SYnR71.TqhMSpMv3RS\",\"encpass\":\"eyJpdiI6ImNzcFQ1Rmt6RVkwK2RZdXNOOXFwelE9PSIsInZhbHVlIjoiM21VcXp1WWxES2I3bnVWdThubG42UT09IiwibWFjIjoiN2IzYzMwOGYyYTkyNmNmYjUyODBmNDdjMWMwNzRhMjU2MDQ1ZGJjMjQ5NjQ2YTk3MTljZGE1ZWJlOWI5M2NkMCIsInRhZyI6IiJ9\",\"code\":\"eafe42\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-15 07:34:28\",\"created_at\":\"2022-04-15 07:34:28\",\"id\":437}', 'http://god.rostaging.com/godpanel/client', '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-15 07:34:28', '2022-04-15 07:34:28'),
(31, NULL, NULL, 'created', 'App\\Models\\Client', 438, '[]', '{\"name\":\"Carona Taxi\",\"phone_number\":\"+351963091542\",\"company_name\":\"Carona Taxi\",\"company_address\":\"Portugal\",\"custom_domain\":null,\"sub_domain\":\"caronataxi\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"suport@caronataxi.com\",\"database_name\":\"caronataxi\",\"password\":\"$2y$10$qEIfga97.Et0093p8oH6JeNUpAhtqtYM3q1W\\/Qz6eA1\\/FrJMDehpW\",\"encpass\":\"eyJpdiI6IkFLUzNGT1BMelhuNlBVRjhuNUo3K0E9PSIsInZhbHVlIjoibDE2VDVpellSb1ZZMktVOU0rZWJRZz09IiwibWFjIjoiYjkwMjFjYzNjYjM2NTNkODBlZGVjMjNjZDVjNGY2ZWZjMzcwZDdhZDBjMmRkYjNlNWRiNmQxZWY3NTcyY2MyYyIsInRhZyI6IiJ9\",\"code\":\"c12d06\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-18 10:19:48\",\"created_at\":\"2022-04-18 10:19:48\",\"id\":438}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-18 10:19:48', '2022-04-18 10:19:48'),
(32, NULL, NULL, 'created', 'App\\Models\\Client', 439, '[]', '{\"name\":\"Gil\",\"phone_number\":\"+15627545626\",\"company_name\":\"PatrolNow\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"patrolnow\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@patrolnow.com\",\"database_name\":\"patrolnow\",\"password\":\"$2y$10$xEN.xyHZsWkmpE2wtsVbKuR5b7N.TQg1eEWMRaun2TGJcn4bIrow.\",\"encpass\":\"eyJpdiI6InZPTkRHNWxHc3gwMFhTYjBzU0c1V0E9PSIsInZhbHVlIjoiNkVFaEFoRC9kdFR5d2l3SFNLV1FrUT09IiwibWFjIjoiOTk2OTExYjVmMmJhY2JkMGY3M2JiYjk4NmQ0MTQ1OThjOGY5OTk2N2MxZTY5ZWZhZmJhZGZmOGM5N2FmYjNkYiIsInRhZyI6IiJ9\",\"code\":\"ad0c7d\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-19 07:25:12\",\"created_at\":\"2022-04-19 07:25:12\",\"id\":439}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', NULL, '2022-04-19 07:25:12', '2022-04-19 07:25:12'),
(33, NULL, NULL, 'created', 'App\\Models\\Client', 440, '[]', '{\"name\":\"The App Corp\",\"phone_number\":\"1234567878\",\"company_name\":\"The App Corp\",\"company_address\":\"Australia\",\"custom_domain\":null,\"sub_domain\":\"theappcorp\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@theappcorp.com\",\"database_name\":\"theappcorp\",\"password\":\"$2y$10$zbQh8jDBw6UmwjGcf9WynOcxmYlvppnKMCR\\/UCzjHenOPc6qUPLaW\",\"encpass\":\"eyJpdiI6ImhvNlJyYzB0SzlLRG12ZWV4aUc3N0E9PSIsInZhbHVlIjoiS1VQMFNDdndxVnUwSkkyYUZLRC8ydz09IiwibWFjIjoiMDBiM2NkMTQyYzQxNmZjNDc3NTRhZWJhYjQwOTRiMmVkNjE4NmUwODQ3ZTdjNWJlMzM4NzY5ZDJlZmM1MzEyYSIsInRhZyI6IiJ9\",\"code\":\"b718ef\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-19 09:24:58\",\"created_at\":\"2022-04-19 09:24:58\",\"id\":440}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-04-19 09:24:58', '2022-04-19 09:24:58'),
(34, NULL, NULL, 'created', 'App\\Models\\Client', 441, '[]', '{\"name\":\"Smile\",\"phone_number\":\"+33661949629\",\"company_name\":\"Smile\",\"company_address\":\"Europe\",\"custom_domain\":null,\"sub_domain\":\"smile\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@smile.com\",\"database_name\":\"smile\",\"password\":\"$2y$10$0kvPNGL1n\\/D3MyCKR8tmU.bJ6yZ5dI.3PGoocMcvd6l.RkeUkaaMG\",\"encpass\":\"eyJpdiI6ImcwZ2dUUll4c3NIS1JLMnJKZ3ZVNHc9PSIsInZhbHVlIjoiZnIzbkdwZkxobkpNcTZzQlM2VU4vUT09IiwibWFjIjoiYmU2NzdlMDdjM2EyZTFiMTAwODY2NjFkZjk5ZTBhOWVlZDI4Nzg5YWRhNjVhMDNlN2YzZTQxMTNhMjUzNDZjYSIsInRhZyI6IiJ9\",\"code\":\"d3a41c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-20 10:31:38\",\"created_at\":\"2022-04-20 10:31:38\",\"id\":441}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', NULL, '2022-04-20 10:31:38', '2022-04-20 10:31:38'),
(35, NULL, NULL, 'created', 'App\\Models\\Client', 442, '[]', '{\"name\":\"Marj Marketplace\",\"phone_number\":\"+966546900909\",\"company_name\":\"Marj Marketplace\",\"company_address\":\"Dubai\",\"custom_domain\":null,\"sub_domain\":\"marjmarketplace\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@marjmarketplace.com\",\"database_name\":\"marjmarketplace\",\"password\":\"$2y$10$HPCmCMPtdWjEgu1LiZQ6yOasTQM9OhG6NZeg9jG46UdPjDu2aCzUO\",\"encpass\":\"eyJpdiI6IksrOForY0x5M0hlYVJRNGJNczBpT3c9PSIsInZhbHVlIjoiRkNJcUxybFpXeGRQTCtCRzBvblFhUT09IiwibWFjIjoiZTczNzVlMTQxZjY4MjkzNjhlNWU5YzE2ZWI5Y2JkNGIxMmIyMmM3MzNhMjY1MWIxMDAxY2NmYWViMGIwYzNmOCIsInRhZyI6IiJ9\",\"code\":\"aa4c64\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-21 09:27:48\",\"created_at\":\"2022-04-21 09:27:48\",\"id\":442}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-21 09:27:48', '2022-04-21 09:27:48'),
(36, NULL, NULL, 'created', 'App\\Models\\Client', 443, '[]', '{\"name\":\"KazaKazi\",\"phone_number\":\"+254721103641\",\"company_name\":\"kazakazi\",\"company_address\":\"Kenya\",\"custom_domain\":null,\"sub_domain\":\"kazakazi\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@kazakazi.com\",\"database_name\":\"kazakazi\",\"password\":\"$2y$10$1.3D5b1pP..jOLcE4aKpCeP9otei4UnuuC6BEtsFcRH0A5ROA7CHC\",\"encpass\":\"eyJpdiI6Ik5McVViRVJTbmxGVWwrQmI1ak5JT1E9PSIsInZhbHVlIjoiTWdWQ0c2MUVlMnJ0bVErMXBtdEh3dz09IiwibWFjIjoiZGY2ZGEyYTgwMWI1ZTc3YjM4MDA0ZmMzNzgwM2Y4NThhMzYwZjFhZjAxMTVhODJhYWI0NDhkYjEzY2Q2ODE5NiIsInRhZyI6IiJ9\",\"code\":\"ec3bf6\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-04-22 10:05:55\",\"created_at\":\"2022-04-22 10:05:55\",\"id\":443}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-04-22 10:05:55', '2022-04-22 10:05:55'),
(37, NULL, NULL, 'created', 'App\\Models\\Client', 444, '[]', '{\"name\":\"EVS On The Go\",\"phone_number\":\"19202542123\",\"company_name\":\"EVS On The Go\",\"company_address\":\"USA\",\"custom_domain\":null,\"sub_domain\":\"evsonthego\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@evsonthego.com\",\"database_name\":\"evsonthego\",\"password\":\"$2y$10$8RBxzkRg2UFZPfykQP5Sru\\/DncDSSUT8m6PmEaYwPWOdLadezXgxe\",\"encpass\":\"eyJpdiI6IjlwTGZ3dUV5Rnd6K2o4dXVaclJwWVE9PSIsInZhbHVlIjoibGZnczl6OTM2SERpOHdIOWdINU9mUT09IiwibWFjIjoiZjc2ZmRlZDg3YWJkNjgyNTQ3ZWFmYTM1NWZiNDI3ZTcwMTRkMDgwNTFmOGM4NWFkOWJmOTRjYWIxZGFmYWQ5OSIsInRhZyI6IiJ9\",\"code\":\"0fa442\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-25 05:27:56\",\"created_at\":\"2022-04-25 05:27:56\",\"id\":444}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-04-25 05:27:56', '2022-04-25 05:27:56'),
(38, NULL, NULL, 'created', 'App\\Models\\Client', 445, '[]', '{\"name\":\"Arwin\",\"phone_number\":\"+447595398695\",\"company_name\":\"Arwin\",\"company_address\":\"UK\",\"custom_domain\":null,\"sub_domain\":\"arwin\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@arwin.com\",\"database_name\":\"arwin\",\"password\":\"$2y$10$fX7b16aj9sjPZlY3k6Q4YulCOzbKCUecgl7hkXmzs\\/PBorkHGc6RC\",\"encpass\":\"eyJpdiI6InVVWmxDWGVwY0h1b2RpQ2JuVzc1Zmc9PSIsInZhbHVlIjoicVdpS1RCYnZVSUs3bHgxMDh4V0w1QT09IiwibWFjIjoiNTZiZDE3MjFhNjY4MmIyNTc0ZDVhZjJkYzc2ZmIzMTFiYjE2ODU3NDYwZTU1NTA3NTlkMjJmNzYxZDE0ZjcwMyIsInRhZyI6IiJ9\",\"code\":\"6a391a\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-25 10:23:25\",\"created_at\":\"2022-04-25 10:23:25\",\"id\":445}', 'http://god.rostaging.com/godpanel/client', '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-25 10:23:25', '2022-04-25 10:23:25'),
(39, NULL, NULL, 'created', 'App\\Models\\Client', 446, '[]', '{\"name\":\"Papiruki\",\"phone_number\":\"+584122527579\",\"company_name\":\"Papiruki\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"papiruki\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@papiruki.com\",\"database_name\":\"papiruki\",\"password\":\"$2y$10$w4NYWDwxFBO8EzEPfUTanuSn2RPHPWT9U0wzJXUB4HTPz3T.tZIh.\",\"encpass\":\"eyJpdiI6ImJnV3JGelZmem9YaWozWmxac2ZRK0E9PSIsInZhbHVlIjoibWJJZWxKaEZiTTcwTk1Pa25VRjdPQT09IiwibWFjIjoiM2U0OWU1Y2U1Nzk1ZTMwNDU3ODdiMWVhMWE1ZDUyN2JkMjg1NWVjZmVmNzJkYzI5NTY2MmRmNTQ0Y2EyMTNjMCIsInRhZyI6IiJ9\",\"code\":\"58e4d2\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-25 13:07:58\",\"created_at\":\"2022-04-25 13:07:58\",\"id\":446}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-25 13:07:58', '2022-04-25 13:07:58'),
(40, NULL, NULL, 'created', 'App\\Models\\Client', 447, '[]', '{\"name\":\"Mark Soublet\",\"phone_number\":\"+18505032955\",\"company_name\":\"Mark Soublet\",\"company_address\":\"US Inbound\",\"custom_domain\":null,\"sub_domain\":\"marksoublet\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@marksoublet.com\",\"database_name\":\"marksoublet\",\"password\":\"$2y$10$yZwIeN3tT27HW2MWKUDz8eQ5DLlllOK\\/T7dfp7f8fti4kNqdwMXo2\",\"encpass\":\"eyJpdiI6Ijcra2l2ekh2ME1qeDM0enpjeFhvSmc9PSIsInZhbHVlIjoiZ2xYeWovbFhjZncwanRvZytwZ2tqZz09IiwibWFjIjoiNTA2YTFmYmM5MDc0NjdhNjU0YjE4ZmZkMGQyM2NiM2UwZThiZmMwODU4MzllN2U3ZWI4MDI4OTEwOTA1MzRkNyIsInRhZyI6IiJ9\",\"code\":\"2b77d8\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-04-25 13:36:25\",\"created_at\":\"2022-04-25 13:36:25\",\"id\":447}', 'http://god.rostaging.com/godpanel/client', '172.31.35.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-25 13:36:26', '2022-04-25 13:36:26');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(41, NULL, NULL, 'created', 'App\\Models\\Client', 448, '[]', '{\"name\":\"Amsta Food\",\"phone_number\":\"+16462452392\",\"company_name\":\"Amsta Food\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"amstafood\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@amstafood.com\",\"database_name\":\"amstafood\",\"password\":\"$2y$10$AU2SyXkxC4cgnfPRs\\/IaruWV0GVSux0OqnfmI7Zxp2lK0xWtSWcIu\",\"encpass\":\"eyJpdiI6Imk3Zm9wNFo3VktXRFVNZVRrUE1MU3c9PSIsInZhbHVlIjoiR1Jla0Z2T0I2RStWRy94cE9uaTA2dz09IiwibWFjIjoiZGQzNThhMjMyMzRmMmNiNzUyNGE0NTVmODVmYzBkZjg2N2RjYmRiMjY0OGRlMzU1MGNhNDk0ZDYzMjg5OTJiYSIsInRhZyI6IiJ9\",\"code\":\"825037\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-04-27 12:45:55\",\"created_at\":\"2022-04-27 12:45:55\",\"id\":448}', 'http://god.rostaging.com/godpanel/client', '172.31.6.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-04-27 12:45:55', '2022-04-27 12:45:55'),
(42, NULL, NULL, 'created', 'App\\Models\\Client', 449, '[]', '{\"name\":\"PeerDeliveries\",\"phone_number\":\"+27728523803\",\"company_name\":\"PeerDeliveries\",\"company_address\":\"Africa\",\"custom_domain\":null,\"sub_domain\":\"peerdeliveries\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@peerdeliveries.com\",\"database_name\":\"peerdeliveries\",\"password\":\"$2y$10$K.68b71ddpig3\\/moiJZzWeJJa6wSstmYMVEVCuCmvOwPGvZG.pkNC\",\"encpass\":\"eyJpdiI6IkJJeTdwdjNHQzhFK1o0c3N2WlpxV0E9PSIsInZhbHVlIjoickczNG1ka3hKcXBIc2thYmV5WFNqUT09IiwibWFjIjoiYTc5YjdkN2MwODU0YmFjOTViNTAzOGZkNzdlNWExNGQ5MDM1ZjMyNWY1NDdmZTAyNzgxY2ZkY2Q5NDVlNDQxYyIsInRhZyI6IiJ9\",\"code\":\"cd7768\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-02 06:49:52\",\"created_at\":\"2022-05-02 06:49:52\",\"id\":449}', 'http://god.rostaging.com/godpanel/client', '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-02 06:49:52', '2022-05-02 06:49:52'),
(43, NULL, NULL, 'created', 'App\\Models\\Client', 450, '[]', '{\"name\":\"Toor\",\"phone_number\":\"+14049144230\",\"company_name\":\"Toor\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"toor\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@toor.com\",\"database_name\":\"toor\",\"password\":\"$2y$10$2xPvMm6wa3ngi9R.Kf.3iezARMApUCBppsK1Aqkwlfor\\/oZT.0nNa\",\"encpass\":\"eyJpdiI6ImtnVTBlRFZPZG55dkNEUlpQaU1Pb2c9PSIsInZhbHVlIjoibllXTVZRV3p1MkRheEdaTUc0bUxpUT09IiwibWFjIjoiMDA4ZDVlZWYzZmEwNDExMmU1OGNlMDg5OGNkNGI0ZmFiM2M1NmM1ZDkyMDA1MzA4MDVkZDg5Yzc5YTU5M2I4NSIsInRhZyI6IiJ9\",\"code\":\"0388b6\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-02 11:15:33\",\"created_at\":\"2022-05-02 11:15:33\",\"id\":450}', 'http://god.rostaging.com/godpanel/client', '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-02 11:15:33', '2022-05-02 11:15:33'),
(44, NULL, NULL, 'created', 'App\\Models\\Client', 451, '[]', '{\"name\":\"Swan\",\"phone_number\":\"19562575331\",\"company_name\":\"Swan\",\"company_address\":\"Canada\",\"custom_domain\":null,\"sub_domain\":\"swan\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@swan.com\",\"database_name\":\"swan\",\"password\":\"$2y$10$vndIt5HqR6Vd4h9\\/cIeke.gIw8Xo62.i7kATdN.hqrwEeEZa9cOOW\",\"encpass\":\"eyJpdiI6IjZldzg1aGdyWWgyOHRRa0ptbjE2TEE9PSIsInZhbHVlIjoiQXlJNTZ4TmcreGlQTXJoYjBiLzBaZz09IiwibWFjIjoiZjQ2MzlmMTFjOTcyN2NmZjEzMTM2ZTljYWU2NDY0ODFkMDViMjI1ZTA1MTc0ZmIyYmI2YjkyMzBlNzUyODU1ZiIsInRhZyI6IiJ9\",\"code\":\"0bd9cb\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-03 09:52:42\",\"created_at\":\"2022-05-03 09:52:42\",\"id\":451}', 'http://god.rostaging.com/godpanel/client', '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-03 09:52:42', '2022-05-03 09:52:42'),
(45, NULL, NULL, 'created', 'App\\Models\\Client', 452, '[]', '{\"name\":\"ChowHub\",\"phone_number\":\"18135019821\",\"company_name\":\"ChowHub\",\"company_address\":\"United States of America\",\"custom_domain\":null,\"sub_domain\":\"chowhub\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/ZopCKoJvT2C70pxqDwEXvsMD6DEVHaHR4J2tbOB0.png\",\"database_path\":\"\",\"email\":\"admin@chowhub.com\",\"database_name\":\"chowhub\",\"password\":\"$2y$10$0HQYelQFHvAGy9c4QGrX9.zx6L9CLYHYTjlAhM\\/y6CgQIAht6Idta\",\"encpass\":\"eyJpdiI6InczNHRVaTZqV1ZOMWs0OWtWdmhUSlE9PSIsInZhbHVlIjoiK1Q3ZkVFZGZvamx3SHg1RFl0RlFxUT09IiwibWFjIjoiMjViYmRjMTdmZGM1NzdiZDFmOTcyODVhNWJkMjg3MWMyZWRlNzBjNzUzNTBkOTg0Yjg0YWI0YWQzYWM0NTE4YiIsInRhZyI6IiJ9\",\"code\":\"57bab0\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-03 10:07:15\",\"created_at\":\"2022-05-03 10:07:15\",\"id\":452}', 'http://god.rostaging.com/godpanel/client', '172.31.19.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-05-03 10:07:15', '2022-05-03 10:07:15'),
(46, NULL, NULL, 'created', 'App\\Models\\Client', 453, '[]', '{\"name\":\"SCOOTUP\",\"phone_number\":\"+919958120905\",\"company_name\":\"SCOOTUP\",\"company_address\":\"Asia\",\"custom_domain\":null,\"sub_domain\":\"scootup\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@scootup.com\",\"database_name\":\"scootup\",\"password\":\"$2y$10$9KVsXD44YLqdvT2xOZ8hwOrNT3k7tZQMQV7ETEarn9pBKqe0N5KXy\",\"encpass\":\"eyJpdiI6IjgyZ012ZFd6VDZyKzAyeHlHczVVSkE9PSIsInZhbHVlIjoiSkVmYStVMUFLN1hQU3hrZlBMUUYwQT09IiwibWFjIjoiMjUyZDg0MzI4YzNlNGZmNmE5MmFmMWI5NzE4MGY3MWQxN2I0NWE1OTFhNWE1MmMxNjhkMGFiMGEyMTFkZDZhZSIsInRhZyI6IiJ9\",\"code\":\"cf21cf\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-03 10:35:46\",\"created_at\":\"2022-05-03 10:35:46\",\"id\":453}', 'http://god.rostaging.com/godpanel/client', '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-03 10:35:46', '2022-05-03 10:35:46'),
(47, NULL, NULL, 'created', 'App\\Models\\Client', 454, '[]', '{\"name\":\"OrderFirst\",\"phone_number\":\"+237679515545\",\"company_name\":\"OrderFirst\",\"company_address\":\"Africa\",\"custom_domain\":null,\"sub_domain\":\"orderfirst\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@orderfirst.com\",\"database_name\":\"orderfirst\",\"password\":\"$2y$10$8gxJMiNHqUkzRN7J\\/OmpS.BlBQqLd2w8M98PfhkpUwuC00bBtXEKe\",\"encpass\":\"eyJpdiI6InYxeDk4WjUwOGhRQ25CY1dIRDlWb1E9PSIsInZhbHVlIjoieWdpOWJMZWpMSVhCNnMyR20rdDJHUT09IiwibWFjIjoiNDE4OTA5ZWUwNzk3M2YwZTk4YmY1NTcyZWU1YmZhZDljNzJkMDkxYjZmOTk2NzU5NzhlNDRlZTJiNzg4MjlkYyIsInRhZyI6IiJ9\",\"code\":\"d760c8\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-03 12:42:17\",\"created_at\":\"2022-05-03 12:42:17\",\"id\":454}', 'http://god.rostaging.com/godpanel/client', '172.31.11.6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-03 12:42:17', '2022-05-03 12:42:17'),
(48, NULL, NULL, 'created', 'App\\Models\\Client', 455, '[]', '{\"name\":\"Medi Cab\",\"phone_number\":\"19162021497\",\"company_name\":\"Medi Cab\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"medicab\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/MXLI6NUwnqtB6fXbsJO95w2gESp5oFxHa6zI5xKS.jpg\",\"database_path\":\"\",\"email\":\"admin@medicab.com\",\"database_name\":\"Medicab\",\"password\":\"$2y$10$7eH9mZJD8Vja5Z35fM8Fnu7UphI\\/A03C\\/80b7pl0yBGrVG68hk9EO\",\"encpass\":\"eyJpdiI6Im1ENzhXZjljMlc5Sk1YYVZVRVcraUE9PSIsInZhbHVlIjoiZWtMa1Bqb0tTRFVHc25mcVFIMUY3dz09IiwibWFjIjoiN2IxMmM0NTk1NmE2NDFkMzg4NjVlNWNmNTAzN2RhN2JkOTRkMDZjNWE0Njk4YWVhMDA2YmU5ZTlkNDMyNzAxZSIsInRhZyI6IiJ9\",\"code\":\"b1f6f1\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-04 06:46:49\",\"created_at\":\"2022-05-04 06:46:49\",\"id\":455}', 'http://god.rostaging.com/godpanel/client', '172.31.20.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', NULL, '2022-05-04 06:46:49', '2022-05-04 06:46:49'),
(49, NULL, NULL, 'created', 'App\\Models\\Client', 456, '[]', '{\"name\":\"Butler Delivery\",\"phone_number\":\"+18507168727\",\"company_name\":\"Butler Delivery\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"butlerdelivery\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@butlerdelivery.com\",\"database_name\":\"butlerdelivery\",\"password\":\"$2y$10$nx8dVp7k3gUNoERJjwpb1.kmS1OKbLhAXxTs1Pz7n8LQxrSmyTs06\",\"encpass\":\"eyJpdiI6InppcEJBWjN3NFJUQ05KdlU1bmxOc1E9PSIsInZhbHVlIjoiSlF2dHZ4Z0JnMVJERE54Zy9lWldwdz09IiwibWFjIjoiNDQyNDkxYjcyOTg0MjAyNjUzMmU3Yzg2NTA4ODAzYmM1YzhhMDg0NzRmZWFhZDRiMzFkOTg3ODljN2I4YmVkOSIsInRhZyI6IiJ9\",\"code\":\"56086e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-04 07:31:25\",\"created_at\":\"2022-05-04 07:31:25\",\"id\":456}', 'http://god.rostaging.com/godpanel/client', '172.31.47.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-04 07:31:25', '2022-05-04 07:31:25'),
(50, NULL, NULL, 'created', 'App\\Models\\Client', 457, '[]', '{\"name\":\"Gin Deliver\",\"phone_number\":\"+12403005037\",\"company_name\":\"Gin Deliver\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"gindeliver\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@gindeliver.com\",\"database_name\":\"gindeliver\",\"password\":\"$2y$10$cuv79MbaF0FPKEd7moeJLenjadOQXwQl9jcGfMcVYrB2xDtR3lsbW\",\"encpass\":\"eyJpdiI6IkJuUVZrVGFScHNGMnlyaWM5Q2pwR1E9PSIsInZhbHVlIjoiTlBpc1RUc1c3UnpBcTJoMWRzVzZwUT09IiwibWFjIjoiY2U5OGI0OWExYWNhNGIxOGMwOTQ5YTc3MThiMTFkM2RhM2Q5NGM4MzE1MTdlNzczYzU3YzI5ZmNlYzdkNDZjMyIsInRhZyI6IiJ9\",\"code\":\"ee3d33\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-04 11:52:39\",\"created_at\":\"2022-05-04 11:52:39\",\"id\":457}', 'http://god.rostaging.com/godpanel/client', '172.31.8.73', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-04 11:52:39', '2022-05-04 11:52:39'),
(51, NULL, NULL, 'created', 'App\\Models\\Client', 458, '[]', '{\"name\":\"SwatiRX\",\"phone_number\":\"+916387534648\",\"company_name\":\"SwatiRX\",\"company_address\":\"Asia\",\"custom_domain\":null,\"sub_domain\":\"swatirx\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@swatirx.com\",\"database_name\":\"swatirx\",\"password\":\"$2y$10$MHoOZbKXafSsp9dmM5ae7OpSknBi5CC6AYbloZza.OK42FoeUHgP2\",\"encpass\":\"eyJpdiI6IlNJK2tMZ3Axd001RVlOaGJUWlVEZVE9PSIsInZhbHVlIjoidUh1dEV4LzZ4Skh0TnByNjhFMytXdz09IiwibWFjIjoiNGJhMDMxNzhlOGY0NThjNzIxMzdhMDFlZGNjZmY2ZTNlNzBhNTQxNzJjYTUzOTIyMGYzNDI4MjM3YWQ1NDYxNCIsInRhZyI6IiJ9\",\"code\":\"c7129e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-05 09:05:30\",\"created_at\":\"2022-05-05 09:05:30\",\"id\":458}', 'http://god.rostaging.com/godpanel/client', '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-05 09:05:30', '2022-05-05 09:05:30'),
(52, NULL, NULL, 'created', 'App\\Models\\Client', 459, '[]', '{\"name\":\"Fazei Team\",\"phone_number\":\"+966504628904\",\"company_name\":\"Fazei Team\",\"company_address\":\"Dubai\",\"custom_domain\":null,\"sub_domain\":\"fazeiteam\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@fazeiteam.com\",\"database_name\":\"fazeiteam\",\"password\":\"$2y$10$.9RHHwqkGkjdk\\/apKn484uYq.rmwGTvE6GM\\/ktaQ5dKK3nbbGK6V2\",\"encpass\":\"eyJpdiI6IjFBaVk1NS9ieXhaUUIzNXlBOUFxRkE9PSIsInZhbHVlIjoicEhsUWtiTjdudWtTd2xlb1VvTTN0QT09IiwibWFjIjoiZjgyNzFjNWZjNzk5MTE2ZTU3YzliZTEwYmNhMTliNzY0YjIwNzQ3ZjlkZGZhMjBlMmRjZmQzNDFkYWFmYTA4NCIsInRhZyI6IiJ9\",\"code\":\"0eca90\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-05 13:29:07\",\"created_at\":\"2022-05-05 13:29:07\",\"id\":459}', 'http://god.rostaging.com/godpanel/client', '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-05 13:29:07', '2022-05-05 13:29:07'),
(53, NULL, NULL, 'created', 'App\\Models\\Client', 460, '[]', '{\"name\":\"Ali\",\"phone_number\":\"14124987806\",\"company_name\":\"Ali\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"ali\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@ali.com\",\"database_name\":\"ali\",\"password\":\"$2y$10$s9xkGnUdzNtwyNktyp4B0utkFiCagiggS6o6jYP8N805ElkVf\\/2oC\",\"encpass\":\"eyJpdiI6Ik5EcVRUV2wrTWQrQnhPYlBDQW5ZNFE9PSIsInZhbHVlIjoicmpwWFhETm13L3V3VmYyWlh6bGtsUT09IiwibWFjIjoiZThmN2M4YmUzMDFkM2FlN2FlY2M2Nzk0YzlkOWUwMWZkNjA0YzQwYjUzOWE2ZjczMTg2NTY5ODI2YTU5MTZiNiIsInRhZyI6IiJ9\",\"code\":\"3df0b6\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-06 09:56:36\",\"created_at\":\"2022-05-06 09:56:36\",\"id\":460}', 'http://god.rostaging.com/godpanel/client', '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-06 09:56:36', '2022-05-06 09:56:36'),
(54, NULL, NULL, 'created', 'App\\Models\\Client', 461, '[]', '{\"name\":\"Ding Dong Eat\",\"phone_number\":\"+16692219875\",\"company_name\":\"Ding Dong Eat\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"dingdongeat\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@dingdongeat.com\",\"database_name\":\"dingdongeat\",\"password\":\"$2y$10$R5awjoUcOj.Nao0Deffhz.4WOUeL8.bEfKV4SgNhx7t3ijOh\\/IOru\",\"encpass\":\"eyJpdiI6InEycmhsWjZWdDllaXNQTFZFK25ybWc9PSIsInZhbHVlIjoidEoxR2tDRDgrbnFhQm5JSFAxRE4rQT09IiwibWFjIjoiNTM3OWNkZGJiMTg5NTA4NzY4MmZhYzE2OTQ1OWM2ZjU3MjUyZGE1M2Y4ZjNmNTMwOGMwZjRlYjI3YTM5YTUyMiIsInRhZyI6IiJ9\",\"code\":\"2f2b60\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-09 10:10:41\",\"created_at\":\"2022-05-09 10:10:41\",\"id\":461}', 'http://god.rostaging.com/godpanel/client', '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-09 10:10:41', '2022-05-09 10:10:41'),
(55, NULL, NULL, 'created', 'App\\Models\\Client', 462, '[]', '{\"name\":\"Valley\",\"phone_number\":\"+1 (209) 769-5897\",\"company_name\":\"Valley\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"valley\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/Dtx34rOLWiomMdUparynbMJCPrf1tovG5zBiJ19b.png\",\"database_path\":\"\",\"email\":\"admin@valley.com\",\"database_name\":\"Valley\",\"password\":\"$2y$10$xKpdmuM4\\/LI2G0FPqYPifO3Ksw0RG70gVvtIEMn4oL1\\/ZG0ht6zWS\",\"encpass\":\"eyJpdiI6IkdWQU9iSm5rV2Qzckhmd2E4UWdMWkE9PSIsInZhbHVlIjoieEUzVk5RU0dPb2VUa3pEOE43MkFZUT09IiwibWFjIjoiN2VmMTQyNWZlN2JhNDFiMmJhMjY0MmUzNmVhY2JhZGMwZGFkYmEzZTJmZTFlMzQ2NzgwOTFmZTJjMWQ0MGNlYSIsInRhZyI6IiJ9\",\"code\":\"b1add5\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-09 11:45:04\",\"created_at\":\"2022-05-09 11:45:04\",\"id\":462}', 'http://god.rostaging.com/godpanel/client', '172.31.1.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', NULL, '2022-05-09 11:45:04', '2022-05-09 11:45:04'),
(56, NULL, NULL, 'created', 'App\\Models\\Client', 463, '[]', '{\"name\":\"Wetogether\",\"phone_number\":\"+12023788752\",\"company_name\":\"Wetogether\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"wetogether\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/iuFfZnuvxQx48lU9omAM9328xSNkdiaRYrCT08jG.png\",\"database_path\":\"\",\"email\":\"admin@Wetogether.com\",\"database_name\":\"wetogether\",\"password\":\"$2y$10$Ee\\/Zvx52LfJ0hz.m9VKf4.eFhM6leC7RFyXv5ofOovQKyu3LbGVd6\",\"encpass\":\"eyJpdiI6Ikh5RE5WT2dMWUpwTk9maWQxUWthOFE9PSIsInZhbHVlIjoibTUxbmlXM1Q5eEk0ZjV6Zy9oSnVOQT09IiwibWFjIjoiMzAwYmE4YzM1YmVlMDFmYzdmNWU4NmY3ZGI4M2M5MzdmYzQ4NDEyZGJlOTRiMGMyMTgzZjVmMmU3OTk0MjI3NCIsInRhZyI6IiJ9\",\"code\":\"686b6c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-05-10 02:05:15\",\"created_at\":\"2022-05-10 02:05:15\",\"id\":463}', 'http://god.rostaging.com/godpanel/client', '172.31.46.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', NULL, '2022-05-10 02:05:16', '2022-05-10 02:05:16'),
(57, NULL, NULL, 'created', 'App\\Models\\Client', 464, '[]', '{\"name\":\"Jiffex\",\"phone_number\":\"9620049350\",\"company_name\":\"Jiffex\",\"company_address\":\"ASIA\",\"custom_domain\":null,\"sub_domain\":\"jiffex\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@jiffex.com\",\"database_name\":\"Jiffex\",\"password\":\"$2y$10$JKeRf5gEYBZC6UyRIgKgQuGRCAbjwSGoaxzINvu6ifJhBjdfhEdei\",\"encpass\":\"eyJpdiI6IjBWTFl5UjN2d1JDUExFdk83L2M1L2c9PSIsInZhbHVlIjoialA2QzFrWnczdFJpOUlZeUN2a2RHQT09IiwibWFjIjoiNTE1MWRkNDIyYTIzZWQ4MDljOTk1NWRmMWNjODYzYjJlZjVkZWViMTMwZDhhODdlM2RmNjQwZDZjN2ZjZjFjMyIsInRhZyI6IiJ9\",\"code\":\"67dcfd\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-10 07:10:39\",\"created_at\":\"2022-05-10 07:10:39\",\"id\":464}', 'http://god.rostaging.com/godpanel/client', '172.31.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', NULL, '2022-05-10 07:10:39', '2022-05-10 07:10:39'),
(58, NULL, NULL, 'created', 'App\\Models\\Client', 465, '[]', '{\"name\":\"Efectibo\",\"phone_number\":\"+584122527579\",\"company_name\":\"Efectibo\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"efectibo\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@efectibo.com\",\"database_name\":\"efectibo\",\"password\":\"$2y$10$sV.4ENJVqZRch6GSfoCAxuF.ZOma4E7fXX.3gLSeQGrEAqRjIhXTe\",\"encpass\":\"eyJpdiI6IlBaMnJ0Z01UZVZZUnBqQnRMWU9udlE9PSIsInZhbHVlIjoia1RScTd2bit1ZEFnTXh0YkhNVHFMQT09IiwibWFjIjoiYTU0MWU5MGQ0ODVkMjM5OTM5NGZlMzM1NTUwNmMwNjUzMjY5MDVjYmRmNTBiOGYxZWRlZTEwZWIwMTBmMzU3YyIsInRhZyI6IiJ9\",\"code\":\"fee23f\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-10 09:36:54\",\"created_at\":\"2022-05-10 09:36:54\",\"id\":465}', 'http://god.rostaging.com/godpanel/client', '172.31.1.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-10 09:36:54', '2022-05-10 09:36:54'),
(59, NULL, NULL, 'created', 'App\\Models\\Client', 466, '[]', '{\"name\":\"Click Service\",\"phone_number\":\"+33618412660\",\"company_name\":\"Click Service\",\"company_address\":\"EU\",\"custom_domain\":null,\"sub_domain\":\"clickservice\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@clickservice.com\",\"database_name\":\"clickservice\",\"password\":\"$2y$10$Pf1g9DCYhihN2czENVgJpuGVzvAfKYO428o1CXMKYvdkAOcrvCF\\/q\",\"encpass\":\"eyJpdiI6ImNTcmZSMXJ4bWVLYitxSWZMTVBXclE9PSIsInZhbHVlIjoiYVRxT3VCbjFjcEp4aWRiYXhyNHFudz09IiwibWFjIjoiN2JmY2RlMWNjZmZlNTE4ZjM5OWNiYzkxNDY4YWNhY2FkOTc3OWI2ZDg3NDliMGJlYTJhYTZkMjQyY2E0MjczNCIsInRhZyI6IiJ9\",\"code\":\"218179\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-10 11:56:13\",\"created_at\":\"2022-05-10 11:56:13\",\"id\":466}', 'http://god.rostaging.com/godpanel/client', '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-10 11:56:13', '2022-05-10 11:56:13'),
(60, NULL, NULL, 'created', 'App\\Models\\Client', 467, '[]', '{\"name\":\"Good\",\"phone_number\":\"9898747456\",\"company_name\":\"Good\",\"company_address\":\"India\",\"custom_domain\":null,\"sub_domain\":\"good\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"good@gmail.com\",\"database_name\":\"good\",\"password\":\"$2y$10$\\/K\\/B7QR7P6XPHudt.tQ\\/e.mNcFgr7QlY4FR1PD1FpERwl\\/O.mryUW\",\"encpass\":\"eyJpdiI6IlgxNytRSEdRSlV6anZKeFZzQlc2aGc9PSIsInZhbHVlIjoiWVRzRXJvSEhHbTM5MDNMTzJjOE41Zz09IiwibWFjIjoiYTk5ZGZmM2VlYThhYTYzYTgxMWZmYWRkOWIzYTFlM2ViYzRkNTk0MDcwMTk1YWQxYmJkODg2MjU1MTI5N2MyYSIsInRhZyI6IiJ9\",\"code\":\"9fcd8b\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-10 12:15:43\",\"created_at\":\"2022-05-10 12:15:43\",\"id\":467}', 'http://god.rostaging.com/godpanel/client', '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-10 12:15:43', '2022-05-10 12:15:43'),
(61, NULL, NULL, 'created', 'App\\Models\\Client', 468, '[]', '{\"name\":\"Click Service\",\"phone_number\":\"+33618412660\",\"company_name\":\"Click Service\",\"company_address\":\"EU\",\"custom_domain\":null,\"sub_domain\":\"clickservice\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@clickservice.com\",\"database_name\":\"clickservice\",\"password\":\"$2y$10$XDFwwu02uAxnlFARPWbv0O7ObKtAQkWvTyKfvASSM09e.pIe7JzA.\",\"encpass\":\"eyJpdiI6IldwVFQza2lTdi8rNXVGZ2YzeUlxYnc9PSIsInZhbHVlIjoibWswcWkrVWc1SDRJekRvZVd2ZlAxZz09IiwibWFjIjoiZGRmZWU0YWRhYmY1MmRkMWFiNWZiMDY5ZGI4NzlhZTc4NGEwMjZmOWZjYWY5ZDM1NDVmMmM2OGZmOTFhMGYxMSIsInRhZyI6IiJ9\",\"code\":\"cb17f2\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-10 13:42:17\",\"created_at\":\"2022-05-10 13:42:17\",\"id\":468}', 'http://god.rostaging.com/godpanel/client', '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-10 13:42:17', '2022-05-10 13:42:17'),
(65, NULL, NULL, 'created', 'App\\Models\\Client', 472, '[]', '{\"name\":\"My farma\",\"phone_number\":\"+13522392401\",\"company_name\":\"My farma\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"myfarma\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@myfarma.com\",\"database_name\":\"myfarma\",\"password\":\"$2y$10$Zo.nE5JvoOZ.UciY8MHZv.J8tMYhpW9VE09RcWACpujiML\\/ElvG2.\",\"encpass\":\"eyJpdiI6IkY0Vnlyc1lkQ01WNzV2Z09XTUl5cUE9PSIsInZhbHVlIjoiZnFWQUdiZllBeTRNTldySHMvaU5jZz09IiwibWFjIjoiYzQ0NDBlYWI3NDgzYmNkOTg2YjZmM2VjY2IyOWRiN2FhMzVkZjNhNzRmNmU1MDRkMjQ3ZmVkNjA0ZjliZGI5YSIsInRhZyI6IiJ9\",\"code\":\"612a45\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-12 10:23:42\",\"created_at\":\"2022-05-12 10:23:42\",\"id\":472}', 'http://god.rostaging.com/godpanel/client', '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-12 10:23:42', '2022-05-12 10:23:42'),
(66, NULL, NULL, 'created', 'App\\Models\\Client', 473, '[]', '{\"name\":\"Kart&Karry\",\"phone_number\":\"+16127189169\",\"company_name\":\"Kart & Karry\",\"company_address\":\"Canada\",\"custom_domain\":null,\"sub_domain\":\"kart&karry\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/Jvt2zyW4F7NF7CxhEQTWzJ0zYiTMFwpfCrOhpa6a.png\",\"database_path\":\"\",\"email\":\"admin@kartandkarry.com\",\"database_name\":\"kart&karry\",\"password\":\"$2y$10$6QVn20Ss0MXepeUTw6I\\/bu3jLEnd7qhSlyPVu7DwafE9k2\\/0WvnNu\",\"encpass\":\"eyJpdiI6InlwMUdibjBYYWpSN3NDME9UdHZNY3c9PSIsInZhbHVlIjoiMTUyTk44RVJ2ZFpPaStvbzZWamJTdz09IiwibWFjIjoiMDA1MWRiZjM5MjlmNGZjYTY0YjMyZjRmYzlhZWY5NmQ4MTA4YTQ2NGI3MjNjZWMxNjliNTRjZTExOWI0ODlhMCIsInRhZyI6IiJ9\",\"code\":\"e6952b\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-13 06:21:58\",\"created_at\":\"2022-05-13 06:21:58\",\"id\":473}', 'http://god.rostaging.com/godpanel/client', '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', NULL, '2022-05-13 06:21:58', '2022-05-13 06:21:58'),
(67, NULL, NULL, 'created', 'App\\Models\\Client', 474, '[]', '{\"name\":\"Kart and Karry\",\"phone_number\":\"+16127189169\",\"company_name\":\"Canada\",\"company_address\":\"Kart and Karry\",\"custom_domain\":null,\"sub_domain\":\"kartandkarry\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/VJ3Xln8LUJJE53LJToJWcSjP6KiEqdD882MKHtOb.png\",\"database_path\":\"\",\"email\":\"admin@kartandkarry.com\",\"database_name\":\"kartandkarry\",\"password\":\"$2y$10$YsCRa2ijO\\/h6UauuyoVCwO1\\/Af9UFNvSLR9exUaUEfvt2x7j0V0Qe\",\"encpass\":\"eyJpdiI6ImwvTE15RUZpOXN3RnBMWTM4SU5BZVE9PSIsInZhbHVlIjoiQXl3ODZ1Ymt2aEt0R291Sjg0cjdNQT09IiwibWFjIjoiOTY2ZGNkNTVhN2FkNDA2ODg0OTgwMDIwN2UwNTM2MjI4NTljNWNhZTc2MjMzYTYxNjIwMmUwY2JiNGFmYmNlOCIsInRhZyI6IiJ9\",\"code\":\"4eaab9\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-13 06:32:42\",\"created_at\":\"2022-05-13 06:32:42\",\"id\":474}', 'http://god.rostaging.com/godpanel/client', '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', NULL, '2022-05-13 06:32:42', '2022-05-13 06:32:42'),
(68, NULL, NULL, 'created', 'App\\Models\\Client', 475, '[]', '{\"name\":\"Amazing Taxi\",\"phone_number\":\"+12096235858\",\"company_name\":\"Amazing Taxi\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"amazingtaxi\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@amazingtaxi.com\",\"database_name\":\"amazingtaxi\",\"password\":\"$2y$10$i4ssVgOei0lXXG9n9rl84Oi9Yt57Mctc6l1cLiRCXmmJ5RtUesecu\",\"encpass\":\"eyJpdiI6IkE2blZZY1FOeFlTM3pWSnhTampzRlE9PSIsInZhbHVlIjoid1Nwc3NPWk8xMmZTQ0FmVmdPQXIvdz09IiwibWFjIjoiNWRiMTU4NWUwMDYzNWVjZDU3ZTJhM2Y5YTU3NmRjODEwYzBhYTc5Y2VhMWZlNmQ2MmE0ZTU5NWZjMTRmYTdkNiIsInRhZyI6IiJ9\",\"code\":\"32e266\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-13 09:20:57\",\"created_at\":\"2022-05-13 09:20:57\",\"id\":475}', 'http://god.rostaging.com/godpanel/client', '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-13 09:20:57', '2022-05-13 09:20:57'),
(69, NULL, NULL, 'created', 'App\\Models\\Client', 476, '[]', '{\"name\":\"JazzyBug\",\"phone_number\":\"+14047978489\",\"company_name\":\"JazzyBug\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"jazzybug\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@jazzybug.com\",\"database_name\":\"jazzybug\",\"password\":\"$2y$10$g4..Z0wFcnRMdNeV3y3CAOkRRf2wnzVrHjy8V6niH2XOIi84DFxSK\",\"encpass\":\"eyJpdiI6IlhQRTNuMkNuMklFSzdVMDlFRkRWS1E9PSIsInZhbHVlIjoiWU95d2xMalBKNTFJNGJvVDRmRUJHdz09IiwibWFjIjoiYzhjYWI4YjkxZGNkZTFiYTMzMzZkN2NlZDkyMDA4MmMzNTgxOWFkMmY5NDAwMjk2Y2ExZThjNDEwMmE3MTRiNiIsInRhZyI6IiJ9\",\"code\":\"3441ec\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-13 12:56:54\",\"created_at\":\"2022-05-13 12:56:54\",\"id\":476}', 'http://god.rostaging.com/godpanel/client', '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-13 12:56:54', '2022-05-13 12:56:54'),
(70, NULL, NULL, 'created', 'App\\Models\\Client', 477, '[]', '{\"name\":\"KeyStone Delivery\",\"phone_number\":\"+13522392401\",\"company_name\":\"KeyStone Delivery\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"keystonedelivery\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@keystonedelivery.com\",\"database_name\":\"keystonedelivery\",\"password\":\"$2y$10$3xFBkWH7UV3VYkEsW.YjR.EZgFb9o\\/A5behh\\/G9sXBXkQ1hORsp5q\",\"encpass\":\"eyJpdiI6IjFQQ3UxaVpyaWtuSmxhK0dZY0U4L2c9PSIsInZhbHVlIjoia2pKVnRKWGF0UUdRakR6Wm9NaGt2UT09IiwibWFjIjoiZjUxN2NkNmE5YmRlYjNjM2NmNzQ3MWI1ZWM2NWNkNzFjYTQwN2YyNzY2MjQ0ODRjOTA1ZjIxMzllMmE1YWFhNSIsInRhZyI6IiJ9\",\"code\":\"87ad74\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-16 09:48:40\",\"created_at\":\"2022-05-16 09:48:40\",\"id\":477}', 'http://god.rostaging.com/godpanel/client', '172.31.6.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-16 09:48:40', '2022-05-16 09:48:40'),
(71, NULL, NULL, 'created', 'App\\Models\\Client', 478, '[]', '{\"name\":\"BLue BUndles Delivery\",\"phone_number\":\"+19046131828\",\"company_name\":\"BLue BUndles Delivery\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"bluebundles\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@bluebundles.com\",\"database_name\":\"bluebundles\",\"password\":\"$2y$10$BoSskl.K1dUdP4QlfFI8FO5w4GDVcy9\\/9KTtuk.x.fc8g5bOr7WXG\",\"encpass\":\"eyJpdiI6ImJEcHZmV2lEcXU0dTdmSExoaDRab3c9PSIsInZhbHVlIjoiR1ErMzVrSVZDRTJuOVhtYkFWbTZTZz09IiwibWFjIjoiZTYyNDY3ZGYwYmJmMzY1ZDQ4NjQyNzAwMTc2Zjk4YWI1NThhYzZkNWVhZDdlNTQ5YTU1OGFlM2NlMzkxYWI5OSIsInRhZyI6IiJ9\",\"code\":\"b245dd\",\"country_id\":null,\"timezone\":null,\"business_type\":\"super_app\",\"status\":1,\"updated_at\":\"2022-05-18 01:40:20\",\"created_at\":\"2022-05-18 01:40:20\",\"id\":478}', 'http://god.rostaging.com/godpanel/client', '172.31.13.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.47', NULL, '2022-05-18 01:40:20', '2022-05-18 01:40:20'),
(72, NULL, NULL, 'created', 'App\\Models\\Client', 479, '[]', '{\"name\":\"Atasktt\",\"phone_number\":\"+18684607164\",\"company_name\":\"Atasktt\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"atasktt\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@atasktt.com\",\"database_name\":\"atasktt\",\"password\":\"$2y$10$zAOsEieLaAuFPGUVMAbxAOwy24zaa.dJWmW5YGJMT7zMHSZFzA0mG\",\"encpass\":\"eyJpdiI6Ik5XNWkxOWUwYU4yNXYxdTZ2bmdFcWc9PSIsInZhbHVlIjoibmZ2YUNzMmF1dkhUMVBucGNWanBVUT09IiwibWFjIjoiZGRlNzcyNjA5ZWQ0NDg3MmVhZjlhZGFlMTA0NWE2MjE3MTk2MGRmNjg1OGUxMGY3MzAxZmQ3Y2FkOGE4ZjRmMiIsInRhZyI6IiJ9\",\"code\":\"9bbd4e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-05-23 07:29:43\",\"created_at\":\"2022-05-23 07:29:43\",\"id\":479}', 'http://god.rostaging.com/godpanel/client', '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-23 07:29:43', '2022-05-23 07:29:43'),
(73, NULL, NULL, 'created', 'App\\Models\\Client', 480, '[]', '{\"name\":\"Quick Lube\",\"phone_number\":\"+12052381443\",\"company_name\":\"Quick Lube\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"quicklube\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@quicklube.com\",\"database_name\":\"quicklube\",\"password\":\"$2y$10$8b04Z1IfELIPhpD9grhIbevZ\\/kRCyQUK70KYioV1Dt8kGl4odGTXW\",\"encpass\":\"eyJpdiI6ImRrZkJMRktFUzFtUGZ2ZlArNTRWSnc9PSIsInZhbHVlIjoiUXFEUEZqc0R0OUd6ZHk2cXk5d1pOdz09IiwibWFjIjoiNmNkYjM1Y2YzYzAzZWY4NzUxMWQ5MmMxMjFiZTI3ZGVkM2I4MzViMTQxZTEwNWJmZDVkZDJiNzM3ZWVkMmNhZiIsInRhZyI6IiJ9\",\"code\":\"4ab432\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-05-23 10:24:58\",\"created_at\":\"2022-05-23 10:24:58\",\"id\":480}', 'http://god.rostaging.com/godpanel/client', '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-23 10:24:58', '2022-05-23 10:24:58'),
(74, NULL, NULL, 'created', 'App\\Models\\Client', 481, '[]', '{\"name\":\"BusTaMove\",\"phone_number\":\"9202137437\",\"company_name\":\"BusTaMove\",\"company_address\":\"United states\",\"custom_domain\":null,\"sub_domain\":\"bustamove\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/aYWM5rXVrqKEFJ19Gezy9yslwEzO9ZCVXGk5kYqF.png\",\"database_path\":\"\",\"email\":\"admin@bustamove.com\",\"database_name\":\"bustamove\",\"password\":\"$2y$10$EnWBl01loQ9Zqy5.ZcO\\/x.lItCykckWM9EzdNyTUP3tSyYGn\\/1wbq\",\"encpass\":\"eyJpdiI6IlBWeThzVGRtcEZaRUQvVEZ1VUp5bUE9PSIsInZhbHVlIjoiU2FBWi9MbFVxT2E2cWJ6c3VOUzF0UT09IiwibWFjIjoiMWQwYTg0ZTBiZGRiZTRmNDIzNzBmYzYwMWZjNjFiMDYwZGU1MDAxMjUwYzFkYmViZTE5YjRjNDI1MzFjMWFlZCIsInRhZyI6IiJ9\",\"code\":\"9d065e\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-05-24 07:32:21\",\"created_at\":\"2022-05-24 07:32:21\",\"id\":481}', 'http://god.rostaging.com/godpanel/client', '172.31.17.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-05-24 07:32:21', '2022-05-24 07:32:21'),
(75, NULL, NULL, 'created', 'App\\Models\\Client', 482, '[]', '{\"name\":\"Sor Delivery\",\"phone_number\":\"+12147942880\",\"company_name\":\"Sor Delivery\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"sordelivery\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@sordelivery.com\",\"database_name\":\"sordelivery\",\"password\":\"$2y$10$EXBA5BE7HJwsk7amrjHwCem.dtGLWN9bbLPyEpb4PMKKmezD3Tfym\",\"encpass\":\"eyJpdiI6IkFCWkZHVzFvd0EyQlI3c0RrQzlIRGc9PSIsInZhbHVlIjoicmNiRFYvdkdvZHVZd2JqWDBLS1ZkQT09IiwibWFjIjoiMDZlYTU2YmUxMGE1ZWNmNmRiODdkODM4YjhiM2QzZjk3YjgzZmY2NTRiMmU2OWUwMTBhNjQyY2U5NWE2ZjA4MSIsInRhZyI6IiJ9\",\"code\":\"732007\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-26 07:46:04\",\"created_at\":\"2022-05-26 07:46:04\",\"id\":482}', 'http://god.rostaging.com/godpanel/client', '172.31.6.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-26 07:46:04', '2022-05-26 07:46:04'),
(76, NULL, NULL, 'created', 'App\\Models\\Client', 483, '[]', '{\"name\":\"Lunchbox Specials\",\"phone_number\":\"+15055031583\",\"company_name\":\"Lunchbox Specials\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"lunchboxspecials\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@lunchboxspecials.com\",\"database_name\":\"lunchboxspecials\",\"password\":\"$2y$10$vM7dJcS5.AL3Epx6QZoHT.Lw2IYs.gy\\/6NVf9mft4aC02ZtklOHaC\",\"encpass\":\"eyJpdiI6IkhRM1JjNDdMSGZqTWhydGFCWGNKY1E9PSIsInZhbHVlIjoiWXRaNHZCdlNDTnJETnMvVURDMlZDdz09IiwibWFjIjoiODNkMmI4NTQ3ZDI4ZDlkNWQyOTBhOGM2ZDY2ZDdkZWY1NDE0MmE0NmJlYjExZDllOTNkYzA1OTE3MmM0Y2JkNiIsInRhZyI6IiJ9\",\"code\":\"cfa64c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-27 10:19:36\",\"created_at\":\"2022-05-27 10:19:36\",\"id\":483}', 'http://god.rostaging.com/godpanel/client', '172.31.20.19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-05-27 10:19:36', '2022-05-27 10:19:36'),
(77, NULL, NULL, 'created', 'App\\Models\\Client', 484, '[]', '{\"name\":\"Grubhouse\",\"phone_number\":\"4843365473\",\"company_name\":\"Grubhouse\",\"company_address\":\"United States\",\"custom_domain\":null,\"sub_domain\":\"grubhouse\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"Clientlogo\\/RpUv7WZmObRJtR50mXfmRKq99fUE8DmciCCLrADI.png\",\"database_path\":\"\",\"email\":\"admin@grubhouse.com\",\"database_name\":\"grubhouse\",\"password\":\"$2y$10$dLz\\/g0JVIFU\\/EPoiCumy2O3mAMjfdQxJ8W0UAWBVX3PkMeWOiJ3Sa\",\"encpass\":\"eyJpdiI6IjB2dTduVk0vL3RVUG14KzBZT0VHM2c9PSIsInZhbHVlIjoiMTlxNkN5Q0k4OTZkczZ1R0NMQ25Tdz09IiwibWFjIjoiODgxMzE5YzAxZDlkNjVkMTcyMDM0M2VkOWUwZGFlODNkMWMzMGJkZmY0YjRkYWZiNmE0MjQyZDA2Zjk4OGUwNiIsInRhZyI6IiJ9\",\"code\":\"d9c5ee\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-05-30 13:13:12\",\"created_at\":\"2022-05-30 13:13:12\",\"id\":484}', 'http://god.rostaging.com/godpanel/client', '172.31.20.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', NULL, '2022-05-30 13:13:12', '2022-05-30 13:13:12'),
(78, NULL, NULL, 'created', 'App\\Models\\Client', 486, '[]', '{\"name\":\"Hitch Delivery\",\"phone_number\":\"+353892560489\",\"company_name\":\"Hitch Delivery\",\"company_address\":\"EU\",\"custom_domain\":null,\"sub_domain\":\"hitchdelivery\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@hitchdelivery.com\",\"database_name\":\"hitchdelivery\",\"password\":\"$2y$10$KIFfN.aAJ.8KjnMH10z48.Av68XY2bwE4caXRxRZfVQ0sWQjIZg3.\",\"encpass\":\"eyJpdiI6InJ0eW5kYzFlNUFMZnZrWFdmVkxoQnc9PSIsInZhbHVlIjoiY2MzREc2YUN5anpFeU1YVTFsY1FmQT09IiwibWFjIjoiOGNmMzJmY2JiNWE1YzU5MTAwOTJmMWViMzJhOWQ2NzE4MDc2MWIxOTgxZDY2YTY1MDNhMWM4YTJlMzkzZjU2ZSIsInRhZyI6IiJ9\",\"code\":\"3bc1d7\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-06-06 12:20:50\",\"created_at\":\"2022-06-06 12:20:50\",\"id\":486}', 'http://god.rostaging.com/godpanel/client', '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-06-06 12:20:50', '2022-06-06 12:20:50'),
(79, NULL, NULL, 'created', 'App\\Models\\Client', 487, '[]', '{\"name\":\"Zood Market\",\"phone_number\":\"+992907660000\",\"company_name\":\"Zood Market\",\"company_address\":\"India\",\"custom_domain\":null,\"sub_domain\":\"zoodmarket\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@zoodmarket.com\",\"database_name\":\"zoodmarket\",\"password\":\"$2y$10$CsbpbU3UhQEyfjPNm490..HVji2HgZts9PA5P04IQr6Tu1OFede4q\",\"encpass\":\"eyJpdiI6ImlkaWlwTFN3eklMNWEycmFQYmlkd1E9PSIsInZhbHVlIjoiYWFwS21LTkZPZys5R0U4Z2NoZXZ5QT09IiwibWFjIjoiMWZkNzAxY2Y0ZjQ0OGVmYmEzMTcyN2RhNjBkYmQ0ZDg0MWUzYzdkNmE2YTk4ZWYzNzE3OTAyYTA0MDU1ZGJkNiIsInRhZyI6IiJ9\",\"code\":\"b077a9\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-06-07 11:50:04\",\"created_at\":\"2022-06-07 11:50:04\",\"id\":487}', 'http://god.rostaging.com/godpanel/client', '172.31.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-06-07 11:50:04', '2022-06-07 11:50:04'),
(80, NULL, NULL, 'created', 'App\\Models\\Client', 488, '[]', '{\"name\":\"Meow\",\"phone_number\":\"+15702447952\",\"company_name\":\"Meow\",\"company_address\":\"USA\",\"custom_domain\":null,\"sub_domain\":\"meow\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@meow.com\",\"database_name\":\"meow\",\"password\":\"$2y$10$NP3g71NW7mbiZheN5U\\/c5uwiWYwJAE1qRvZTzFs6azhXnWlX2qLVy\",\"encpass\":\"eyJpdiI6IkFDZDF4elMyWVVOc1Zlb1RXOU5Hc0E9PSIsInZhbHVlIjoiV2hjY0xQbmtyZnFUOTFLVnNuNWFMQT09IiwibWFjIjoiOTFlZTZiZjljYWYwMGIzNTliZTg0NTMxYzM2OTkzMzNmZGI5MTMwNzk3MDk4OTg3NGRhMzc1YjRkOGRiMGE2OSIsInRhZyI6IiJ9\",\"code\":\"71f36c\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-06-08 11:12:41\",\"created_at\":\"2022-06-08 11:12:41\",\"id\":488}', 'http://god.rostaging.com/godpanel/client', '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-06-08 11:12:41', '2022-06-08 11:12:41'),
(81, NULL, NULL, 'created', 'App\\Models\\Client', 489, '[]', '{\"name\":\"Capital diagnostics\",\"phone_number\":\"+14104282222\",\"company_name\":\"Capital diagnostics\",\"company_address\":\"Capital diagnostics\",\"custom_domain\":null,\"sub_domain\":\"capitaldiagnostics\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@capitaldiagnostics.com\",\"database_name\":\"capitaldiagnostics\",\"password\":\"$2y$10$NxtjI0MYSB2OFxug0nyTxO\\/eFtScAP7XCPMhGaJn5nHkoUpw1gPdO\",\"encpass\":\"eyJpdiI6IllBVXV1QWxYZnVXV2IrVjdDNW9UR0E9PSIsInZhbHVlIjoiRHQ4MlJjZXlDVmZ0UVFNK2U0SXgvUT09IiwibWFjIjoiOWFlNjRlNzllNzZiOTIzNjg5ZTA3NTNjMjk2YWZkYTk3MDczY2NhZmNiMWE5YjllMDI0NTg3MTBhNzQ4ZmEyMCIsInRhZyI6IiJ9\",\"code\":\"fd6dd6\",\"country_id\":null,\"timezone\":null,\"business_type\":\"home_service\",\"status\":1,\"updated_at\":\"2022-06-09 07:15:06\",\"created_at\":\"2022-06-09 07:15:06\",\"id\":489}', 'http://god.rostaging.com/godpanel/client', '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', NULL, '2022-06-09 07:15:06', '2022-06-09 07:15:06');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(82, NULL, NULL, 'created', 'App\\Models\\Client', 490, '[]', '{\"name\":\"Ding Dong Delivers\",\"phone_number\":\"+16692219875\",\"company_name\":\"Ding Dong Delivers\",\"company_address\":\"USA\",\"custom_domain\":null,\"sub_domain\":\"dingdongdelivers\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@dingdongdelivers.com\",\"database_name\":\"dingdongdelivers\",\"password\":\"$2y$10$n9Gd3eGfkMlDO51aA3ojIeona5Fw.fUiw6SwPrpBUEEtrjEkieRj.\",\"encpass\":\"eyJpdiI6InNDY2E1MElPMkxLUUJLcXliRE9zaXc9PSIsInZhbHVlIjoicVhrZ3FZYk1Pd3R2c3lUN0FHRmFDQT09IiwibWFjIjoiYWI1MDc3YzlhNzRlNmI3NjlmMTQ5MzRjYmM2M2EzMDBlN2FlNmI5NGIwY2NlNDZmMmJhOGU1MjQ0YzAyMWM1MiIsInRhZyI6IiJ9\",\"code\":\"380c49\",\"country_id\":null,\"timezone\":null,\"business_type\":\"food_grocery_ecommerce\",\"status\":1,\"updated_at\":\"2022-06-09 11:12:59\",\"created_at\":\"2022-06-09 11:12:59\",\"id\":490}', 'http://god.rostaging.com/godpanel/client', '172.31.47.227', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-06-09 11:12:59', '2022-06-09 11:12:59'),
(83, NULL, NULL, 'created', 'App\\Models\\Client', 491, '[]', '{\"name\":\"Torunz\",\"phone_number\":\"16477681409\",\"company_name\":\"Torunz\",\"company_address\":\"Canada\",\"custom_domain\":null,\"sub_domain\":\"torunz\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@torunz.com\",\"database_name\":\"torunz\",\"password\":\"$2y$10$SgoZsZdQZmiSoFPdr2X7eeu\\/sxC1tW7jP79y2TkdedbbkOAIr.HE.\",\"encpass\":\"eyJpdiI6Im1XcXppZjNHZjlxa2JNMjJSUndVOWc9PSIsInZhbHVlIjoidDE1eDRUTmFSKy9tRmtldjNYWkNVQT09IiwibWFjIjoiNzNhZTdmNGU2MWQzYjY5YTgyODQ2MDIxZWI4MjkwOTRjNDBjZmUzM2I3OTZkMjA0Y2I1NTc1NTlkYmIwNjUwZSIsInRhZyI6IiJ9\",\"code\":\"f23b31\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-06-13 06:31:34\",\"created_at\":\"2022-06-13 06:31:34\",\"id\":491}', 'http://god.rostaging.com/godpanel/client', '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', NULL, '2022-06-13 06:31:34', '2022-06-13 06:31:34'),
(84, NULL, NULL, 'created', 'App\\Models\\Client', 492, '[]', '{\"name\":\"KURS\",\"phone_number\":\"+16086285641\",\"company_name\":\"KURS\",\"company_address\":\"US\",\"custom_domain\":null,\"sub_domain\":\"kurs\",\"database_host\":\"royoorders-2-db-staging-cluster.cvgfslznkneq.us-west-2.rds.amazonaws.com\",\"database_port\":\"3306\",\"database_username\":\"cbladmin\",\"database_password\":\"aQ2hvKYLH4LKWmrA\",\"logo\":\"default\\/default_logo.png\",\"database_path\":\"\",\"email\":\"admin@kurs.com\",\"database_name\":\"kurs\",\"password\":\"$2y$10$BfumV.rnob0HU2QLLxYgPuBXAcOXbraTtjnwTmEyPPtytv2uzxzkq\",\"encpass\":\"eyJpdiI6Im1qL2RBeWVVbWEyMjZncTZNU205bUE9PSIsInZhbHVlIjoiVUlPcWw1cklHQlhNdy90VnFabHY1dz09IiwibWFjIjoiZDBmZTdjMzM3ZGRmZWFjYWExOWZmZmE4NWZkZjc1ZTg2Mzc3ZGI0MmQzMDRkNjIyMmRiNWI4MGJlM2Y2NTJiYiIsInRhZyI6IiJ9\",\"code\":\"046761\",\"country_id\":null,\"timezone\":null,\"business_type\":\"taxi\",\"status\":1,\"updated_at\":\"2022-06-13 11:52:08\",\"created_at\":\"2022-06-13 11:52:08\",\"id\":492}', 'http://god.rostaging.com/godpanel/client', '172.31.18.180', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', NULL, '2022-06-13 11:52:08', '2022-06-13 11:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `authentication_log`
--

CREATE TABLE `authentication_log` (
  `id` bigint UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_at` timestamp NULL DEFAULT NULL,
  `logout_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authentication_log`
--

INSERT INTO `authentication_log` (`id`, `authenticatable_type`, `authenticatable_id`, `ip_address`, `user_agent`, `login_at`, `logout_at`) VALUES
(1, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:15:12', '2022-03-16 10:20:26'),
(2, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:15:12', NULL),
(3, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:18:34', NULL),
(4, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:18:34', NULL),
(5, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:20:29', NULL),
(6, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:20:29', NULL),
(7, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:56:51', NULL),
(8, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-16 10:56:51', NULL),
(9, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-17 11:49:48', NULL),
(10, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '2022-03-17 11:49:48', NULL),
(11, 'App\\Models\\Admin', 1, '172.31.40.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-21 13:23:40', NULL),
(12, 'App\\Models\\Admin', 1, '172.31.40.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-21 13:23:40', NULL),
(13, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 07:56:55', NULL),
(14, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 07:56:55', NULL),
(15, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:23:48', NULL),
(16, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:23:48', NULL),
(17, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:28:28', NULL),
(18, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:28:28', NULL),
(19, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:58:32', NULL),
(20, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', '2022-03-22 09:58:32', NULL),
(21, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.46', '2022-03-22 12:11:32', NULL),
(22, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.46', '2022-03-22 12:11:32', NULL),
(23, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-03-22 12:54:40', NULL),
(24, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-03-22 12:54:40', NULL),
(25, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-03-22 12:58:15', NULL),
(26, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-03-22 12:58:15', NULL),
(27, 'App\\Models\\Admin', 1, '172.31.32.240', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-24 10:14:58', NULL),
(28, 'App\\Models\\Admin', 1, '172.31.32.240', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-24 10:14:58', NULL),
(29, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-25 07:13:04', NULL),
(30, 'App\\Models\\Admin', 1, '172.31.6.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-25 07:13:04', NULL),
(31, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-25 07:13:46', '2022-03-25 07:29:36'),
(32, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-25 07:13:46', NULL),
(33, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 10:10:27', NULL),
(34, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 10:10:27', NULL),
(35, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', NULL, '2022-03-28 12:34:17'),
(36, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:16:03', NULL),
(37, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:16:03', NULL),
(38, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:38:00', NULL),
(39, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:38:00', '2022-03-28 12:52:19'),
(40, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:55:14', '2022-03-28 13:17:57'),
(41, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-28 12:55:14', NULL),
(42, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-29 05:54:05', NULL),
(43, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-29 05:54:05', NULL),
(44, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-30 06:22:30', '2022-03-30 06:22:48'),
(45, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '2022-03-30 06:22:30', NULL),
(46, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-30 10:20:23', NULL),
(47, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-30 10:20:23', NULL),
(48, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-31 06:47:42', NULL),
(49, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-31 06:47:42', NULL),
(50, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-31 13:24:51', NULL),
(51, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-03-31 13:24:51', NULL),
(52, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 10:12:10', NULL),
(53, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 10:12:10', NULL),
(54, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 11:10:59', NULL),
(55, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 11:10:59', NULL),
(56, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 13:35:07', NULL),
(57, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-01 13:35:07', NULL),
(58, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-03 05:06:17', NULL),
(59, 'App\\Models\\Admin', 1, '172.31.13.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-03 05:06:17', NULL),
(60, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', '2022-04-04 07:41:42', NULL),
(61, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', '2022-04-04 07:41:42', NULL),
(62, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-04 13:21:03', NULL),
(63, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-04 13:21:03', NULL),
(64, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-05 07:33:06', NULL),
(65, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-05 07:33:06', NULL),
(66, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-05 07:36:37', NULL),
(67, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-05 07:36:37', NULL),
(68, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 08:43:02', NULL),
(69, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 08:43:02', NULL),
(70, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 09:01:30', NULL),
(71, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 09:01:30', NULL),
(72, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', '2022-04-05 10:06:06', NULL),
(73, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', '2022-04-05 10:06:06', NULL),
(74, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 12:01:06', NULL),
(75, 'App\\Models\\Admin', 1, '172.31.21.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-05 12:01:06', NULL),
(76, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-06 07:19:09', NULL),
(77, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-06 07:19:09', NULL),
(78, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-06 07:34:20', NULL),
(79, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-06 07:34:20', NULL),
(80, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-07 07:09:19', NULL),
(81, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-07 07:09:20', NULL),
(82, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-08 07:31:56', NULL),
(83, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-08 07:31:56', NULL),
(84, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 07:40:59', NULL),
(85, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 07:40:59', NULL),
(86, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 07:41:21', NULL),
(87, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 07:41:21', NULL),
(88, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-08 07:42:34', NULL),
(89, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-08 07:42:34', NULL),
(90, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 08:11:18', NULL),
(91, 'App\\Models\\Admin', 1, '172.31.36.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '2022-04-08 08:11:18', NULL),
(92, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-10 09:16:09', NULL),
(93, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-10 09:16:09', NULL),
(94, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-11 07:17:12', NULL),
(95, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-11 07:17:12', NULL),
(96, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-11 07:17:18', NULL),
(97, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-11 07:17:19', NULL),
(98, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 06:00:09', NULL),
(99, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 06:00:09', NULL),
(100, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 07:49:20', NULL),
(101, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 07:49:20', NULL),
(102, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 10:06:48', NULL),
(103, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 10:06:48', NULL),
(104, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 10:34:49', NULL),
(105, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-13 10:34:49', NULL),
(106, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-14 05:57:16', NULL),
(107, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-14 05:57:16', NULL),
(108, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-14 05:58:27', NULL),
(109, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-14 05:58:27', NULL),
(110, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-14 08:55:10', NULL),
(111, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-14 08:55:10', NULL),
(112, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-14 10:15:32', NULL),
(113, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36', '2022-04-14 10:15:32', NULL),
(114, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-14 10:57:12', NULL),
(115, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-14 10:57:12', NULL),
(116, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-14 12:03:17', NULL),
(117, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36', '2022-04-14 12:03:17', NULL),
(118, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-14 13:38:10', NULL),
(119, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-14 13:38:10', NULL),
(120, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-15 07:23:08', NULL),
(121, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-15 07:23:08', NULL),
(122, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-15 07:23:09', NULL),
(123, 'App\\Models\\Admin', 1, '172.31.24.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-15 07:23:09', NULL),
(124, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 07:09:32', NULL),
(125, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 07:09:32', NULL),
(126, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 07:09:34', NULL),
(127, 'App\\Models\\Admin', 1, '172.31.9.62', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 07:09:34', NULL),
(128, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 10:05:51', NULL),
(129, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 10:05:51', NULL),
(130, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 10:05:51', NULL),
(131, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-18 10:05:51', NULL),
(132, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-19 06:17:12', NULL),
(133, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-19 06:17:12', NULL),
(134, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-19 07:12:04', NULL),
(135, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', '2022-04-19 07:12:04', NULL),
(136, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-19 09:17:53', NULL),
(137, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-19 09:17:53', NULL),
(138, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 10:26:28', NULL),
(139, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36 Edg/100.0.1185.44', '2022-04-20 10:26:28', NULL),
(140, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:47:12', NULL),
(141, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:47:12', NULL),
(142, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:47:47', NULL),
(143, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:47:47', NULL),
(144, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:48:23', NULL),
(145, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 07:48:23', '2022-04-21 07:48:33'),
(146, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-21 08:46:11', NULL),
(147, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-21 08:46:12', NULL),
(148, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 09:21:14', NULL),
(149, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-21 09:21:14', NULL),
(150, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-22 10:00:27', NULL),
(151, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-22 10:00:27', NULL),
(152, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 05:21:09', NULL),
(153, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 05:21:09', NULL),
(154, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:01:07', NULL),
(155, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:01:07', NULL),
(156, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:01:21', NULL),
(157, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:01:21', NULL),
(158, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:02:02', NULL),
(159, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:02:02', NULL),
(160, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:08:32', NULL),
(161, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:08:32', NULL),
(162, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:09:05', NULL),
(163, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:09:05', NULL),
(164, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:09:17', NULL),
(165, 'App\\Models\\Admin', 1, '172.31.21.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 10:09:17', NULL),
(166, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:10:57', NULL),
(167, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:10:57', NULL),
(168, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:24:51', NULL),
(169, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-25 10:24:51', NULL),
(170, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 13:29:44', NULL),
(171, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-25 13:29:44', NULL),
(172, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-26 07:32:11', NULL),
(173, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-26 07:32:11', NULL),
(174, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-27 08:08:41', NULL),
(175, 'App\\Models\\Admin', 1, '172.31.35.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-27 08:08:41', NULL),
(176, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36', '2022-04-27 10:27:37', NULL),
(177, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36', '2022-04-27 10:27:37', NULL),
(178, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-27 10:39:59', NULL),
(179, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-27 10:39:59', NULL),
(180, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-27 12:41:10', NULL),
(181, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-27 12:41:10', NULL),
(182, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-27 12:41:13', NULL),
(183, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-04-27 12:41:13', NULL),
(184, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-28 13:24:26', NULL),
(185, 'App\\Models\\Admin', 1, '172.31.6.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-04-28 13:24:26', NULL),
(186, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-02 06:39:22', NULL),
(187, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-02 06:39:22', NULL),
(188, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-02 06:39:22', NULL),
(189, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-02 06:39:22', NULL),
(190, 'App\\Models\\Admin', 1, '172.31.11.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 06:49:04', NULL),
(191, 'App\\Models\\Admin', 1, '172.31.11.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 06:49:04', NULL),
(192, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 07:40:08', NULL),
(193, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 07:40:08', NULL),
(194, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-03 09:38:32', NULL),
(195, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-03 09:38:32', NULL),
(196, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-03 09:38:32', NULL),
(197, 'App\\Models\\Admin', 1, '172.31.19.255', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-03 09:38:32', NULL),
(198, 'App\\Models\\Admin', 1, '172.31.11.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 09:49:15', NULL),
(199, 'App\\Models\\Admin', 1, '172.31.11.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-03 09:49:15', NULL),
(200, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-04 05:57:57', NULL),
(201, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-04 05:57:57', NULL),
(202, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-04 07:27:47', NULL),
(203, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-04 07:27:47', NULL),
(204, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-04 07:27:54', NULL),
(205, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-04 07:27:54', NULL),
(206, 'App\\Models\\Admin', 1, '172.31.8.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-04 10:34:37', NULL),
(207, 'App\\Models\\Admin', 1, '172.31.8.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-04 10:34:37', NULL),
(208, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-04 10:47:41', NULL),
(209, 'App\\Models\\Admin', 1, '172.31.47.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-04 10:47:41', NULL),
(210, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-05 09:02:14', NULL),
(211, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-05 09:02:14', NULL),
(212, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-05 09:02:30', NULL),
(213, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-05 09:02:30', NULL),
(214, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-05 09:06:47', '2022-05-05 09:06:57'),
(215, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-05 09:06:47', NULL),
(216, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 06:36:55', NULL),
(217, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 06:36:55', NULL),
(218, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 06:47:53', NULL),
(219, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 06:47:53', NULL),
(220, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-06 09:33:37', NULL),
(221, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-06 09:33:37', NULL),
(222, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-06 09:33:45', NULL),
(223, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-06 09:33:45', NULL),
(224, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 09:55:24', NULL),
(225, 'App\\Models\\Admin', 1, '172.31.47.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-06 09:55:24', NULL),
(226, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-09 10:02:04', NULL),
(227, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-09 10:02:05', NULL),
(228, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-09 10:02:09', NULL),
(229, 'App\\Models\\Admin', 1, '172.31.8.200', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-09 10:02:09', NULL),
(230, 'App\\Models\\Admin', 1, '172.31.1.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-09 11:24:10', NULL),
(231, 'App\\Models\\Admin', 1, '172.31.1.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', '2022-05-09 11:24:10', NULL),
(232, 'App\\Models\\Admin', 1, '172.31.31.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-09 12:29:16', NULL),
(233, 'App\\Models\\Admin', 1, '172.31.31.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-09 12:29:16', NULL),
(234, 'App\\Models\\Admin', 1, '172.31.46.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 01:58:55', NULL),
(235, 'App\\Models\\Admin', 1, '172.31.46.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 01:58:55', NULL),
(236, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 05:23:11', NULL),
(237, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 05:23:11', NULL),
(238, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 07:09:06', NULL),
(239, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 07:09:06', NULL),
(240, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-10 09:24:01', NULL),
(241, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-10 09:24:01', NULL),
(242, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-10 09:24:02', NULL),
(243, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-10 09:24:02', NULL),
(244, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 09:54:00', NULL),
(245, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-10 09:54:01', NULL),
(246, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-11 12:19:34', NULL),
(247, 'App\\Models\\Admin', 1, '172.31.1.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-11 12:19:34', NULL),
(248, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-12 09:30:15', NULL),
(249, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-12 09:30:15', NULL),
(250, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-12 09:30:42', NULL),
(251, 'App\\Models\\Admin', 1, '172.31.23.153', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-12 09:30:42', NULL);
INSERT INTO `authentication_log` (`id`, `authenticatable_type`, `authenticatable_id`, `ip_address`, `user_agent`, `login_at`, `logout_at`) VALUES
(252, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 05:52:37', NULL),
(253, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 05:52:37', NULL),
(254, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 06:23:12', NULL),
(255, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 06:23:12', NULL),
(256, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 06:30:01', NULL),
(257, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 06:30:01', NULL),
(258, 'App\\Models\\Admin', 1, '172.31.42.209', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', '2022-05-13 07:26:58', NULL),
(259, 'App\\Models\\Admin', 1, '172.31.42.209', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', '2022-05-13 07:26:58', NULL),
(260, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-13 07:43:11', NULL),
(261, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-13 07:43:11', NULL),
(262, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 08:45:00', NULL),
(263, 'App\\Models\\Admin', 1, '172.31.31.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36 Edg/101.0.1210.39', '2022-05-13 08:45:00', NULL),
(264, 'App\\Models\\Admin', 1, '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-13 09:16:04', NULL),
(265, 'App\\Models\\Admin', 1, '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-13 09:16:04', NULL),
(266, 'App\\Models\\Admin', 1, '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-13 09:16:05', NULL),
(267, 'App\\Models\\Admin', 1, '172.31.13.223', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-13 09:16:05', NULL),
(268, 'App\\Models\\Admin', 1, '172.31.42.209', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', '2022-05-13 11:08:45', NULL),
(269, 'App\\Models\\Admin', 1, '172.31.42.209', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', '2022-05-13 11:08:45', NULL),
(270, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-16 09:45:02', NULL),
(271, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-16 09:45:02', NULL),
(272, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-16 09:45:13', NULL),
(273, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-16 09:45:13', NULL),
(274, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 10:47:50', NULL),
(275, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 10:47:50', NULL),
(276, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 11:18:06', NULL),
(277, 'App\\Models\\Admin', 1, '172.31.6.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 11:18:06', NULL),
(278, 'App\\Models\\Admin', 1, '172.31.24.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 12:46:30', NULL),
(279, 'App\\Models\\Admin', 1, '172.31.24.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-16 12:46:31', NULL),
(280, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:36:20', NULL),
(281, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:36:20', NULL),
(282, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:44:13', NULL),
(283, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:44:13', NULL),
(284, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:46:51', NULL),
(285, 'App\\Models\\Admin', 1, '172.31.22.78', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 06:46:51', NULL),
(286, 'App\\Models\\Admin', 1, '172.31.10.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 10:25:28', NULL),
(287, 'App\\Models\\Admin', 1, '172.31.10.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-17 10:25:28', NULL),
(288, 'App\\Models\\Admin', 1, '172.31.13.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.47', '2022-05-18 01:33:44', NULL),
(289, 'App\\Models\\Admin', 1, '172.31.13.224', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.47', '2022-05-18 01:33:44', NULL),
(290, 'App\\Models\\Admin', 1, '172.31.39.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-18 12:57:56', NULL),
(291, 'App\\Models\\Admin', 1, '172.31.39.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-18 12:57:56', NULL),
(292, 'App\\Models\\Admin', 1, '172.31.39.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-19 09:07:11', NULL),
(293, 'App\\Models\\Admin', 1, '172.31.39.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-19 09:07:11', NULL),
(294, 'App\\Models\\Admin', 1, '172.31.29.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-19 09:18:19', NULL),
(295, 'App\\Models\\Admin', 1, '172.31.29.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', '2022-05-19 09:18:19', NULL),
(296, 'App\\Models\\Admin', 1, '172.31.40.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-20 06:52:14', NULL),
(297, 'App\\Models\\Admin', 1, '172.31.40.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-20 06:52:14', NULL),
(298, 'App\\Models\\Admin', 1, '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-23 07:13:37', NULL),
(299, 'App\\Models\\Admin', 1, '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-23 07:13:37', NULL),
(300, 'App\\Models\\Admin', 1, '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-23 07:13:40', NULL),
(301, 'App\\Models\\Admin', 1, '172.31.3.174', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-23 07:13:40', NULL),
(302, 'App\\Models\\Admin', 1, '172.31.17.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-24 07:23:17', NULL),
(303, 'App\\Models\\Admin', 1, '172.31.17.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-24 07:23:17', NULL),
(304, 'App\\Models\\Admin', 1, '172.31.17.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-24 07:36:22', NULL),
(305, 'App\\Models\\Admin', 1, '172.31.17.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-24 07:36:22', NULL),
(306, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-25 11:16:57', NULL),
(307, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-25 11:16:57', NULL),
(308, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-26 07:30:31', NULL),
(309, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', '2022-05-26 07:30:31', NULL),
(310, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 07:39:00', NULL),
(311, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 07:39:00', NULL),
(312, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 07:39:02', NULL),
(313, 'App\\Models\\Admin', 1, '172.31.6.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 07:39:02', NULL),
(314, 'App\\Models\\Admin', 1, '172.31.21.237', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 12:31:20', NULL),
(315, 'App\\Models\\Admin', 1, '172.31.21.237', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 12:31:20', NULL),
(316, 'App\\Models\\Admin', 1, '172.31.21.237', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 12:31:25', NULL),
(317, 'App\\Models\\Admin', 1, '172.31.21.237', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-26 12:31:25', NULL),
(318, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-27 07:36:39', NULL),
(319, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-27 07:36:39', NULL),
(320, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-27 10:15:26', NULL),
(321, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-27 10:15:26', NULL),
(322, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-27 10:15:44', NULL),
(323, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-05-27 10:15:45', NULL),
(324, 'App\\Models\\Admin', 1, '172.31.14.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-30 12:06:26', NULL),
(325, 'App\\Models\\Admin', 1, '172.31.14.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-05-30 12:06:26', NULL),
(326, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-30 12:50:18', NULL),
(327, 'App\\Models\\Admin', 1, '172.31.20.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', '2022-05-30 12:50:18', NULL),
(328, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-06-02 09:25:08', NULL),
(329, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', '2022-06-02 09:25:09', NULL),
(330, 'App\\Models\\Admin', 1, '172.31.14.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-06 06:20:39', NULL),
(331, 'App\\Models\\Admin', 1, '172.31.14.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-06 06:20:39', NULL),
(332, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-06 12:15:42', NULL),
(333, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-06 12:15:42', NULL),
(334, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-06 12:16:00', NULL),
(335, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-06 12:16:00', NULL),
(336, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-07 09:43:03', NULL),
(337, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-07 09:43:03', NULL),
(338, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-07 11:47:14', NULL),
(339, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-07 11:47:14', NULL),
(340, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-07 11:47:25', NULL),
(341, 'App\\Models\\Admin', 1, '172.31.33.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-07 11:47:25', NULL),
(342, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-07 13:03:05', NULL),
(343, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-07 13:03:05', NULL),
(344, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-08 11:09:11', NULL),
(345, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-08 11:09:11', NULL),
(346, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-08 11:09:12', NULL),
(347, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-08 11:09:12', NULL),
(348, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-08 12:07:42', NULL),
(349, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-08 12:07:42', NULL),
(350, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-08 13:39:54', NULL),
(351, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-08 13:39:54', NULL),
(352, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-09 07:05:56', NULL),
(353, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-09 07:05:56', NULL),
(354, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-09 10:28:58', NULL),
(355, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-09 10:28:58', NULL),
(356, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-09 11:07:54', NULL),
(357, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-09 11:07:54', NULL),
(358, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-09 11:08:03', NULL),
(359, 'App\\Models\\Admin', 1, '172.31.47.227', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-09 11:08:03', NULL),
(360, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-09 13:09:26', NULL),
(361, 'App\\Models\\Admin', 1, '172.31.30.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-09 13:09:26', NULL),
(362, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-10 06:33:42', NULL),
(363, 'App\\Models\\Admin', 1, '172.31.9.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-10 06:33:42', NULL),
(364, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-13 06:26:31', NULL),
(365, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-13 06:26:31', NULL),
(366, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-13 07:24:09', NULL),
(367, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', '2022-06-13 07:24:09', NULL),
(368, 'App\\Models\\Admin', 1, '172.31.18.180', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-13 11:48:41', NULL),
(369, 'App\\Models\\Admin', 1, '172.31.18.180', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-13 11:48:41', NULL),
(370, 'App\\Models\\Admin', 1, '172.31.18.180', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-13 11:49:31', NULL),
(371, 'App\\Models\\Admin', 1, '172.31.18.180', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2022-06-13 11:49:31', NULL),
(372, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-13 13:34:10', NULL),
(373, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-13 13:34:10', NULL),
(374, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-14 07:51:33', NULL),
(375, 'App\\Models\\Admin', 1, '172.31.10.143', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-14 07:51:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auto_reject_orders_cron`
--

CREATE TABLE `auto_reject_orders_cron` (
  `id` bigint UNSIGNED NOT NULL,
  `database_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_vendor_id` int DEFAULT NULL,
  `auto_reject_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auto_reject_orders_cron`
--

INSERT INTO `auto_reject_orders_cron` (`id`, `database_host`, `database_name`, `database_username`, `database_password`, `order_vendor_id`, `auto_reject_time`, `created_at`, `updated_at`) VALUES
(137, '', 'mokabfix', 'cbladmin', 'aQ2hvKYLH4LKWmrA', 93, '2022-05-04 06:50:03', '2022-05-04 06:49:03', '2022-05-04 06:49:03'),
(146, '', 'mokabfix', 'cbladmin', 'aQ2hvKYLH4LKWmrA', 106, '2022-05-05 04:53:58', '2022-05-05 04:52:58', '2022-05-05 04:52:58'),
(158, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 26, '2025-04-17 10:09:58', '2025-04-17 09:54:58', '2025-04-17 09:54:58'),
(159, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 27, '2025-04-17 10:10:28', '2025-04-17 09:55:28', '2025-04-17 09:55:28'),
(160, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 30, '2025-04-17 10:44:39', '2025-04-17 10:29:39', '2025-04-17 10:29:39'),
(161, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 34, '2025-04-17 11:40:21', '2025-04-17 11:25:21', '2025-04-17 11:25:21'),
(162, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 41, '2025-04-18 07:21:01', '2025-04-18 07:06:01', '2025-04-18 07:06:01'),
(163, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 45, '2025-04-18 07:28:44', '2025-04-18 07:13:44', '2025-04-18 07:13:44'),
(164, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 47, '2025-04-18 07:29:39', '2025-04-18 07:14:39', '2025-04-18 07:14:39'),
(165, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 48, '2025-04-18 07:49:42', '2025-04-18 07:34:42', '2025-04-18 07:34:42'),
(167, '', 'ihdaa', 'root', 'WwVncfdEWM9BccLu', 59, '2025-04-22 11:19:07', '2025-04-22 11:04:07', '2025-04-22 11:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity_on` tinyint NOT NULL DEFAULT '1' COMMENT '1 - yes, 0 - no',
  `sorting` tinyint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 - active, 0 - pending, 2 - blocked',
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `redirect_category_id` bigint UNSIGNED DEFAULT NULL,
  `redirect_vendor_id` bigint UNSIGNED DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_tokens`
--

CREATE TABLE `blocked_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired` tinyint NOT NULL DEFAULT '0' COMMENT '1 yes, 0 no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 - pending, 1 - active, 2 - blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `brand_categories`
--

CREATE TABLE `brand_categories` (
  `brand_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE `business_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_types`
--

INSERT INTO `business_types` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Taxi', 'taxi', '2021-09-29 06:22:52', '2021-09-29 06:22:52'),
(2, 'Food/Grocery/E-commerce', 'food_grocery_ecommerce', '2021-09-29 07:26:50', '2021-09-29 07:26:57'),
(3, 'Home Service', 'home_service', '2021-09-29 07:26:53', '2021-09-29 07:27:00'),
(4, 'Super App', 'super_app', '2021-09-29 07:26:55', '2021-09-29 07:27:02'),
(5, 'Laundry', 'laundry', '2021-09-29 07:26:55', '2021-09-29 07:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `unique_identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0-Active, 1-Blocked, 2-Deleted',
  `is_gift` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0-Yes, 1-No',
  `item_count` int DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_addons`
--

CREATE TABLE `cart_addons` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `cart_product_id` bigint UNSIGNED NOT NULL,
  `addon_id` bigint UNSIGNED NOT NULL,
  `option_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_coupons`
--

CREATE TABLE `cart_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0-Active, 1-Blocked, 2-Deleted',
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `is_tax_applied` tinyint NOT NULL COMMENT '0-Yes, 1-No',
  `tax_rate_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `tax_category_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_product_prescriptions`
--

CREATE TABLE `cart_product_prescriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `prescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_visible` tinyint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 - pending, 1 - active, 2 - blocked',
  `position` smallint NOT NULL DEFAULT '1' COMMENT 'for same position, display asc order',
  `is_core` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no, 1 - yes',
  `can_add_products` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no, 1 - yes',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `client_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'only products name, product with description',
  `warning_page_id` bigint DEFAULT NULL,
  `template_type_id` bigint DEFAULT NULL,
  `warning_page_design` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `show_wishlist` tinyint NOT NULL DEFAULT '1' COMMENT '1 for yes, 0 for no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `icon`, `slug`, `type_id`, `image`, `is_visible`, `status`, `position`, `is_core`, `can_add_products`, `parent_id`, `vendor_id`, `client_code`, `display_mode`, `warning_page_id`, `template_type_id`, `warning_page_design`, `created_at`, `updated_at`, `deleted_at`, `show_wishlist`) VALUES
(1, NULL, 'root', NULL, NULL, 0, 1, 1, 1, 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_histories`
--

CREATE TABLE `category_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `action` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add' COMMENT 'add, update, delete, block, active',
  `updater_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SuperAdmin' COMMENT 'SuperAdmin, Admin, Seller',
  `update_id` bigint UNSIGNED DEFAULT NULL,
  `client_code` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `category_tags`
--

CREATE TABLE `category_tags` (
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `tag` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans-slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `celebrities`
--

CREATE TABLE `celebrities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 - pending, 1 - active, 2 - inactive, 3 - deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `celebrity_brands`
--

CREATE TABLE `celebrity_brands` (
  `celebrity_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `celebrity_product`
--

CREATE TABLE `celebrity_product` (
  `celebrity_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `timezone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_domain` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_domain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_blocked` tinyint NOT NULL DEFAULT '0',
  `database_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1 for active, 0 for pending, 2 for blocked, 3 for inactive',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `database_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_port` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superadmin` tinyint NOT NULL DEFAULT '1' COMMENT '1 for yes, 0 for no',
  `business_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_type` tinyint UNSIGNED DEFAULT '1' COMMENT '1=>Live, 2=>demo',
  `single_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `socket_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_chat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_chat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_chat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone_number`, `password`, `encpass`, `country_id`, `timezone`, `custom_domain`, `sub_domain`, `is_deleted`, `is_blocked`, `database_path`, `database_name`, `database_username`, `database_password`, `logo`, `company_name`, `company_address`, `status`, `code`, `database_host`, `database_port`, `created_at`, `updated_at`, `is_superadmin`, `business_type`, `client_type`, `single_vendor`, `socket_url`, `admin_chat`, `driver_chat`, `customer_chat`) VALUES
(1208, 'ihdaa', 'admin@ihdaa.com', '07887898989', '$2y$10$K74huJyQaOA3oQ/7IOUwkuFQwQQdTtTD4BBMKQop4x0bu0R9LL8Um', 'eyJpdiI6Ik55M1ZnZHVOYmRXYzErT1VtbnJyb2c9PSIsInZhbHVlIjoib3ZveVUrMFZrKzRqQWpib2w3WS9ldz09IiwibWFjIjoiYWE3Njg3ZWZkYzU4M2YzYzYwZjkzZjZmNDA5OWVhOTM0Y2U5NTg1YjlkOTIyOTljNmMyMGYwZWE5OGI2YzM3OCIsInRhZyI6IiJ9', NULL, NULL, 'shop.ihdaa.com', 'ihdaa', 0, 0, '', 'ihdaa', 'root', 'password', 'default/default_logo.png', 'ihdaa', 'CDCL Building, 28B, Sector 28, Chandigarh, India', 1, '873fad', 'localhost', '3306', '2024-10-07 07:02:38', '2024-10-07 07:02:38', 1, 'food_grocery_ecommerce', 1, 0, NULL, '2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `client_currencies`
--

CREATE TABLE `client_currencies` (
  `client_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `is_primary` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `client_languages`
--

CREATE TABLE `client_languages` (
  `client_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `client_preferences`
--

CREATE TABLE `client_preferences` (
  `id` bigint UNSIGNED NOT NULL,
  `client_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_admin` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light' COMMENT 'Light, Dark',
  `distance_unit` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'metric' COMMENT 'metric, imperial',
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `date_format` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_format` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'H:i',
  `fb_login` tinyint NOT NULL DEFAULT '0' COMMENT '1 - enable, 0 - disable',
  `fb_client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_client_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_client_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_login` tinyint NOT NULL DEFAULT '0' COMMENT '1 - enable, 0 - disable',
  `twitter_client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_client_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_client_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_login` tinyint NOT NULL DEFAULT '0' COMMENT '1 - enable, 0 - disable',
  `google_client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_client_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_client_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_login` tinyint NOT NULL DEFAULT '0' COMMENT '1 - enable, 0 - disable',
  `apple_client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_client_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_client_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default_location_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default_latitude` decimal(15,12) NOT NULL DEFAULT '0.000000000000',
  `Default_longitude` decimal(16,12) NOT NULL DEFAULT '0.000000000000',
  `map_provider` bigint UNSIGNED DEFAULT NULL,
  `map_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_provider` bigint UNSIGNED DEFAULT NULL,
  `sms_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_email` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `verify_phone` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `web_template_id` bigint UNSIGNED DEFAULT NULL,
  `app_template_id` bigint UNSIGNED DEFAULT NULL,
  `personal_access_token_v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_access_token_v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'smtp',
  `mail_driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_host` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_port` smallint DEFAULT NULL,
  `mail_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_from` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `secondary_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000000',
  `is_hyperlocal` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `need_delivery_service` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `dispatcher_key_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dispatcher_key_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `celebrity_check` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `delivery_service_key_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_key_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reffered_by_amount` decimal(8,2) DEFAULT NULL,
  `reffered_to_amount` decimal(8,2) DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pharmacy_check` tinyint DEFAULT '0' COMMENT '0-No, 1-Yes',
  `dinein_check` tinyint DEFAULT '1' COMMENT '0-No, 1-Yes',
  `takeaway_check` tinyint DEFAULT '1' COMMENT '0-No, 1-Yes',
  `delivery_check` tinyint DEFAULT '1' COMMENT '0-No, 1-Yes',
  `pickup_delivery_service_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_delivery_service_key_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_delivery_service_key_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint UNSIGNED NOT NULL,
  `sorting` smallint NOT NULL DEFAULT '1',
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client_code` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 - active, 0 - pending, 2 - blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'US', 'United States', NULL, NULL),
(2, 'CA', 'Canada', NULL, NULL),
(3, 'AF', 'Afghanistan', NULL, NULL),
(4, 'AL', 'Albania', NULL, NULL),
(5, 'DZ', 'Algeria', NULL, NULL),
(6, 'DS', 'American Samoa', NULL, NULL),
(7, 'AD', 'Andorra', NULL, NULL),
(8, 'AO', 'Angola', NULL, NULL),
(9, 'AI', 'Anguilla', NULL, NULL),
(10, 'AQ', 'Antarctica', NULL, NULL),
(11, 'AG', 'Antigua and/or Barbuda', NULL, NULL),
(12, 'AR', 'Argentina', NULL, NULL),
(13, 'AM', 'Armenia', NULL, NULL),
(14, 'AW', 'Aruba', NULL, NULL),
(15, 'AU', 'Australia', NULL, NULL),
(16, 'AT', 'Austria', NULL, NULL),
(17, 'AZ', 'Azerbaijan', NULL, NULL),
(18, 'BS', 'Bahamas', NULL, NULL),
(19, 'BH', 'Bahrain', NULL, NULL),
(20, 'BD', 'Bangladesh', NULL, NULL),
(21, 'BB', 'Barbados', NULL, NULL),
(22, 'BY', 'Belarus', NULL, NULL),
(23, 'BE', 'Belgium', NULL, NULL),
(24, 'BZ', 'Belize', NULL, NULL),
(25, 'BJ', 'Benin', NULL, NULL),
(26, 'BM', 'Bermuda', NULL, NULL),
(27, 'BT', 'Bhutan', NULL, NULL),
(28, 'BO', 'Bolivia', NULL, NULL),
(29, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(30, 'BW', 'Botswana', NULL, NULL),
(31, 'BV', 'Bouvet Island', NULL, NULL),
(32, 'BR', 'Brazil', NULL, NULL),
(33, 'IO', 'British lndian Ocean Territory', NULL, NULL),
(34, 'BN', 'Brunei Darussalam', NULL, NULL),
(35, 'BG', 'Bulgaria', NULL, NULL),
(36, 'BF', 'Burkina Faso', NULL, NULL),
(37, 'BI', 'Burundi', NULL, NULL),
(38, 'KH', 'Cambodia', NULL, NULL),
(39, 'CM', 'Cameroon', NULL, NULL),
(40, 'CV', 'Cape Verde', NULL, NULL),
(41, 'KY', 'Cayman Islands', NULL, NULL),
(42, 'CF', 'Central African Republic', NULL, NULL),
(43, 'TD', 'Chad', NULL, NULL),
(44, 'CL', 'Chile', NULL, NULL),
(45, 'CN', 'China', NULL, NULL),
(46, 'CX', 'Christmas Island', NULL, NULL),
(47, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(48, 'CO', 'Colombia', NULL, NULL),
(49, 'KM', 'Comoros', NULL, NULL),
(50, 'CG', 'Congo', NULL, NULL),
(51, 'CK', 'Cook Islands', NULL, NULL),
(52, 'CR', 'Costa Rica', NULL, NULL),
(53, 'HR', 'Croatia (Hrvatska)', NULL, NULL),
(54, 'CU', 'Cuba', NULL, NULL),
(55, 'CY', 'Cyprus', NULL, NULL),
(56, 'CZ', 'Czech Republic', NULL, NULL),
(57, 'DK', 'Denmark', NULL, NULL),
(58, 'DJ', 'Djibouti', NULL, NULL),
(59, 'DM', 'Dominica', NULL, NULL),
(60, 'DO', 'Dominican Republic', NULL, NULL),
(61, 'TP', 'East Timor', NULL, NULL),
(62, 'EC', 'Ecudaor', NULL, NULL),
(63, 'EG', 'Egypt', NULL, NULL),
(64, 'SV', 'El Salvador', NULL, NULL),
(65, 'GQ', 'Equatorial Guinea', NULL, NULL),
(66, 'ER', 'Eritrea', NULL, NULL),
(67, 'EE', 'Estonia', NULL, NULL),
(68, 'ET', 'Ethiopia', NULL, NULL),
(69, 'FK', 'Falkland Islands (Malvinas)', NULL, NULL),
(70, 'FO', 'Faroe Islands', NULL, NULL),
(71, 'FJ', 'Fiji', NULL, NULL),
(72, 'FI', 'Finland', NULL, NULL),
(73, 'FR', 'France', NULL, NULL),
(74, 'FX', 'France, Metropolitan', NULL, NULL),
(75, 'GF', 'French Guiana', NULL, NULL),
(76, 'PF', 'French Polynesia', NULL, NULL),
(77, 'TF', 'French Southern Territories', NULL, NULL),
(78, 'GA', 'Gabon', NULL, NULL),
(79, 'GM', 'Gambia', NULL, NULL),
(80, 'GE', 'Georgia', NULL, NULL),
(81, 'DE', 'Germany', NULL, NULL),
(82, 'GH', 'Ghana', NULL, NULL),
(83, 'GI', 'Gibraltar', NULL, NULL),
(84, 'GR', 'Greece', NULL, NULL),
(85, 'GL', 'Greenland', NULL, NULL),
(86, 'GD', 'Grenada', NULL, NULL),
(87, 'GP', 'Guadeloupe', NULL, NULL),
(88, 'GU', 'Guam', NULL, NULL),
(89, 'GT', 'Guatemala', NULL, NULL),
(90, 'GN', 'Guinea', NULL, NULL),
(91, 'GW', 'Guinea-Bissau', NULL, NULL),
(92, 'GY', 'Guyana', NULL, NULL),
(93, 'HT', 'Haiti', NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', NULL, NULL),
(95, 'HN', 'Honduras', NULL, NULL),
(96, 'HK', 'Hong Kong', NULL, NULL),
(97, 'HU', 'Hungary', NULL, NULL),
(98, 'IS', 'Iceland', NULL, NULL),
(99, 'IN', 'India', NULL, NULL),
(100, 'ID', 'Indonesia', NULL, NULL),
(101, 'IR', 'Iran (Islamic Republic of)', NULL, NULL),
(102, 'IQ', 'Iraq', NULL, NULL),
(103, 'IE', 'Ireland', NULL, NULL),
(104, 'IL', 'Israel', NULL, NULL),
(105, 'IT', 'Italy', NULL, NULL),
(106, 'CI', 'Ivory Coast', NULL, NULL),
(107, 'JM', 'Jamaica', NULL, NULL),
(108, 'JP', 'Japan', NULL, NULL),
(109, 'JO', 'Jordan', NULL, NULL),
(110, 'KZ', 'Kazakhstan', NULL, NULL),
(111, 'KE', 'Kenya', NULL, NULL),
(112, 'KI', 'Kiribati', NULL, NULL),
(113, 'KP', 'Korea, Democratic People\'s Republic of', NULL, NULL),
(114, 'KR', 'Korea, Republic of', NULL, NULL),
(115, 'KW', 'Kuwait', NULL, NULL),
(116, 'KG', 'Kyrgyzstan', NULL, NULL),
(117, 'LA', 'Lao People\'s Democratic Republic', NULL, NULL),
(118, 'LV', 'Latvia', NULL, NULL),
(119, 'LB', 'Lebanon', NULL, NULL),
(120, 'LS', 'Lesotho', NULL, NULL),
(121, 'LR', 'Liberia', NULL, NULL),
(122, 'LY', 'Libyan Arab Jamahiriya', NULL, NULL),
(123, 'LI', 'Liechtenstein', NULL, NULL),
(124, 'LT', 'Lithuania', NULL, NULL),
(125, 'LU', 'Luxembourg', NULL, NULL),
(126, 'MO', 'Macau', NULL, NULL),
(127, 'MK', 'Macedonia', NULL, NULL),
(128, 'MG', 'Madagascar', NULL, NULL),
(129, 'MW', 'Malawi', NULL, NULL),
(130, 'MY', 'Malaysia', NULL, NULL),
(131, 'MV', 'Maldives', NULL, NULL),
(132, 'ML', 'Mali', NULL, NULL),
(133, 'MT', 'Malta', NULL, NULL),
(134, 'MH', 'Marshall Islands', NULL, NULL),
(135, 'MQ', 'Martinique', NULL, NULL),
(136, 'MR', 'Mauritania', NULL, NULL),
(137, 'MU', 'Mauritius', NULL, NULL),
(138, 'TY', 'Mayotte', NULL, NULL),
(139, 'MX', 'Mexico', NULL, NULL),
(140, 'FM', 'Micronesia, Federated States of', NULL, NULL),
(141, 'MD', 'Moldova, Republic of', NULL, NULL),
(142, 'MC', 'Monaco', NULL, NULL),
(143, 'MN', 'Mongolia', NULL, NULL),
(144, 'MS', 'Montserrat', NULL, NULL),
(145, 'MA', 'Morocco', NULL, NULL),
(146, 'MZ', 'Mozambique', NULL, NULL),
(147, 'MM', 'Myanmar', NULL, NULL),
(148, 'NA', 'Namibia', NULL, NULL),
(149, 'NR', 'Nauru', NULL, NULL),
(150, 'NP', 'Nepal', NULL, NULL),
(151, 'NL', 'Netherlands', NULL, NULL),
(152, 'AN', 'Netherlands Antilles', NULL, NULL),
(153, 'NC', 'New Caledonia', NULL, NULL),
(154, 'NZ', 'New Zealand', NULL, NULL),
(155, 'NI', 'Nicaragua', NULL, NULL),
(156, 'NE', 'Niger', NULL, NULL),
(157, 'NG', 'Nigeria', NULL, NULL),
(158, 'NU', 'Niue', NULL, NULL),
(159, 'NF', 'Norfork Island', NULL, NULL),
(160, 'MP', 'Northern Mariana Islands', NULL, NULL),
(161, 'NO', 'Norway', NULL, NULL),
(162, 'OM', 'Oman', NULL, NULL),
(163, 'PK', 'Pakistan', NULL, NULL),
(164, 'PW', 'Palau', NULL, NULL),
(165, 'PA', 'Panama', NULL, NULL),
(166, 'PG', 'Papua New Guinea', NULL, NULL),
(167, 'PY', 'Paraguay', NULL, NULL),
(168, 'PE', 'Peru', NULL, NULL),
(169, 'PH', 'Philippines', NULL, NULL),
(170, 'PN', 'Pitcairn', NULL, NULL),
(171, 'PL', 'Poland', NULL, NULL),
(172, 'PT', 'Portugal', NULL, NULL),
(173, 'PR', 'Puerto Rico', NULL, NULL),
(174, 'QA', 'Qatar', NULL, NULL),
(175, 'RE', 'Reunion', NULL, NULL),
(176, 'RO', 'Romania', NULL, NULL),
(177, 'RU', 'Russian Federation', NULL, NULL),
(178, 'RW', 'Rwanda', NULL, NULL),
(179, 'KN', 'Saint Kitts and Nevis', NULL, NULL),
(180, 'LC', 'Saint Lucia', NULL, NULL),
(181, 'VC', 'Saint Vincent and the Grenadines', NULL, NULL),
(182, 'WS', 'Samoa', NULL, NULL),
(183, 'SM', 'San Marino', NULL, NULL),
(184, 'ST', 'Sao Tome and Principe', NULL, NULL),
(185, 'SA', 'Saudi Arabia', NULL, NULL),
(186, 'SN', 'Senegal', NULL, NULL),
(187, 'SC', 'Seychelles', NULL, NULL),
(188, 'SL', 'Sierra Leone', NULL, NULL),
(189, 'SG', 'Singapore', NULL, NULL),
(190, 'SK', 'Slovakia', NULL, NULL),
(191, 'SI', 'Slovenia', NULL, NULL),
(192, 'SB', 'Solomon Islands', NULL, NULL),
(193, 'SO', 'Somalia', NULL, NULL),
(194, 'ZA', 'South Africa', NULL, NULL),
(195, 'GS', 'South Georgia South Sandwich Islands', NULL, NULL),
(196, 'ES', 'Spain', NULL, NULL),
(197, 'LK', 'Sri Lanka', NULL, NULL),
(198, 'SH', 'St. Helena', NULL, NULL),
(199, 'PM', 'St. Pierre and Miquelon', NULL, NULL),
(200, 'SD', 'Sudan', NULL, NULL),
(201, 'SR', 'Suriname', NULL, NULL),
(202, 'SJ', 'Svalbarn and Jan Mayen Islands', NULL, NULL),
(203, 'SZ', 'Swaziland', NULL, NULL),
(204, 'SE', 'Sweden', NULL, NULL),
(205, 'CH', 'Switzerland', NULL, NULL),
(206, 'SY', 'Syrian Arab Republic', NULL, NULL),
(207, 'TW', 'Taiwan', NULL, NULL),
(208, 'TJ', 'Tajikistan', NULL, NULL),
(209, 'TZ', 'Tanzania, United Republic of', NULL, NULL),
(210, 'TH', 'Thailand', NULL, NULL),
(211, 'TG', 'Togo', NULL, NULL),
(212, 'TK', 'Tokelau', NULL, NULL),
(213, 'TO', 'Tonga', NULL, NULL),
(214, 'TT', 'Trinidad and Tobago', NULL, NULL),
(215, 'TN', 'Tunisia', NULL, NULL),
(216, 'TR', 'Turkey', NULL, NULL),
(217, 'TM', 'Turkmenistan', NULL, NULL),
(218, 'TC', 'Turks and Caicos Islands', NULL, NULL),
(219, 'TV', 'Tuvalu', NULL, NULL),
(220, 'UG', 'Uganda', NULL, NULL),
(221, 'UA', 'Ukraine', NULL, NULL),
(222, 'AE', 'United Arab Emirates', NULL, NULL),
(223, 'GB', 'United Kingdom', NULL, NULL),
(224, 'UM', 'United States minor outlying islands', NULL, NULL),
(225, 'UY', 'Uruguay', NULL, NULL),
(226, 'UZ', 'Uzbekistan', NULL, NULL),
(227, 'VU', 'Vanuatu', NULL, NULL),
(228, 'VA', 'Vatican City State', NULL, NULL),
(229, 'VE', 'Venezuela', NULL, NULL),
(230, 'VN', 'Vietnam', NULL, NULL),
(231, 'VG', 'Virigan Islands (British)', NULL, NULL),
(232, 'VI', 'Virgin Islands (U.S.)', NULL, NULL),
(233, 'WF', 'Wallis and Futuna Islands', NULL, NULL),
(234, 'EH', 'Western Sahara', NULL, NULL),
(235, 'YE', 'Yemen', NULL, NULL),
(236, 'YU', 'Yugoslavia', NULL, NULL),
(237, 'ZR', 'Zaire', NULL, NULL),
(238, 'ZM', 'Zambia', NULL, NULL),
(239, 'ZW', 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `csv_product_imports`
--

CREATE TABLE `csv_product_imports` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1-Pending, 2-Success, 3-Failed, 4-In-progress',
  `error` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `csv_vendor_imports`
--

CREATE TABLE `csv_vendor_imports` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1-Pending, 2-Success, 3-Failed, 4-In-progress',
  `error` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `iso_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subunit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subunit_to_unit` int NOT NULL,
  `symbol_first` tinyint NOT NULL,
  `html_entity` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_mark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousands_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_numeric` smallint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `priority`, `iso_code`, `symbol`, `subunit`, `subunit_to_unit`, `symbol_first`, `html_entity`, `decimal_mark`, `thousands_separator`, `iso_numeric`, `created_at`, `updated_at`) VALUES
(1, 'United Arab Emirates Dirham', 100, 'AED', 'د.إ', 'Fils', 100, 1, '', '.', ',', 784, NULL, NULL),
(2, 'Afghan Afghani', 100, 'AFN', '؋', 'Pul', 100, 0, '', '.', ',', 971, NULL, NULL),
(3, 'Albanian Lek', 100, 'ALL', 'L', 'Qintar', 100, 0, '', '.', ',', 8, NULL, NULL),
(4, 'Armenian Dram', 100, 'AMD', 'դր.', 'Luma', 100, 0, '', '.', ',', 51, NULL, NULL),
(5, 'Netherlands Antillean Gulden', 100, 'ANG', 'ƒ', 'Cent', 100, 1, '&#x0192;', ',', '.', 532, NULL, NULL),
(6, 'Angolan Kwanza', 100, 'AOA', 'Kz', 'Cêntimo', 100, 0, '', '.', ',', 973, NULL, NULL),
(7, 'Argentine Peso', 100, 'ARS', '$', 'Centavo', 100, 1, '&#x20B1;', ',', '.', 32, NULL, NULL),
(8, 'Australian Dollar', 4, 'AUD', '$', 'Cent', 100, 1, '$', '.', ',', 36, NULL, NULL),
(9, 'Aruban Florin', 100, 'AWG', 'ƒ', 'Cent', 100, 0, '&#x0192;', '.', ',', 533, NULL, NULL),
(10, 'Azerbaijani Manat', 100, 'AZN', 'null', 'Qəpik', 100, 1, '', '.', ',', 944, NULL, NULL),
(11, 'Bosnia and Herzegovina Convertible Mark', 100, 'BAM', 'КМ', 'Fening', 100, 1, '', '.', ',', 977, NULL, NULL),
(12, 'Barbadian Dollar', 100, 'BBD', '$', 'Cent', 100, 0, '$', '.', ',', 52, NULL, NULL),
(13, 'Bangladeshi Taka', 100, 'BDT', '৳', 'Paisa', 100, 1, '', '.', ',', 50, NULL, NULL),
(14, 'Bulgarian Lev', 100, 'BGN', 'лв', 'Stotinka', 100, 0, '', '.', ',', 975, NULL, NULL),
(15, 'Bahraini Dinar', 100, 'BHD', 'ب.د', 'Fils', 1000, 1, '', '.', ',', 48, NULL, NULL),
(16, 'Burundian Franc', 100, 'BIF', 'Fr', 'Centime', 100, 0, '', '.', ',', 108, NULL, NULL),
(17, 'Bermudian Dollar', 100, 'BMD', '$', 'Cent', 100, 1, '$', '.', ',', 60, NULL, NULL),
(18, 'Brunei Dollar', 100, 'BND', '$', 'Sen', 100, 1, '$', '.', ',', 96, NULL, NULL),
(19, 'Bolivian Boliviano', 100, 'BOB', 'Bs.', 'Centavo', 100, 1, '', '.', ',', 68, NULL, NULL),
(20, 'Brazilian Real', 100, 'BRL', 'R$', 'Centavo', 100, 1, 'R$', ',', '.', 986, NULL, NULL),
(21, 'Bahamian Dollar', 100, 'BSD', '$', 'Cent', 100, 1, '$', '.', ',', 44, NULL, NULL),
(22, 'Bhutanese Ngultrum', 100, 'BTN', 'Nu.', 'Chertrum', 100, 0, '', '.', ',', 64, NULL, NULL),
(23, 'Botswana Pula', 100, 'BWP', 'P', 'Thebe', 100, 1, '', '.', ',', 72, NULL, NULL),
(24, 'Belarusian Ruble', 100, 'BYR', 'Br', 'Kapyeyka', 100, 0, '', '.', ',', 974, NULL, NULL),
(25, 'Belize Dollar', 100, 'BZD', '$', 'Cent', 100, 1, '$', '.', ',', 84, NULL, NULL),
(26, 'Canadian Dollar', 5, 'CAD', '$', 'Cent', 100, 1, '$', '.', ',', 124, NULL, NULL),
(27, 'Congolese Franc', 100, 'CDF', 'Fr', 'Centime', 100, 0, '', '.', ',', 976, NULL, NULL),
(28, 'Swiss Franc', 100, 'CHF', 'Fr', 'Rappen', 100, 1, '', '.', ',', 756, NULL, NULL),
(29, 'Unidad de Fomento', 100, 'CLF', 'UF', 'Peso', 1, 1, '&#x20B1;', ',', '.', 990, NULL, NULL),
(30, 'Chilean Peso', 100, 'CLP', '$', 'Peso', 1, 1, '&#36;', ',', '.', 152, NULL, NULL),
(31, 'Chinese Renminbi Yuan', 100, 'CNY', '¥', 'Fen', 100, 1, '&#20803;', '.', ',', 156, NULL, NULL),
(32, 'Colombian Peso', 100, 'COP', '$', 'Centavo', 100, 1, '&#x20B1;', ',', '.', 170, NULL, NULL),
(33, 'Costa Rican Colón', 100, 'CRC', '₡', 'Céntimo', 100, 1, '&#x20A1;', ',', '.', 188, NULL, NULL),
(34, 'Cuban Convertible Peso', 100, 'CUC', '$', 'Centavo', 100, 0, '', '.', ',', 931, NULL, NULL),
(35, 'Cuban Peso', 100, 'CUP', '$', 'Centavo', 100, 1, '&#x20B1;', '.', ',', 192, NULL, NULL),
(36, 'Cape Verdean Escudo', 100, 'CVE', '$', 'Centavo', 100, 0, '', '.', ',', 132, NULL, NULL),
(37, 'Czech Koruna', 100, 'CZK', 'Kč', 'Haléř', 100, 1, '', ',', '.', 203, NULL, NULL),
(38, 'Djiboutian Franc', 100, 'DJF', 'Fdj', 'Centime', 100, 0, '', '.', ',', 262, NULL, NULL),
(39, 'Danish Krone', 100, 'DKK', 'kr', 'Øre', 100, 0, '', ',', '.', 208, NULL, NULL),
(40, 'Dominican Peso', 100, 'DOP', '$', 'Centavo', 100, 1, '&#x20B1;', '.', ',', 214, NULL, NULL),
(41, 'Algerian Dinar', 100, 'DZD', 'د.ج', 'Centime', 100, 0, '', '.', ',', 12, NULL, NULL),
(42, 'Egyptian Pound', 100, 'EGP', 'ج.م', 'Piastre', 100, 1, '&#x00A3;', '.', ',', 818, NULL, NULL),
(43, 'Eritrean Nakfa', 100, 'ERN', 'Nfk', 'Cent', 100, 0, '', '.', ',', 232, NULL, NULL),
(44, 'Ethiopian Birr', 100, 'ETB', 'Br', 'Santim', 100, 0, '', '.', ',', 230, NULL, NULL),
(45, 'Euro', 2, 'EUR', '€', 'Cent', 100, 1, '&#x20AC;', ',', '.', 978, NULL, NULL),
(46, 'Fijian Dollar', 100, 'FJD', '$', 'Cent', 100, 0, '$', '.', ',', 242, NULL, NULL),
(47, 'Falkland Pound', 100, 'FKP', '£', 'Penny', 100, 0, '&#x00A3;', '.', ',', 238, NULL, NULL),
(48, 'British Pound', 3, 'GBP', '£', 'Penny', 100, 1, '&#x00A3;', '.', ',', 826, NULL, NULL),
(49, 'Georgian Lari', 100, 'GEL', 'ლ', 'Tetri', 100, 0, '', '.', ',', 981, NULL, NULL),
(50, 'Ghanaian Cedi', 100, 'GHS', '₵', 'Pesewa', 100, 1, '&#x20B5;', '.', ',', 936, NULL, NULL),
(51, 'Gibraltar Pound', 100, 'GIP', '£', 'Penny', 100, 1, '&#x00A3;', '.', ',', 292, NULL, NULL),
(52, 'Gambian Dalasi', 100, 'GMD', 'D', 'Butut', 100, 0, '', '.', ',', 270, NULL, NULL),
(53, 'Guinean Franc', 100, 'GNF', 'Fr', 'Centime', 100, 0, '', '.', ',', 324, NULL, NULL),
(54, 'Guatemalan Quetzal', 100, 'GTQ', 'Q', 'Centavo', 100, 1, '', '.', ',', 320, NULL, NULL),
(55, 'Guyanese Dollar', 100, 'GYD', '$', 'Cent', 100, 0, '$', '.', ',', 328, NULL, NULL),
(56, 'Hong Kong Dollar', 100, 'HKD', '$', 'Cent', 100, 1, '$', '.', ',', 344, NULL, NULL),
(57, 'Honduran Lempira', 100, 'HNL', 'L', 'Centavo', 100, 1, '', '.', ',', 340, NULL, NULL),
(58, 'Croatian Kuna', 100, 'HRK', 'kn', 'Lipa', 100, 1, '', ',', '.', 191, NULL, NULL),
(59, 'Haitian Gourde', 100, 'HTG', 'G', 'Centime', 100, 0, '', '.', ',', 332, NULL, NULL),
(60, 'Hungarian Forint', 100, 'HUF', 'Ft', 'Fillér', 100, 0, '', ',', '.', 348, NULL, NULL),
(61, 'Indonesian Rupiah', 100, 'IDR', 'Rp', 'Sen', 100, 1, '', ',', '.', 360, NULL, NULL),
(62, 'Israeli New Sheqel', 100, 'ILS', '₪', 'Agora', 100, 1, '&#x20AA;', '.', ',', 376, NULL, NULL),
(63, 'Indian Rupee', 100, 'INR', '₹', 'Paisa', 100, 1, '&#x20b9;', '.', ',', 356, NULL, NULL),
(64, 'Iraqi Dinar', 100, 'IQD', 'ع.د', 'Fils', 1000, 0, '', '.', ',', 368, NULL, NULL),
(65, 'Iranian Rial', 100, 'IRR', '﷼', 'Dinar', 100, 1, '&#xFDFC;', '.', ',', 364, NULL, NULL),
(66, 'Icelandic Króna', 100, 'ISK', 'kr', 'Eyrir', 100, 1, '', ',', '.', 352, NULL, NULL),
(67, 'Jamaican Dollar', 100, 'JMD', '$', 'Cent', 100, 1, '$', '.', ',', 388, NULL, NULL),
(68, 'Jordanian Dinar', 100, 'JOD', 'د.ا', 'Piastre', 100, 1, '', '.', ',', 400, NULL, NULL),
(69, 'Japanese Yen', 6, 'JPY', '¥', 'null', 1, 1, '&#x00A5;', '.', ',', 392, NULL, NULL),
(70, 'Kenyan Shilling', 100, 'KES', 'KSh', 'Cent', 100, 1, '', '.', ',', 404, NULL, NULL),
(71, 'Kyrgyzstani Som', 100, 'KGS', 'som', 'Tyiyn', 100, 0, '', '.', ',', 417, NULL, NULL),
(72, 'Cambodian Riel', 100, 'KHR', '៛', 'Sen', 100, 0, '&#x17DB;', '.', ',', 116, NULL, NULL),
(73, 'Comorian Franc', 100, 'KMF', 'Fr', 'Centime', 100, 0, '', '.', ',', 174, NULL, NULL),
(74, 'North Korean Won', 100, 'KPW', '₩', 'Chŏn', 100, 0, '&#x20A9;', '.', ',', 408, NULL, NULL),
(75, 'South Korean Won', 100, 'KRW', '₩', 'null', 1, 1, '&#x20A9;', '.', ',', 410, NULL, NULL),
(76, 'Kuwaiti Dinar', 100, 'KWD', 'د.ك', 'Fils', 1000, 1, '', '.', ',', 414, NULL, NULL),
(77, 'Cayman Islands Dollar', 100, 'KYD', '$', 'Cent', 100, 1, '$', '.', ',', 136, NULL, NULL),
(78, 'Kazakhstani Tenge', 100, 'KZT', '〒', 'Tiyn', 100, 0, '', '.', ',', 398, NULL, NULL),
(79, 'Lao Kip', 100, 'LAK', '₭', 'Att', 100, 0, '&#x20AD;', '.', ',', 418, NULL, NULL),
(80, 'Lebanese Pound', 100, 'LBP', 'ل.ل', 'Piastre', 100, 1, '&#x00A3;', '.', ',', 422, NULL, NULL),
(81, 'Sri Lankan Rupee', 100, 'LKR', '₨', 'Cent', 100, 0, '&#x0BF9;', '.', ',', 144, NULL, NULL),
(82, 'Liberian Dollar', 100, 'LRD', '$', 'Cent', 100, 0, '$', '.', ',', 430, NULL, NULL),
(83, 'Lesotho Loti', 100, 'LSL', 'L', 'Sente', 100, 0, '', '.', ',', 426, NULL, NULL),
(84, 'Lithuanian Litas', 100, 'LTL', 'Lt', 'Centas', 100, 0, '', '.', ',', 440, NULL, NULL),
(85, 'Latvian Lats', 100, 'LVL', 'Ls', 'Santīms', 100, 1, '', '.', ',', 428, NULL, NULL),
(86, 'Libyan Dinar', 100, 'LYD', 'ل.د', 'Dirham', 1000, 0, '', '.', ',', 434, NULL, NULL),
(87, 'Moroccan Dirham', 100, 'MAD', 'د.م.', 'Centime', 100, 0, '', '.', ',', 504, NULL, NULL),
(88, 'Moldovan Leu', 100, 'MDL', 'L', 'Ban', 100, 0, '', '.', ',', 498, NULL, NULL),
(89, 'Malagasy Ariary', 100, 'MGA', 'Ar', 'Iraimbilanja', 5, 1, '', '.', ',', 969, NULL, NULL),
(90, 'Macedonian Denar', 100, 'MKD', 'ден', 'Deni', 100, 0, '', '.', ',', 807, NULL, NULL),
(91, 'Myanmar Kyat', 100, 'MMK', 'K', 'Pya', 100, 0, '', '.', ',', 104, NULL, NULL),
(92, 'Mongolian Tögrög', 100, 'MNT', '₮', 'Möngö', 100, 0, '&#x20AE;', '.', ',', 496, NULL, NULL),
(93, 'Macanese Pataca', 100, 'MOP', 'P', 'Avo', 100, 0, '', '.', ',', 446, NULL, NULL),
(94, 'Mauritanian Ouguiya', 100, 'MRO', 'UM', 'Khoums', 5, 0, '', '.', ',', 478, NULL, NULL),
(95, 'Mauritian Rupee', 100, 'MUR', '₨', 'Cent', 100, 1, '&#x20A8;', '.', ',', 480, NULL, NULL),
(96, 'Maldivian Rufiyaa', 100, 'MVR', 'MVR', 'Laari', 100, 0, '', '.', ',', 462, NULL, NULL),
(97, 'Malawian Kwacha', 100, 'MWK', 'MK', 'Tambala', 100, 0, '', '.', ',', 454, NULL, NULL),
(98, 'Mexican Peso', 100, 'MXN', '$', 'Centavo', 100, 1, '$', '.', ',', 484, NULL, NULL),
(99, 'Malaysian Ringgit', 100, 'MYR', 'RM', 'Sen', 100, 1, '', '.', ',', 458, NULL, NULL),
(100, 'Mozambican Metical', 100, 'MZN', 'MTn', 'Centavo', 100, 1, '', ',', '.', 943, NULL, NULL),
(101, 'Namibian Dollar', 100, 'NAD', '$', 'Cent', 100, 0, '$', '.', ',', 516, NULL, NULL),
(102, 'Nigerian Naira', 100, 'NGN', '₦', 'Kobo', 100, 0, '&#x20A6;', '.', ',', 566, NULL, NULL),
(103, 'Nicaraguan Córdoba', 100, 'NIO', 'C$', 'Centavo', 100, 0, '', '.', ',', 558, NULL, NULL),
(104, 'Norwegian Krone', 100, 'NOK', 'kr', 'Øre', 100, 1, 'kr', ',', '.', 578, NULL, NULL),
(105, 'Nepalese Rupee', 100, 'NPR', '₨', 'Paisa', 100, 1, '&#x20A8;', '.', ',', 524, NULL, NULL),
(106, 'New Zealand Dollar', 100, 'NZD', '$', 'Cent', 100, 1, '$', '.', ',', 554, NULL, NULL),
(107, 'Omani Rial', 100, 'OMR', 'ر.ع.', 'Baisa', 1000, 1, '&#xFDFC;', '.', ',', 512, NULL, NULL),
(108, 'Panamanian Balboa', 100, 'PAB', 'B/.', 'Centésimo', 100, 0, '', '.', ',', 590, NULL, NULL),
(109, 'Peruvian Nuevo Sol', 100, 'PEN', 'S/.', 'Céntimo', 100, 1, 'S/.', '.', ',', 604, NULL, NULL),
(110, 'Papua New Guinean Kina', 100, 'PGK', 'K', 'Toea', 100, 0, '', '.', ',', 598, NULL, NULL),
(111, 'Philippine Peso', 100, 'PHP', '₱', 'Centavo', 100, 1, '&#x20B1;', '.', ',', 608, NULL, NULL),
(112, 'Pakistani Rupee', 100, 'PKR', '₨', 'Paisa', 100, 1, '&#x20A8;', '.', ',', 586, NULL, NULL),
(113, 'Polish Złoty', 100, 'PLN', 'zł', 'Grosz', 100, 0, 'z&#322;', ',', '', 985, NULL, NULL),
(114, 'Paraguayan Guaraní', 100, 'PYG', '₲', 'Céntimo', 100, 1, '&#x20B2;', '.', ',', 600, NULL, NULL),
(115, 'Qatari Riyal', 100, 'QAR', 'ر.ق', 'Dirham', 100, 0, '&#xFDFC;', '.', ',', 634, NULL, NULL),
(116, 'Romanian Leu', 100, 'RON', 'Lei', 'Bani', 100, 1, '', ',', '.', 946, NULL, NULL),
(117, 'Serbian Dinar', 100, 'RSD', 'РСД', 'Para', 100, 1, '', '.', ',', 941, NULL, NULL),
(118, 'Russian Ruble', 100, 'RUB', 'р.', 'Kopek', 100, 0, '&#x0440;&#x0443;&#x0431;', ',', '.', 643, NULL, NULL),
(119, 'Rwandan Franc', 100, 'RWF', 'FRw', 'Centime', 100, 0, '', '.', ',', 646, NULL, NULL),
(120, 'Saudi Riyal', 100, 'SAR', 'ر.س', 'Hallallah', 100, 1, '&#xFDFC;', '.', ',', 682, NULL, NULL),
(121, 'Solomon Islands Dollar', 100, 'SBD', '$', 'Cent', 100, 0, '$', '.', ',', 90, NULL, NULL),
(122, 'Seychellois Rupee', 100, 'SCR', '₨', 'Cent', 100, 0, '&#x20A8;', '.', ',', 690, NULL, NULL),
(123, 'Sudanese Pound', 100, 'SDG', '£', 'Piastre', 100, 1, '', '.', ',', 938, NULL, NULL),
(124, 'Swedish Krona', 100, 'SEK', 'kr', 'Öre', 100, 0, '', ',', '', 752, NULL, NULL),
(125, 'Singapore Dollar', 100, 'SGD', '$', 'Cent', 100, 1, '$', '.', ',', 702, NULL, NULL),
(126, 'Saint Helenian Pound', 100, 'SHP', '£', 'Penny', 100, 0, '&#x00A3;', '.', ',', 654, NULL, NULL),
(127, 'Slovak Koruna', 100, 'SKK', 'Sk', 'Halier', 100, 1, '', '.', ',', 703, NULL, NULL),
(128, 'Sierra Leonean Leone', 100, 'SLL', 'Le', 'Cent', 100, 0, '', '.', ',', 694, NULL, NULL),
(129, 'Somali Shilling', 100, 'SOS', 'Sh', 'Cent', 100, 0, '', '.', ',', 706, NULL, NULL),
(130, 'Surinamese Dollar', 100, 'SRD', '$', 'Cent', 100, 0, '', '.', ',', 968, NULL, NULL),
(131, 'South Sudanese Pound', 100, 'SSP', '£', 'piaster', 100, 0, '&#x00A3;', '.', ',', 728, NULL, NULL),
(132, 'São Tomé and Príncipe Dobra', 100, 'STD', 'Db', 'Cêntimo', 100, 0, '', '.', ',', 678, NULL, NULL),
(133, 'Salvadoran Colón', 100, 'SVC', '₡', 'Centavo', 100, 1, '&#x20A1;', '.', ',', 222, NULL, NULL),
(134, 'Syrian Pound', 100, 'SYP', '£S', 'Piastre', 100, 0, '&#x00A3;', '.', ',', 760, NULL, NULL),
(135, 'Swazi Lilangeni', 100, 'SZL', 'L', 'Cent', 100, 1, '', '.', ',', 748, NULL, NULL),
(136, 'Thai Baht', 100, 'THB', '฿', 'Satang', 100, 1, '&#x0E3F;', '.', ',', 764, NULL, NULL),
(137, 'Tajikistani Somoni', 100, 'TJS', 'ЅМ', 'Diram', 100, 0, '', '.', ',', 972, NULL, NULL),
(138, 'Turkmenistani Manat', 100, 'TMT', 'T', 'Tenge', 100, 0, '', '.', ',', 934, NULL, NULL),
(139, 'Tunisian Dinar', 100, 'TND', 'د.ت', 'Millime', 1000, 0, '', '.', ',', 788, NULL, NULL),
(140, 'Tongan Paʻanga', 100, 'TOP', 'T$', 'Seniti', 100, 1, '', '.', ',', 776, NULL, NULL),
(141, 'Turkish Lira', 100, 'TRY', 'TL', 'kuruş', 100, 0, '', ',', '.', 949, NULL, NULL),
(142, 'Trinidad and Tobago Dollar', 100, 'TTD', '$', 'Cent', 100, 0, '$', '.', ',', 780, NULL, NULL),
(143, 'New Taiwan Dollar', 100, 'TWD', '$', 'Cent', 100, 1, '$', '.', ',', 901, NULL, NULL),
(144, 'Tanzanian Shilling', 100, 'TZS', 'Sh', 'Cent', 100, 1, '', '.', ',', 834, NULL, NULL),
(145, 'Ukrainian Hryvnia', 100, 'UAH', '₴', 'Kopiyka', 100, 0, '&#x20B4;', '.', ',', 980, NULL, NULL),
(146, 'Ugandan Shilling', 100, 'UGX', 'USh', 'Cent', 100, 0, '', '.', ',', 800, NULL, NULL),
(147, 'United States Dollar', 1, 'USD', '$', 'Cent', 100, 1, '$', '.', ',', 840, NULL, NULL),
(148, 'Uruguayan Peso', 100, 'UYU', '$', 'Centésimo', 100, 1, '&#x20B1;', ',', '.', 858, NULL, NULL),
(149, 'Uzbekistani Som', 100, 'UZS', 'null', 'Tiyin', 100, 0, '', '.', ',', 860, NULL, NULL),
(150, 'Venezuelan Bolívar', 100, 'VEF', 'Bs F', 'Céntimo', 100, 1, '', ',', '.', 937, NULL, NULL),
(151, 'Vietnamese Đồng', 100, 'VND', '₫', 'Hào', 10, 1, '&#x20AB;', ',', '.', 704, NULL, NULL),
(152, 'Vanuatu Vatu', 100, 'VUV', 'Vt', 'null', 1, 1, '', '.', ',', 548, NULL, NULL),
(153, 'Samoan Tala', 100, 'WST', 'T', 'Sene', 100, 0, '', '.', ',', 882, NULL, NULL),
(154, 'Central African Cfa Franc', 100, 'XAF', 'Fr', 'Centime', 100, 0, '', '.', ',', 950, NULL, NULL),
(155, 'Silver (Troy Ounce)', 100, 'XAG', 'oz t', 'oz', 1, 0, '', '.', ',', 961, NULL, NULL),
(156, 'Gold (Troy Ounce)', 100, 'XAU', 'oz t', 'oz', 1, 0, '', '.', ',', 959, NULL, NULL),
(157, 'East Caribbean Dollar', 100, 'XCD', '$', 'Cent', 100, 1, '$', '.', ',', 951, NULL, NULL),
(158, 'Special Drawing Rights', 100, 'XDR', 'SDR', '', 1, 0, '$', '.', ',', 960, NULL, NULL),
(159, 'West African Cfa Franc', 100, 'XOF', 'Fr', 'Centime', 100, 0, '', '.', ',', 952, NULL, NULL),
(160, 'Cfp Franc', 100, 'XPF', 'Fr', 'Centime', 100, 0, '', '.', ',', 953, NULL, NULL),
(161, 'Yemeni Rial', 100, 'YER', '﷼', 'Fils', 100, 0, '&#xFDFC;', '.', ',', 886, NULL, NULL),
(162, 'South African Rand', 100, 'ZAR', 'R', 'Cent', 100, 1, '&#x0052;', '.', ',', 710, NULL, NULL),
(163, 'Zambian Kwacha', 100, 'ZMK', 'ZK', 'Ngwee', 100, 0, '', '.', ',', 894, NULL, NULL),
(164, 'Zambian Kwacha', 100, 'ZMW', 'ZK', 'Ngwee', 100, 0, '', '.', ',', 967, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_status_options`
--

CREATE TABLE `dispatcher_status_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1 - for order, 2 - fordispatch',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1 - active, 0 - inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_template_type_options`
--

CREATE TABLE `dispatcher_template_type_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 for inactive and 1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_warning_pages`
--

CREATE TABLE `dispatcher_warning_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 for inactive and 1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nativeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `nativeName`, `sort_code`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'en', NULL, NULL),
(2, 'Abkhaz', 'аҧсуа', 'ab', NULL, NULL),
(3, 'Afar', 'Afaraf', 'aa', NULL, NULL),
(4, 'Afrikaans', 'Afrikaans', 'af', NULL, NULL),
(5, 'Akan', 'Akan', 'ak', NULL, NULL),
(6, 'Albanian', 'Shqip', 'sq', NULL, NULL),
(7, 'Amharic', 'አማርኛ', 'am', NULL, NULL),
(8, 'Arabic', 'العربية', 'ar', NULL, NULL),
(9, 'Aragonese', 'Aragonés', 'an', NULL, NULL),
(10, 'Armenian', 'Հայերեն', 'hy', NULL, NULL),
(11, 'Assamese', 'অসমীয়া', 'as', NULL, NULL),
(12, 'Avaric', 'авар мацӀ, магӀарул мацӀ', 'av', NULL, NULL),
(13, 'Avestan', 'avesta', 'ae', NULL, NULL),
(14, 'Aymara', 'aymar aru', 'ay', NULL, NULL),
(15, 'Azerbaijani', 'azərbaycan dili', 'az', NULL, NULL),
(16, 'Bambara', 'bamanankan', 'bm', NULL, NULL),
(17, 'Bashkir', 'башҡорт теле', 'ba', NULL, NULL),
(18, 'Basque', 'euskara, euskera', 'eu', NULL, NULL),
(19, 'Belarusian', 'Беларуская', 'be', NULL, NULL),
(20, 'Bengali', 'বাংলা', 'bn', NULL, NULL),
(21, 'Bihari', 'भोजपुरी', 'bh', NULL, NULL),
(22, 'Bislama', 'Bislama', 'bi', NULL, NULL),
(23, 'Bosnian', 'bosanski jezik', 'bs', NULL, NULL),
(24, 'Breton', 'brezhoneg', 'br', NULL, NULL),
(25, 'Bulgarian', 'български език', 'bg', NULL, NULL),
(26, 'Burmese', 'ဗမာစာ', 'my', NULL, NULL),
(27, 'Catalan; Valencian', 'Català', 'ca', NULL, NULL),
(28, 'Chamorro', 'Chamoru', 'ch', NULL, NULL),
(29, 'Chechen', 'нохчийн мотт', 'ce', NULL, NULL),
(30, 'Chichewa; Chewa; Nya', 'chiCheŵa, chinyanja', 'ny', NULL, NULL),
(31, 'Chinese', '中文 (Zhōngwén), 汉语, 漢語', 'zh', NULL, NULL),
(32, 'Chuvash', 'чӑваш чӗлхи', 'cv', NULL, NULL),
(33, 'Cornish', 'Kernewek', 'kw', NULL, NULL),
(34, 'Corsican', 'corsu, lingua corsa', 'co', NULL, NULL),
(35, 'Cree', 'ᓀᐦᐃᔭᐍᐏᐣ', 'cr', NULL, NULL),
(36, 'Croatian', 'hrvatski', 'hr', NULL, NULL),
(37, 'Czech', 'česky, čeština', 'cs', NULL, NULL),
(38, 'Danish', 'dansk', 'da', NULL, NULL),
(39, 'Divehi; Dhivehi; Mal', 'ދިވެހި', 'dv', NULL, NULL),
(40, 'Dutch', 'Nederlands, Vlaams', 'nl', NULL, NULL),
(41, 'Esperanto', 'Esperanto', 'eo', NULL, NULL),
(42, 'Estonian', 'eesti, eesti keel', 'et', NULL, NULL),
(43, 'Ewe', 'Eʋegbe', 'ee', NULL, NULL),
(44, 'Faroese', 'føroyskt', 'fo', NULL, NULL),
(45, 'Fijian', 'vosa Vakaviti', 'fj', NULL, NULL),
(46, 'Finnish', 'suomi, suomen kieli', 'fi', NULL, NULL),
(47, 'French', 'français, langue française', 'fr', NULL, NULL),
(48, 'Fula; Fulah; Pulaar;', 'Fulfulde, Pulaar, Pular', 'ff', NULL, NULL),
(49, 'Galician', 'Galego', 'gl', NULL, NULL),
(50, 'Georgian', 'ქართული', 'ka', NULL, NULL),
(51, 'German', 'Deutsch', 'de', NULL, NULL),
(52, 'Greek, Modern', 'Ελληνικά', 'el', NULL, NULL),
(53, 'Guaraní', 'Avañeẽ', 'gn', NULL, NULL),
(54, 'Gujarati', 'ગુજરાતી', 'gu', NULL, NULL),
(55, 'Haitian; Haitian Cre', 'Kreyòl ayisyen', 'ht', NULL, NULL),
(56, 'Hausa', 'Hausa, هَوُسَ', 'ha', NULL, NULL),
(57, 'Hebrew (modern)', 'עברית', 'he', NULL, NULL),
(58, 'Herero', 'Otjiherero', 'hz', NULL, NULL),
(59, 'Hindi', 'हिन्दी, हिंदी', 'hi', NULL, NULL),
(60, 'Hiri Motu', 'Hiri Motu', 'ho', NULL, NULL),
(61, 'Hungarian', 'Magyar', 'hu', NULL, NULL),
(62, 'Interlingua', 'Interlingua', 'ia', NULL, NULL),
(63, 'Indonesian', 'Bahasa Indonesia', 'id', NULL, NULL),
(64, 'Interlingue', 'Originally called Occidental; then Interlingue after WWII', 'ie', NULL, NULL),
(65, 'Irish', 'Gaeilge', 'ga', NULL, NULL),
(66, 'Igbo', 'Asụsụ Igbo', 'ig', NULL, NULL),
(67, 'Inupiaq', 'Iñupiaq, Iñupiatun', 'ik', NULL, NULL),
(68, 'Ido', 'Ido', 'io', NULL, NULL),
(69, 'Icelandic', 'Íslenska', 'is', NULL, NULL),
(70, 'Italian', 'Italiano', 'it', NULL, NULL),
(71, 'Inuktitut', 'ᐃᓄᒃᑎᑐᑦ', 'iu', NULL, NULL),
(72, 'Japanese', '日本語 (にほんご／にっぽんご)', 'ja', NULL, NULL),
(73, 'Javanese', 'basa Jawa', 'jv', NULL, NULL),
(74, 'Kalaallisut, Greenla', 'kalaallisut, kalaallit oqaasii', 'kl', NULL, NULL),
(75, 'Kannada', 'ಕನ್ನಡ', 'kn', NULL, NULL),
(76, 'Kanuri', 'Kanuri', 'kr', NULL, NULL),
(77, 'Kashmiri', 'कश्मीरी, كشميري‎', 'ks', NULL, NULL),
(78, 'Kazakh', 'Қазақ тілі', 'kk', NULL, NULL),
(79, 'Khmer', 'ភាសាខ្មែរ', 'km', NULL, NULL),
(80, 'Kikuyu, Gikuyu', 'Gĩkũyũ', 'ki', NULL, NULL),
(81, 'Kinyarwanda', 'Ikinyarwanda', 'rw', NULL, NULL),
(82, 'Kirghiz, Kyrgyz', 'кыргыз тили', 'ky', NULL, NULL),
(83, 'Komi', 'коми кыв', 'kv', NULL, NULL),
(84, 'Kongo', 'KiKongo', 'kg', NULL, NULL),
(85, 'Korean', '한국어 (韓國語), 조선말 (朝鮮語)', 'ko', NULL, NULL),
(86, 'Kurdish', 'Kurdî, كوردی‎', 'ku', NULL, NULL),
(87, 'Kwanyama, Kuanyama', 'Kuanyama', 'kj', NULL, NULL),
(88, 'Latin', 'latine, lingua latina', 'la', NULL, NULL),
(89, 'Luxembourgish, Letze', 'Lëtzebuergesch', 'lb', NULL, NULL),
(90, 'Luganda', 'Luganda', 'lg', NULL, NULL),
(91, 'Limburgish, Limburga', 'Limburgs', 'li', NULL, NULL),
(92, 'Lingala', 'Lingála', 'ln', NULL, NULL),
(93, 'Lao', 'ພາສາລາວ', 'lo', NULL, NULL),
(94, 'Lithuanian', 'lietuvių kalba', 'lt', NULL, NULL),
(95, 'Luba-Katanga', '', 'lu', NULL, NULL),
(96, 'Latvian', 'latviešu valoda', 'lv', NULL, NULL),
(97, 'Manx', 'Gaelg, Gailck', 'gv', NULL, NULL),
(98, 'Macedonian', 'македонски јазик', 'mk', NULL, NULL),
(99, 'Malagasy', 'Malagasy fiteny', 'mg', NULL, NULL),
(100, 'Malay', 'bahasa Melayu, بهاس ملايو‎', 'ms', NULL, NULL),
(101, 'Malayalam', 'മലയാളം', 'ml', NULL, NULL),
(102, 'Maltese', 'Malti', 'mt', NULL, NULL),
(103, 'Māori', 'te reo Māori', 'mi', NULL, NULL),
(104, 'Marathi (Marāṭhī)', 'मराठी', 'mr', NULL, NULL),
(105, 'Marshallese', 'Kajin M̧ajeļ', 'mh', NULL, NULL),
(106, 'Mongolian', 'монгол', 'mn', NULL, NULL),
(107, 'Nauru', 'Ekakairũ Naoero', 'na', NULL, NULL),
(108, 'Navajo, Navaho', 'Diné bizaad, Dinékʼehǰí', 'nv', NULL, NULL),
(109, 'Norwegian Bokmål', 'Norsk bokmål', 'nb', NULL, NULL),
(110, 'North Ndebele', 'isiNdebele', 'nd', NULL, NULL),
(111, 'Nepali', 'नेपाली', 'ne', NULL, NULL),
(112, 'Ndonga', 'Owambo', 'ng', NULL, NULL),
(113, 'Norwegian Nynorsk', 'Norsk nynorsk', 'nn', NULL, NULL),
(114, 'Norwegian', 'Norsk', 'no', NULL, NULL),
(115, 'Nuosu', 'ꆈꌠ꒿ Nuosuhxop', 'ii', NULL, NULL),
(116, 'South Ndebele', 'isiNdebele', 'nr', NULL, NULL),
(117, 'Occitan', 'Occitan', 'oc', NULL, NULL),
(118, 'Ojibwe, Ojibwa', 'ᐊᓂᔑᓈᐯᒧᐎᓐ', 'oj', NULL, NULL),
(119, 'Old Church Slavonic,', 'ѩзыкъ словѣньскъ', 'cu', NULL, NULL),
(120, 'Oromo', 'Afaan Oromoo', 'om', NULL, NULL),
(121, 'Oriya', 'ଓଡ଼ିଆ', 'or', NULL, NULL),
(122, 'Ossetian, Ossetic', 'ирон æвзаг', 'os', NULL, NULL),
(123, 'Panjabi, Punjabi', 'ਪੰਜਾਬੀ, پنجابی‎', 'pa', NULL, NULL),
(124, 'Pāli', 'पाऴि', 'pi', NULL, NULL),
(125, 'Persian', 'فارسی', 'fa', NULL, NULL),
(126, 'Polish', 'polski', 'pl', NULL, NULL),
(127, 'Pashto, Pushto', 'پښتو', 'ps', NULL, NULL),
(128, 'Portuguese', 'Português', 'pt', NULL, NULL),
(129, 'Quechua', 'Runa Simi, Kichwa', 'qu', NULL, NULL),
(130, 'Romansh', 'rumantsch grischun', 'rm', NULL, NULL),
(131, 'Kirundi', 'kiRundi', 'rn', NULL, NULL),
(132, 'Romanian, Moldavian,', 'română', 'ro', NULL, NULL),
(133, 'Russian', 'русский язык', 'ru', NULL, NULL),
(134, 'Sanskrit (Saṁskṛta)', 'संस्कृतम्', 'sa', NULL, NULL),
(135, 'Sardinian', 'sardu', 'sc', NULL, NULL),
(136, 'Sindhi', 'सिन्धी, سنڌي، سندھی‎', 'sd', NULL, NULL),
(137, 'Northern Sami', 'Davvisámegiella', 'se', NULL, NULL),
(138, 'Samoan', 'gagana faa Samoa', 'sm', NULL, NULL),
(139, 'Sango', 'yângâ tî sängö', 'sg', NULL, NULL),
(140, 'Serbian', 'српски језик', 'sr', NULL, NULL),
(141, 'Scottish Gaelic; Gae', 'Gàidhlig', 'gd', NULL, NULL),
(142, 'Shona', 'chiShona', 'sn', NULL, NULL),
(143, 'Sinhala, Sinhalese', 'සිංහල', 'si', NULL, NULL),
(144, 'Slovak', 'slovenčina', 'sk', NULL, NULL),
(145, 'Slovene', 'slovenščina', 'sl', NULL, NULL),
(146, 'Somali', 'Soomaaliga, af Soomaali', 'so', NULL, NULL),
(147, 'Southern Sotho', 'Sesotho', 'st', NULL, NULL),
(148, 'Spanish; Castilian', 'español, castellano', 'es', NULL, NULL),
(149, 'Sundanese', 'Basa Sunda', 'su', NULL, NULL),
(150, 'Swahili', 'Kiswahili', 'sw', NULL, NULL),
(151, 'Swati', 'SiSwati', 'ss', NULL, NULL),
(152, 'Swedish', 'svenska', 'sv', NULL, NULL),
(153, 'Tamil', 'தமிழ்', 'ta', NULL, NULL),
(154, 'Telugu', 'తెలుగు', 'te', NULL, NULL),
(155, 'Tajik', 'тоҷикӣ, toğikī, تاجیکی‎', 'tg', NULL, NULL),
(156, 'Thai', 'ไทย', 'th', NULL, NULL),
(157, 'Tigrinya', 'ትግርኛ', 'ti', NULL, NULL),
(158, 'Tibetan Standard, Ti', 'བོད་ཡིག', 'bo', NULL, NULL),
(159, 'Turkmen', 'Türkmen, Түркмен', 'tk', NULL, NULL),
(160, 'Tagalog', 'Wikang Tagalog, ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔', 'tl', NULL, NULL),
(161, 'Tswana', 'Setswana', 'tn', NULL, NULL),
(162, 'Tonga (Tonga Islands', 'faka Tonga', 'to', NULL, NULL),
(163, 'Turkish', 'Türkçe', 'tr', NULL, NULL),
(164, 'Tsonga', 'Xitsonga', 'ts', NULL, NULL),
(165, 'Tatar', 'татарча, tatarça, تاتارچا‎', 'tt', NULL, NULL),
(166, 'Twi', 'Twi', 'tw', NULL, NULL),
(167, 'Tahitian', 'Reo Tahiti', 'ty', NULL, NULL),
(168, 'Uighur, Uyghur', 'Uyƣurqə, ئۇيغۇرچە‎', 'ug', NULL, NULL),
(169, 'Ukrainian', 'українська', 'uk', NULL, NULL),
(170, 'Urdu', 'اردو', 'ur', NULL, NULL),
(171, 'Uzbek', 'zbek, Ўзбек, أۇزبېك‎', 'uz', NULL, NULL),
(172, 'Venda', 'Tshivenḓa', 've', NULL, NULL),
(173, 'Vietnamese', 'Tiếng Việt', 'vi', NULL, NULL),
(174, 'Volapük', 'Volapük', 'vo', NULL, NULL),
(175, 'Walloon', 'Walon', 'wa', NULL, NULL),
(176, 'Welsh', 'Cymraeg', 'cy', NULL, NULL),
(177, 'Wolof', 'Wollof', 'wo', NULL, NULL),
(178, 'Western Frisian', 'Frysk', 'fy', NULL, NULL),
(179, 'Xhosa', 'isiXhosa', 'xh', NULL, NULL),
(180, 'Yiddish', 'ייִדיש', 'yi', NULL, NULL),
(181, 'Yoruba', 'Yorùbá', 'yo', NULL, NULL),
(182, 'Zhuang, Chuang', 'Saɯ cueŋƅ, Saw cuengh', 'za', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_cards`
--

CREATE TABLE `loyalty_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_points` int DEFAULT NULL,
  `per_order_minimum_amount` int DEFAULT NULL,
  `per_order_points` int DEFAULT NULL,
  `per_purchase_minimum_amount` int DEFAULT NULL,
  `amount_per_loyalty_point` int DEFAULT NULL,
  `redeem_points_per_primary_currency` int DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0-Active, 1-Deactive, 2-Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loyalty_check` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0-Active, 1-Deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map_providers`
--

CREATE TABLE `map_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT ' 0 for no, 1 for yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `map_providers`
--

INSERT INTO `map_providers` (`id`, `provider`, `keyword`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Google Map', 'google_map', 1, NULL, NULL),
(2, 'Map Box', 'map_box', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_admins_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_07_103301_create_countries_table', 1),
(5, '2020_12_07_103302_create_currencies_table', 1),
(6, '2020_12_07_103380_create_languages_table', 1),
(7, '2020_12_07_103418_create_notification_types_table', 1),
(8, '2020_12_07_103419_create_blocked_tokens_table', 1),
(9, '2020_12_21_104934_create_clients_table', 1),
(10, '2020_12_21_120042_create_roles_table', 1),
(11, '2020_12_21_135144_create_users_table', 1),
(12, '2020_12_22_121255_create_categories_table', 1),
(13, '2020_12_22_260417_create_category_translations_table', 1),
(14, '2020_12_24_103343_create_map_providers_table', 1),
(15, '2020_12_24_104834_create_sms_providers_table', 1),
(16, '2020_12_25_095834_create_banners_table', 1),
(17, '2020_12_25_095943_create_cms_table', 1),
(18, '2020_12_25_114722_create_templates_table', 1),
(19, '2020_12_25_124722_create_client_preferences_table', 1),
(20, '2020_12_26_095929_create_promocodes_table', 1),
(21, '2020_12_26_100004_create_terminologies_table', 1),
(22, '2020_12_26_100013_create_taxes_table', 1),
(23, '2020_12_26_100026_create_accounts_table', 1),
(24, '2020_12_26_100036_create_payments_table', 1),
(25, '2020_12_26_100053_create_reports_table', 1),
(26, '2020_12_29_073256_add_fields_to_users_table', 2),
(27, '2020_12_29_121021_create_client_languages_table', 3),
(28, '2020_12_30_072614_add_fields_to_client_preferences_table', 4),
(29, '2020_12_30_095834_create_banners_table', 5),
(30, '2020_12_30_125834_create_banners_table', 6),
(31, '2020_12_29_142820_create_categories_table', 7),
(32, '2020_12_29_142836_create_category_translations_table', 8),
(33, '2020_12_29_152820_create_attributes_table', 8),
(34, '2020_12_29_343339_create_category_filterable_attributes_table', 8),
(37, '2020_12_31_152820_create_attributes_table', 9),
(39, '2020_12_31_343339_create_category_filterable_attributes_table', 9),
(49, '2020_12_30_053607_create_vendors_table', 13),
(50, '2020_12_30_060809_create_vendor_users_table', 13),
(51, '2020_12_30_061924_create_service_areas_table', 14),
(52, '2020_12_31_142820_create_categories_table', 9),
(53, '2020_12_31_142836_create_category_translations_table', 9),
(54, '2020_12_31_165834_create_banners_table', 9),
(55, '2020_12_31_263025_create_vendor_slots_table', 15),
(56, '2020_12_31_323159_create_vendor_slot_dates_table', 15),
(57, '2020_12_31_325657_create_slot_days_table', 15),
(58, '2021_01_01_042820_create_attributes_table', 10),
(59, '2021_01_01_132854_create_attribute_translations_table', 10),
(60, '2021_01_01_135150_create_attribute_families_table', 10),
(61, '2021_01_01_135152_create_attribute_groups_table', 11),
(62, '2021_01_01_140832_create_attribute_options_table', 12),
(63, '2021_01_01_140856_create_attribute_option_translations_table', 12),
(64, '2021_01_01_343339_create_category_filterable_attributes_table', 12),
(77, '2021_01_14_053038_add_fields_to_vendors_table', 16),
(79, '2021_01_14_063531_create_client_currencies_table', 17),
(86, '2021_01_14_114953_create_variants_table', 18),
(87, '2021_01_14_115058_create_variant_categories_table', 18),
(88, '2021_01_14_115141_create_variant_translations_table', 18),
(89, '2021_01_14_115200_create_variant_options_table', 18),
(90, '2021_01_14_115217_create_variant_option_translations_table', 18),
(91, '2021_01_14_135222_create_brands_table', 19),
(92, '2021_01_18_141503_create_brand_categories_table', 19),
(93, '2021_01_18_141534_create_brand_translations_table', 20),
(95, '2021_01_19_103352_create_category_histories_table', 21),
(96, '2021_01_19_125204_create_tax_categories_table', 22),
(97, '2021_01_19_125318_create_tax_rates_table', 23),
(98, '2021_01_19_125451_create_tax_rate_categories_table', 23),
(99, '2021_01_20_114648_create_addon_sets_table', 24),
(100, '2021_01_20_114706_create_addon_set_translations_table', 24),
(101, '2021_01_20_114724_create_addon_options_table', 24),
(102, '2021_01_20_114734_create_addon_option_translations_table', 24),
(103, '2020_12_07_100603_create_types_table', 25),
(114, '2021_01_20_093635_create_media_table', 29),
(115, '2021_01_21_101637_create_vendor_media_table', 30),
(116, '2021_01_21_112832_create_products_table', 30),
(117, '2021_01_21_112848_create_product_translations_table', 30),
(118, '2021_01_22_101046_create_product_categories_table', 30),
(119, '2021_01_22_113717_create_product_addons_table', 30),
(120, '2021_01_22_113948_create_product_cross_sells_table', 30),
(121, '2021_01_22_114102_create_product_up_sells_table', 30),
(122, '2021_01_22_114129_create_product_related_table', 30),
(123, '2021_01_22_134800_create_product_variants_table', 30),
(124, '2021_01_22_141044_create_product_variant_sets_table', 30),
(128, '2021_02_01_101734_create_product_images_table', 31),
(129, '2021_02_03_052127_create_product_variant_images_table', 31),
(132, '2021_02_19_061315_create_user_verifications_table', 32),
(134, '2021_02_19_061327_create_user_devices_table', 33),
(135, '2020_12_30_095943_create_cms_table', 34),
(137, '2021_02_20_100004_create_terminologies_table', 35),
(138, '2021_02_20_100026_create_accounts_table', 35),
(139, '2021_02_20_100036_create_payments_table', 35),
(140, '2021_02_20_100053_create_reports_table', 35),
(142, '2021_02_26_094556_create_category_tags_table', 36),
(143, '2021_03_01_092608_create_user_addresses_table', 37),
(150, '2021_03_02_060411_create_promocodes_table', 38),
(151, '2021_03_02_081409_create_promocode_users_table', 38),
(152, '2021_03_02_081423_create_promocode_products_table', 38),
(153, '2021_03_09_074202_add_port_to_clients_table', 39),
(154, '2021_03_25_064409_add_social_login_field', 40),
(155, '2021_03_25_072244_add_brands_field', 40),
(156, '2019_10_13_000000_create_social_credentials_table', 41),
(157, '2021_04_14_055025_create_user_wishlists_table', 41),
(158, '2021_04_15_071315_create_user_verifications_table', 41),
(159, '2021_04_15_125922_create_loyalty_cards_table', 41),
(160, '2021_04_16_074202_add_image_to_users_table', 42),
(161, '2021_04_19_091007_create_promo_types_table', 42),
(162, '2021_04_19_191007_create_promocodes_table', 43),
(163, '2021_04_19_201007_create_promocode_restrictions_table', 43),
(164, '2021_04_20_055234_create_promo_types_table', 44),
(165, '2021_04_20_055359_create_promocodes_table', 45),
(166, '2021_04_20_055509_create_promocode_restrictions_table', 45),
(167, '2021_04_20_054439_create_carts_table', 46),
(168, '2021_04_20_055624_create_cart_coupons_table', 46),
(169, '2021_04_20_055625_create_cart_products_table', 46),
(170, '2021_04_20_092608_create_user_addresses_table', 47),
(171, '2021_04_28_041838_create_cart_addons_table', 48),
(172, '2021_04_29_100739_add_currency_field_in_cart_products', 49),
(173, '2021_05_03_092015_create_orders_table', 50),
(174, '2021_05_04_070811_create_order_vendors_table', 50),
(175, '2021_05_04_071200_create_order_products_table', 50),
(176, '2021_05_04_071929_create_order_product_addons_table', 50),
(177, '2021_05_05_080739_add_currency_field_in_cart_products', 51),
(178, '2021_05_07_145709_create_promo_usages_table', 52),
(179, '2021_05_10_034916_add_fields_to_promocodes_table', 52),
(180, '2021_05_10_052517_create_celebrities_table', 52),
(181, '2021_05_10_053007_create_celebrity_product_table', 52),
(182, '2021_05_10_131738_create_promocode_details_table', 53),
(183, '2021_05_11_124314_add_fields_to_preferences_table', 53),
(184, '2021_05_12_050135_create_user_loyalty_points_table', 53),
(185, '2021_05_12_050252_create_user_loyalty_point_histories', 53),
(186, '2021_05_12_050529_alter_promocode_image_field_table', 53),
(187, '2021_05_12_102501_alter_promocodes_short_desc_field_table', 54),
(188, '2021_05_11_095651_create_wallets_table', 55),
(189, '2021_05_11_103912_create_wallet_histories_table', 55),
(190, '2021_05_12_100036_create_payments_table', 56),
(191, '2021_05_12_115651_create_wallets_table', 57),
(192, '2021_05_12_123912_create_wallet_histories_table', 57),
(193, '2021_05_13_053118_create_refer_and_earns_table', 57),
(194, '2021_05_13_080525_create_user_refferals_table', 57),
(195, '2021_05_13_095454_alter_cart_coupons_for_vendor_id_field_table', 57),
(196, '2021_05_13_195454_alter_cart_coupons_for_vendor_id_field_table', 58),
(197, '2021_05_13_102448_alter_cart_coupons_for_vendor_ids_field_table', 59),
(198, '2021_05_13_153007_create_celebrity_brand_table', 60),
(199, '2021_05_14_083633_add_status_to_orders', 60),
(200, '2021_05_14_084221_add_order_id_to_payments', 60),
(201, '2021_05_14_141254_add_country_id_to_celebrities', 60),
(202, '2021_05_17_092828_create_product_celebrities_table', 61),
(203, '2021_05_17_141254_add_description_to_celebrities', 61),
(204, '2021_05_19_042503_create_payment_options_table', 62),
(205, '2021_05_19_042544_create_vendor_payment_options_table', 62),
(206, '2021_05_20_065410_alter_orders_table_order_no', 63),
(207, '2019_09_17_051112_create_api_logs_table', 64),
(208, '2021_05_20_123811_create_jobs_table', 64),
(209, '2021_05_21_045823_add_phonecode_in_address_table', 64),
(210, '2021_05_21_045823_change_county_field_type_table', 65),
(211, '2021_05_21_082602_alter_order_products_table', 66),
(212, '2021_05_21_103918_alter_order_products_for_rename_table_table', 66),
(213, '2021_05_21_113803_create_vendor_categories_table', 66),
(214, '2021_05_25_100950_alter_order_vendors_table', 67),
(215, '2021_05_25_104437_alter_order_vendors_table_for_coupon_code', 68),
(216, '2021_05_27_091733_add_wishlist_field_in_categories_table', 69),
(217, '2021_05_27_112637_add_status_in_product_variants_table', 70),
(218, '2021_05_28_051503_add_timezone_in_users_table', 71),
(219, '2021_05_31_062720_add_category_switch_in_vendors_table', 71),
(220, '2021_05_31_090803_create_vendor_templetes_table', 72),
(221, '2021_05_31_091703_add_templete_id_in_vendors_table', 72),
(222, '2021_06_01_043327_create_timezones_table', 73),
(223, '2021_06_01_043453_create_order_status_table', 73),
(224, '2021_06_01_051302_add_timezone_field_users_table', 73),
(225, '2021_06_01_113407_alter_promo_codes_table', 74),
(226, '2021_06_03_061348_add_delete_at_products_table', 74),
(227, '2021_06_09_043732_add_loyalty_points_earned_orders_table', 75),
(228, '2021_06_09_074633_alter_cart_addons_table', 75),
(229, '2018_11_06_222923_create_transactions_table', 76),
(230, '2018_11_07_192923_create_transfers_table', 76),
(231, '2018_11_07_202152_update_transfers_table', 76),
(232, '2018_11_15_124230_create_wallets_table', 77),
(233, '2018_11_19_164609_update_transactions_table', 77),
(234, '2018_11_20_133759_add_fee_transfers_table', 77),
(235, '2018_11_22_131953_add_status_transfers_table', 77),
(236, '2018_11_22_133438_drop_refund_transfers_table', 77),
(237, '2019_05_13_111553_update_status_transfers_table', 77),
(238, '2019_06_25_103755_add_exchange_status_transfers_table', 77),
(239, '2019_07_29_184926_decimal_places_wallets_table', 77),
(240, '2019_10_02_193759_add_discount_transfers_table', 77),
(241, '2020_10_30_193412_add_meta_wallets_table', 77),
(242, '2021_05_21_063543_permission_table_for_acl', 77),
(243, '2021_05_21_074707_user_permissions_table_for_acl', 77),
(244, '2021_05_25_094250_user_vendors_table_for_acl', 77),
(245, '2021_05_28_052713_add_code_in_user', 77),
(246, '2021_05_28_052713_add_superadmin_in_client', 77),
(247, '2021_05_28_052713_add_superadmin_in_user', 77),
(248, '2021_06_08_094834_create_csv_product_imports_table', 77),
(249, '2021_06_10_074037_alter_preference_dispatch_new_keys', 77),
(250, '2021_06_10_075653_add_credentials_to_payment_options', 77),
(251, '2021_06_10_094428_alter_categories_table_for_deleted_at', 77),
(252, '2021_06_11_083205_create_csv_vendor_imports_table', 77),
(253, '2021_06_14_050458_create_app_stylings_table', 77),
(254, '2021_06_14_050649_create_app_styling_options_table', 77),
(255, '2021_06_14_065037_alter_currency_id_cart_products_table', 77),
(256, '2021_06_14_105745_drop_vendor_payment_options_table', 77),
(257, '2021_06_15_102257_rename_order_status_table', 77),
(258, '2021_06_15_102631_create_dispatcher_status_options_table', 77),
(259, '2021_06_15_103435_create_order_statuses_table', 77),
(260, '2021_06_15_103450_create_dispatcher_statuses_table', 77),
(261, '2021_06_16_051848_rename_order_status2_table', 77),
(262, '2021_06_16_052121_add_vendor_id_to_order_status', 77),
(263, '2021_06_16_052903_rename_dispatcher_statuses_table', 77),
(264, '2021_06_16_052952_add_vendor_id_to_dispatcher_status', 77),
(265, '2021_06_16_064425_add_timezone_to_user_table', 77),
(266, '2021_06_16_110618_add_refer_and_earn_columns_to_client_preferences', 77),
(267, '2021_06_16_132604_drop_wallets_table', 78),
(268, '2021_06_17_044423_alter_order_vendor_web_hook_code_table', 78),
(269, '2021_06_18_072955_addtrackingurlinordervendor', 78),
(270, '2021_06_18_112628_alter_some_table_for_ref', 78),
(271, '2021_06_21_064857_add_total_delivery_fee_to_orders', 78),
(272, '2021_06_21_065449_orderproductratingstable', 78),
(273, '2021_06_21_094217_add_template_id_field_to_app_styling_options_table', 78),
(274, '2021_06_21_123621_alter_user_user_id_field_for_order_vendors_table', 78),
(275, '2021_06_21_123928_add_web_color_field_to_client_preferences_table', 78),
(276, '2021_06_22_062736_createreviewfilestable', 78),
(277, '2021_06_22_063355_alterorderproductratingsstatustable', 78),
(278, '2021_06_23_063853_add_pharmacy_check_field_to_client_preferences_table', 78),
(279, '2021_06_24_044626_add_description_to_users_table', 78),
(280, '2021_06_24_045847_add_pharmacy_check_field_to_products_table', 78),
(281, '2021_06_24_064903_create_cart_product_prescriptions_table', 78),
(282, '2021_06_24_122153_create_order_product_prescriptions_table', 78),
(283, '2021_06_25_045048_create_dispatcher_template_type_options_table', 78),
(284, '2021_06_25_052752_create_dispatcher_warning_pages_table', 78),
(285, '2021_06_25_053039_add_vendor_id_field_to_order_product_prescriptions_table', 78),
(286, '2021_06_25_054358_add_vendor_id_field_to_cart_product_prescriptions_table', 78),
(287, '2021_06_25_083707_alter_category_table_for_dipatcher_field_in_tables', 78),
(288, '2021_06_28_110323_add_category_id_field_to_order_products_table', 78),
(289, '2021_06_28_112229_alter_type_table_for_sequences_field_in_tables', 78),
(290, '2021_06_28_134738_alter_vendor_for_slug_tables', 78),
(291, '2021_06_29_045943_add_admin_commission_fields_to_order_vendors_table', 78),
(292, '2021_06_29_063720_add_actual_amount_fields_to_order_vendors_table', 78),
(293, '2021_06_29_084253_add_taxable_amount_fields_to_order_vendors_table', 78),
(294, '2021_06_29_094113_change_taxable_amount_fields_to_order_vendors_table', 78),
(295, '2021_06_29_102709_createtableorderreturnrequests', 78),
(296, '2021_06_29_121116_change_limit_fields_to_promocodes_table', 78),
(297, '2021_06_30_053518_createtablereturn_reasons', 78),
(298, '2021_06_30_095821_createtablereturnrequestfiles', 78),
(299, '2021_06_30_123018_add_image_path_field_to_dispatcher_template_type_options_table', 78),
(300, '2021_06_30_123341_add_image_path_field_to_dispatcher_warning_pages_table', 78),
(301, '2021_06_30_130644_alter_vendor_orders_add_payment_option_id_table', 78),
(302, '2021_07_01_071008_alter_orders_for_loyalty_membership_id_table', 78),
(303, '2021_07_01_072413_add_dine_in_fields_to_client_preferences_table', 78),
(304, '2021_07_01_124823_create_order_taxes_table', 78),
(305, '2021_07_02_123701_alter_order_vendor_products_for_order_vendor_id', 78),
(306, '2021_07_05_045644_add_slug_in_celebrities_table', 78),
(307, '2021_07_05_075226_alter_types_for_images_table', 78),
(308, '2021_07_05_104133_addreasonbyvendorinreturnrequests', 78),
(309, '2021_07_05_123711_add_loyalty_check_field_to_loyalty_cards_table', 78),
(310, '2021_07_06_045605_alter_vendors_table_forfew_fields', 78),
(311, '2021_07_06_084032_create_subscription_validities_table', 78),
(312, '2020_01_01_000001_create_plans_table', 79),
(313, '2020_01_01_000002_create_plan_features_table', 79),
(314, '2020_01_01_000003_create_plan_subscriptions_table', 79),
(315, '2020_01_01_000004_create_plan_subscription_usage_table', 79),
(316, '2021_07_06_054045_addpickupdeliverykeysinclientprefereance', 79);

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_option_id` tinyint NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint NOT NULL COMMENT '0-No, 1-Yes',
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `loyalty_membership_id` int UNSIGNED DEFAULT NULL,
  `loyalty_points_used` decimal(10,2) DEFAULT NULL,
  `loyalty_amount_saved` decimal(10,2) DEFAULT NULL,
  `loyalty_points_earned` decimal(10,2) DEFAULT NULL,
  `paid_via_wallet` tinyint NOT NULL COMMENT '0-No, 1-Yes',
  `paid_via_loyalty` tinyint NOT NULL COMMENT '0-No, 1-Yes',
  `total_amount` decimal(8,2) UNSIGNED DEFAULT NULL,
  `total_discount` decimal(8,2) UNSIGNED DEFAULT NULL,
  `total_delivery_fee` decimal(8,2) DEFAULT NULL,
  `taxable_amount` decimal(8,2) UNSIGNED DEFAULT NULL,
  `payable_amount` decimal(8,2) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_method` tinyint NOT NULL DEFAULT '1' COMMENT '1 - Credit Card, 2 - Cash On Delivery, 3 - Paypal, 4 - Wallet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_addons`
--

CREATE TABLE `order_product_addons` (
  `id` bigint UNSIGNED NOT NULL,
  `order_product_id` bigint UNSIGNED NOT NULL,
  `addon_id` bigint UNSIGNED NOT NULL,
  `option_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_prescriptions`
--

CREATE TABLE `order_product_prescriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `prescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_ratings`
--

CREATE TABLE `order_product_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `order_vendor_product_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `review` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_rating_files`
--

CREATE TABLE `order_product_rating_files` (
  `id` bigint UNSIGNED NOT NULL,
  `order_product_rating_id` bigint UNSIGNED NOT NULL,
  `file` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_return_requests`
--

CREATE TABLE `order_return_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `order_vendor_product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `return_by` bigint UNSIGNED NOT NULL,
  `reason` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reason_by_vendor` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','Accepted','Rejected','On-Hold') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_return_request_files`
--

CREATE TABLE `order_return_request_files` (
  `id` bigint UNSIGNED NOT NULL,
  `order_return_request_id` bigint UNSIGNED NOT NULL,
  `file` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_options`
--

CREATE TABLE `order_status_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1 - for order, 2 - fordispatch',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1 - active, 0 - inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_options`
--

INSERT INTO `order_status_options` (`id`, `title`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Placed', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20'),
(2, 'Accepted', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20'),
(3, 'Rejected', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20'),
(4, 'Processing', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20'),
(5, 'Out For Delivery', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20'),
(6, 'Delivered', 1, 1, '2021-06-24 05:55:20', '2021-06-24 05:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_taxes`
--

CREATE TABLE `order_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_vendors`
--

CREATE TABLE `order_vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `delivery_fee` decimal(8,2) UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0-Created, 1-Confirmed, 2-Dispatched, 3-Delivered',
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxable_amount` decimal(10,2) DEFAULT NULL,
  `subtotal_amount` decimal(10,2) DEFAULT NULL,
  `payable_amount` decimal(8,2) DEFAULT NULL,
  `discount_amount` decimal(8,2) DEFAULT NULL,
  `web_hook_code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_commission_percentage_amount` decimal(10,2) DEFAULT NULL,
  `admin_commission_fixed_amount` decimal(10,2) DEFAULT NULL,
  `coupon_paid_by` tinyint DEFAULT '1' COMMENT '0-Vendor, 1-Admin',
  `payment_option_id` tinyint DEFAULT NULL,
  `order_status_option_id` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dispatch_traking_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `order_vendor_products`
--

CREATE TABLE `order_vendor_products` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `order_vendor_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `taxable_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `meta_title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keyword` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_published` tinyint NOT NULL DEFAULT '0' COMMENT '0 draft and 1 for published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance_transaction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `payment_options`
--

CREATE TABLE `payment_options` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credentials` json DEFAULT NULL COMMENT 'credentials in json format',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 inactive, 1 active, 2 delete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Dumping data for table `payment_options`
--

INSERT INTO `payment_options` (`id`, `code`, `path`, `title`, `credentials`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cod', '', 'Cash On Delivery', NULL, 1, NULL, NULL),
(2, 'loyalty-points', '', 'loyalty Points', NULL, 1, NULL, NULL),
(3, 'paypal', 'omnipay/paypal', 'PayPal', NULL, 1, NULL, NULL),
(4, 'stripe', 'omnipay/targetpay', 'Stripe', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `description` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `signup_fee` decimal(8,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_period` smallint UNSIGNED NOT NULL DEFAULT '0',
  `trial_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `invoice_period` smallint UNSIGNED NOT NULL DEFAULT '0',
  `invoice_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `grace_period` smallint UNSIGNED NOT NULL DEFAULT '0',
  `grace_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `prorate_day` tinyint UNSIGNED DEFAULT NULL,
  `prorate_period` tinyint UNSIGNED DEFAULT NULL,
  `prorate_extend_due` tinyint UNSIGNED DEFAULT NULL,
  `active_subscribers_limit` smallint UNSIGNED DEFAULT NULL,
  `sort_order` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `plan_features`
--

CREATE TABLE `plan_features` (
  `id` int UNSIGNED NOT NULL,
  `plan_id` int UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `description` json DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resettable_period` smallint UNSIGNED NOT NULL DEFAULT '0',
  `resettable_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `sort_order` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` int UNSIGNED NOT NULL,
  `subscriber_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_id` bigint UNSIGNED NOT NULL,
  `plan_id` int UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `description` json DEFAULT NULL,
  `trial_ends_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `cancels_at` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscription_usage`
--

CREATE TABLE `plan_subscription_usage` (
  `id` int UNSIGNED NOT NULL,
  `subscription_id` int UNSIGNED NOT NULL,
  `feature_id` int UNSIGNED NOT NULL,
  `used` smallint UNSIGNED NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `type_id` bigint UNSIGNED DEFAULT NULL,
  `country_origin_id` bigint UNSIGNED DEFAULT NULL,
  `is_new` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `is_featured` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `is_live` tinyint NOT NULL DEFAULT '0' COMMENT '0 - draft, 1 - published, 2 - blocked',
  `is_physical` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `weight` decimal(10,4) DEFAULT NULL,
  `weight_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_inventory` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `has_variant` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `sell_when_out_of_stock` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `requires_shipping` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `Requires_last_mile` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `publish_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `tax_category_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pharmacy_check` tinyint DEFAULT '0' COMMENT '0-No, 1-Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_addons`
--

CREATE TABLE `product_addons` (
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `addon_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_celebrities`
--

CREATE TABLE `product_celebrities` (
  `celebrity_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `cross_product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

CREATE TABLE `product_related` (
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `related_product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `upsell_product_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `position` tinyint NOT NULL DEFAULT '1',
  `compare_at_price` decimal(10,2) DEFAULT NULL,
  `barcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `tax_category_id` bigint UNSIGNED DEFAULT NULL,
  `inventory_policy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fulfillment_service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 for avtive, 0 for inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_images`
--

CREATE TABLE `product_variant_images` (
  `product_variant_id` bigint UNSIGNED DEFAULT NULL,
  `product_image_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_sets`
--

CREATE TABLE `product_variant_sets` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `product_variant_id` bigint UNSIGNED DEFAULT NULL,
  `variant_type_id` bigint UNSIGNED DEFAULT NULL,
  `variant_option_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_desc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(12,2) UNSIGNED DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `promo_type_id` bigint UNSIGNED DEFAULT NULL,
  `allow_free_delivery` tinyint DEFAULT '0' COMMENT '0- No, 1- yes',
  `minimum_spend` int UNSIGNED DEFAULT NULL,
  `maximum_spend` int UNSIGNED DEFAULT NULL,
  `first_order_only` tinyint DEFAULT '0' COMMENT '0- No, 1- yes',
  `limit_per_user` int DEFAULT NULL,
  `limit_total` int DEFAULT NULL,
  `paid_by_vendor_admin` tinyint DEFAULT NULL,
  `is_deleted` tinyint DEFAULT '0' COMMENT '0- No, 1- yes',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restriction_on` tinyint DEFAULT '0' COMMENT '0- product, 1-vendor',
  `restriction_type` tinyint DEFAULT '0' COMMENT '0- Include, 1-Exclude'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_details`
--

CREATE TABLE `promocode_details` (
  `id` bigint UNSIGNED NOT NULL,
  `promocode_id` bigint UNSIGNED DEFAULT NULL,
  `refrence_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_restrictions`
--

CREATE TABLE `promocode_restrictions` (
  `promocode_id` bigint UNSIGNED DEFAULT NULL,
  `restriction_type` tinyint DEFAULT '0' COMMENT '0- product, 1-vendor, 2-category',
  `included_product` bigint UNSIGNED DEFAULT NULL,
  `excluded_product` bigint UNSIGNED DEFAULT NULL,
  `excluded_vendor` bigint UNSIGNED DEFAULT NULL,
  `included_vendor` bigint UNSIGNED DEFAULT NULL,
  `included_category` bigint UNSIGNED DEFAULT NULL,
  `excluded_category` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_restrictions_`
--

CREATE TABLE `promocode_restrictions_` (
  `id` bigint UNSIGNED NOT NULL,
  `promocode_id` bigint UNSIGNED DEFAULT NULL,
  `restriction_type` tinyint DEFAULT '0' COMMENT '0- product, 1-vendor, 2-category',
  `data_id` bigint UNSIGNED DEFAULT NULL,
  `is_included` tinyint NOT NULL DEFAULT '1' COMMENT '1 for yes, 0 for no',
  `is_excluded` tinyint NOT NULL DEFAULT '1' COMMENT '1 for yes, 0 for no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `promo_types`
--

CREATE TABLE `promo_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 - Active, 2 - Block, 3 - delete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_types`
--

INSERT INTO `promo_types` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Percentage Discount', 1, NULL, NULL),
(2, 'Fixed Ammount', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo_usages`
--

CREATE TABLE `promo_usages` (
  `id` bigint UNSIGNED NOT NULL,
  `promocode_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `usage_count` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `refer_and_earns`
--

CREATE TABLE `refer_and_earns` (
  `id` bigint UNSIGNED NOT NULL,
  `reffered_by_amount` decimal(8,2) DEFAULT NULL,
  `reffered_to_amount` decimal(8,2) DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_reasons`
--

CREATE TABLE `return_reasons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Block') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL COMMENT '0 - pending, 1 - active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'vendor', 1, NULL, NULL),
(2, 'customer', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_areas`
--

CREATE TABLE `service_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `geo_array` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `zoom_level` smallint NOT NULL DEFAULT '13',
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `slot_days`
--

CREATE TABLE `slot_days` (
  `id` bigint UNSIGNED NOT NULL,
  `slot_id` bigint UNSIGNED DEFAULT NULL,
  `day` tinyint NOT NULL DEFAULT '0' COMMENT '1 sunday, 2 monday, 3 tuesday, 4 wednesday, 5 thursday, 6 friday, 7 saturday',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `sms_providers`
--

CREATE TABLE `sms_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT ' 0 for no, 1 for yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_providers`
--

INSERT INTO `sms_providers` (`id`, `provider`, `keyword`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Twilio Service', 'twilio', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_credentials`
--

CREATE TABLE `social_credentials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_validities`
--

CREATE TABLE `subscription_validities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_core` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no, 1 - yes',
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_zip` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no, 1 - yes',
  `zip_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_categories`
--

CREATE TABLE `tax_rate_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `tax_cate_id` bigint UNSIGNED NOT NULL,
  `tax_rate_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` tinyint NOT NULL DEFAULT '0' COMMENT '1 for web, 2 for app',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `image`, `for`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default/templete.jpg', 1, NULL, NULL),
(2, 'Default', 'default/templete.jpg', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `terminologies`
--

CREATE TABLE `terminologies` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint UNSIGNED NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diff_from_gtm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `payable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint UNSIGNED NOT NULL,
  `wallet_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('deposit','withdraw') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `from_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint UNSIGNED NOT NULL,
  `to_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint UNSIGNED NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint UNSIGNED NOT NULL,
  `withdraw_id` bigint UNSIGNED NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT '0',
  `fee` decimal(64,0) NOT NULL DEFAULT '0',
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sequence` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone_number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified_phone` tinyint NOT NULL DEFAULT '0' COMMENT '0 for no, 1 for yes',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '1 for buyer, 2 for seller',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 - pending, 1 - active, 2 - blocked, 3 - inactive',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `auth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_token` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_token_valid_till` timestamp NULL DEFAULT NULL,
  `phone_token` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token_valid_till` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `is_phone_verified` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `timezone_id` bigint UNSIGNED DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `is_admin` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(15,12) DEFAULT NULL,
  `longitude` decimal(16,12) DEFAULT NULL,
  `pincode` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `phonecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1 - home',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `device_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_loyalty_points`
--

CREATE TABLE `user_loyalty_points` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `points` int DEFAULT '0',
  `loyalty_card_id` bigint UNSIGNED DEFAULT NULL,
  `assigned_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_loyalty_point_histories`
--

CREATE TABLE `user_loyalty_point_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `points` int DEFAULT NULL,
  `earn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'on_purchase, get_as_gift, add_wallet_money',
  `earn_type_id` bigint UNSIGNED DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_refferals`
--

CREATE TABLE `user_refferals` (
  `id` bigint UNSIGNED NOT NULL,
  `refferal_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reffered_by` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_vendors`
--

CREATE TABLE `user_vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_verifications`
--

CREATE TABLE `user_verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `email_token` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_token_valid_till` timestamp NULL DEFAULT NULL,
  `phone_token` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token_valid_till` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `is_phone_verified` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlists`
--

CREATE TABLE `user_wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `product_variant_id` bigint UNSIGNED DEFAULT NULL,
  `added_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1 for dropdown, 2 for color',
  `position` smallint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 - pending, 1 - active, 2 - blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `variant_categories`
--

CREATE TABLE `variant_categories` (
  `variant_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `variant_options`
--

CREATE TABLE `variant_options` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `hexacode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `variant_option_translations`
--

CREATE TABLE `variant_option_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_option_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `variant_translations`
--

CREATE TABLE `variant_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `language_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(15,12) DEFAULT NULL,
  `longitude` decimal(16,12) DEFAULT NULL,
  `order_min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_pre_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_reject_time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_percent` smallint DEFAULT '1',
  `commission_fixed_per_order` decimal(10,2) DEFAULT '0.00',
  `commission_monthly` decimal(10,2) DEFAULT '0.00',
  `dine_in` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `takeaway` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `delivery` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-active, 0-pending, 2-blocked',
  `add_category` tinyint NOT NULL DEFAULT '1' COMMENT '0 for no, 1 for yes',
  `setting` tinyint NOT NULL DEFAULT '0' COMMENT '0 for no, 1 for yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_slot` tinyint NOT NULL DEFAULT '1' COMMENT '1 for yes, 0 for no',
  `vendor_templete_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_categories`
--

CREATE TABLE `vendor_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 - yes, 0 - no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_media`
--

CREATE TABLE `vendor_media` (
  `id` bigint UNSIGNED NOT NULL,
  `media_type` tinyint NOT NULL DEFAULT '1' COMMENT '1 - image, 2 - video, 3 - file',
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order_dispatcher_statuses`
--

CREATE TABLE `vendor_order_dispatcher_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `dispatcher_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `dispatcher_status_option_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order_statuses`
--

CREATE TABLE `vendor_order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `order_vendor_id` bigint UNSIGNED DEFAULT NULL,
  `order_status_option_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_slots`
--

CREATE TABLE `vendor_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `geo_id` bigint UNSIGNED DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `dine_in` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `takeaway` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `delivery` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_slot_dates`
--

CREATE TABLE `vendor_slot_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `specific_date` date NOT NULL,
  `working_today` tinyint NOT NULL DEFAULT '1' COMMENT '1 - yes, 0 - no',
  `dine_in` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `takeaway` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `delivery` tinyint NOT NULL DEFAULT '0' COMMENT '1 for yes, 0 for no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_templetes`
--

CREATE TABLE `vendor_templetes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1 - active, 0 - inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_templetes`
--

INSERT INTO `vendor_templetes` (`id`, `title`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Product', 'Grid', 1, NULL, NULL),
(2, 'Category', 'Grid', 1, NULL, NULL),
(3, 'Product', 'List', 0, NULL, NULL),
(4, 'Category', 'List', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_users`
--

CREATE TABLE `vendor_users` (
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci TABLESPACE `innodb_system`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_options`
--
ALTER TABLE `addon_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_options_addon_id_foreign` (`addon_id`);

--
-- Indexes for table `addon_option_translations`
--
ALTER TABLE `addon_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_option_translations_addon_opt_id_foreign` (`addon_opt_id`),
  ADD KEY `addon_option_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `addon_sets`
--
ALTER TABLE `addon_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_sets_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `addon_set_translations`
--
ALTER TABLE `addon_set_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_set_translations_addon_id_foreign` (`addon_id`),
  ADD KEY `addon_set_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_stylings`
--
ALTER TABLE `app_stylings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_styling_options`
--
ALTER TABLE `app_styling_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_styling_options_app_styling_id_foreign` (`app_styling_id`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `authentication_log`
--
ALTER TABLE `authentication_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_log_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `auto_reject_orders_cron`
--
ALTER TABLE `auto_reject_orders_cron`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_redirect_category_id_foreign` (`redirect_category_id`),
  ADD KEY `banners_redirect_vendor_id_foreign` (`redirect_vendor_id`),
  ADD KEY `banners_name_index` (`name`),
  ADD KEY `banners_status_index` (`status`),
  ADD KEY `banners_start_date_time_index` (`start_date_time`),
  ADD KEY `banners_end_date_time_index` (`end_date_time`);

--
-- Indexes for table `blocked_tokens`
--
ALTER TABLE `blocked_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_position_index` (`position`),
  ADD KEY `brands_status_index` (`status`);

--
-- Indexes for table `brand_categories`
--
ALTER TABLE `brand_categories`
  ADD KEY `brand_categories_brand_id_foreign` (`brand_id`),
  ADD KEY `brand_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_translations_brand_id_foreign` (`brand_id`),
  ADD KEY `brand_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `business_types`
--
ALTER TABLE `business_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_created_by_foreign` (`created_by`),
  ADD KEY `carts_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_addons_cart_product_id_foreign` (`cart_product_id`),
  ADD KEY `cart_addons_addon_id_foreign` (`addon_id`),
  ADD KEY `cart_addons_option_id_foreign` (`option_id`);

--
-- Indexes for table `cart_coupons`
--
ALTER TABLE `cart_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_coupons_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_coupons_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_products_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_products_product_id_foreign` (`product_id`),
  ADD KEY `cart_products_vendor_id_foreign` (`vendor_id`),
  ADD KEY `cart_products_created_by_foreign` (`created_by`),
  ADD KEY `cart_products_variant_id_foreign` (`variant_id`),
  ADD KEY `cart_products_tax_rate_id_foreign` (`tax_rate_id`),
  ADD KEY `cart_products_status_index` (`status`),
  ADD KEY `cart_products_is_tax_applied_index` (`is_tax_applied`),
  ADD KEY `cart_products_currency_id_foreign` (`currency_id`),
  ADD KEY `cart_products_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `cart_product_prescriptions`
--
ALTER TABLE `cart_product_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_prescriptions_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_product_prescriptions_product_id_foreign` (`product_id`),
  ADD KEY `cart_product_prescriptions_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_client_code_foreign` (`client_code`),
  ADD KEY `categories_vendor_id_foreign` (`vendor_id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_type_id_foreign` (`type_id`),
  ADD KEY `categories_status_index` (`status`),
  ADD KEY `categories_is_core_index` (`is_core`),
  ADD KEY `categories_position_index` (`position`),
  ADD KEY `categories_can_add_products_index` (`can_add_products`),
  ADD KEY `categories_display_mode_index` (`display_mode`);

--
-- Indexes for table `category_histories`
--
ALTER TABLE `category_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_histories_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_tags`
--
ALTER TABLE `category_tags`
  ADD KEY `category_tags_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_translations_name_index` (`name`),
  ADD KEY `category_translations_category_id_foreign` (`category_id`),
  ADD KEY `category_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `celebrities`
--
ALTER TABLE `celebrities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `celebrities_email_unique` (`email`),
  ADD KEY `celebrities_country_id_foreign` (`country_id`);

--
-- Indexes for table `celebrity_brands`
--
ALTER TABLE `celebrity_brands`
  ADD KEY `celebrity_brands_celebrity_id_foreign` (`celebrity_id`),
  ADD KEY `celebrity_brands_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `celebrity_product`
--
ALTER TABLE `celebrity_product`
  ADD KEY `celebrity_product_celebrity_id_foreign` (`celebrity_id`),
  ADD KEY `celebrity_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_code_unique` (`code`),
  ADD KEY `clients_country_id_foreign` (`country_id`),
  ADD KEY `clients_phone_number_index` (`phone_number`),
  ADD KEY `clients_custom_domain_index` (`custom_domain`),
  ADD KEY `clients_is_deleted_index` (`is_deleted`),
  ADD KEY `clients_is_blocked_index` (`is_blocked`),
  ADD KEY `clients_database_name_index` (`database_name`),
  ADD KEY `clients_company_name_index` (`company_name`),
  ADD KEY `clients_status_index` (`status`);

--
-- Indexes for table `client_currencies`
--
ALTER TABLE `client_currencies`
  ADD KEY `client_currencies_client_code_foreign` (`client_code`),
  ADD KEY `client_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `client_languages`
--
ALTER TABLE `client_languages`
  ADD KEY `client_languages_client_code_foreign` (`client_code`),
  ADD KEY `client_languages_language_id_foreign` (`language_id`);

--
-- Indexes for table `client_preferences`
--
ALTER TABLE `client_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_preferences_client_code_unique` (`client_code`),
  ADD KEY `client_preferences_fb_login_index` (`fb_login`),
  ADD KEY `client_preferences_twitter_login_index` (`twitter_login`),
  ADD KEY `client_preferences_google_login_index` (`google_login`),
  ADD KEY `client_preferences_apple_login_index` (`apple_login`),
  ADD KEY `client_preferences_verify_email_index` (`verify_email`),
  ADD KEY `client_preferences_verify_phone_index` (`verify_phone`),
  ADD KEY `client_preferences_currency_id_foreign` (`currency_id`),
  ADD KEY `client_preferences_language_id_foreign` (`language_id`),
  ADD KEY `client_preferences_map_provider_foreign` (`map_provider`),
  ADD KEY `client_preferences_sms_provider_foreign` (`sms_provider`),
  ADD KEY `client_preferences_web_template_id_foreign` (`web_template_id`),
  ADD KEY `client_preferences_app_template_id_foreign` (`app_template_id`),
  ADD KEY `client_preferences_is_hyperlocal_index` (`is_hyperlocal`),
  ADD KEY `client_preferences_need_delivery_service_index` (`need_delivery_service`),
  ADD KEY `client_preferences_mail_type_index` (`mail_type`),
  ADD KEY `client_preferences_celebrity_check_index` (`celebrity_check`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_title_unique` (`title`),
  ADD KEY `cms_client_code_foreign` (`client_code`),
  ADD KEY `cms_language_id_foreign` (`language_id`),
  ADD KEY `cms_title_index` (`title`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_code_index` (`code`),
  ADD KEY `countries_name_index` (`name`);

--
-- Indexes for table `csv_product_imports`
--
ALTER TABLE `csv_product_imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csv_product_imports_vendor_id_foreign` (`vendor_id`),
  ADD KEY `csv_product_imports_uploaded_by_foreign` (`uploaded_by`);

--
-- Indexes for table `csv_vendor_imports`
--
ALTER TABLE `csv_vendor_imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `csv_vendor_imports_uploaded_by_foreign` (`uploaded_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_name_index` (`name`),
  ADD KEY `currencies_priority_index` (`priority`),
  ADD KEY `currencies_iso_code_index` (`iso_code`),
  ADD KEY `currencies_iso_numeric_index` (`iso_numeric`);

--
-- Indexes for table `dispatcher_status_options`
--
ALTER TABLE `dispatcher_status_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatcher_template_type_options`
--
ALTER TABLE `dispatcher_template_type_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatcher_warning_pages`
--
ALTER TABLE `dispatcher_warning_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_sort_code_unique` (`sort_code`);

--
-- Indexes for table `loyalty_cards`
--
ALTER TABLE `loyalty_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `map_providers`
--
ALTER TABLE `map_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_types_name_index` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `order_product_addons`
--
ALTER TABLE `order_product_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_addons_order_product_id_foreign` (`order_product_id`),
  ADD KEY `order_product_addons_addon_id_foreign` (`addon_id`),
  ADD KEY `order_product_addons_option_id_foreign` (`option_id`);

--
-- Indexes for table `order_product_prescriptions`
--
ALTER TABLE `order_product_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_prescriptions_order_id_foreign` (`order_id`),
  ADD KEY `order_product_prescriptions_product_id_foreign` (`product_id`),
  ADD KEY `order_product_prescriptions_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `order_product_ratings`
--
ALTER TABLE `order_product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_ratings_order_id_foreign` (`order_id`),
  ADD KEY `order_product_ratings_order_vendor_product_id_foreign` (`order_vendor_product_id`);

--
-- Indexes for table `order_product_rating_files`
--
ALTER TABLE `order_product_rating_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_rating_files_order_product_rating_id_foreign` (`order_product_rating_id`);

--
-- Indexes for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_return_requests_order_vendor_product_id_foreign` (`order_vendor_product_id`),
  ADD KEY `order_return_requests_order_id_foreign` (`order_id`),
  ADD KEY `order_return_requests_return_by_foreign` (`return_by`);

--
-- Indexes for table `order_return_request_files`
--
ALTER TABLE `order_return_request_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_return_request_files_order_return_request_id_foreign` (`order_return_request_id`);

--
-- Indexes for table `order_status_options`
--
ALTER TABLE `order_status_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_vendors`
--
ALTER TABLE `order_vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_vendors_order_id_foreign` (`order_id`),
  ADD KEY `order_vendors_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `order_vendor_products`
--
ALTER TABLE `order_vendor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`),
  ADD KEY `order_products_vendor_id_foreign` (`vendor_id`),
  ADD KEY `order_products_variant_id_foreign` (`variant_id`),
  ADD KEY `order_vendor_products_category_id_foreign` (`category_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_translations_page_id_foreign` (`page_id`),
  ADD KEY `page_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_cart_id_foreign` (`cart_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_features_plan_id_slug_unique` (`plan_id`,`slug`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_subscriptions_slug_unique` (`slug`),
  ADD KEY `plan_subscriptions_subscriber_type_subscriber_id_index` (`subscriber_type`,`subscriber_id`),
  ADD KEY `plan_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_subscription_usage_subscription_id_feature_id_unique` (`subscription_id`,`feature_id`),
  ADD KEY `plan_subscription_usage_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_vendor_id_foreign` (`vendor_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_type_id_foreign` (`type_id`),
  ADD KEY `products_country_origin_id_foreign` (`country_origin_id`),
  ADD KEY `products_is_new_index` (`is_new`),
  ADD KEY `products_is_featured_index` (`is_featured`),
  ADD KEY `products_is_live_index` (`is_live`),
  ADD KEY `products_is_physical_index` (`is_physical`),
  ADD KEY `products_has_inventory_index` (`has_inventory`),
  ADD KEY `products_sell_when_out_of_stock_index` (`sell_when_out_of_stock`),
  ADD KEY `products_requires_shipping_index` (`requires_shipping`),
  ADD KEY `products_requires_last_mile_index` (`Requires_last_mile`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `product_addons`
--
ALTER TABLE `product_addons`
  ADD KEY `product_addons_product_id_foreign` (`product_id`),
  ADD KEY `product_addons_addon_id_foreign` (`addon_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_celebrities`
--
ALTER TABLE `product_celebrities`
  ADD KEY `product_celebrities_celebrity_id_foreign` (`celebrity_id`),
  ADD KEY `product_celebrities_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD KEY `product_cross_sells_product_id_foreign` (`product_id`),
  ADD KEY `product_cross_sells_cross_product_id_foreign` (`cross_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`),
  ADD KEY `product_images_media_id_foreign` (`media_id`);

--
-- Indexes for table `product_related`
--
ALTER TABLE `product_related`
  ADD KEY `product_related_product_id_foreign` (`product_id`),
  ADD KEY `product_related_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_translations_product_id_foreign` (`product_id`),
  ADD KEY `product_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD KEY `product_up_sells_product_id_foreign` (`product_id`),
  ADD KEY `product_up_sells_upsell_product_id_foreign` (`upsell_product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD UNIQUE KEY `product_variants_barcode_unique` (`barcode`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`),
  ADD KEY `product_variants_tax_category_id_foreign` (`tax_category_id`),
  ADD KEY `product_variants_sku_index` (`sku`),
  ADD KEY `product_variants_quantity_index` (`quantity`),
  ADD KEY `product_variants_price_index` (`price`),
  ADD KEY `product_variants_compare_at_price_index` (`compare_at_price`),
  ADD KEY `product_variants_cost_price_index` (`cost_price`);

--
-- Indexes for table `product_variant_images`
--
ALTER TABLE `product_variant_images`
  ADD KEY `product_variant_images_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `product_variant_images_product_image_id_foreign` (`product_image_id`);

--
-- Indexes for table `product_variant_sets`
--
ALTER TABLE `product_variant_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_sets_product_id_foreign` (`product_id`),
  ADD KEY `product_variant_sets_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `product_variant_sets_variant_type_id_foreign` (`variant_type_id`),
  ADD KEY `product_variant_sets_variant_option_id_foreign` (`variant_option_id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocodes_promo_type_id_foreign` (`promo_type_id`),
  ADD KEY `promocodes_created_by_foreign` (`created_by`),
  ADD KEY `promocodes_allow_free_delivery_index` (`allow_free_delivery`),
  ADD KEY `promocodes_minimum_spend_index` (`minimum_spend`),
  ADD KEY `promocodes_maximum_spend_index` (`maximum_spend`),
  ADD KEY `promocodes_first_order_only_index` (`first_order_only`),
  ADD KEY `promocodes_limit_per_user_index` (`limit_per_user`),
  ADD KEY `promocodes_limit_total_index` (`limit_total`),
  ADD KEY `promocodes_paid_by_vendor_admin_index` (`paid_by_vendor_admin`),
  ADD KEY `promocodes_is_deleted_index` (`is_deleted`);

--
-- Indexes for table `promocode_details`
--
ALTER TABLE `promocode_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_restrictions`
--
ALTER TABLE `promocode_restrictions`
  ADD KEY `promocode_restrictions_promocode_id_foreign` (`promocode_id`);

--
-- Indexes for table `promocode_restrictions_`
--
ALTER TABLE `promocode_restrictions_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocode_restrictions__is_included_index` (`is_included`),
  ADD KEY `promocode_restrictions__is_excluded_index` (`is_excluded`),
  ADD KEY `promocode_restrictions__promocode_id_foreign` (`promocode_id`);

--
-- Indexes for table `promo_types`
--
ALTER TABLE `promo_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_usages`
--
ALTER TABLE `promo_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_usages_promocode_id_foreign` (`promocode_id`),
  ADD KEY `promo_usages_user_id_foreign` (`user_id`);

--
-- Indexes for table `refer_and_earns`
--
ALTER TABLE `refer_and_earns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refer_and_earns_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_reasons`
--
ALTER TABLE `return_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_areas`
--
ALTER TABLE `service_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_areas_vendor_id_foreign` (`vendor_id`),
  ADD KEY `service_areas_name_index` (`name`);

--
-- Indexes for table `slot_days`
--
ALTER TABLE `slot_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slot_days_slot_id_foreign` (`slot_id`),
  ADD KEY `slot_days_day_index` (`day`);

--
-- Indexes for table `sms_providers`
--
ALTER TABLE `sms_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_credentials`
--
ALTER TABLE `social_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_validities`
--
ALTER TABLE `subscription_validities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_categories_vendor_id_foreign` (`vendor_id`),
  ADD KEY `tax_categories_code_index` (`code`),
  ADD KEY `tax_categories_is_core_index` (`is_core`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_is_zip_index` (`is_zip`);

--
-- Indexes for table `tax_rate_categories`
--
ALTER TABLE `tax_rate_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rate_categories_tax_cate_id_foreign` (`tax_cate_id`),
  ADD KEY `tax_rate_categories_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminologies`
--
ALTER TABLE `terminologies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_phone_number_index` (`phone_number`),
  ADD KEY `users_is_verified_phone_index` (`is_verified_phone`),
  ADD KEY `users_type_index` (`type`),
  ADD KEY `users_status_index` (`status`),
  ADD KEY `users_facebook_auth_id_index` (`facebook_auth_id`),
  ADD KEY `users_twitter_auth_id_index` (`twitter_auth_id`),
  ADD KEY `users_google_auth_id_index` (`google_auth_id`),
  ADD KEY `users_apple_auth_id_index` (`apple_auth_id`),
  ADD KEY `users_timezone_id_foreign` (`timezone_id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_devices_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_loyalty_points`
--
ALTER TABLE `user_loyalty_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_loyalty_points_points_index` (`points`),
  ADD KEY `user_loyalty_points_user_id_foreign` (`user_id`),
  ADD KEY `user_loyalty_points_loyalty_card_id_foreign` (`loyalty_card_id`);

--
-- Indexes for table `user_loyalty_point_histories`
--
ALTER TABLE `user_loyalty_point_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_refferals`
--
ALTER TABLE `user_refferals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_refferals_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_vendors`
--
ALTER TABLE `user_vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_vendors_vendor_id_foreign` (`vendor_id`),
  ADD KEY `user_vendors_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_verifications`
--
ALTER TABLE `user_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_wishlists`
--
ALTER TABLE `user_wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wishlists_user_id_foreign` (`user_id`),
  ADD KEY `user_wishlists_product_variant_id_foreign` (`product_variant_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_type_index` (`type`),
  ADD KEY `variants_position_index` (`position`),
  ADD KEY `variants_status_index` (`status`);

--
-- Indexes for table `variant_categories`
--
ALTER TABLE `variant_categories`
  ADD KEY `variant_categories_variant_id_foreign` (`variant_id`),
  ADD KEY `variant_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_options_position_index` (`position`),
  ADD KEY `variant_options_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `variant_option_translations`
--
ALTER TABLE `variant_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_option_translations_variant_option_id_foreign` (`variant_option_id`),
  ADD KEY `variant_option_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `variant_translations`
--
ALTER TABLE `variant_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_translations_variant_id_foreign` (`variant_id`),
  ADD KEY `variant_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_name_index` (`name`),
  ADD KEY `vendors_order_min_amount_index` (`order_min_amount`),
  ADD KEY `vendors_order_pre_time_index` (`order_pre_time`),
  ADD KEY `vendors_auto_reject_time_index` (`auto_reject_time`),
  ADD KEY `vendors_commission_percent_index` (`commission_percent`),
  ADD KEY `vendors_commission_fixed_per_order_index` (`commission_fixed_per_order`),
  ADD KEY `vendors_commission_monthly_index` (`commission_monthly`),
  ADD KEY `vendors_dine_in_index` (`dine_in`),
  ADD KEY `vendors_takeaway_index` (`takeaway`),
  ADD KEY `vendors_delivery_index` (`delivery`),
  ADD KEY `vendors_add_category_index` (`add_category`),
  ADD KEY `vendors_vendor_templete_id_foreign` (`vendor_templete_id`);

--
-- Indexes for table `vendor_categories`
--
ALTER TABLE `vendor_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_categories_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `vendor_media`
--
ALTER TABLE `vendor_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_media_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_media_media_type_index` (`media_type`);

--
-- Indexes for table `vendor_order_dispatcher_statuses`
--
ALTER TABLE `vendor_order_dispatcher_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispatcher_statuses_order_id_foreign` (`order_id`),
  ADD KEY `dispatcher_statuses_dispatcher_status_option_id_foreign` (`dispatcher_status_option_id`),
  ADD KEY `vendor_order_dispatcher_statuses_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `vendor_order_statuses`
--
ALTER TABLE `vendor_order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_statuses_order_id_foreign` (`order_id`),
  ADD KEY `order_statuses_order_status_option_id_foreign` (`order_status_option_id`),
  ADD KEY `vendor_order_statuses_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `vendor_slots`
--
ALTER TABLE `vendor_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_slots_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_slots_category_id_foreign` (`category_id`),
  ADD KEY `vendor_slots_start_time_index` (`start_time`),
  ADD KEY `vendor_slots_end_time_index` (`end_time`),
  ADD KEY `vendor_slots_dine_in_index` (`dine_in`),
  ADD KEY `vendor_slots_takeaway_index` (`takeaway`),
  ADD KEY `vendor_slots_delivery_index` (`delivery`);

--
-- Indexes for table `vendor_slot_dates`
--
ALTER TABLE `vendor_slot_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_slot_dates_specific_date_index` (`specific_date`),
  ADD KEY `vendor_slot_dates_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_slot_dates_category_id_foreign` (`category_id`),
  ADD KEY `vendor_slot_dates_dine_in_index` (`dine_in`),
  ADD KEY `vendor_slot_dates_takeaway_index` (`takeaway`),
  ADD KEY `vendor_slot_dates_delivery_index` (`delivery`);

--
-- Indexes for table `vendor_templetes`
--
ALTER TABLE `vendor_templetes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD KEY `vendor_users_user_id_foreign` (`user_id`),
  ADD KEY `vendor_users_vendor_id_foreign` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_options`
--
ALTER TABLE `addon_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_option_translations`
--
ALTER TABLE `addon_option_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_sets`
--
ALTER TABLE `addon_sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_set_translations`
--
ALTER TABLE `addon_set_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_stylings`
--
ALTER TABLE `app_stylings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_styling_options`
--
ALTER TABLE `app_styling_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `authentication_log`
--
ALTER TABLE `authentication_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `auto_reject_orders_cron`
--
ALTER TABLE `auto_reject_orders_cron`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocked_tokens`
--
ALTER TABLE `blocked_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_types`
--
ALTER TABLE `business_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_addons`
--
ALTER TABLE `cart_addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_coupons`
--
ALTER TABLE `cart_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_product_prescriptions`
--
ALTER TABLE `cart_product_prescriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_histories`
--
ALTER TABLE `category_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `celebrities`
--
ALTER TABLE `celebrities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1304;

--
-- AUTO_INCREMENT for table `client_preferences`
--
ALTER TABLE `client_preferences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `csv_product_imports`
--
ALTER TABLE `csv_product_imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csv_vendor_imports`
--
ALTER TABLE `csv_vendor_imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `dispatcher_status_options`
--
ALTER TABLE `dispatcher_status_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatcher_template_type_options`
--
ALTER TABLE `dispatcher_template_type_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatcher_warning_pages`
--
ALTER TABLE `dispatcher_warning_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `loyalty_cards`
--
ALTER TABLE `loyalty_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `map_providers`
--
ALTER TABLE `map_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_addons`
--
ALTER TABLE `order_product_addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_prescriptions`
--
ALTER TABLE `order_product_prescriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_ratings`
--
ALTER TABLE `order_product_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_rating_files`
--
ALTER TABLE `order_product_rating_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_return_request_files`
--
ALTER TABLE `order_return_request_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_options`
--
ALTER TABLE `order_status_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_taxes`
--
ALTER TABLE `order_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_vendors`
--
ALTER TABLE `order_vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_vendor_products`
--
ALTER TABLE `order_vendor_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_options`
--
ALTER TABLE `payment_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variant_sets`
--
ALTER TABLE `product_variant_sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode_details`
--
ALTER TABLE `promocode_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode_restrictions_`
--
ALTER TABLE `promocode_restrictions_`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_types`
--
ALTER TABLE `promo_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promo_usages`
--
ALTER TABLE `promo_usages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refer_and_earns`
--
ALTER TABLE `refer_and_earns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_reasons`
--
ALTER TABLE `return_reasons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_areas`
--
ALTER TABLE `service_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slot_days`
--
ALTER TABLE `slot_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_providers`
--
ALTER TABLE `sms_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_credentials`
--
ALTER TABLE `social_credentials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_validities`
--
ALTER TABLE `subscription_validities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rate_categories`
--
ALTER TABLE `tax_rate_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `terminologies`
--
ALTER TABLE `terminologies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_loyalty_points`
--
ALTER TABLE `user_loyalty_points`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_loyalty_point_histories`
--
ALTER TABLE `user_loyalty_point_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_refferals`
--
ALTER TABLE `user_refferals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_vendors`
--
ALTER TABLE `user_vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_verifications`
--
ALTER TABLE `user_verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wishlists`
--
ALTER TABLE `user_wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variant_options`
--
ALTER TABLE `variant_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variant_option_translations`
--
ALTER TABLE `variant_option_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variant_translations`
--
ALTER TABLE `variant_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_categories`
--
ALTER TABLE `vendor_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_media`
--
ALTER TABLE `vendor_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_order_dispatcher_statuses`
--
ALTER TABLE `vendor_order_dispatcher_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_order_statuses`
--
ALTER TABLE `vendor_order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_slots`
--
ALTER TABLE `vendor_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_slot_dates`
--
ALTER TABLE `vendor_slot_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_templetes`
--
ALTER TABLE `vendor_templetes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addon_options`
--
ALTER TABLE `addon_options`
  ADD CONSTRAINT `addon_options_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addon_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addon_option_translations`
--
ALTER TABLE `addon_option_translations`
  ADD CONSTRAINT `addon_option_translations_addon_opt_id_foreign` FOREIGN KEY (`addon_opt_id`) REFERENCES `addon_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_option_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `client_languages` (`language_id`) ON DELETE CASCADE;

--
-- Constraints for table `addon_sets`
--
ALTER TABLE `addon_sets`
  ADD CONSTRAINT `addon_sets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `addon_set_translations`
--
ALTER TABLE `addon_set_translations`
  ADD CONSTRAINT `addon_set_translations_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addon_sets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_set_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `client_languages` (`language_id`) ON DELETE CASCADE;

--
-- Constraints for table `app_styling_options`
--
ALTER TABLE `app_styling_options`
  ADD CONSTRAINT `app_styling_options_app_styling_id_foreign` FOREIGN KEY (`app_styling_id`) REFERENCES `app_stylings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_redirect_category_id_foreign` FOREIGN KEY (`redirect_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `banners_redirect_vendor_id_foreign` FOREIGN KEY (`redirect_vendor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `brand_categories`
--
ALTER TABLE `brand_categories`
  ADD CONSTRAINT `brand_categories_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD CONSTRAINT `brand_translations_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `client_languages` (`language_id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_addons`
--
ALTER TABLE `cart_addons`
  ADD CONSTRAINT `cart_addons_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addon_sets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_addons_cart_product_id_foreign` FOREIGN KEY (`cart_product_id`) REFERENCES `cart_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_addons_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `addon_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_coupons`
--
ALTER TABLE `cart_coupons`
  ADD CONSTRAINT `cart_coupons_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `promocodes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_products_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_products_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_product_prescriptions`
--
ALTER TABLE `cart_product_prescriptions`
  ADD CONSTRAINT `cart_product_prescriptions_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_prescriptions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_prescriptions_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_client_code_foreign` FOREIGN KEY (`client_code`) REFERENCES `clients` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_histories`
--
ALTER TABLE `category_histories`
  ADD CONSTRAINT `category_histories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_tags`
--
ALTER TABLE `category_tags`
  ADD CONSTRAINT `category_tags_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `celebrities`
--
ALTER TABLE `celebrities`
  ADD CONSTRAINT `celebrities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `celebrity_brands`
--
ALTER TABLE `celebrity_brands`
  ADD CONSTRAINT `celebrity_brands_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `celebrity_brands_celebrity_id_foreign` FOREIGN KEY (`celebrity_id`) REFERENCES `celebrities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `celebrity_product`
--
ALTER TABLE `celebrity_product`
  ADD CONSTRAINT `celebrity_product_celebrity_id_foreign` FOREIGN KEY (`celebrity_id`) REFERENCES `celebrities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `celebrity_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `client_currencies`
--
ALTER TABLE `client_currencies`
  ADD CONSTRAINT `client_currencies_client_code_foreign` FOREIGN KEY (`client_code`) REFERENCES `clients` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `client_languages`
--
ALTER TABLE `client_languages`
  ADD CONSTRAINT `client_languages_client_code_foreign` FOREIGN KEY (`client_code`) REFERENCES `clients` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_languages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `client_preferences`
--
ALTER TABLE `client_preferences`
  ADD CONSTRAINT `client_preferences_app_template_id_foreign` FOREIGN KEY (`app_template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_client_code_foreign` FOREIGN KEY (`client_code`) REFERENCES `clients` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_map_provider_foreign` FOREIGN KEY (`map_provider`) REFERENCES `map_providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_sms_provider_foreign` FOREIGN KEY (`sms_provider`) REFERENCES `sms_providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_web_template_id_foreign` FOREIGN KEY (`web_template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cms`
--
ALTER TABLE `cms`
  ADD CONSTRAINT `cms_client_code_foreign` FOREIGN KEY (`client_code`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cms_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `csv_product_imports`
--
ALTER TABLE `csv_product_imports`
  ADD CONSTRAINT `csv_product_imports_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `csv_product_imports_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `csv_vendor_imports`
--
ALTER TABLE `csv_vendor_imports`
  ADD CONSTRAINT `csv_vendor_imports_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `user_addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_addons`
--
ALTER TABLE `order_product_addons`
  ADD CONSTRAINT `order_product_addons_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addon_sets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_addons_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `addon_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_addons_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_vendor_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_prescriptions`
--
ALTER TABLE `order_product_prescriptions`
  ADD CONSTRAINT `order_product_prescriptions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_prescriptions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_prescriptions_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_ratings`
--
ALTER TABLE `order_product_ratings`
  ADD CONSTRAINT `order_product_ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_ratings_order_vendor_product_id_foreign` FOREIGN KEY (`order_vendor_product_id`) REFERENCES `order_vendor_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_rating_files`
--
ALTER TABLE `order_product_rating_files`
  ADD CONSTRAINT `order_product_rating_files_order_product_rating_id_foreign` FOREIGN KEY (`order_product_rating_id`) REFERENCES `order_product_ratings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_return_requests`
--
ALTER TABLE `order_return_requests`
  ADD CONSTRAINT `order_return_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_return_requests_order_vendor_product_id_foreign` FOREIGN KEY (`order_vendor_product_id`) REFERENCES `order_vendor_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_return_requests_return_by_foreign` FOREIGN KEY (`return_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_return_request_files`
--
ALTER TABLE `order_return_request_files`
  ADD CONSTRAINT `order_return_request_files_order_return_request_id_foreign` FOREIGN KEY (`order_return_request_id`) REFERENCES `order_return_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_vendors`
--
ALTER TABLE `order_vendors`
  ADD CONSTRAINT `order_vendors_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_vendors_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_vendor_products`
--
ALTER TABLE `order_vendor_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_products_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_vendor_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD CONSTRAINT `plan_features_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD CONSTRAINT `plan_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  ADD CONSTRAINT `plan_subscription_usage_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `plan_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plan_subscription_usage_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `plan_subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_country_origin_id_foreign` FOREIGN KEY (`country_origin_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_addons`
--
ALTER TABLE `product_addons`
  ADD CONSTRAINT `product_addons_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addon_sets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_addons_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_celebrities`
--
ALTER TABLE `product_celebrities`
  ADD CONSTRAINT `product_celebrities_celebrity_id_foreign` FOREIGN KEY (`celebrity_id`) REFERENCES `celebrities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_celebrities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_cross_product_id_foreign` FOREIGN KEY (`cross_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `vendor_media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_related`
--
ALTER TABLE `product_related`
  ADD CONSTRAINT `product_related_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_related_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `client_languages` (`language_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_upsell_product_id_foreign` FOREIGN KEY (`upsell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_variant_images`
--
ALTER TABLE `product_variant_images`
  ADD CONSTRAINT `product_variant_images_product_image_id_foreign` FOREIGN KEY (`product_image_id`) REFERENCES `product_images` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_images_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_sets`
--
ALTER TABLE `product_variant_sets`
  ADD CONSTRAINT `product_variant_sets_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_sets_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_sets_variant_option_id_foreign` FOREIGN KEY (`variant_option_id`) REFERENCES `variant_options` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_variant_sets_variant_type_id_foreign` FOREIGN KEY (`variant_type_id`) REFERENCES `variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD CONSTRAINT `promocodes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `promocodes_promo_type_id_foreign` FOREIGN KEY (`promo_type_id`) REFERENCES `promo_types` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promocode_restrictions`
--
ALTER TABLE `promocode_restrictions`
  ADD CONSTRAINT `promocode_restrictions_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promocode_restrictions_`
--
ALTER TABLE `promocode_restrictions_`
  ADD CONSTRAINT `promocode_restrictions__promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_usages`
--
ALTER TABLE `promo_usages`
  ADD CONSTRAINT `promo_usages_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `refer_and_earns`
--
ALTER TABLE `refer_and_earns`
  ADD CONSTRAINT `refer_and_earns_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `service_areas`
--
ALTER TABLE `service_areas`
  ADD CONSTRAINT `service_areas_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slot_days`
--
ALTER TABLE `slot_days`
  ADD CONSTRAINT `slot_days_slot_id_foreign` FOREIGN KEY (`slot_id`) REFERENCES `vendor_slots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD CONSTRAINT `tax_categories_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tax_rate_categories`
--
ALTER TABLE `tax_rate_categories`
  ADD CONSTRAINT `tax_rate_categories_tax_cate_id_foreign` FOREIGN KEY (`tax_cate_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rate_categories_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
