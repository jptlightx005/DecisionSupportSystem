-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2017 at 07:03 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decisionsupportsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `dss_accounts`
--

CREATE TABLE `dss_accounts` (
  `ID` int(11) NOT NULL,
  `UL_ID` int(11) DEFAULT '0',
  `email` varchar(50) DEFAULT '0',
  `privilege_level` int(11) DEFAULT '0',
  `first_name` text,
  `middle_name` text,
  `last_name` text,
  `gender` varchar(6) DEFAULT '0',
  `date_of_birth` date DEFAULT NULL,
  `job` text,
  `contact_no` text NOT NULL,
  `address` text,
  `image_url` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_accounts`
--

INSERT INTO `dss_accounts` (`ID`, `UL_ID`, `email`, `privilege_level`, `first_name`, `middle_name`, `last_name`, `gender`, `date_of_birth`, `job`, `contact_no`, `address`, `image_url`) VALUES
(1, 8, 'shamballa@khamartaj.com', 3, 'Steven', NULL, 'Strange', '0', NULL, 'Doctor', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dss_patients`
--

CREATE TABLE `dss_patients` (
  `ID` int(11) NOT NULL,
  `PatientID` varchar(10) NOT NULL,
  `first_name` text NOT NULL,
  `middle_name` text NOT NULL,
  `last_name` text NOT NULL,
  `ward` text NOT NULL,
  `address` text NOT NULL,
  `gender` text NOT NULL,
  `status` text NOT NULL,
  `brgy` text NOT NULL,
  `telephone` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(11) NOT NULL,
  `place_of_birth` text NOT NULL,
  `nationality` text NOT NULL,
  `religion` text NOT NULL,
  `occupation` text NOT NULL,
  `employer` text NOT NULL,
  `emp_address` text NOT NULL,
  `emp_telephone` text NOT NULL,
  `mother` text NOT NULL,
  `mom_address` text NOT NULL,
  `mom_telephone` text NOT NULL,
  `spouse` text NOT NULL,
  `sp_address` text NOT NULL,
  `sp_telephone` text NOT NULL,
  `height` text NOT NULL,
  `weight` text NOT NULL,
  `blood_pressure` text NOT NULL,
  `body_temperature` text NOT NULL,
  `last_visit` date NOT NULL,
  `admin_ulid` int(11) NOT NULL,
  `is_removed` int(11) NOT NULL DEFAULT '0',
  `picture_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_uploads`
--

CREATE TABLE `dss_uploads` (
  `ID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `url` text NOT NULL,
  `type` text NOT NULL,
  `date_uploaded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ul_blocked_ips`
--

CREATE TABLE `ul_blocked_ips` (
  `ip` varchar(39) CHARACTER SET ascii NOT NULL,
  `block_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ul_log`
--

CREATE TABLE `ul_log` (
  `timestamp` varchar(26) CHARACTER SET ascii NOT NULL,
  `action` varchar(20) CHARACTER SET ascii NOT NULL,
  `comment` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `user` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(39) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ul_log`
--

INSERT INTO `ul_log` (`timestamp`, `action`, `comment`, `user`, `ip`) VALUES
('2017-07-26T11:24:09+02:00', 'create login', '', 'admin', '::1'),
('2017-07-26T19:18:13+02:00', 'create login', '', 'admin2', '::1'),
('2017-07-26T19:32:00+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-26T19:32:25+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-26T19:33:20+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-26T19:33:47+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T04:20:58+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T04:22:11+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T04:27:32+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T04:28:43+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T05:20:36+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T05:22:59+02:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T17:58:26+08:00', 'create login', '', 'admin5', '::1'),
('2017-07-27T18:02:37+08:00', 'create login', '', 'admin6', '::1'),
('2017-07-27T18:03:30+08:00', 'create login', '', 'admin7', '::1'),
('2017-07-27T18:15:37+08:00', 'create login', '', 'admin8', '::1'),
('2017-07-27T18:17:23+08:00', 'create login', '', 'doctor_strange', '::1'),
('2017-07-27T18:18:06+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:18:37+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:18:49+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-07-27T18:26:21+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-07-27T18:28:55+08:00', 'auth-success', '', 'admin', '::1'),
('2017-07-27T18:29:10+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:29:26+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:32:00+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:32:49+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-07-27T18:33:12+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:33:23+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-07-27T18:33:35+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-07-28T18:50:57+08:00', 'auth-success', '', 'doctor_strange', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `ul_logins`
--

CREATE TABLE `ul_logins` (
  `id` int(11) NOT NULL,
  `username` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(2048) CHARACTER SET ascii NOT NULL,
  `date_created` varchar(26) CHARACTER SET ascii NOT NULL,
  `last_login` varchar(26) CHARACTER SET ascii NOT NULL,
  `block_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ul_logins`
--

INSERT INTO `ul_logins` (`id`, `username`, `password`, `date_created`, `last_login`, `block_expires`) VALUES
(1, 'admin', '$2a$11$eZQdon4ne2zMwXBocMF8O.2X7hk12Dx5VOudoNtaZQS.zMOUMPJmu', '2017-07-26T11:24:09+02:00', '2017-07-27T18:28:54+08:00', '1017-07-26T11:24:09+01:00'),
(2, 'admin2', '$2a$11$w8F7Y7H0bnS7iGIjwUciDuUO4bbDVmjhwFkEWckYSmsBngNh3yrGO', '2017-07-26T19:18:13+02:00', '2017-07-26T19:18:13+02:00', '1017-07-26T19:18:13+01:00'),
(4, 'admin5', '$2a$11$6rZetoB/h9JpBCswoh8pC.83gw8TUMya0p6BK2IUYmW7gKxk7I8u.', '2017-07-27T17:58:26+08:00', '2017-07-27T17:58:26+08:00', '1017-07-27T17:58:26+08:00'),
(5, 'admin6', '$2a$11$KEGzQv8.Skf5vgO3ft8OEezy997gnLvl2rNmstmZYe/NUZWcfF5eK', '2017-07-27T18:02:37+08:00', '2017-07-27T18:02:37+08:00', '1017-07-27T18:02:37+08:00'),
(6, 'admin7', '$2a$11$0TBJgB2e318H7u7h08S7/uv63GawwxUpd20Oqbd.BJT02bB4WjYoK', '2017-07-27T18:03:30+08:00', '2017-07-27T18:03:30+08:00', '1017-07-27T18:03:30+08:00'),
(7, 'admin8', '$2a$11$M95FQrhnAFYH6ZDQwJsGnuri3anyVv8UzsFAP8U0VhwfWaGkkIfrC', '2017-07-27T18:15:36+08:00', '2017-07-27T18:15:36+08:00', '1017-07-27T18:15:36+08:00'),
(8, 'doctor_strange', '$2a$11$ZuqqiuPl8nooQN5puvmzDO/fMNnvF39EFoBylUkxoGMCdaqWWCyaG', '2017-07-27T18:17:23+08:00', '2017-07-28T18:50:57+08:00', '1017-07-27T18:17:23+08:00');

-- --------------------------------------------------------

--
-- Table structure for table `ul_nonces`
--

CREATE TABLE `ul_nonces` (
  `code` varchar(100) CHARACTER SET ascii NOT NULL,
  `action` varchar(850) CHARACTER SET ascii NOT NULL,
  `nonce_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ul_sessions`
--

CREATE TABLE `ul_sessions` (
  `id` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `data` blob NOT NULL,
  `session_expires` varchar(26) CHARACTER SET ascii NOT NULL,
  `lock_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ul_sessions`
--

INSERT INTO `ul_sessions` (`id`, `data`, `session_expires`, `lock_expires`) VALUES
('0safeq4lcdaibc9e7vi6gganj2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530313039323339363b7d756c4e6f6e6365737c613a323a7b733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2233633130613565656430383132393862313033393661383166303063336631363565666264613130656162303963616333633038613164373961356632326432223b733a363a22657870697265223b733a32353a22323031372d30372d32365431393a34383a34372b30323a3030223b7d733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264363139383833316137336436663433356230316331393238626235626633643730383537383036626562663930313938333338386230356364336361326636223b733a363a22657870697265223b733a32353a22323031372d30372d32365432303a30363a33362b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-07-26T20:10:36+02:00', '1017-07-26T19:46:36+01:00'),
('ki6nik56vd20v6hlfb4plftu34', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530313236323534373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238616430386531653632636263393364386632393236653164356232356331623164663364653062653231333364393532353233643933623666386266313665223b733a363a22657870697265223b733a32353a22323031372d30372d32385431393a32323a32372b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-07-28T19:26:27+02:00', '1017-07-29T01:02:27+08:00'),
('sptf84e7drvhkuo6bkgjl7vs72', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530313135333138313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266326233343433383739636561313461646662336365643262343462636664353134363865343861623433643732383462303363353632336433643130323862223b733a363a22657870697265223b733a32353a22323031372d30372d32375431323a35393a34312b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-07-27T13:03:41+02:00', '1017-07-27T18:39:41+08:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dss_accounts`
--
ALTER TABLE `dss_accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_patients`
--
ALTER TABLE `dss_patients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ul_blocked_ips`
--
ALTER TABLE `ul_blocked_ips`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `ul_logins`
--
ALTER TABLE `ul_logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`(255));

--
-- Indexes for table `ul_nonces`
--
ALTER TABLE `ul_nonces`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `action` (`action`(255));

--
-- Indexes for table `ul_sessions`
--
ALTER TABLE `ul_sessions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dss_accounts`
--
ALTER TABLE `dss_accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
