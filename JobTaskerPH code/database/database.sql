-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 25, 2024 at 03:40 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multigig`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_sections`
--

CREATE TABLE `about_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `button_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `about_sections`
--

INSERT INTO `about_sections` (`id`, `language_id`, `title`, `text`, `button_name`, `button_url`, `created_at`, `updated_at`) VALUES
(4, 8, 'Take Your Business Life To The Next Level', '<p>Welcome to our website, a cutting-edge multi-vendor freelance platform designed to connect skilled professionals with businesses and individuals seeking top-tier services. Just like the renowned platform Fiverr, we\'ve curated a dynamic ecosystem where talent meets opportunity, fostering a thriving community of freelancers and clients.</p>\r\n<p>At our site, we believe in empowering freelancers to showcase their expertise across diverse categories, from graphic design and digital marketing to programming, writing, and more. Our platform offers a seamless and secure environment for freelancers to exhibit their skills, set their own prices, and connect with a global clientele.</p>', 'Get Started', 'https://example.com', '2022-05-14 23:00:15', '2023-12-20 07:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `first_name`, `last_name`, `image`, `username`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', NULL, '622845a1841fb.png', 'admin', 'admin@example.com', '$2y$10$W/ymK1oV1m7R7KTdZb/D/.BWGuxn5yN/brblegtXFylo3XQn8oI8.', 1, NULL, '2024-01-24 21:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resolution_type` smallint(5) UNSIGNED NOT NULL COMMENT '1 => 300 x 250, 2 => 300 x 600, 3 => 728 x 90',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slot` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_extends`
--

CREATE TABLE `basic_extends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `popular_tags` text COLLATE utf8_unicode_ci,
  `news_letter_section_text` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `basic_extends`
--

INSERT INTO `basic_extends` (`id`, `language_id`, `popular_tags`, `news_letter_section_text`, `created_at`, `updated_at`) VALUES
(1, 8, 'Graphic Design,Web Development,Digital Marketing', 'Subscribe to Our Newsletter Today! Get the latest updates, exclusive offers, and valuable insights delivered directly to your inbox.', '2023-05-07 07:36:15', '2024-01-04 05:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uniqid` int(10) UNSIGNED NOT NULL DEFAULT '12345',
  `favicon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `longitude` decimal(8,5) DEFAULT NULL,
  `theme_version` smallint(5) UNSIGNED NOT NULL,
  `base_currency_symbol` varchar(255) DEFAULT NULL,
  `base_currency_symbol_position` varchar(20) DEFAULT NULL,
  `base_currency_text` varchar(20) DEFAULT NULL,
  `base_currency_text_position` varchar(20) DEFAULT NULL,
  `base_currency_rate` decimal(8,2) DEFAULT NULL,
  `primary_color` varchar(30) DEFAULT NULL,
  `secondary_color` varchar(30) DEFAULT NULL,
  `breadcrumb_overlay_color` varchar(30) DEFAULT NULL,
  `breadcrumb_overlay_opacity` decimal(4,2) DEFAULT NULL,
  `smtp_status` tinyint(4) DEFAULT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `encryption` varchar(50) DEFAULT NULL,
  `smtp_username` varchar(255) DEFAULT NULL,
  `smtp_password` varchar(255) DEFAULT NULL,
  `from_mail` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `to_mail` varchar(255) DEFAULT NULL,
  `breadcrumb` varchar(255) DEFAULT NULL,
  `disqus_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `disqus_short_name` varchar(255) DEFAULT NULL,
  `google_recaptcha_status` tinyint(4) DEFAULT NULL,
  `google_recaptcha_site_key` varchar(255) DEFAULT NULL,
  `google_recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `whatsapp_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `whatsapp_header_title` varchar(255) DEFAULT NULL,
  `whatsapp_popup_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `whatsapp_popup_message` text,
  `maintenance_img` varchar(255) DEFAULT NULL,
  `maintenance_status` tinyint(4) DEFAULT NULL,
  `maintenance_msg` text,
  `bypass_token` varchar(255) DEFAULT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `admin_theme_version` varchar(10) NOT NULL DEFAULT 'light',
  `notification_image` varchar(255) DEFAULT NULL,
  `google_adsense_publisher_id` varchar(255) DEFAULT NULL,
  `hero_bg_img` varchar(255) DEFAULT NULL,
  `about_section_image` varchar(255) DEFAULT NULL,
  `about_section_video_link` varchar(255) DEFAULT NULL,
  `feature_bg_img` varchar(255) NOT NULL,
  `testimonial_bg_img` varchar(255) NOT NULL,
  `qr_url` varchar(255) DEFAULT NULL,
  `qr_image` varchar(255) DEFAULT NULL,
  `qr_color` varchar(255) NOT NULL DEFAULT '000000',
  `qr_size` int(10) UNSIGNED NOT NULL DEFAULT '250',
  `qr_style` varchar(255) NOT NULL DEFAULT 'square',
  `qr_eye_style` varchar(255) NOT NULL DEFAULT 'square',
  `qr_margin` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `qr_type` varchar(255) NOT NULL DEFAULT 'default' COMMENT 'it can be 3 types of qr code. they are: ''default'', ''image'' and ''text''',
  `qr_inserted_image` varchar(255) DEFAULT NULL,
  `qr_inserted_image_size` int(10) UNSIGNED NOT NULL DEFAULT '20',
  `qr_inserted_image_x` int(10) UNSIGNED NOT NULL DEFAULT '50',
  `qr_inserted_image_y` int(10) UNSIGNED NOT NULL DEFAULT '50',
  `qr_text` varchar(255) DEFAULT NULL,
  `qr_text_color` varchar(255) NOT NULL DEFAULT '000000',
  `qr_text_size` int(10) UNSIGNED NOT NULL DEFAULT '15',
  `qr_text_x` int(10) UNSIGNED NOT NULL DEFAULT '50',
  `qr_text_y` int(10) UNSIGNED NOT NULL DEFAULT '50',
  `facebook_login_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 -> enable, 0 -> disable',
  `facebook_app_id` varchar(255) DEFAULT NULL,
  `facebook_app_secret` varchar(255) DEFAULT NULL,
  `google_login_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 -> enable, 0 -> disable',
  `google_client_id` varchar(255) DEFAULT NULL,
  `google_client_secret` varchar(255) DEFAULT NULL,
  `pusher_app_id` varchar(255) DEFAULT NULL,
  `pusher_key` varchar(255) DEFAULT NULL,
  `pusher_secret` varchar(255) DEFAULT NULL,
  `pusher_cluster` varchar(50) DEFAULT NULL,
  `support_ticket_status` tinyint(3) UNSIGNED NOT NULL COMMENT '1 -> enable, 0 -> disable',
  `hero_static_img` varchar(255) DEFAULT NULL,
  `hero_video_url` varchar(255) DEFAULT NULL,
  `newsletter_bg_img` varchar(255) DEFAULT NULL,
  `cta_bg_img` varchar(255) DEFAULT NULL,
  `is_service` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - active, 0 - deactive',
  `is_language` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- active, 0 - deactive from menubar',
  `seller_email_verification` int(11) DEFAULT '0',
  `seller_admin_approval` int(11) DEFAULT '0',
  `admin_approval_notice` text,
  `expiration_reminder` int(11) DEFAULT '0',
  `tax` float(8,2) NOT NULL DEFAULT '0.00',
  `chat_max_file` varchar(255) DEFAULT '0',
  `life_time_earning` double(8,2) NOT NULL,
  `total_profit` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `uniqid`, `favicon`, `logo`, `website_title`, `email_address`, `contact_number`, `address`, `latitude`, `longitude`, `theme_version`, `base_currency_symbol`, `base_currency_symbol_position`, `base_currency_text`, `base_currency_text_position`, `base_currency_rate`, `primary_color`, `secondary_color`, `breadcrumb_overlay_color`, `breadcrumb_overlay_opacity`, `smtp_status`, `smtp_host`, `smtp_port`, `encryption`, `smtp_username`, `smtp_password`, `from_mail`, `from_name`, `to_mail`, `breadcrumb`, `disqus_status`, `disqus_short_name`, `google_recaptcha_status`, `google_recaptcha_site_key`, `google_recaptcha_secret_key`, `whatsapp_status`, `whatsapp_number`, `whatsapp_header_title`, `whatsapp_popup_status`, `whatsapp_popup_message`, `maintenance_img`, `maintenance_status`, `maintenance_msg`, `bypass_token`, `footer_logo`, `admin_theme_version`, `notification_image`, `google_adsense_publisher_id`, `hero_bg_img`, `about_section_image`, `about_section_video_link`, `feature_bg_img`, `testimonial_bg_img`, `qr_url`, `qr_image`, `qr_color`, `qr_size`, `qr_style`, `qr_eye_style`, `qr_margin`, `qr_type`, `qr_inserted_image`, `qr_inserted_image_size`, `qr_inserted_image_x`, `qr_inserted_image_y`, `qr_text`, `qr_text_color`, `qr_text_size`, `qr_text_x`, `qr_text_y`, `facebook_login_status`, `facebook_app_id`, `facebook_app_secret`, `google_login_status`, `google_client_id`, `google_client_secret`, `pusher_app_id`, `pusher_key`, `pusher_secret`, `pusher_cluster`, `support_ticket_status`, `hero_static_img`, `hero_video_url`, `newsletter_bg_img`, `cta_bg_img`, `is_service`, `is_language`, `seller_email_verification`, `seller_admin_approval`, `admin_approval_notice`, `expiration_reminder`, `tax`, `chat_max_file`, `life_time_earning`, `total_profit`, `created_at`, `updated_at`) VALUES
(2, 12345, '659cd55a62941.png', '659cd56561e43.png', 'Multigig', 'demo@example.com', '+1-202-555-0109', '450 Young Road, New York, USA', '34.05224', '-118.24368', 1, '$', 'left', 'NGN', 'right', '1.00', 'F4813C', '160828', '000000', '0.60', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '65a78e90ec7d1.jpg', 1, 'multigig', 0, NULL, NULL, 0, NULL, NULL, 0, NULL, '1632725312.png', 0, 'We are upgrading our site. We will come back soon. \r\nPlease stay with us.\r\nThank you.', 'scret', '659cd578e68d1.png', 'dark', '619b7d5e5e9df.png', NULL, '65aba5181bbf1.jpg', '6598e6d2e8a19.png', 'https://www.youtube.com/watch?v=Sr31hnsdeaw', '625bae6fd72f0.jpg', '658d222b348ff.jpg', 'NULL', '62b09198e947e.png', '000000', 250, 'square', 'square', 0, 'default', NULL, 20, 50, 50, NULL, '000000', 15, 50, 50, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'ap2', 1, '65aba5181c73c.png', NULL, '62f09aacaaa98.png', '659934867b5bd.jpg', 1, 1, 1, 1, 'Unfortunately, your account is deactive now. please get in touch with admin.', 3, 7.00, '2000', 0.00, 0.00, '2023-12-03 06:27:43', '2023-12-03 06:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cookie_alerts`
--

CREATE TABLE `cookie_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `cookie_alert_status` tinyint(3) UNSIGNED NOT NULL,
  `cookie_alert_btn_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cookie_alert_text` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cookie_alerts`
--

INSERT INTO `cookie_alerts` (`id`, `language_id`, `cookie_alert_status`, `cookie_alert_btn_text`, `cookie_alert_text`, `created_at`, `updated_at`) VALUES
(2, 8, 1, 'I Agree', 'We use cookies to give you the best online experience.\r\nBy continuing to browse the site you are agreeing to our use of cookies. dfalkfa', '2021-08-29 04:20:43', '2024-01-06 09:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `cta_section_infos`
--

CREATE TABLE `cta_section_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cta_section_infos`
--

INSERT INTO `cta_section_infos` (`id`, `language_id`, `image`, `title`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(1, 8, '659bbdc06845d.png', 'Experience the Power of Premium Freelancers', 'Start Hiring', 'https://example.com', '2023-12-30 06:04:55', '2024-01-08 09:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) DEFAULT NULL,
  `following_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer_contents`
--

CREATE TABLE `footer_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `footer_background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_company` text COLLATE utf8_unicode_ci,
  `copyright_text` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `footer_contents`
--

INSERT INTO `footer_contents` (`id`, `language_id`, `footer_background_color`, `about_company`, `copyright_text`, `created_at`, `updated_at`) VALUES
(4, 8, '4D6878', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'Copyright © 2022,  All Rights Reserved.', '2022-03-06 01:00:32', '2024-01-03 05:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_inputs`
--

CREATE TABLE `form_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '1 - Text Field, 2 - Number Field, 3 - Select, 4 - Checkbox, 5 - Textarea Field, 6 - Datepicker, 7 - Timepicker, 8 - File',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(3) UNSIGNED NOT NULL COMMENT '0 - not required, 1 - required',
  `options` text COLLATE utf8_unicode_ci,
  `file_size` decimal(11,2) UNSIGNED DEFAULT NULL,
  `order_no` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'default value 0 means, this input field has created just now and it has not sorted yet.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hero_sliders`
--

CREATE TABLE `hero_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hero_statics`
--

CREATE TABLE `hero_statics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hero_statics`
--

INSERT INTO `hero_statics` (`id`, `language_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(14, 8, 'The Easiest Way to Find & Hire Skills Talent for Projects', 'Explore a Diverse World of Skills and services Offered by Expert Freelancers, Connecting You to the Perfect Match', '2022-06-22 08:42:24', '2024-01-02 06:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `direction` tinyint(4) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `direction`, `is_default`, `created_at`, `updated_at`) VALUES
(8, 'English', 'en', 0, 1, '2021-05-31 05:58:22', '2023-12-13 11:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` int(11) NOT NULL,
  `mail_type` varchar(255) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `mail_type`, `mail_subject`, `mail_body`) VALUES
(4, 'verify_email', 'Verify Your Email Address', '<table class=\"m_2450577039782362685body\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" valign=\"top\" bgcolor=\"#F6F6F6\"><center>\r\n<table class=\"m_2450577039782362685container\" style=\"width: 78.3088%;\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100%;\">\r\n<table class=\"m_2450577039782362685row\">\r\n<tbody>\r\n<tr>\r\n<th class=\"m_2450577039782362685small-12 m_2450577039782362685columns\">\r\n<table style=\"width: 100.096%; height: 191.953px;\">\r\n<tbody>\r\n<tr style=\"height:22.3906px;\">\r\n<th style=\"width:97.6447%;height:22.3906px;\"> </th>\r\n</tr>\r\n<tr style=\"height:169.562px;\">\r\n<td style=\"width: 97.6447%; height: 169.562px;\">\r\n<p style=\"text-align:left;\">Hi {username},</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">We need to verify your email address before you can access your dashboard.</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">Please verify your email address by visiting the link below:</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">{verification_link}.</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">Thank you.<br />{website_title}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</th>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class=\"CToWUd\" src=\"https://ci5.googleusercontent.com/proxy/_L2S_yn8V9jLvAeR1rLPF3qmrQLBqWlB2DJfAQ4SBEhv-VqAJHg0FK6cmT99y8m9R1G1BC_i2FWCFmHGlcjnIExwE3rNqaUN1-ayp0bawEaxVCbLEGpJ7JQDR4jbczNq_1DXjqcVXXnTza_LEegpL2x792ZGjaA8Y594GJqeVxtjqM2LA5kDTgdYFWW8sGb8UQzAetE2hKnCmyIkYvcqSFceBQcSFT_B7jgjI_qLUCiOPLf8IAudBTPMNjeesYBhKmRLScTVpcAyb1ASUfoBwueWDC3I8AHTpsbotgLJks5ipgbiZSINWL1bG_qw0pI_JbMPhCaSek6I-f4QsLYRd6oAUcdol5y2dXTkzr3WmL1K1lZ8lr1i6eJ8FDsTtGwlLTwxv9-kUCCT2UfqHxbUGnGTPYOHH74ytkpK=s0-d-e1-ft#http://email-link.overleaf.com/wf/open?upn=CB7nsy4cUUrMEy00dVC7xtkixf1jGRQiRmv9ytghPG-2F9iMBvteO1eyfwjvE7n-2FPrXViQOvivqNnn9vNEH7KuOUPk6gWzhzmBjtlf6gat86vo9nJtlVPWo-2BQ6DCAkJV4JpOTwpu0-2FMAzexK9bw6PGBTnX5GD5nNe2ed6hROW6IDmeUd0gh2F5IV42PVhMQ-2B0gYOp39DeLXW7PovcBulw-2BrA8qlCawgAjpBtNzRd-2Bl3Hk-3D\" alt=\"\" width=\"1\" height=\"1\" border=\"0\" /></p>'),
(5, 'reset_password', 'Recover Password of Your Account', '<table class=\"m_2450577039782362685body\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" valign=\"top\" bgcolor=\"#F6F6F6\"><center>\r\n<table class=\"m_2450577039782362685container\" style=\"width: 78.3088%;\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100%;\">\r\n<table class=\"m_2450577039782362685row\">\r\n<tbody>\r\n<tr>\r\n<th class=\"m_2450577039782362685small-12 m_2450577039782362685columns\">\r\n<table style=\"width: 100.096%; height: 191.953px;\">\r\n<tbody>\r\n<tr style=\"height:22.3906px;\">\r\n<th style=\"width:97.6447%;height:22.3906px;\"> </th>\r\n</tr>\r\n<tr style=\"height:169.562px;\">\r\n<td style=\"width: 97.6447%; height: 169.562px;\">\r\n<p style=\"text-align:left;\">Hi {customer_name},</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">We have received a request to reset your password. If you did not make the request, just ignore this email. Otherwise, you can reset your password using the below link.</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">{password_reset_link}</p>\r\n<p class=\"m_2450577039782362685force-overleaf-style\" style=\"text-align:left;\">Thanks,<br />{website_title}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</th>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class=\"CToWUd\" src=\"https://ci5.googleusercontent.com/proxy/_L2S_yn8V9jLvAeR1rLPF3qmrQLBqWlB2DJfAQ4SBEhv-VqAJHg0FK6cmT99y8m9R1G1BC_i2FWCFmHGlcjnIExwE3rNqaUN1-ayp0bawEaxVCbLEGpJ7JQDR4jbczNq_1DXjqcVXXnTza_LEegpL2x792ZGjaA8Y594GJqeVxtjqM2LA5kDTgdYFWW8sGb8UQzAetE2hKnCmyIkYvcqSFceBQcSFT_B7jgjI_qLUCiOPLf8IAudBTPMNjeesYBhKmRLScTVpcAyb1ASUfoBwueWDC3I8AHTpsbotgLJks5ipgbiZSINWL1bG_qw0pI_JbMPhCaSek6I-f4QsLYRd6oAUcdol5y2dXTkzr3WmL1K1lZ8lr1i6eJ8FDsTtGwlLTwxv9-kUCCT2UfqHxbUGnGTPYOHH74ytkpK=s0-d-e1-ft#http://email-link.overleaf.com/wf/open?upn=CB7nsy4cUUrMEy00dVC7xtkixf1jGRQiRmv9ytghPG-2F9iMBvteO1eyfwjvE7n-2FPrXViQOvivqNnn9vNEH7KuOUPk6gWzhzmBjtlf6gat86vo9nJtlVPWo-2BQ6DCAkJV4JpOTwpu0-2FMAzexK9bw6PGBTnX5GD5nNe2ed6hROW6IDmeUd0gh2F5IV42PVhMQ-2B0gYOp39DeLXW7PovcBulw-2BrA8qlCawgAjpBtNzRd-2Bl3Hk-3D\" alt=\"\" width=\"1\" height=\"1\" border=\"0\" /></p>'),
(11, 'service_order', 'Service Order Has Been Placed', '<p>Hi {customer_name},</p><p>Your order has been placed successfully. We have attached an invoice in this mail.<br />Order No: #{order_number}</p><p>{order_link}<br /></p><p>Best regards.<br />{website_title}</p>'),
(12, 'payment_success', 'Payment Success', '<p>Hi {customer_name},</p><p>Your payment is completed. We have attached an invoice in this mail.<br />Invoice No: #{invoice_number}</p><p>Best regards.<br />{website_title}</p>'),
(15, 'user_register_success', 'Successfully Register Your Account', '<p>Hi {username},</p>\r\n<p>You have successfully crate an account. Now you can access your dashboard.</p>\r\n<p>Thank you.<br />{website_title}</p>'),
(18, 'membership_extend', 'Your membership is extended', '<p>Hi {username},<br><br>This is a confirmation mail from us.<br>You have extended your membership.<br><strong>Package Title:</strong> {package_title}<br><strong>Package Price:</strong> {package_price}<br><strong>Activation Date:</strong> {activation_date}<br><strong>Expire Date:</strong> {expire_date}</p>\r\n<p> </p>\r\n<p>We have attached an invoice with this mail.<br>Thank you for your purchase.</p>\r\n<p><br>Best Regards,<br>{website_title}.</p>'),
(19, 'registration_with_premium_package', 'You have registered successfully', '<p>Hi {username},<br /><br />This is a confirmation mail from us</p>\r\n<p><strong><span style=\"font-size:18px;\">Membership Information:</span></strong><br /><strong>Package Title:</strong> {package_title}<br /><strong>Package Price:</strong> {package_price}</p>\r\n<p><span style=\"font-weight:600;\">Total:</span> {total}<br /><strong>Activation Date:</strong> {activation_date}<br /><strong>Expire Date:</strong> {expire_date}</p>\r\n<p> </p>\r\n<p>We have attached an invoice with this mail.<br />Thank you for your purchase.</p>\r\n<p><br />Best Regards,<br />{website_title}.</p>'),
(20, 'registration_with_trial_package', 'You have registered successfully', 'Hi {username},<br /><br />\r\n\r\nThis is a confirmation mail from us.<br />\r\nYou have purchased a trial package<br /><br />\r\n\r\n<h4>Membership Information:</h4>\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}<br /><br />\r\n\r\nWe have attached an invoice in this mail<br />\r\nThank you for your purchase.<br /><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br />'),
(21, 'registration_with_free_package', 'You have registered successfully', 'Hi {username},<br /><br />\r\n\r\nThis is a confirmation mail from us.<br />\r\nYou have purchased a free package<br /><br />\r\n\r\n<h4>Membership Information:</h4>\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}<br /><br />\r\n\r\nWe have attached an invoice in this mail<br />\r\nThank you for your purchase.<br /><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br />'),
(22, 'membership_expiry_reminder', 'Your membership will be expired soon', 'Hi {username},<br /><br />\n\nYour membership will be expired soon.<br />\nYour membership is valid till <strong>{last_day_of_membership}</strong><br />\nPlease click here - {login_link} to log into the dashboard to purchase a new package / extend the current package to extend your membership.<br /><br />\n\nBest Regards,<br />\n{website_title}.'),
(23, 'membership_expired', 'Your membership is expired', 'Hi {username},<br><br>\n\nYour membership is expired.<br>\nPlease click here - {login_link} to log into the dashboard to purchase a new package / extend the current package to continue the membership.<br><br>\n\nBest Regards,<br>\n{website_title}.'),
(24, 'payment_accepted_for_membership_extension_offline_gateway', 'Your payment for membership extension is accepted', '<p>Hi {username},<br><br>This is a confirmation mail from us.<br>Your payment has been accepted &amp; your membership is extended.<br><strong>Package Title:</strong> {package_title}<br><strong>Package Price:</strong> {package_price}<br><strong>Activation Date:</strong> {activation_date}<br><strong>Expire Date:</strong> {expire_date}</p>\r\n<p>Best Regards,<br>{website_title}.</p>'),
(25, 'payment_accepted_for_registration_offline_gateway', 'Your payment for registration is approved', '<p>Hi {username},<br /><br />\r\n\r\nThis is a confirmation mail from us.<br />\r\nYour payment has been accepted & now you can login to your user dashboard to build your portfolio website.<br />\r\n\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}</p><p><br /></p><p>We have attached an invoice with this mail.<br />\r\nThank you for your purchase.</p><p><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(26, 'payment_rejected_for_membership_extension_offline_gateway', 'Your payment for membership extension is rejected', '<p>Hi {username},<br /><br />\r\n\r\nWe are sorry to inform you that your payment has been rejected<br />\r\n\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(27, 'payment_rejected_for_registration_offline_gateway', 'Your payment for registration is rejected', '<p>Hi {username},<br><br>We are sorry to inform you that your payment has been rejected<br><strong>Package Title:</strong> {package_title}<br><strong>Package Price:</strong> {package_price}<br>Best Regards,<br>{website_title}.</p>'),
(28, 'admin_changed_current_package', 'Admin has changed your current package', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has changed your current package <b>({replaced_package})</b></p>\r\n<p><b>New Package Information:</b></p>\r\n<p>\r\n<strong>Package:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}</p><p><br /></p><p>We have attached an invoice with this mail.<br />\r\nThank you for your purchase.</p><p><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(29, 'admin_added_current_package', 'Admin has added current package for you', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has added current package for you</p><p><b><span style=\"font-size:18px;\">Current Membership Information:</span></b><br />\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}</p><p><br /></p><p>We have attached an invoice with this mail.<br />\r\nThank you for your purchase.</p><p><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(30, 'admin_changed_next_package', 'Admin has changed your next package', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has changed your next package <b>({replaced_package})</b></p><p><b><span style=\"font-size:18px;\">Next Membership Information:</span></b><br />\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}</p><p><br /></p><p>We have attached an invoice with this mail.<br />\r\nThank you for your purchase.</p><p><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(31, 'admin_added_next_package', 'Admin has added next package for you', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has added next package for you</p><p><b><span style=\"font-size:18px;\">Next Membership Information:</span></b><br />\r\n<strong>Package Title:</strong> {package_title}<br />\r\n<strong>Package Price:</strong> {package_price}<br />\r\n<strong>Activation Date:</strong> {activation_date}<br />\r\n<strong>Expire Date:</strong> {expire_date}</p><p><br /></p><p>We have attached an invoice with this mail.<br />\r\nThank you for your purchase.</p><p><br />\r\n\r\nBest Regards,<br />\r\n{website_title}.<br /></p>'),
(32, 'admin_removed_current_package', 'Admin has removed current package for you', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has removed current package - <strong>{removed_package_title}</strong><br>\r\n\r\nBest Regards,<br />\r\n{website_title}.<br />'),
(33, 'admin_removed_next_package', 'Admin has removed next package for you', '<p>Hi {username},<br /><br />\r\n\r\nAdmin has removed next package - <strong>{removed_package_title}</strong><br>\r\n\r\nBest Regards,<br />\r\n{website_title}.<br />'),
(34, 'withdraw_approve', 'Confirmation of Withdraw Approve', '<p>Hi {seller_username},</p>\r\n<p>This email is confirm that your withdraw request  {withdraw_id} is approved. </p>\r\n<p>Your current balance is {current_balance}, withdraw amount {withdraw_amount}, charge : {charge},payable amount {payable_amount}</p>\r\n<p>withdraw method : {withdraw_method},</p>\r\n<p> </p>\r\n<p>Best Regards.<br />{website_title}</p>'),
(35, 'withdraw_rejected', 'Withdraw Request Rejected', '<p>Hi {seller_username},</p>\r\n<p>This email is to confirm that your withdrawal request  {withdraw_id} is rejected and the balance added to your account. </p>\r\n<p>Your current balance is {current_balance}</p>\r\n<p> </p>\r\n<p>Best Regards.<br />{website_title}</p>'),
(36, 'balance_add', 'Balance Add', '<p>Hi {username}</p><p>{amount} added to your account.</p><p>Your current balance is {current_balance}. </p></p><p><br></p><p>Best Regards.<br>{website_title}<br></p><br>'),
(37, 'balance_subtract', 'Balance Subtract', '<p>Hi {username}</p>\r\n<p>{amount} subtract from your account.</p>\r\n<p>Your current balance is {current_balance}.</p>\r\n<p>Best Regards.<br />{website_title}</p>\r\n<p> </p>\r\n<p> </p>'),
(38, 'add_user_by_admin', 'Admin has been added your account.', '<p>Hi {username},</p>\r\n<p>Admin has been added to your account as a \'{user_type}\'.</p>\r\n<p>Your username: {username} and password: #{password}</p>\r\n<p>Best regards.<br />{website_title}</p>');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_trial` tinyint(4) NOT NULL DEFAULT '0',
  `trial_days` int(11) NOT NULL DEFAULT '0',
  `receipt` longtext COLLATE utf8_unicode_ci,
  `transaction_details` longtext COLLATE utf8_unicode_ci,
  `settings` longtext COLLATE utf8_unicode_ci,
  `package_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `modified` tinyint(4) DEFAULT NULL COMMENT '1 - modified by Admin, 0 - not modified by Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_builders`
--

CREATE TABLE `menu_builders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `menus` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_builders`
--

INSERT INTO `menu_builders` (`id`, `language_id`, `menus`, `created_at`, `updated_at`) VALUES
(3, 8, '[{\"text\":\"Home\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"home\"},{\"text\":\"Services\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"services\"},{\"text\":\"Pricing\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"pricing\"},{\"text\":\"Sellers\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"sellers\"},{\"text\":\"Pages\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"custom\",\"children\":[{\"text\":\"Blog\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"blog\"},{\"text\":\"Privacy Policy\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"privacy-policy\"},{\"text\":\"Terms & Conditions\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"terms--conditions\"},{\"text\":\"FAQ\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"faq\"}]},{\"text\":\"About\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"about\"},{\"text\":\"Contact\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"contact\"}]', '2022-05-11 03:26:11', '2024-01-17 08:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2023_12_30_110825_create_cta_section_infos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offline_gateways`
--

CREATE TABLE `offline_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci,
  `instructions` longtext COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 -> gateway is deactive, 1 -> gateway is active.',
  `has_attachment` tinyint(1) NOT NULL COMMENT '0 -> do not need attachment, 1 -> need attachment.',
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_gateways`
--

CREATE TABLE `online_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `information` mediumtext,
  `status` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `online_gateways`
--

INSERT INTO `online_gateways` (`id`, `name`, `keyword`, `information`, `status`) VALUES
(1, 'PayPal', 'paypal', '{\"sandbox_status\":\"1\",\"client_id\":\"\",\"client_secret\":\"\"}', 0),
(2, 'Instamojo', 'instamojo', '{\"sandbox_status\":\"1\",\"key\":\"\",\"token\":\"\"}', 0),
(3, 'Paystack', 'paystack', '{\"key\":\"\"}', 0),
(4, 'Flutterwave', 'flutterwave', '{\"public_key\":\"\",\"secret_key\":\"\"}', 0),
(5, 'Razorpay', 'razorpay', '{\"key\":\"\",\"secret\":\"\"}', 0),
(6, 'MercadoPago', 'mercadopago', '{\"sandbox_status\":\"1\",\"token\":\"\"}', 0),
(7, 'Mollie', 'mollie', '{\"key\":\"\"}', 0),
(8, 'Stripe', 'stripe', '{\"key\":\"\",\"secret\":\"\"}', 0),
(9, 'Paytm', 'paytm', '{\"environment\":\"local\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"WEBSTAGING\",\"industry_type\":\"Retail\"}', 0),
(10, 'Authorize.Net', 'authorize.net', '{\"sandbox_status\":\"1\",\"api_login_id\":\"\",\"transaction_key\":\"\",\"public_client_key\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_service_add` int(11) DEFAULT '0',
  `number_of_service_featured` int(11) DEFAULT '0',
  `number_of_form_add` int(11) DEFAULT '0',
  `number_of_service_order` int(11) NOT NULL DEFAULT '0',
  `live_chat_status` int(11) DEFAULT '0',
  `qr_builder_status` int(11) DEFAULT '0',
  `qr_code_save_limit` int(11) DEFAULT '0',
  `custom_features` longtext COLLATE utf8_unicode_ci,
  `is_trial` int(11) DEFAULT NULL,
  `recommended` int(11) DEFAULT '0',
  `trial_days` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_headings`
--

CREATE TABLE `page_headings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `blog_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_details_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `error_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `faq_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `forget_password_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signup_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `services_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_details_page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `about_us_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_login_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_signup_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_forget_password_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricing_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_headings`
--

INSERT INTO `page_headings` (`id`, `language_id`, `blog_page_title`, `post_details_page_title`, `contact_page_title`, `error_page_title`, `faq_page_title`, `forget_password_page_title`, `login_page_title`, `signup_page_title`, `services_page_title`, `service_details_page_title`, `created_at`, `updated_at`, `about_us_page_title`, `seller_page_title`, `seller_login_page_title`, `seller_signup_page_title`, `seller_forget_password_page_title`, `pricing_page_title`) VALUES
(8, 8, 'Blog', 'Post Details', 'Contact', '404', 'FAQ', 'Forget Password', 'Login', 'Signup', 'Services', 'Service Details', '2022-01-10 05:21:48', '2023-12-19 09:40:29', 'About', 'Sellers', 'Login', 'Signup', 'Forget Password', 'Pricing');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `image`, `url`, `serial_number`, `created_at`, `updated_at`) VALUES
(21, '64b37476320ef.png', 'https://www.example.com/', 1, '2023-07-16 04:39:18', '2023-07-16 04:39:18'),
(22, '64b374c63640b.png', 'https://www.example.com', 2, '2023-07-16 04:40:38', '2023-07-16 04:40:38'),
(23, '64b374dba7bd4.png', 'https://example.com', 3, '2023-07-16 04:40:59', '2023-07-16 04:40:59'),
(24, '64b374edc9386.png', 'https://example.com', 4, '2023-07-16 04:41:17', '2023-07-16 04:41:17'),
(25, '64b376a0292d4.png', 'https://www.example.com', 5, '2023-07-16 04:48:32', '2023-07-16 04:48:32'),
(26, '64b376be932e4.png', 'https://www.example.com', 5, '2023-07-16 04:49:02', '2023-07-16 04:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color_opacity` decimal(3,2) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `button_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `button_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `delay` int(10) UNSIGNED NOT NULL COMMENT 'value will be in milliseconds',
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0 => deactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_informations`
--

CREATE TABLE `post_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subscribable_id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quick_links`
--

CREATE TABLE `quick_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_category_section_status` tinyint(4) NOT NULL DEFAULT '1',
  `about_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `features_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `featured_services_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `testimonials_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `blog_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `partners_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `featured_products_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `newsletter_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `footer_section_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `cta_section_status` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `service_category_section_status`, `about_section_status`, `features_section_status`, `featured_services_section_status`, `testimonials_section_status`, `blog_section_status`, `partners_section_status`, `featured_products_section_status`, `newsletter_section_status`, `footer_section_status`, `cta_section_status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, '2023-12-30 06:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `section_titles`
--

CREATE TABLE `section_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `category_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_services_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `testimonials_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_products_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newsletter_section_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section_titles`
--

INSERT INTO `section_titles` (`id`, `language_id`, `category_section_title`, `featured_services_section_title`, `testimonials_section_title`, `blog_section_title`, `featured_products_section_title`, `newsletter_section_title`, `created_at`, `updated_at`) VALUES
(5, 8, 'Most Popular Categories', 'Top Featured Services', 'What Our Client Say About Multigig Services', 'Read Our Blog', NULL, NULL, '2022-05-14 22:56:47', '2023-12-28 07:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_mail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `amount` double(8,2) DEFAULT '0.00',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avg_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_email_addresss` tinyint(4) DEFAULT '1',
  `show_phone_number` tinyint(4) DEFAULT '1',
  `show_contact_form` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_infos`
--

CREATE TABLE `seller_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `meta_keyword_home` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_home` text COLLATE utf8_unicode_ci,
  `meta_keyword_services` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_services` text COLLATE utf8_unicode_ci,
  `meta_keyword_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_products` text COLLATE utf8_unicode_ci,
  `meta_keyword_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_cart` text COLLATE utf8_unicode_ci,
  `meta_keyword_blog` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_blog` text COLLATE utf8_unicode_ci,
  `meta_keyword_faq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_faq` text COLLATE utf8_unicode_ci,
  `meta_keyword_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_contact` text COLLATE utf8_unicode_ci,
  `meta_keyword_customer_login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_customer_login` text COLLATE utf8_unicode_ci,
  `meta_keyword_customer_signup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_customer_signup` text COLLATE utf8_unicode_ci,
  `meta_keyword_customer_forget_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_customer_forget_password` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_keyword_checkout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_checkout` text COLLATE utf8_unicode_ci,
  `meta_keyword_aboutus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_aboutus` text COLLATE utf8_unicode_ci,
  `meta_keyword_service_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_service_order` text COLLATE utf8_unicode_ci,
  `meta_keyword_invoice_payment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description_invoice_payment` text COLLATE utf8_unicode_ci,
  `seller_page_meta_keywords` text COLLATE utf8_unicode_ci,
  `seller_page_meta_description` text COLLATE utf8_unicode_ci,
  `meta_keyword_seller_login` text COLLATE utf8_unicode_ci,
  `meta_description_seller_login` text COLLATE utf8_unicode_ci,
  `meta_keyword_seller_signup` text COLLATE utf8_unicode_ci,
  `meta_description_seller_signup` text COLLATE utf8_unicode_ci,
  `meta_keyword_seller_forget_password` text COLLATE utf8_unicode_ci,
  `meta_description_seller_forget_password` text COLLATE utf8_unicode_ci,
  `pricing_page_meta_keywords` text COLLATE utf8_unicode_ci,
  `pricing_page_meta_description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `language_id`, `meta_keyword_home`, `meta_description_home`, `meta_keyword_services`, `meta_description_services`, `meta_keyword_products`, `meta_description_products`, `meta_keyword_cart`, `meta_description_cart`, `meta_keyword_blog`, `meta_description_blog`, `meta_keyword_faq`, `meta_description_faq`, `meta_keyword_contact`, `meta_description_contact`, `meta_keyword_customer_login`, `meta_description_customer_login`, `meta_keyword_customer_signup`, `meta_description_customer_signup`, `meta_keyword_customer_forget_password`, `meta_description_customer_forget_password`, `created_at`, `updated_at`, `meta_keyword_checkout`, `meta_description_checkout`, `meta_keyword_aboutus`, `meta_description_aboutus`, `meta_keyword_service_order`, `meta_description_service_order`, `meta_keyword_invoice_payment`, `meta_description_invoice_payment`, `seller_page_meta_keywords`, `seller_page_meta_description`, `meta_keyword_seller_login`, `meta_description_seller_login`, `meta_keyword_seller_signup`, `meta_description_seller_signup`, `meta_keyword_seller_forget_password`, `meta_description_seller_forget_password`, `pricing_page_meta_keywords`, `pricing_page_meta_description`) VALUES
(4, 8, 'Home', 'Home Description', 'Services', 'Services Description999', 'Products', 'Products Description', 'Cart', 'Cart Description', 'Blog', 'Blog Description', 'FAQ', 'FAQ Description', 'Contact', 'Contact Description', 'Login', 'Login Description', 'Signup', 'Signup Description', 'Forget Password', 'Forget Password Description', '2022-03-05 23:49:35', '2023-12-19 09:43:10', 'dd,der,ser,see', 'ssssererwer', 'sss,ereaw', 'sss999', 'service orders', 'Service Orders', 'Invoice Payments', 'Invoice Payments Descriptions', 'seller,sellers', 'meta description seller', 'seller_login', 'seller login description', 'seller signup', 'seller signup description', 'seller forget password', 'seller sigdescription', 'Pricing', 'Pricing Description');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT '0',
  `thumbnail_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slider_images` text COLLATE utf8_unicode_ci NOT NULL,
  `video_preview_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_demo_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quote_btn_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `service_status` tinyint(3) UNSIGNED NOT NULL,
  `is_featured` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `average_rating` decimal(4,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `package_lowest_price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `skills` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_addons`
--

CREATE TABLE `service_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `is_featured` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `add_to_menu` int(11) DEFAULT '0' COMMENT '1=added, 0 = none',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `language_id`, `image`, `name`, `slug`, `status`, `serial_number`, `is_featured`, `add_to_menu`, `created_at`, `updated_at`) VALUES
(1, 8, '65a7909463758.png', 'Graphics & Design', 'graphics--design', 1, 1, 'yes', 1, '2023-12-17 07:26:15', '2024-01-17 08:32:20'),
(2, 8, '65a7918a72a9e.png', 'Digital Marketing', 'digital-marketing', 1, 2, 'yes', 1, '2023-12-17 07:29:33', '2024-01-17 08:36:26'),
(3, 8, '65a791fb5487e.png', 'Writing & Translation', 'writing--translation', 1, 5, 'yes', 1, '2023-12-17 07:33:06', '2024-01-17 08:38:19'),
(4, 8, '65a791e957453.png', 'Video & Animation', 'video--animation', 1, 4, 'yes', 1, '2023-12-17 07:34:19', '2024-01-17 08:38:01'),
(5, 8, '65a791d91286b.png', 'Programming &Tech', 'programming-tech', 1, 3, 'yes', 1, '2023-12-17 07:35:46', '2024-01-17 08:37:45'),
(6, 8, '65a79218501a4.png', 'Music & Audio', 'music--audio', 1, 6, 'yes', 1, '2023-12-17 07:37:09', '2024-01-17 08:38:48'),
(7, 8, '65a7922d32445.png', 'Business', 'business', 1, 7, 'no', 1, '2023-12-17 07:38:02', '2024-01-17 08:39:09'),
(8, 8, '65a7923d10b57.png', 'Lifestyle', 'lifestyle', 1, 8, 'no', 1, '2023-12-17 07:38:58', '2024-01-17 08:39:25'),
(9, 8, '65a792b15c05c.png', 'Data & Analytics', 'data--analytics', 1, 9, 'no', 1, '2023-12-17 07:40:01', '2024-01-17 08:41:21'),
(10, 8, '65a792b756c31.png', 'Engineering & Architecture', 'engineering--architecture', 1, 10, 'no', 1, '2023-12-17 07:41:05', '2024-01-17 08:41:27'),
(21, 8, '65a794fbba0d3.png', 'AI Services', 'ai-services', 1, 11, 'no', 1, '2024-01-17 08:51:07', '2024-01-17 08:52:20'),
(22, 8, '65a7952fb46a5.png', 'Photography', 'photography', 1, 12, 'no', 1, '2024-01-17 08:51:59', '2024-01-17 08:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `service_contents`
--

CREATE TABLE `service_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `service_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_faqs`
--

CREATE TABLE `service_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_orders`
--

CREATE TABLE `service_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `informations` text COLLATE utf8_unicode_ci,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_membership_id` bigint(20) DEFAULT NULL,
  `package_price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `addons` text COLLATE utf8_unicode_ci,
  `addon_price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `grand_total` decimal(8,2) UNSIGNED DEFAULT NULL,
  `tax_percentage` float DEFAULT '0',
  `tax` float DEFAULT '0',
  `currency_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_text_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raise_status` int(11) DEFAULT '0' COMMENT '0=none, 1 = raised, 2=completed, 3=rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_order_messages`
--

CREATE TABLE `service_order_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `person_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `current_price` decimal(8,2) UNSIGNED NOT NULL,
  `previous_price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `delivery_time` int(10) UNSIGNED DEFAULT NULL,
  `number_of_revision` int(10) UNSIGNED DEFAULT NULL,
  `features` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_reviews`
--

CREATE TABLE `service_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_subcategories`
--

CREATE TABLE `service_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1=active, 0=deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_conversations`
--

CREATE TABLE `ticket_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `person_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `gmt_offset` decimal(10,2) NOT NULL,
  `dst_offset` decimal(10,2) NOT NULL,
  `raw_offset` decimal(10,2) NOT NULL,
  `is_set` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `country_code`, `timezone`, `gmt_offset`, `dst_offset`, `raw_offset`, `is_set`) VALUES
(1, 'AD', 'Europe/Andorra', '1.00', '2.00', '1.00', 'no'),
(2, 'AE', 'Asia/Dubai', '4.00', '4.00', '4.00', 'no'),
(3, 'AF', 'Asia/Kabul', '4.50', '4.50', '4.50', 'no'),
(4, 'AG', 'America/Antigua', '-4.00', '-4.00', '-4.00', 'no'),
(5, 'AI', 'America/Anguilla', '-4.00', '-4.00', '-4.00', 'no'),
(6, 'AL', 'Europe/Tirane', '1.00', '2.00', '1.00', 'no'),
(7, 'AM', 'Asia/Yerevan', '4.00', '4.00', '4.00', 'no'),
(8, 'AO', 'Africa/Luanda', '1.00', '1.00', '1.00', 'no'),
(9, 'AQ', 'Antarctica/Casey', '8.00', '8.00', '8.00', 'no'),
(10, 'AQ', 'Antarctica/Davis', '7.00', '7.00', '7.00', 'no'),
(11, 'AQ', 'Antarctica/DumontDUrville', '10.00', '10.00', '10.00', 'no'),
(12, 'AQ', 'Antarctica/Mawson', '5.00', '5.00', '5.00', 'no'),
(13, 'AQ', 'Antarctica/McMurdo', '13.00', '12.00', '12.00', 'no'),
(14, 'AQ', 'Antarctica/Palmer', '-3.00', '-4.00', '-4.00', 'no'),
(15, 'AQ', 'Antarctica/Rothera', '-3.00', '-3.00', '-3.00', 'no'),
(16, 'AQ', 'Antarctica/South_Pole', '13.00', '12.00', '12.00', 'no'),
(17, 'AQ', 'Antarctica/Syowa', '3.00', '3.00', '3.00', 'no'),
(18, 'AQ', 'Antarctica/Vostok', '6.00', '6.00', '6.00', 'no'),
(19, 'AR', 'America/Argentina/Buenos_Aires', '-3.00', '-3.00', '-3.00', 'no'),
(20, 'AR', 'America/Argentina/Catamarca', '-3.00', '-3.00', '-3.00', 'no'),
(21, 'AR', 'America/Argentina/Cordoba', '-3.00', '-3.00', '-3.00', 'no'),
(22, 'AR', 'America/Argentina/Jujuy', '-3.00', '-3.00', '-3.00', 'no'),
(23, 'AR', 'America/Argentina/La_Rioja', '-3.00', '-3.00', '-3.00', 'no'),
(24, 'AR', 'America/Argentina/Mendoza', '-3.00', '-3.00', '-3.00', 'no'),
(25, 'AR', 'America/Argentina/Rio_Gallegos', '-3.00', '-3.00', '-3.00', 'no'),
(26, 'AR', 'America/Argentina/Salta', '-3.00', '-3.00', '-3.00', 'no'),
(27, 'AR', 'America/Argentina/San_Juan', '-3.00', '-3.00', '-3.00', 'no'),
(28, 'AR', 'America/Argentina/San_Luis', '-3.00', '-3.00', '-3.00', 'no'),
(29, 'AR', 'America/Argentina/Tucuman', '-3.00', '-3.00', '-3.00', 'no'),
(30, 'AR', 'America/Argentina/Ushuaia', '-3.00', '-3.00', '-3.00', 'no'),
(31, 'AS', 'Pacific/Pago_Pago', '-11.00', '-11.00', '-11.00', 'no'),
(32, 'AT', 'Europe/Vienna', '1.00', '2.00', '1.00', 'no'),
(33, 'AU', 'Antarctica/Macquarie', '11.00', '11.00', '11.00', 'no'),
(34, 'AU', 'Australia/Adelaide', '10.50', '9.50', '9.50', 'no'),
(35, 'AU', 'Australia/Brisbane', '10.00', '10.00', '10.00', 'no'),
(36, 'AU', 'Australia/Broken_Hill', '10.50', '9.50', '9.50', 'no'),
(37, 'AU', 'Australia/Currie', '11.00', '10.00', '10.00', 'no'),
(38, 'AU', 'Australia/Darwin', '9.50', '9.50', '9.50', 'no'),
(39, 'AU', 'Australia/Eucla', '8.75', '8.75', '8.75', 'no'),
(40, 'AU', 'Australia/Hobart', '11.00', '10.00', '10.00', 'no'),
(41, 'AU', 'Australia/Lindeman', '10.00', '10.00', '10.00', 'no'),
(42, 'AU', 'Australia/Lord_Howe', '11.00', '10.50', '10.50', 'no'),
(43, 'AU', 'Australia/Melbourne', '11.00', '10.00', '10.00', 'no'),
(44, 'AU', 'Australia/Perth', '8.00', '8.00', '8.00', 'no'),
(45, 'AU', 'Australia/Sydney', '11.00', '10.00', '10.00', 'no'),
(46, 'AW', 'America/Aruba', '-4.00', '-4.00', '-4.00', 'no'),
(47, 'AX', 'Europe/Mariehamn', '2.00', '3.00', '2.00', 'no'),
(48, 'AZ', 'Asia/Baku', '4.00', '5.00', '4.00', 'no'),
(49, 'BA', 'Europe/Sarajevo', '1.00', '2.00', '1.00', 'no'),
(50, 'BB', 'America/Barbados', '-4.00', '-4.00', '-4.00', 'no'),
(51, 'BD', 'Asia/Dhaka', '6.00', '6.00', '6.00', 'yes'),
(52, 'BE', 'Europe/Brussels', '1.00', '2.00', '1.00', 'no'),
(53, 'BF', 'Africa/Ouagadougou', '0.00', '0.00', '0.00', 'no'),
(54, 'BG', 'Europe/Sofia', '2.00', '3.00', '2.00', 'no'),
(55, 'BH', 'Asia/Bahrain', '3.00', '3.00', '3.00', 'no'),
(56, 'BI', 'Africa/Bujumbura', '2.00', '2.00', '2.00', 'no'),
(57, 'BJ', 'Africa/Porto-Novo', '1.00', '1.00', '1.00', 'no'),
(58, 'BL', 'America/St_Barthelemy', '-4.00', '-4.00', '-4.00', 'no'),
(59, 'BM', 'Atlantic/Bermuda', '-4.00', '-3.00', '-4.00', 'no'),
(60, 'BN', 'Asia/Brunei', '8.00', '8.00', '8.00', 'no'),
(61, 'BO', 'America/La_Paz', '-4.00', '-4.00', '-4.00', 'no'),
(62, 'BQ', 'America/Kralendijk', '-4.00', '-4.00', '-4.00', 'no'),
(63, 'BR', 'America/Araguaina', '-3.00', '-3.00', '-3.00', 'no'),
(64, 'BR', 'America/Bahia', '-3.00', '-3.00', '-3.00', 'no'),
(65, 'BR', 'America/Belem', '-3.00', '-3.00', '-3.00', 'no'),
(66, 'BR', 'America/Boa_Vista', '-4.00', '-4.00', '-4.00', 'no'),
(67, 'BR', 'America/Campo_Grande', '-3.00', '-4.00', '-4.00', 'no'),
(68, 'BR', 'America/Cuiaba', '-3.00', '-4.00', '-4.00', 'no'),
(69, 'BR', 'America/Eirunepe', '-5.00', '-5.00', '-5.00', 'no'),
(70, 'BR', 'America/Fortaleza', '-3.00', '-3.00', '-3.00', 'no'),
(71, 'BR', 'America/Maceio', '-3.00', '-3.00', '-3.00', 'no'),
(72, 'BR', 'America/Manaus', '-4.00', '-4.00', '-4.00', 'no'),
(73, 'BR', 'America/Noronha', '-2.00', '-2.00', '-2.00', 'no'),
(74, 'BR', 'America/Porto_Velho', '-4.00', '-4.00', '-4.00', 'no'),
(75, 'BR', 'America/Recife', '-3.00', '-3.00', '-3.00', 'no'),
(76, 'BR', 'America/Rio_Branco', '-5.00', '-5.00', '-5.00', 'no'),
(77, 'BR', 'America/Santarem', '-3.00', '-3.00', '-3.00', 'no'),
(78, 'BR', 'America/Sao_Paulo', '-2.00', '-3.00', '-3.00', 'no'),
(79, 'BS', 'America/Nassau', '-5.00', '-4.00', '-5.00', 'no'),
(80, 'BT', 'Asia/Thimphu', '6.00', '6.00', '6.00', 'no'),
(81, 'BW', 'Africa/Gaborone', '2.00', '2.00', '2.00', 'no'),
(82, 'BY', 'Europe/Minsk', '3.00', '3.00', '3.00', 'no'),
(83, 'BZ', 'America/Belize', '-6.00', '-6.00', '-6.00', 'no'),
(84, 'CA', 'America/Atikokan', '-5.00', '-5.00', '-5.00', 'no'),
(85, 'CA', 'America/Blanc-Sablon', '-4.00', '-4.00', '-4.00', 'no'),
(86, 'CA', 'America/Cambridge_Bay', '-7.00', '-6.00', '-7.00', 'no'),
(87, 'CA', 'America/Creston', '-7.00', '-7.00', '-7.00', 'no'),
(88, 'CA', 'America/Dawson', '-8.00', '-7.00', '-8.00', 'no'),
(89, 'CA', 'America/Dawson_Creek', '-7.00', '-7.00', '-7.00', 'no'),
(90, 'CA', 'America/Edmonton', '-7.00', '-6.00', '-7.00', 'no'),
(91, 'CA', 'America/Glace_Bay', '-4.00', '-3.00', '-4.00', 'no'),
(92, 'CA', 'America/Goose_Bay', '-4.00', '-3.00', '-4.00', 'no'),
(93, 'CA', 'America/Halifax', '-4.00', '-3.00', '-4.00', 'no'),
(94, 'CA', 'America/Inuvik', '-7.00', '-6.00', '-7.00', 'no'),
(95, 'CA', 'America/Iqaluit', '-5.00', '-4.00', '-5.00', 'no'),
(96, 'CA', 'America/Moncton', '-4.00', '-3.00', '-4.00', 'no'),
(97, 'CA', 'America/Montreal', '-5.00', '-4.00', '-5.00', 'no'),
(98, 'CA', 'America/Nipigon', '-5.00', '-4.00', '-5.00', 'no'),
(99, 'CA', 'America/Pangnirtung', '-5.00', '-4.00', '-5.00', 'no'),
(100, 'CA', 'America/Rainy_River', '-6.00', '-5.00', '-6.00', 'no'),
(101, 'CA', 'America/Rankin_Inlet', '-6.00', '-5.00', '-6.00', 'no'),
(102, 'CA', 'America/Regina', '-6.00', '-6.00', '-6.00', 'no'),
(103, 'CA', 'America/Resolute', '-6.00', '-5.00', '-6.00', 'no'),
(104, 'CA', 'America/St_Johns', '-3.50', '-2.50', '-3.50', 'no'),
(105, 'CA', 'America/Swift_Current', '-6.00', '-6.00', '-6.00', 'no'),
(106, 'CA', 'America/Thunder_Bay', '-5.00', '-4.00', '-5.00', 'no'),
(107, 'CA', 'America/Toronto', '-5.00', '-4.00', '-5.00', 'no'),
(108, 'CA', 'America/Vancouver', '-8.00', '-7.00', '-8.00', 'no'),
(109, 'CA', 'America/Whitehorse', '-8.00', '-7.00', '-8.00', 'no'),
(110, 'CA', 'America/Winnipeg', '-6.00', '-5.00', '-6.00', 'no'),
(111, 'CA', 'America/Yellowknife', '-7.00', '-6.00', '-7.00', 'no'),
(112, 'CC', 'Indian/Cocos', '6.50', '6.50', '6.50', 'no'),
(113, 'CD', 'Africa/Kinshasa', '1.00', '1.00', '1.00', 'no'),
(114, 'CD', 'Africa/Lubumbashi', '2.00', '2.00', '2.00', 'no'),
(115, 'CF', 'Africa/Bangui', '1.00', '1.00', '1.00', 'no'),
(116, 'CG', 'Africa/Brazzaville', '1.00', '1.00', '1.00', 'no'),
(117, 'CH', 'Europe/Zurich', '1.00', '2.00', '1.00', 'no'),
(118, 'CI', 'Africa/Abidjan', '0.00', '0.00', '0.00', 'no'),
(119, 'CK', 'Pacific/Rarotonga', '-10.00', '-10.00', '-10.00', 'no'),
(120, 'CL', 'America/Santiago', '-3.00', '-4.00', '-4.00', 'no'),
(121, 'CL', 'Pacific/Easter', '-5.00', '-6.00', '-6.00', 'no'),
(122, 'CM', 'Africa/Douala', '1.00', '1.00', '1.00', 'no'),
(123, 'CN', 'Asia/Chongqing', '8.00', '8.00', '8.00', 'no'),
(124, 'CN', 'Asia/Harbin', '8.00', '8.00', '8.00', 'no'),
(125, 'CN', 'Asia/Kashgar', '8.00', '8.00', '8.00', 'no'),
(126, 'CN', 'Asia/Shanghai', '8.00', '8.00', '8.00', 'no'),
(127, 'CN', 'Asia/Urumqi', '8.00', '8.00', '8.00', 'no'),
(128, 'CO', 'America/Bogota', '-5.00', '-5.00', '-5.00', 'no'),
(129, 'CR', 'America/Costa_Rica', '-6.00', '-6.00', '-6.00', 'no'),
(130, 'CU', 'America/Havana', '-5.00', '-4.00', '-5.00', 'no'),
(131, 'CV', 'Atlantic/Cape_Verde', '-1.00', '-1.00', '-1.00', 'no'),
(132, 'CW', 'America/Curacao', '-4.00', '-4.00', '-4.00', 'no'),
(133, 'CX', 'Indian/Christmas', '7.00', '7.00', '7.00', 'no'),
(134, 'CY', 'Asia/Nicosia', '2.00', '3.00', '2.00', 'no'),
(135, 'CZ', 'Europe/Prague', '1.00', '2.00', '1.00', 'no'),
(136, 'DE', 'Europe/Berlin', '1.00', '2.00', '1.00', 'no'),
(137, 'DE', 'Europe/Busingen', '1.00', '2.00', '1.00', 'no'),
(138, 'DJ', 'Africa/Djibouti', '3.00', '3.00', '3.00', 'no'),
(139, 'DK', 'Europe/Copenhagen', '1.00', '2.00', '1.00', 'no'),
(140, 'DM', 'America/Dominica', '-4.00', '-4.00', '-4.00', 'no'),
(141, 'DO', 'America/Santo_Domingo', '-4.00', '-4.00', '-4.00', 'no'),
(142, 'DZ', 'Africa/Algiers', '1.00', '1.00', '1.00', 'no'),
(143, 'EC', 'America/Guayaquil', '-5.00', '-5.00', '-5.00', 'no'),
(144, 'EC', 'Pacific/Galapagos', '-6.00', '-6.00', '-6.00', 'no'),
(145, 'EE', 'Europe/Tallinn', '2.00', '3.00', '2.00', 'no'),
(146, 'EG', 'Africa/Cairo', '2.00', '2.00', '2.00', 'no'),
(147, 'EH', 'Africa/El_Aaiun', '0.00', '0.00', '0.00', 'no'),
(148, 'ER', 'Africa/Asmara', '3.00', '3.00', '3.00', 'no'),
(149, 'ES', 'Africa/Ceuta', '1.00', '2.00', '1.00', 'no'),
(150, 'ES', 'Atlantic/Canary', '0.00', '1.00', '0.00', 'no'),
(151, 'ES', 'Europe/Madrid', '1.00', '2.00', '1.00', 'no'),
(152, 'ET', 'Africa/Addis_Ababa', '3.00', '3.00', '3.00', 'no'),
(153, 'FI', 'Europe/Helsinki', '2.00', '3.00', '2.00', 'no'),
(154, 'FJ', 'Pacific/Fiji', '13.00', '12.00', '12.00', 'no'),
(155, 'FK', 'Atlantic/Stanley', '-3.00', '-3.00', '-3.00', 'no'),
(156, 'FM', 'Pacific/Chuuk', '10.00', '10.00', '10.00', 'no'),
(157, 'FM', 'Pacific/Kosrae', '11.00', '11.00', '11.00', 'no'),
(158, 'FM', 'Pacific/Pohnpei', '11.00', '11.00', '11.00', 'no'),
(159, 'FO', 'Atlantic/Faroe', '0.00', '1.00', '0.00', 'no'),
(160, 'FR', 'Europe/Paris', '1.00', '2.00', '1.00', 'no'),
(161, 'GA', 'Africa/Libreville', '1.00', '1.00', '1.00', 'no'),
(162, 'GB', 'Europe/London', '0.00', '1.00', '0.00', 'no'),
(163, 'GD', 'America/Grenada', '-4.00', '-4.00', '-4.00', 'no'),
(164, 'GE', 'Asia/Tbilisi', '4.00', '4.00', '4.00', 'no'),
(165, 'GF', 'America/Cayenne', '-3.00', '-3.00', '-3.00', 'no'),
(166, 'GG', 'Europe/Guernsey', '0.00', '1.00', '0.00', 'no'),
(167, 'GH', 'Africa/Accra', '0.00', '0.00', '0.00', 'no'),
(168, 'GI', 'Europe/Gibraltar', '1.00', '2.00', '1.00', 'no'),
(169, 'GL', 'America/Danmarkshavn', '0.00', '0.00', '0.00', 'no'),
(170, 'GL', 'America/Godthab', '-3.00', '-2.00', '-3.00', 'no'),
(171, 'GL', 'America/Scoresbysund', '-1.00', '0.00', '-1.00', 'no'),
(172, 'GL', 'America/Thule', '-4.00', '-3.00', '-4.00', 'no'),
(173, 'GM', 'Africa/Banjul', '0.00', '0.00', '0.00', 'no'),
(174, 'GN', 'Africa/Conakry', '0.00', '0.00', '0.00', 'no'),
(175, 'GP', 'America/Guadeloupe', '-4.00', '-4.00', '-4.00', 'no'),
(176, 'GQ', 'Africa/Malabo', '1.00', '1.00', '1.00', 'no'),
(177, 'GR', 'Europe/Athens', '2.00', '3.00', '2.00', 'no'),
(178, 'GS', 'Atlantic/South_Georgia', '-2.00', '-2.00', '-2.00', 'no'),
(179, 'GT', 'America/Guatemala', '-6.00', '-6.00', '-6.00', 'no'),
(180, 'GU', 'Pacific/Guam', '10.00', '10.00', '10.00', 'no'),
(181, 'GW', 'Africa/Bissau', '0.00', '0.00', '0.00', 'no'),
(182, 'GY', 'America/Guyana', '-4.00', '-4.00', '-4.00', 'no'),
(183, 'HK', 'Asia/Hong_Kong', '8.00', '8.00', '8.00', 'no'),
(184, 'HN', 'America/Tegucigalpa', '-6.00', '-6.00', '-6.00', 'no'),
(185, 'HR', 'Europe/Zagreb', '1.00', '2.00', '1.00', 'no'),
(186, 'HT', 'America/Port-au-Prince', '-5.00', '-4.00', '-5.00', 'no'),
(187, 'HU', 'Europe/Budapest', '1.00', '2.00', '1.00', 'no'),
(188, 'ID', 'Asia/Jakarta', '7.00', '7.00', '7.00', 'no'),
(189, 'ID', 'Asia/Jayapura', '9.00', '9.00', '9.00', 'no'),
(190, 'ID', 'Asia/Makassar', '8.00', '8.00', '8.00', 'no'),
(191, 'ID', 'Asia/Pontianak', '7.00', '7.00', '7.00', 'no'),
(192, 'IE', 'Europe/Dublin', '0.00', '1.00', '0.00', 'no'),
(193, 'IL', 'Asia/Jerusalem', '2.00', '3.00', '2.00', 'no'),
(194, 'IM', 'Europe/Isle_of_Man', '0.00', '1.00', '0.00', 'no'),
(195, 'IN', 'Asia/Kolkata', '5.50', '5.50', '5.50', 'no'),
(196, 'IO', 'Indian/Chagos', '6.00', '6.00', '6.00', 'no'),
(197, 'IQ', 'Asia/Baghdad', '3.00', '3.00', '3.00', 'no'),
(198, 'IR', 'Asia/Tehran', '3.50', '4.50', '3.50', 'no'),
(199, 'IS', 'Atlantic/Reykjavik', '0.00', '0.00', '0.00', 'no'),
(200, 'IT', 'Europe/Rome', '1.00', '2.00', '1.00', 'no'),
(201, 'JE', 'Europe/Jersey', '0.00', '1.00', '0.00', 'no'),
(202, 'JM', 'America/Jamaica', '-5.00', '-5.00', '-5.00', 'no'),
(203, 'JO', 'Asia/Amman', '2.00', '3.00', '2.00', 'no'),
(204, 'JP', 'Asia/Tokyo', '9.00', '9.00', '9.00', 'no'),
(205, 'KE', 'Africa/Nairobi', '3.00', '3.00', '3.00', 'no'),
(206, 'KG', 'Asia/Bishkek', '6.00', '6.00', '6.00', 'no'),
(207, 'KH', 'Asia/Phnom_Penh', '7.00', '7.00', '7.00', 'no'),
(208, 'KI', 'Pacific/Enderbury', '13.00', '13.00', '13.00', 'no'),
(209, 'KI', 'Pacific/Kiritimati', '14.00', '14.00', '14.00', 'no'),
(210, 'KI', 'Pacific/Tarawa', '12.00', '12.00', '12.00', 'no'),
(211, 'KM', 'Indian/Comoro', '3.00', '3.00', '3.00', 'no'),
(212, 'KN', 'America/St_Kitts', '-4.00', '-4.00', '-4.00', 'no'),
(213, 'KP', 'Asia/Pyongyang', '9.00', '9.00', '9.00', 'no'),
(214, 'KR', 'Asia/Seoul', '9.00', '9.00', '9.00', 'no'),
(215, 'KW', 'Asia/Kuwait', '3.00', '3.00', '3.00', 'no'),
(216, 'KY', 'America/Cayman', '-5.00', '-5.00', '-5.00', 'no'),
(217, 'KZ', 'Asia/Almaty', '6.00', '6.00', '6.00', 'no'),
(218, 'KZ', 'Asia/Aqtau', '5.00', '5.00', '5.00', 'no'),
(219, 'KZ', 'Asia/Aqtobe', '5.00', '5.00', '5.00', 'no'),
(220, 'KZ', 'Asia/Oral', '5.00', '5.00', '5.00', 'no'),
(221, 'KZ', 'Asia/Qyzylorda', '6.00', '6.00', '6.00', 'no'),
(222, 'LA', 'Asia/Vientiane', '7.00', '7.00', '7.00', 'no'),
(223, 'LB', 'Asia/Beirut', '2.00', '3.00', '2.00', 'no'),
(224, 'LC', 'America/St_Lucia', '-4.00', '-4.00', '-4.00', 'no'),
(225, 'LI', 'Europe/Vaduz', '1.00', '2.00', '1.00', 'no'),
(226, 'LK', 'Asia/Colombo', '5.50', '5.50', '5.50', 'no'),
(227, 'LR', 'Africa/Monrovia', '0.00', '0.00', '0.00', 'no'),
(228, 'LS', 'Africa/Maseru', '2.00', '2.00', '2.00', 'no'),
(229, 'LT', 'Europe/Vilnius', '2.00', '3.00', '2.00', 'no'),
(230, 'LU', 'Europe/Luxembourg', '1.00', '2.00', '1.00', 'no'),
(231, 'LV', 'Europe/Riga', '2.00', '3.00', '2.00', 'no'),
(232, 'LY', 'Africa/Tripoli', '2.00', '2.00', '2.00', 'no'),
(233, 'MA', 'Africa/Casablanca', '0.00', '0.00', '0.00', 'no'),
(234, 'MC', 'Europe/Monaco', '1.00', '2.00', '1.00', 'no'),
(235, 'MD', 'Europe/Chisinau', '2.00', '3.00', '2.00', 'no'),
(236, 'ME', 'Europe/Podgorica', '1.00', '2.00', '1.00', 'no'),
(237, 'MF', 'America/Marigot', '-4.00', '-4.00', '-4.00', 'no'),
(238, 'MG', 'Indian/Antananarivo', '3.00', '3.00', '3.00', 'no'),
(239, 'MH', 'Pacific/Kwajalein', '12.00', '12.00', '12.00', 'no'),
(240, 'MH', 'Pacific/Majuro', '12.00', '12.00', '12.00', 'no'),
(241, 'MK', 'Europe/Skopje', '1.00', '2.00', '1.00', 'no'),
(242, 'ML', 'Africa/Bamako', '0.00', '0.00', '0.00', 'no'),
(243, 'MM', 'Asia/Rangoon', '6.50', '6.50', '6.50', 'no'),
(244, 'MN', 'Asia/Choibalsan', '8.00', '8.00', '8.00', 'no'),
(245, 'MN', 'Asia/Hovd', '7.00', '7.00', '7.00', 'no'),
(246, 'MN', 'Asia/Ulaanbaatar', '8.00', '8.00', '8.00', 'no'),
(247, 'MO', 'Asia/Macau', '8.00', '8.00', '8.00', 'no'),
(248, 'MP', 'Pacific/Saipan', '10.00', '10.00', '10.00', 'no'),
(249, 'MQ', 'America/Martinique', '-4.00', '-4.00', '-4.00', 'no'),
(250, 'MR', 'Africa/Nouakchott', '0.00', '0.00', '0.00', 'no'),
(251, 'MS', 'America/Montserrat', '-4.00', '-4.00', '-4.00', 'no'),
(252, 'MT', 'Europe/Malta', '1.00', '2.00', '1.00', 'no'),
(253, 'MU', 'Indian/Mauritius', '4.00', '4.00', '4.00', 'no'),
(254, 'MV', 'Indian/Maldives', '5.00', '5.00', '5.00', 'no'),
(255, 'MW', 'Africa/Blantyre', '2.00', '2.00', '2.00', 'no'),
(256, 'MX', 'America/Bahia_Banderas', '-6.00', '-5.00', '-6.00', 'no'),
(257, 'MX', 'America/Cancun', '-6.00', '-5.00', '-6.00', 'no'),
(258, 'MX', 'America/Chihuahua', '-7.00', '-6.00', '-7.00', 'no'),
(259, 'MX', 'America/Hermosillo', '-7.00', '-7.00', '-7.00', 'no'),
(260, 'MX', 'America/Matamoros', '-6.00', '-5.00', '-6.00', 'no'),
(261, 'MX', 'America/Mazatlan', '-7.00', '-6.00', '-7.00', 'no'),
(262, 'MX', 'America/Merida', '-6.00', '-5.00', '-6.00', 'no'),
(263, 'MX', 'America/Mexico_City', '-6.00', '-5.00', '-6.00', 'no'),
(264, 'MX', 'America/Monterrey', '-6.00', '-5.00', '-6.00', 'no'),
(265, 'MX', 'America/Ojinaga', '-7.00', '-6.00', '-7.00', 'no'),
(266, 'MX', 'America/Santa_Isabel', '-8.00', '-7.00', '-8.00', 'no'),
(267, 'MX', 'America/Tijuana', '-8.00', '-7.00', '-8.00', 'no'),
(268, 'MY', 'Asia/Kuala_Lumpur', '8.00', '8.00', '8.00', 'no'),
(269, 'MY', 'Asia/Kuching', '8.00', '8.00', '8.00', 'no'),
(270, 'MZ', 'Africa/Maputo', '2.00', '2.00', '2.00', 'no'),
(271, 'NA', 'Africa/Windhoek', '2.00', '1.00', '1.00', 'no'),
(272, 'NC', 'Pacific/Noumea', '11.00', '11.00', '11.00', 'no'),
(273, 'NE', 'Africa/Niamey', '1.00', '1.00', '1.00', 'no'),
(274, 'NF', 'Pacific/Norfolk', '11.50', '11.50', '11.50', 'no'),
(275, 'NG', 'Africa/Lagos', '1.00', '1.00', '1.00', 'no'),
(276, 'NI', 'America/Managua', '-6.00', '-6.00', '-6.00', 'no'),
(277, 'NL', 'Europe/Amsterdam', '1.00', '2.00', '1.00', 'no'),
(278, 'NO', 'Europe/Oslo', '1.00', '2.00', '1.00', 'no'),
(279, 'NP', 'Asia/Kathmandu', '5.75', '5.75', '5.75', 'no'),
(280, 'NR', 'Pacific/Nauru', '12.00', '12.00', '12.00', 'no'),
(281, 'NU', 'Pacific/Niue', '-11.00', '-11.00', '-11.00', 'no'),
(282, 'NZ', 'Pacific/Auckland', '13.00', '12.00', '12.00', 'no'),
(283, 'NZ', 'Pacific/Chatham', '13.75', '12.75', '12.75', 'no'),
(284, 'OM', 'Asia/Muscat', '4.00', '4.00', '4.00', 'no'),
(285, 'PA', 'America/Panama', '-5.00', '-5.00', '-5.00', 'no'),
(286, 'PE', 'America/Lima', '-5.00', '-5.00', '-5.00', 'no'),
(287, 'PF', 'Pacific/Gambier', '-9.00', '-9.00', '-9.00', 'no'),
(288, 'PF', 'Pacific/Marquesas', '-9.50', '-9.50', '-9.50', 'no'),
(289, 'PF', 'Pacific/Tahiti', '-10.00', '-10.00', '-10.00', 'no'),
(290, 'PG', 'Pacific/Port_Moresby', '10.00', '10.00', '10.00', 'no'),
(291, 'PH', 'Asia/Manila', '8.00', '8.00', '8.00', 'no'),
(292, 'PK', 'Asia/Karachi', '5.00', '5.00', '5.00', 'no'),
(293, 'PL', 'Europe/Warsaw', '1.00', '2.00', '1.00', 'no'),
(294, 'PM', 'America/Miquelon', '-3.00', '-2.00', '-3.00', 'no'),
(295, 'PN', 'Pacific/Pitcairn', '-8.00', '-8.00', '-8.00', 'no'),
(296, 'PR', 'America/Puerto_Rico', '-4.00', '-4.00', '-4.00', 'no'),
(297, 'PS', 'Asia/Gaza', '2.00', '3.00', '2.00', 'no'),
(298, 'PS', 'Asia/Hebron', '2.00', '3.00', '2.00', 'no'),
(299, 'PT', 'Atlantic/Azores', '-1.00', '0.00', '-1.00', 'no'),
(300, 'PT', 'Atlantic/Madeira', '0.00', '1.00', '0.00', 'no'),
(301, 'PT', 'Europe/Lisbon', '0.00', '1.00', '0.00', 'no'),
(302, 'PW', 'Pacific/Palau', '9.00', '9.00', '9.00', 'no'),
(303, 'PY', 'America/Asuncion', '-3.00', '-4.00', '-4.00', 'no'),
(304, 'QA', 'Asia/Qatar', '3.00', '3.00', '3.00', 'no'),
(305, 'RE', 'Indian/Reunion', '4.00', '4.00', '4.00', 'no'),
(306, 'RO', 'Europe/Bucharest', '2.00', '3.00', '2.00', 'no'),
(307, 'RS', 'Europe/Belgrade', '1.00', '2.00', '1.00', 'no'),
(308, 'RU', 'Asia/Anadyr', '12.00', '12.00', '12.00', 'no'),
(309, 'RU', 'Asia/Irkutsk', '9.00', '9.00', '9.00', 'no'),
(310, 'RU', 'Asia/Kamchatka', '12.00', '12.00', '12.00', 'no'),
(311, 'RU', 'Asia/Khandyga', '10.00', '10.00', '10.00', 'no'),
(312, 'RU', 'Asia/Krasnoyarsk', '8.00', '8.00', '8.00', 'no'),
(313, 'RU', 'Asia/Magadan', '12.00', '12.00', '12.00', 'no'),
(314, 'RU', 'Asia/Novokuznetsk', '7.00', '7.00', '7.00', 'no'),
(315, 'RU', 'Asia/Novosibirsk', '7.00', '7.00', '7.00', 'no'),
(316, 'RU', 'Asia/Omsk', '7.00', '7.00', '7.00', 'no'),
(317, 'RU', 'Asia/Sakhalin', '11.00', '11.00', '11.00', 'no'),
(318, 'RU', 'Asia/Ust-Nera', '11.00', '11.00', '11.00', 'no'),
(319, 'RU', 'Asia/Vladivostok', '11.00', '11.00', '11.00', 'no'),
(320, 'RU', 'Asia/Yakutsk', '10.00', '10.00', '10.00', 'no'),
(321, 'RU', 'Asia/Yekaterinburg', '6.00', '6.00', '6.00', 'no'),
(322, 'RU', 'Europe/Kaliningrad', '3.00', '3.00', '3.00', 'no'),
(323, 'RU', 'Europe/Moscow', '4.00', '4.00', '4.00', 'no'),
(324, 'RU', 'Europe/Samara', '4.00', '4.00', '4.00', 'no'),
(325, 'RU', 'Europe/Volgograd', '4.00', '4.00', '4.00', 'no'),
(326, 'RW', 'Africa/Kigali', '2.00', '2.00', '2.00', 'no'),
(327, 'SA', 'Asia/Riyadh', '3.00', '3.00', '3.00', 'no'),
(328, 'SB', 'Pacific/Guadalcanal', '11.00', '11.00', '11.00', 'no'),
(329, 'SC', 'Indian/Mahe', '4.00', '4.00', '4.00', 'no'),
(330, 'SD', 'Africa/Khartoum', '3.00', '3.00', '3.00', 'no'),
(331, 'SE', 'Europe/Stockholm', '1.00', '2.00', '1.00', 'no'),
(332, 'SG', 'Asia/Singapore', '8.00', '8.00', '8.00', 'no'),
(333, 'SH', 'Atlantic/St_Helena', '0.00', '0.00', '0.00', 'no'),
(334, 'SI', 'Europe/Ljubljana', '1.00', '2.00', '1.00', 'no'),
(335, 'SJ', 'Arctic/Longyearbyen', '1.00', '2.00', '1.00', 'no'),
(336, 'SK', 'Europe/Bratislava', '1.00', '2.00', '1.00', 'no'),
(337, 'SL', 'Africa/Freetown', '0.00', '0.00', '0.00', 'no'),
(338, 'SM', 'Europe/San_Marino', '1.00', '2.00', '1.00', 'no'),
(339, 'SN', 'Africa/Dakar', '0.00', '0.00', '0.00', 'no'),
(340, 'SO', 'Africa/Mogadishu', '3.00', '3.00', '3.00', 'no'),
(341, 'SR', 'America/Paramaribo', '-3.00', '-3.00', '-3.00', 'no'),
(342, 'SS', 'Africa/Juba', '3.00', '3.00', '3.00', 'no'),
(343, 'ST', 'Africa/Sao_Tome', '0.00', '0.00', '0.00', 'no'),
(344, 'SV', 'America/El_Salvador', '-6.00', '-6.00', '-6.00', 'no'),
(345, 'SX', 'America/Lower_Princes', '-4.00', '-4.00', '-4.00', 'no'),
(346, 'SY', 'Asia/Damascus', '2.00', '3.00', '2.00', 'no'),
(347, 'SZ', 'Africa/Mbabane', '2.00', '2.00', '2.00', 'no'),
(348, 'TC', 'America/Grand_Turk', '-5.00', '-4.00', '-5.00', 'no'),
(349, 'TD', 'Africa/Ndjamena', '1.00', '1.00', '1.00', 'no'),
(350, 'TF', 'Indian/Kerguelen', '5.00', '5.00', '5.00', 'no'),
(351, 'TG', 'Africa/Lome', '0.00', '0.00', '0.00', 'no'),
(352, 'TH', 'Asia/Bangkok', '7.00', '7.00', '7.00', 'no'),
(353, 'TJ', 'Asia/Dushanbe', '5.00', '5.00', '5.00', 'no'),
(354, 'TK', 'Pacific/Fakaofo', '13.00', '13.00', '13.00', 'no'),
(355, 'TL', 'Asia/Dili', '9.00', '9.00', '9.00', 'no'),
(356, 'TM', 'Asia/Ashgabat', '5.00', '5.00', '5.00', 'no'),
(357, 'TN', 'Africa/Tunis', '1.00', '1.00', '1.00', 'no'),
(358, 'TO', 'Pacific/Tongatapu', '13.00', '13.00', '13.00', 'no'),
(359, 'TR', 'Europe/Istanbul', '2.00', '3.00', '2.00', 'no'),
(360, 'TT', 'America/Port_of_Spain', '-4.00', '-4.00', '-4.00', 'no'),
(361, 'TV', 'Pacific/Funafuti', '12.00', '12.00', '12.00', 'no'),
(362, 'TW', 'Asia/Taipei', '8.00', '8.00', '8.00', 'no'),
(363, 'TZ', 'Africa/Dar_es_Salaam', '3.00', '3.00', '3.00', 'no'),
(364, 'UA', 'Europe/Kiev', '2.00', '3.00', '2.00', 'no'),
(365, 'UA', 'Europe/Simferopol', '2.00', '4.00', '4.00', 'no'),
(366, 'UA', 'Europe/Uzhgorod', '2.00', '3.00', '2.00', 'no'),
(367, 'UA', 'Europe/Zaporozhye', '2.00', '3.00', '2.00', 'no'),
(368, 'UG', 'Africa/Kampala', '3.00', '3.00', '3.00', 'no'),
(369, 'UM', 'Pacific/Johnston', '-10.00', '-10.00', '-10.00', 'no'),
(370, 'UM', 'Pacific/Midway', '-11.00', '-11.00', '-11.00', 'no'),
(371, 'UM', 'Pacific/Wake', '12.00', '12.00', '12.00', 'no'),
(372, 'US', 'America/Adak', '-10.00', '-9.00', '-10.00', 'no'),
(373, 'US', 'America/Anchorage', '-9.00', '-8.00', '-9.00', 'no'),
(374, 'US', 'America/Boise', '-7.00', '-6.00', '-7.00', 'no'),
(375, 'US', 'America/Chicago', '-6.00', '-5.00', '-6.00', 'no'),
(376, 'US', 'America/Denver', '-7.00', '-6.00', '-7.00', 'no'),
(377, 'US', 'America/Detroit', '-5.00', '-4.00', '-5.00', 'no'),
(378, 'US', 'America/Indiana/Indianapolis', '-5.00', '-4.00', '-5.00', 'no'),
(379, 'US', 'America/Indiana/Knox', '-6.00', '-5.00', '-6.00', 'no'),
(380, 'US', 'America/Indiana/Marengo', '-5.00', '-4.00', '-5.00', 'no'),
(381, 'US', 'America/Indiana/Petersburg', '-5.00', '-4.00', '-5.00', 'no'),
(382, 'US', 'America/Indiana/Tell_City', '-6.00', '-5.00', '-6.00', 'no'),
(383, 'US', 'America/Indiana/Vevay', '-5.00', '-4.00', '-5.00', 'no'),
(384, 'US', 'America/Indiana/Vincennes', '-5.00', '-4.00', '-5.00', 'no'),
(385, 'US', 'America/Indiana/Winamac', '-5.00', '-4.00', '-5.00', 'no'),
(386, 'US', 'America/Juneau', '-9.00', '-8.00', '-9.00', 'no'),
(387, 'US', 'America/Kentucky/Louisville', '-5.00', '-4.00', '-5.00', 'no'),
(388, 'US', 'America/Kentucky/Monticello', '-5.00', '-4.00', '-5.00', 'no'),
(389, 'US', 'America/Los_Angeles', '-8.00', '-7.00', '-8.00', 'no'),
(390, 'US', 'America/Menominee', '-6.00', '-5.00', '-6.00', 'no'),
(391, 'US', 'America/Metlakatla', '-8.00', '-8.00', '-8.00', 'no'),
(392, 'US', 'America/New_York', '-5.00', '-4.00', '-5.00', 'no'),
(393, 'US', 'America/Nome', '-9.00', '-8.00', '-9.00', 'no'),
(394, 'US', 'America/North_Dakota/Beulah', '-6.00', '-5.00', '-6.00', 'no'),
(395, 'US', 'America/North_Dakota/Center', '-6.00', '-5.00', '-6.00', 'no'),
(396, 'US', 'America/North_Dakota/New_Salem', '-6.00', '-5.00', '-6.00', 'no'),
(397, 'US', 'America/Phoenix', '-7.00', '-7.00', '-7.00', 'no'),
(398, 'US', 'America/Shiprock', '-7.00', '-6.00', '-7.00', 'no'),
(399, 'US', 'America/Sitka', '-9.00', '-8.00', '-9.00', 'no'),
(400, 'US', 'America/Yakutat', '-9.00', '-8.00', '-9.00', 'no'),
(401, 'US', 'Pacific/Honolulu', '-10.00', '-10.00', '-10.00', 'no'),
(402, 'UY', 'America/Montevideo', '-2.00', '-3.00', '-3.00', 'no'),
(403, 'UZ', 'Asia/Samarkand', '5.00', '5.00', '5.00', 'no'),
(404, 'UZ', 'Asia/Tashkent', '5.00', '5.00', '5.00', 'no'),
(405, 'VA', 'Europe/Vatican', '1.00', '2.00', '1.00', 'no'),
(406, 'VC', 'America/St_Vincent', '-4.00', '-4.00', '-4.00', 'no'),
(407, 'VE', 'America/Caracas', '-4.50', '-4.50', '-4.50', 'no'),
(408, 'VG', 'America/Tortola', '-4.00', '-4.00', '-4.00', 'no'),
(409, 'VI', 'America/St_Thomas', '-4.00', '-4.00', '-4.00', 'no'),
(410, 'VN', 'Asia/Ho_Chi_Minh', '7.00', '7.00', '7.00', 'no'),
(411, 'VU', 'Pacific/Efate', '11.00', '11.00', '11.00', 'no'),
(412, 'WF', 'Pacific/Wallis', '12.00', '12.00', '12.00', 'no'),
(413, 'WS', 'Pacific/Apia', '14.00', '13.00', '13.00', 'no'),
(414, 'YE', 'Asia/Aden', '3.00', '3.00', '3.00', 'no'),
(415, 'YT', 'Indian/Mayotte', '3.00', '3.00', '3.00', 'no'),
(416, 'ZA', 'Africa/Johannesburg', '2.00', '2.00', '2.00', 'no'),
(417, 'ZM', 'Africa/Lusaka', '2.00', '2.00', '2.00', 'no'),
(418, 'ZW', 'Africa/Harare', '2.00', '2.00', '2.00', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transcation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `transcation_type` int(11) DEFAULT NULL COMMENT '1=service order, 2=Withdraw, 3= balance add, 4 = balance subtract, 5 = pacakge purchase',
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `tax` float(8,2) DEFAULT '0.00',
  `pre_balance` double(8,2) DEFAULT NULL,
  `after_balance` double(8,2) DEFAULT NULL,
  `gateway_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 -> banned or deactive, 1 -> active',
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_products`
--

CREATE TABLE `wishlist_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_services`
--

CREATE TABLE `wishlist_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `withdraw_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_id` int(11) DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payable_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `total_charge` float(8,2) NOT NULL DEFAULT '0.00',
  `additional_reference` text COLLATE utf8mb4_unicode_ci,
  `feilds` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_method_inputs`
--

CREATE TABLE `withdraw_method_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_payment_method_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1-text, 2-select, 3-checkbox, 4-textarea, 5-datepicker, 6-timepicker, 7-number',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-required, 0- optional',
  `order_number` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_method_options`
--

CREATE TABLE `withdraw_method_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_method_input_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_payment_methods`
--

CREATE TABLE `withdraw_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_limit` double(8,2) DEFAULT NULL,
  `max_limit` double(8,2) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `fixed_charge` float(8,2) DEFAULT '0.00',
  `percentage_charge` float(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_sections`
--
ALTER TABLE `about_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_role_id_foreign` (`role_id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_extends`
--
ALTER TABLE `basic_extends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cookie_alerts_language_id_foreign` (`language_id`);

--
-- Indexes for table `cta_section_infos`
--
ALTER TABLE `cta_section_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_language_id_foreign` (`language_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_contents`
--
ALTER TABLE `footer_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_texts_language_id_foreign` (`language_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_inputs`
--
ALTER TABLE `form_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_sliders`
--
ALTER TABLE `hero_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_statics`
--
ALTER TABLE `hero_statics`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_builders`
--
ALTER TABLE `menu_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_gateways`
--
ALTER TABLE `online_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_contents_language_id_foreign` (`language_id`),
  ADD KEY `page_contents_page_id_foreign` (`page_id`);

--
-- Indexes for table `page_headings`
--
ALTER TABLE `page_headings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_headings_language_id_foreign` (`language_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popups_language_id_foreign` (`language_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_informations`
--
ALTER TABLE `post_informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quick_links`
--
ALTER TABLE `quick_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quick_links_language_id_foreign` (`language_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_titles`
--
ALTER TABLE `section_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_infos`
--
ALTER TABLE `seller_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seos_language_id_foreign` (`language_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_addons`
--
ALTER TABLE `service_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `service_contents`
--
ALTER TABLE `service_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_faqs`
--
ALTER TABLE `service_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_orders`
--
ALTER TABLE `service_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_order_messages`
--
ALTER TABLE `service_order_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_subcategories`
--
ALTER TABLE `service_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_subcategories_language_id_foreign` (`language_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_id_unique` (`email_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_conversations`
--
ALTER TABLE `ticket_conversations`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_address_unique` (`email_address`) USING BTREE,
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_services`
--
ALTER TABLE `wishlist_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_method_inputs`
--
ALTER TABLE `withdraw_method_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_method_options`
--
ALTER TABLE `withdraw_method_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_payment_methods`
--
ALTER TABLE `withdraw_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_sections`
--
ALTER TABLE `about_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_extends`
--
ALTER TABLE `basic_extends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cta_section_infos`
--
ALTER TABLE `cta_section_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_contents`
--
ALTER TABLE `footer_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_inputs`
--
ALTER TABLE `form_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hero_sliders`
--
ALTER TABLE `hero_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hero_statics`
--
ALTER TABLE `hero_statics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_builders`
--
ALTER TABLE `menu_builders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_gateways`
--
ALTER TABLE `online_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_headings`
--
ALTER TABLE `page_headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_informations`
--
ALTER TABLE `post_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quick_links`
--
ALTER TABLE `quick_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section_titles`
--
ALTER TABLE `section_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_infos`
--
ALTER TABLE `seller_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_addons`
--
ALTER TABLE `service_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `service_contents`
--
ALTER TABLE `service_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_faqs`
--
ALTER TABLE `service_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_orders`
--
ALTER TABLE `service_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_order_messages`
--
ALTER TABLE `service_order_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_reviews`
--
ALTER TABLE `service_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_subcategories`
--
ALTER TABLE `service_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_conversations`
--
ALTER TABLE `ticket_conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_services`
--
ALTER TABLE `wishlist_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_method_inputs`
--
ALTER TABLE `withdraw_method_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_method_options`
--
ALTER TABLE `withdraw_method_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_payment_methods`
--
ALTER TABLE `withdraw_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD CONSTRAINT `cookie_alerts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `footer_contents`
--
ALTER TABLE `footer_contents`
  ADD CONSTRAINT `footer_texts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD CONSTRAINT `page_contents_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_contents_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `popups`
--
ALTER TABLE `popups`
  ADD CONSTRAINT `popups_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quick_links`
--
ALTER TABLE `quick_links`
  ADD CONSTRAINT `quick_links_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seos`
--
ALTER TABLE `seos`
  ADD CONSTRAINT `seos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_subcategories`
--
ALTER TABLE `service_subcategories`
  ADD CONSTRAINT `service_subcategories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
