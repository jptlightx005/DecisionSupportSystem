-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2017 at 07:57 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decisionsupportsystemv2`
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
(1, 1, 'admin@yahoo.com', 3, 'Stephen', '', 'Strange', 'Male', '1995-11-12', 'Doctor', '', '', NULL),
(2, 2, 'admin1@yahoo.com', 1, 'Donald', NULL, 'Trump', '0', NULL, 'Nurse', '', NULL, NULL),
(3, 3, 'admin2@yahoo.com', 0, 'Kim', NULL, 'Un', '0', NULL, 'Nurse', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dss_cases`
--

CREATE TABLE `dss_cases` (
  `ID` int(11) NOT NULL,
  `CaseID` varchar(9) NOT NULL,
  `disease` text,
  `PatientID` int(11) DEFAULT '0',
  `diagnosis` text,
  `treatment` text,
  `remarks` text,
  `case_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_ulid` int(11) DEFAULT '0',
  `is_removed` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_diseases`
--

CREATE TABLE `dss_diseases` (
  `ID` int(11) NOT NULL,
  `name` text,
  `diagnosis` text,
  `treatment` text,
  `admin_ulid` int(11) NOT NULL DEFAULT '0',
  `is_removed` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_medicine`
--

CREATE TABLE `dss_medicine` (
  `ID` int(11) NOT NULL,
  `name` text,
  `generic_name` text,
  `brand_name` text,
  `overview` text,
  `side_effects` text,
  `dosage` text,
  `warning` text,
  `is_removed` int(11) DEFAULT '0',
  `admin_ulid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_medicine_used`
--

CREATE TABLE `dss_medicine_used` (
  `ID` int(11) NOT NULL,
  `MedicineID` int(11) DEFAULT '0',
  `CaseID` int(11) DEFAULT '0',
  `DiseaseID` int(11) DEFAULT '0',
  `medicine` text,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_removed` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_patients`
--

CREATE TABLE `dss_patients` (
  `ID` int(11) NOT NULL,
  `PatientID` varchar(12) NOT NULL,
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
-- Table structure for table `dss_symptoms`
--

CREATE TABLE `dss_symptoms` (
  `ID` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `admin_ulid` int(11) NOT NULL DEFAULT '0',
  `is_removed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dss_symptoms_used`
--

CREATE TABLE `dss_symptoms_used` (
  `ID` int(11) NOT NULL,
  `SymptomID` int(11) NOT NULL DEFAULT '0',
  `CaseID` int(11) NOT NULL DEFAULT '0',
  `DiseaseID` int(11) NOT NULL DEFAULT '0',
  `symptom` text NOT NULL,
  `date_added` datetime NOT NULL,
  `is_removed` int(11) NOT NULL DEFAULT '0'
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
  `date_uploaded` datetime DEFAULT NULL,
  `is_removed` int(11) NOT NULL
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
('2017-08-12T13:53:10+08:00', 'auth-fail', '', 'admin', '::1'),
('2017-08-12T13:53:54+08:00', 'create login', '', 'admin', '::1'),
('2017-08-12T13:54:15+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-12T13:55:47+08:00', 'create login', '', 'admin1', '::1'),
('2017-08-12T13:56:09+08:00', 'create login', '', 'admin2', '::1'),
('2017-08-12T13:56:18+08:00', 'auth-success', '', 'admin', '::1');

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
(1, 'admin', '$2a$11$UUGKpE59qycoIck5hXdYueUj.sv5JdMijfB5BHTH.GX1xk463I66O', '2017-08-12T13:53:54+08:00', '2017-08-12T13:56:18+08:00', '1017-08-12T13:53:54+08:00'),
(2, 'admin1', '$2a$11$nWQo6OZKU58BQhnE9SZZY.V6bThC9.r62VvdembeMrSOwg9GKa8zy', '2017-08-12T13:55:46+08:00', '2017-08-12T13:55:46+08:00', '1017-08-12T13:55:46+08:00'),
(3, 'admin2', '$2a$11$zZsXm4h9zu6hScdmL01qCu.wcJ0IW7Ke4HPEZ0HQEdkzBJY3.DRq6', '2017-08-12T13:56:09+08:00', '2017-08-12T13:56:09+08:00', '1017-08-12T13:56:09+08:00');

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
('nee6v8c2eja0lftqesrvshem32', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e3930205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323531383335313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237623963386238613461306433323364616362653762396165393462343733613561613663346263393934326432343835393264323362363630636462336438223b733a363a22657870697265223b733a32353a22323031372d30382d31325430383a31323a33312b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-12T08:16:31+02:00', '1017-08-12T13:52:31+08:00'),
('ohhprbk32brobqfs2rq451bp36', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e3930205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323531383634313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261363435663734356432633932623863663930656564343665633162316363363535666538663636343234316636666237333462643237373538343864316636223b733a363a22657870697265223b733a32353a22323031372d30382d31325430383a31373a32312b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-12T08:21:20+02:00', '1017-08-12T13:57:21+08:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dss_accounts`
--
ALTER TABLE `dss_accounts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_cases`
--
ALTER TABLE `dss_cases`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_patients`
--
ALTER TABLE `dss_patients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
