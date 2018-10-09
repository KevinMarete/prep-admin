-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2018 at 02:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `preplr`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
(23, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 6, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 2),
(25, 6, 'subtitle', 'text', 'Subtitle', 0, 1, 1, 1, 1, 1, NULL, 3),
(26, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(27, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(28, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(29, 8, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 2),
(30, 8, 'columns', 'text', 'Columns', 0, 1, 1, 1, 1, 1, NULL, 3),
(31, 8, 'hierrarchy', 'text', 'Hierrarchy', 0, 1, 1, 1, 1, 1, NULL, 4),
(32, 8, 'faq_id', 'text', 'Faq Id', 0, 1, 1, 1, 1, 1, NULL, 5),
(33, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(34, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(35, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(36, 9, 'question', 'text', 'Question', 0, 1, 1, 1, 1, 1, NULL, 2),
(37, 9, 'answer', 'text', 'Answer', 0, 1, 1, 1, 1, 1, NULL, 3),
(38, 9, 'category', 'text', 'Category', 0, 1, 1, 1, 1, 1, NULL, 4),
(39, 8, 'section_hasone_faq_relationship', 'relationship', 'faqs', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Faq","table":"faqs","type":"hasOne","column":"id","key":"id","label":"question","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
(40, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(41, 11, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, NULL, 2),
(42, 11, 'number', 'text', 'Number', 0, 1, 1, 1, 1, 1, NULL, 3),
(43, 11, 'subtitle', 'text', 'Subtitle', 0, 1, 1, 1, 1, 1, NULL, 4),
(44, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(45, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(46, 8, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, NULL, 8),
(47, 8, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-10-08 09:08:08', '2018-10-08 09:08:08'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-10-08 09:08:08', '2018-10-08 09:08:08'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-10-08 09:08:08', '2018-10-08 09:08:08'),
(5, 'homeherotext', 'homeherotext', 'Homeherotext', 'Homeherotexts', NULL, 'App\\Homeherotext', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(6, 'homeherotexts', 'homeherotexts', 'Homeherotext', 'Homeherotexts', NULL, 'App\\Homeherotext', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(8, 'sections', 'sections', 'Section', 'Sections', NULL, 'App\\Section', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-10-09 05:31:21', '2018-10-09 05:31:21'),
(9, 'faqs', 'faqs', 'Faq', 'Faqs', NULL, 'App\\Faq', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(11, 'homenumbers', 'homenumbers', 'Homenumber', 'Homenumbers', NULL, 'App\\Homenumber', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null}', '2018-10-09 06:00:52', '2018-10-09 06:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category`, `created_at`, `updated_at`) VALUES
(1, 'What Is Prep', 'Pre-Exposure Prophylaxis (PrEP) is an antiretroviral drug taken daily by HIV negative people who are at a substantial ongoing risk of HIV infection to reduce their chances of contracting the virus.  PrEP is not a vaccine and does not prevent from STI’s and pregnancy. It should be used with other prevention strategies such as condoms and contraceptives.', 'User', '2018-10-09 06:15:32', '2018-10-09 06:15:32'),
(2, 'Is Prep for Everyone', 'PrEP can be taken by anyone who is at a substantial on-going risk of acquiring HIV.', 'User', '2018-10-09 06:23:21', '2018-10-09 06:23:21'),
(3, 'Is it true that Prep Prevents HIV', 'If used consistently and as prescribed (one pill a day taken at least seven days before exposure), studies have shown that PrEP reduces the risk of contracting HIV from sexual contact by more than 90%', 'User', '2018-10-09 06:24:10', '2018-10-09 06:24:10'),
(4, 'When should PrEP be initiated', 'THE CHOICE IS YOURS!!PrEP should only be initiated by a health care provider when the client is willing and ready.  The Health Care provider will carry out a HIV test and counsel the client. A risk assessment to establish eligibility and  inform the client of other prevention strategies.', 'User', '2018-10-09 06:24:48', '2018-10-09 06:24:48'),
(5, 'Who is a potential PrEP user', 'A HIV negative person who is at an ongoing risk of HIV infection or if the client has a sexual partner who is:  Known to be HIV positive and not on ART  Is on ART but does not take medication consistently or has not achieved viral suppression  Also if the client:  Has multiple sexual partners of unknown HIV status  Has multiple sexual partners  Has frequent STI’s  Engages in transactional sex (sex in exchange for gifts, money)  Recurrently uses Post Exposure Prophylaxis (PEP)  Is in a sero-discordant relationship trying to conceive  Experiences frequent condom bursts or is unable to negotiate condom use with persons on unknown HIV status  PrEP may also be offered to pregnant and breastfeeding women or women in a sero-discordant relationship trying to conceive.', 'Provider', '2018-10-09 06:28:08', '2018-10-09 06:28:08'),
(6, 'How does prep work', 'If PrEP is taken correctly and consistently, it helps build a protective layer around body cells e.g. having unprotected sex with someone who is living with HIV or coming into contact with infected body fluid, PrEP can stop the virus from establishing itself in the body', 'Provider', '2018-10-09 06:29:17', '2018-10-09 06:29:17'),
(7, 'How do I ensure that the client is comfortable to discuss their risk', 'Providers should make every effort to establish rapport with potential PrEP clients, provide adequate privacy and offer assurances of confidentiality. A non-judgmental attitude will contribute towards open conversations where clients will be free to share accurate information on their ongoing risk', 'Provider', '2018-10-09 06:30:33', '2018-10-09 06:30:33'),
(8, 'What resources are available to support PrEP provision', 'There are a variety of resources available to support Health Care Providers in initiating, administering and dispensing PrEP >>link to resources<< i. Provider tool Kit  ii. Guidelines', 'Provider', '2018-10-09 06:31:06', '2018-10-09 06:31:06'),
(9, 'Who can dispense PrEP', 'PrEP must be prescribed by a healthcare professional who has completed training on the national guidelines for the use of ARVs as PrEP .', 'Provider', '2018-10-09 06:31:47', '2018-10-09 06:31:47'),
(10, 'Where is PrEP Offered in Kenya', 'In Kenya PrEP is currently offered in 900 health facilities in various service delivery points such as CCC’s, PMTCT Clinics, MCH Clinics, FP Clinics, OPD, IPD. PrEP is also available in Drop in Centres (DICES) and safe spaces >>link to map locator)   ', 'Provider', '2018-10-09 06:33:05', '2018-10-09 06:33:05'),
(11, 'Will PrEP be effective if a client does not adhere to one pill a day', 'Missing of pills greatly reduces the ability of PrEP to provide full protection against HIV infection. For PrEP to be effective, medication should be taken as instructed by the health provider.', 'Provider', '2018-10-09 06:33:38', '2018-10-09 06:33:38'),
(12, 'What are the side-effects of PrEP', 'Side effects related to PrEP may be experienced occasionally for a short period. These may include: Headaches, weight loss, nausea, vomiting, and abdominal discomfort. These side effects will reduce after a few weeks of taking PrEP', 'Provider', '2018-10-09 06:34:36', '2018-10-09 06:34:36'),
(13, 'How long should a client take PrEP', 'Use of PrEP will be based on the continued risk of a client to contract HIV', 'User', '2018-10-09 06:35:05', '2018-10-09 06:35:05'),
(14, 'How often should a repeat HIV test be carried out when a client is on PrEP', 'HIV testing should be done every three (3) months. However, in the monthly re-fill visits the provider should reassess risk of HIV infection and offer risk reduction counselling.', 'Provider', '2018-10-09 06:35:49', '2018-10-09 06:35:49'),
(15, 'When should I discontinue prescribing PrEp for a client', 'If the client sero-converts (becomes HIV positive) If there is a reduction in the risk of contracting HIV  If the client(s) kidney (renal) function is low after conducting laboratory tests If a client requests to stop taking PrEP If a client is not adhering to PrEP  If a client is in a discordant relationship and the HIV positive partner has achieved viral suppression', 'Provider', '2018-10-09 06:37:17', '2018-10-09 06:37:17'),
(16, 'What should the client know about combination prevention strategies?', NULL, NULL, '2018-10-09 06:37:33', '2018-10-09 06:37:33'),
(17, 'What happens when a client seroconverts while on PrEP', 'If a client sero-converts while on PrEP, it is important to counsel the client and immediately link to care and treatment.', 'Provider', '2018-10-09 06:38:15', '2018-10-09 06:38:15'),
(18, 'What are the focus areas in the implementation of oral PrEP in Kenya', 'Leadership and governance – Focus on leadership and governance to increase ownership and coordination of HIV PrEP response at all level  Service delivery – Service provision approaches and operations around PrEP implementation  Commodity security - Access and availability of commodities to users underpins the success of PrEP implementation  Communications advocacy and community engagement – Effective communication to ensure meaningful engagement of stakeholders for successful rollout of PrEP in Kenya  Monitoring and evaluation - How PrEP national roll-out will be incorporated into the mainstream HIV M&E health sector reporting  Research and impact evaluation - Key research and impact evaluation agenda for PrEP implementation and defines strategies for formulating, conducting, coordinating and funding implementation science research within the context of PrEP.  Financing and resource mobilisation - Cost estimates and impact of PrEP as a prevention strategy to inform the implementation and scale-up of PrEP services', 'Policymaker', '2018-10-09 06:40:24', '2018-10-09 06:40:24'),
(19, 'What areas are supported by PrEP implementing partners?', 'There are a variety of partners who support in the implementation and scale up of PrEP across Kenya. Currently areas that are supported are:  Monitoring and Evaluation  Capacity building  Laboratory services  IEC materials', 'Policymaker', '2018-10-09 06:43:28', '2018-10-09 06:43:28'),
(20, 'Default', 'Default', 'Default', '2018-10-09 07:22:17', '2018-10-09 07:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `homeherotexts`
--

CREATE TABLE `homeherotexts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeherotexts`
--

INSERT INTO `homeherotexts` (`id`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, 'Love.Prevent.Live', 'Protect yourself from HIV.', '2018-10-08 10:44:11', '2018-10-08 10:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `homenumbers`
--

CREATE TABLE `homenumbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homenumbers`
--

INSERT INTO `homenumbers` (`id`, `title`, `number`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, 'People living with HIV', 1500000, '2016', '2018-10-09 07:09:00', '2018-10-09 07:10:53'),
(2, 'New HIV Infections', 62000, '2016', '2018-10-09 07:09:48', '2018-10-09 07:09:48'),
(3, 'Clients on PrEP', 19000, '2016', '2018-10-09 07:10:41', '2018-10-09 07:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-10-08 09:08:10', '2018-10-08 09:08:10'),
(2, 'main', '2018-10-08 09:13:58', '2018-10-08 09:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-10-08 09:08:10', '2018-10-08 09:08:10', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2018-10-08 09:08:11', '2018-10-08 09:08:11', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2018-10-08 09:08:11', '2018-10-08 09:08:11', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2018-10-08 09:08:16', '2018-10-08 09:08:16', 'voyager.hooks', NULL),
(12, 2, 'Home', '', '_self', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', '/', ''),
(13, 2, 'User', '', '_self', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', 'user', ''),
(14, 2, 'Provider', '', '_self', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', '/provider', ''),
(15, 2, 'Policy Maker', '', '_self', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', '/policymaker', ''),
(16, 2, 'Journey in Kenya', '', '_self', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', '/journey', ''),
(17, 2, 'Resources', '', '/resources', NULL, '#000000', NULL, 15, '2018-10-08 09:14:19', '2018-10-08 09:14:19', '/resources', ''),
(18, 1, 'Homeherotexts', '', '_self', NULL, NULL, NULL, 16, '2018-10-08 10:33:09', '2018-10-08 10:33:09', 'voyager.homeherotext.index', NULL),
(19, 1, 'Homeherotexts', '', '_self', NULL, NULL, NULL, 17, '2018-10-08 10:43:19', '2018-10-08 10:43:19', 'voyager.homeherotexts.index', NULL),
(20, 1, 'Sections', '', '_self', NULL, NULL, NULL, 18, '2018-10-09 05:31:22', '2018-10-09 05:31:22', 'voyager.sections.index', NULL),
(21, 1, 'Faqs', '', '_self', NULL, NULL, NULL, 19, '2018-10-09 05:37:07', '2018-10-09 05:37:07', 'voyager.faqs.index', NULL),
(22, 1, 'Homenumbers', '', '_self', NULL, NULL, NULL, 20, '2018-10-09 06:00:52', '2018-10-09 06:00:52', 'voyager.homenumbers.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-10-08 09:08:11', '2018-10-08 09:08:11'),
(2, 'browse_bread', NULL, '2018-10-08 09:08:11', '2018-10-08 09:08:11'),
(3, 'browse_database', NULL, '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(4, 'browse_media', NULL, '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(5, 'browse_compass', NULL, '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(6, 'browse_menus', 'menus', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(7, 'read_menus', 'menus', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(8, 'edit_menus', 'menus', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(9, 'add_menus', 'menus', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(10, 'delete_menus', 'menus', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(11, 'browse_roles', 'roles', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(12, 'read_roles', 'roles', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(13, 'edit_roles', 'roles', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(14, 'add_roles', 'roles', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(15, 'delete_roles', 'roles', '2018-10-08 09:08:12', '2018-10-08 09:08:12'),
(16, 'browse_users', 'users', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(17, 'read_users', 'users', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(18, 'edit_users', 'users', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(19, 'add_users', 'users', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(20, 'delete_users', 'users', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(21, 'browse_settings', 'settings', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(22, 'read_settings', 'settings', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(23, 'edit_settings', 'settings', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(24, 'add_settings', 'settings', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(25, 'delete_settings', 'settings', '2018-10-08 09:08:13', '2018-10-08 09:08:13'),
(26, 'browse_hooks', NULL, '2018-10-08 09:08:16', '2018-10-08 09:08:16'),
(27, 'browse_homeherotext', 'homeherotext', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(28, 'read_homeherotext', 'homeherotext', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(29, 'edit_homeherotext', 'homeherotext', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(30, 'add_homeherotext', 'homeherotext', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(31, 'delete_homeherotext', 'homeherotext', '2018-10-08 10:33:09', '2018-10-08 10:33:09'),
(32, 'browse_homeherotexts', 'homeherotexts', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(33, 'read_homeherotexts', 'homeherotexts', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(34, 'edit_homeherotexts', 'homeherotexts', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(35, 'add_homeherotexts', 'homeherotexts', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(36, 'delete_homeherotexts', 'homeherotexts', '2018-10-08 10:43:19', '2018-10-08 10:43:19'),
(37, 'browse_sections', 'sections', '2018-10-09 05:31:22', '2018-10-09 05:31:22'),
(38, 'read_sections', 'sections', '2018-10-09 05:31:22', '2018-10-09 05:31:22'),
(39, 'edit_sections', 'sections', '2018-10-09 05:31:22', '2018-10-09 05:31:22'),
(40, 'add_sections', 'sections', '2018-10-09 05:31:22', '2018-10-09 05:31:22'),
(41, 'delete_sections', 'sections', '2018-10-09 05:31:22', '2018-10-09 05:31:22'),
(42, 'browse_faqs', 'faqs', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(43, 'read_faqs', 'faqs', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(44, 'edit_faqs', 'faqs', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(45, 'add_faqs', 'faqs', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(46, 'delete_faqs', 'faqs', '2018-10-09 05:37:07', '2018-10-09 05:37:07'),
(47, 'browse_homenumbers', 'homenumbers', '2018-10-09 06:00:52', '2018-10-09 06:00:52'),
(48, 'read_homenumbers', 'homenumbers', '2018-10-09 06:00:52', '2018-10-09 06:00:52'),
(49, 'edit_homenumbers', 'homenumbers', '2018-10-09 06:00:52', '2018-10-09 06:00:52'),
(50, 'add_homenumbers', 'homenumbers', '2018-10-09 06:00:52', '2018-10-09 06:00:52'),
(51, 'delete_homenumbers', 'homenumbers', '2018-10-09 06:00:52', '2018-10-09 06:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-10-08 09:08:11', '2018-10-08 09:08:11'),
(2, 'user', 'Normal User', '2018-10-08 09:08:11', '2018-10-08 09:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columns` int(11) DEFAULT NULL,
  `hierrarchy` int(11) DEFAULT NULL,
  `faq_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'medium',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `columns`, `hierrarchy`, `faq_id`, `created_at`, `updated_at`, `size`, `status`) VALUES
(1, 'What Is Prep', 2, 1, 1, '2018-10-09 05:32:09', '2018-10-09 05:32:09', NULL, 'on'),
(2, 'What Is Prep and Is it for everyone', 2, 2, 2, '2018-10-09 07:15:06', '2018-10-09 07:15:06', NULL, 'on'),
(3, 'Prep Prevents HIV', 2, 3, 3, '2018-10-09 07:15:48', '2018-10-09 07:15:48', NULL, 'on'),
(4, 'When should Prep be Initiated', 2, 4, 4, '2018-10-09 07:16:36', '2018-10-09 07:16:36', NULL, 'on'),
(5, 'Map Locator', 1, 5, 20, '2018-10-09 07:17:00', '2018-10-09 07:27:26', NULL, 'on'),
(6, 'By The Numbers', 1, 6, 20, '2018-10-09 07:18:00', '2018-10-09 07:27:06', NULL, 'on'),
(7, 'Partners', 1, 7, 20, '2018-10-09 07:19:00', '2018-10-09 07:31:54', NULL, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Prep Admin', 'admin@prep.nascop', 'users/default.png', NULL, '$2y$10$2oUUFty8CBeFdSsWI3.jN.ODuGVyTAkqcyw1wOOrj7KR0aB3xWhI2', NULL, NULL, '2018-10-08 09:12:46', '2018-10-08 09:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeherotexts`
--
ALTER TABLE `homeherotexts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homenumbers`
--
ALTER TABLE `homenumbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `homeherotexts`
--
ALTER TABLE `homeherotexts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `homenumbers`
--
ALTER TABLE `homenumbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
