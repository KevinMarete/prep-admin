-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2018 at 09:09 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `separator_` varchar(10) NOT NULL,
  `og_url` varchar(100) NOT NULL,
  `og_type` varchar(100) NOT NULL,
  `og_site_name` varchar(100) NOT NULL,
  `keywords` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `page` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `title`, `description`, `separator_`, `og_url`, `og_type`, `og_site_name`, `keywords`, `created_at`, `updated_at`, `page`) VALUES
(1, 'PrEP Kenya Public Portal Home Page', 'Home page of FAQ-based information portal on usage of PrEP (Pre-exposure Prophylaxis) for the prevention of HIV infections in Kenya', '-', 'prep.nascop.org', '-', 'PrEP Kenya Public Portal', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'home'),
(2, 'PrEP Kenya Public Portal Users Page', 'FAQ-based information portal on usage of PrEP (Pre-exposure Prophylaxis) for the prevention of HIV infections in Kenya for active users and potential users of PrEP (Pre-exposure Prophylaxis)', '-', 'prep.nascop.org/user', '-', 'PrEP Kenya Public Portal ', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit, PrEP Use, PEP, Combination Prevention, Condoms', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'user'),
(3, 'PrEP Kenya Public Portal Provider Page', 'FAQ-based information page on provision and administration of PrEP (Pre-exposure Prophylaxis) for health providers and facilities', '-', 'prep.nascop.org/provider', '-', 'PrEP Kenya Public Portal ', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit, PrEP Use, PEP, Combination Prevention, Condoms, PrEP Provider, PrEP Facilities', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'provider'),
(4, 'PrEP Kenya Public Portal Policymaker Page', 'FAQ-based information page on PrEP (Pre-exposure Prophylaxis) for policy makers regarding PrEP implementation and PrEP partner support ', '-', 'prep.nascop.org/policymaker', '-', 'PrEP Kenya Public Portal ', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit, PrEP Use, PEP, Combination Prevention, Condoms, PrEP Provider, PrEP Facilities, PrEP Implementation Kenya, PrEP Partners Kenya, Cabotegravir Kenya, Daprivirine Kenya, Combination Prevention, PMTCT Kenya, VMMC Kenya', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'policymaker'),
(5, 'PrEP Kenya Public Portal Journey Page', 'FAQ-based information page on PrEP (Pre-exposure Prophylaxis) for policy makers regarding PrEP introduction in Kenya, and the PrEP Journey from start til ow', '-', 'prep.nascop.org/journeyinkenya', '-', 'PrEP Kenya Public Portal ', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit, PrEP Use, PEP, Combination Prevention, Condoms, PrEP Provider, PrEP Facilities, PrEP Implementation Kenya, PrEP Partners Kenya, Cabotegravir Kenya, Daprivirine Kenya, Combination Prevention, PMTCT Kenya, VMMC Kenya, Prezi PrEP, PrEP Journey in Kenya', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'journeyinkenya'),
(6, 'PrEP Kenya Public Portal Resources Page', 'FAQ-based information page on PrEP (Pre-exposure Prophylaxis) for policy makers regarding PrEP Publications, PrEP Guidelines in Kenya, PrEP Documentation', '-', 'prep.nascop.org/resources', '-', 'PrEP Kenya Public Portal ', 'HIV, HIV Prevention, HIV Kenya, Pre-exposure Prophylaxis Kenya, HIV and AIDS, AIDS Kenya, Nascop, HIV Test, Jipende JiPrep, HIV Self Testing Kit, PrEP Use, PEP, Combination Prevention, Condoms, PrEP Provider, PrEP Facilities, PrEP Implementation Kenya, PrEP Partners Kenya, Cabotegravir Kenya, Daprivirine Kenya, Combination Prevention, PMTCT Kenya, VMMC Kenya, Prezi PrEP, PrEP Journey in Kenya, PrEP Resources, PrEP Toolkit Kenya, PrEP Guidelines Kenya, PrEP Events Kenya, PrEP Pictures Kenya', '2018-11-27 02:48:00', '2018-11-27 02:54:02', 'resources');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
