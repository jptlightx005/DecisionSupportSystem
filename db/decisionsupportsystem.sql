-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2017 at 08:37 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `decisionsupportsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `dss_accounts`
--

CREATE TABLE IF NOT EXISTS `dss_accounts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_accounts`
--

INSERT INTO `dss_accounts` (`ID`, `UL_ID`, `email`, `privilege_level`, `first_name`, `middle_name`, `last_name`, `gender`, `date_of_birth`, `job`, `contact_no`, `address`, `image_url`) VALUES
(1, 8, 'shamballa@khamartaj.com', 3, 'Steven', NULL, 'Strange', '0', NULL, 'Doctor', '', NULL, NULL),
(2, 1, 'admin@yahoo.com', 3, 'Stephen', 'Stark', 'Strange', 'Male', '0000-00-00', 'Doctor', '09098058053', 'Pototan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dss_brgy`
--

CREATE TABLE IF NOT EXISTS `dss_brgy` (
`ID` int(11) NOT NULL,
  `name` text NOT NULL,
  `municipality` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_brgy`
--

INSERT INTO `dss_brgy` (`ID`, `name`, `municipality`) VALUES
(1, 'Abangay', 'Pototan'),
(2, 'Amamaros', 'Pototan'),
(3, 'Bagacay', 'Pototan'),
(4, 'Barasan', 'Pototan'),
(5, 'Batuan', 'Pototan'),
(6, 'Bongco', 'Pototan'),
(7, 'Cahaguichican', 'Pototan'),
(8, 'Callan', 'Pototan'),
(9, 'Cansilayan', 'Pototan'),
(10, 'Casalsagan', 'Pototan'),
(11, 'Cato-ogan', 'Pototan'),
(12, 'Cau-ayan', 'Pototan'),
(13, 'Culob', 'Pototan'),
(14, 'Danao', 'Pototan'),
(15, 'Dapitan', 'Pototan'),
(16, 'Dawis', 'Pototan'),
(17, 'Dongsol', 'Pototan'),
(18, 'Fundacion', 'Pototan'),
(19, 'Guinacas', 'Pototan'),
(20, 'Guibuangan', 'Pototan'),
(21, 'Igang', 'Pototan'),
(22, 'Intaluan', 'Pototan'),
(23, 'Iwa Ilaud', 'Pototan'),
(24, 'Iwa Ilaya', 'Pototan'),
(25, 'Jamabalud', 'Pototan'),
(26, 'Jebioc', 'Pototan'),
(27, 'Lay-Ahan', 'Pototan'),
(28, 'Primitivo Ledesma Ward (Pob.', 'Pototan'),
(29, 'Lopez Jaena Ward (Pob.)', 'Pototan'),
(30, 'Lumbo', 'Pototan'),
(31, 'Macatol', 'Pototan'),
(32, 'Malusgod', 'Pototan'),
(33, 'Naslo', 'Pototan'),
(34, 'Nabitasan', 'Pototan'),
(35, 'Naga', 'Pototan'),
(36, 'Nanga', 'Pototan'),
(37, 'Pajo', 'Pototan'),
(38, 'Palanguia', 'Pototan'),
(39, 'Fernando Parcon Ward (Pob.)', 'Pototan'),
(40, 'Pitogo', 'Pototan'),
(41, 'Polot-an', 'Pototan'),
(42, 'Purog', 'Pototan'),
(43, 'Rumbang', 'Pototan'),
(44, 'San Jose Ward (Pob.)', 'Pototan'),
(45, 'Sinuagan', 'Pototan'),
(46, 'Tuburan', 'Pototan'),
(47, 'Tumcon Ilaya', 'Pototan'),
(48, 'Tumcon Ilaud', 'Pototan'),
(49, 'Ubang', 'Pototan'),
(50, 'Zarrague', 'Pototan');

-- --------------------------------------------------------

--
-- Table structure for table `dss_cases`
--

CREATE TABLE IF NOT EXISTS `dss_cases` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_cases`
--

INSERT INTO `dss_cases` (`ID`, `CaseID`, `disease`, `PatientID`, `diagnosis`, `treatment`, `remarks`, `case_date`, `admin_ulid`, `is_removed`) VALUES
(1, '', 'disease', 3, 'asdfasdfsad', 'sadfsadf', NULL, '2017-08-08 17:11:32', 8, 1),
(2, '', 'sadfsafsad', 3, 'asdfsad', 'sdafsad', NULL, '2017-08-08 17:17:45', 8, 1),
(3, '', 'try', 3, 'asdfsda', 'asdfasdfsad', NULL, '2017-08-08 18:12:54', 8, 1),
(4, 'C17-00004', 'Fever', 4, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-08 18:19:54', 8, 0),
(5, 'C17-00005', 'Fever', 15, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-13 11:33:44', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dss_diseases`
--

CREATE TABLE IF NOT EXISTS `dss_diseases` (
`ID` int(11) NOT NULL,
  `name` text,
  `diagnosis` text,
  `treatment` text,
  `admin_ulid` int(11) NOT NULL DEFAULT '0',
  `is_removed` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_diseases`
--

INSERT INTO `dss_diseases` (`ID`, `name`, `diagnosis`, `treatment`, `admin_ulid`, `is_removed`) VALUES
(1, 'sadfsafsad', 'fsadsdafsa', 'dfsdafsda', 8, 1),
(2, 'sadfsafsad', 'fsadsdafsa', 'dfsdafsda', 8, 1),
(3, 'sadfsafsad', 'fsadsdafsa', 'dfsdafsda', 8, 1),
(4, 'sadfsafsad', 'fsadsdafsa', 'dfsdafsda', 8, 0),
(5, 'asdfsdaf', 'asdfasdfsad', 'asdfsadfsad', 8, 1),
(6, 'try', 'asdfsda', 'asdfasdfsad', 8, 0),
(7, 'Fever', 'Body exceeds normal temperature', 'Take 4 times a day', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dss_medicine`
--

CREATE TABLE IF NOT EXISTS `dss_medicine` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_medicine`
--

INSERT INTO `dss_medicine` (`ID`, `name`, `generic_name`, `brand_name`, `overview`, `side_effects`, `dosage`, `warning`, `is_removed`, `admin_ulid`) VALUES
(1, 'Biogesic', 'Paracetamol', 'Biogesic', 'This is an ii medicine da', 'dizzy luhh', '3 times a day', 'sdfasdfsad', 0, 8),
(2, 'sadf', 'gfdkl', 'j', 'lkj', 'ioj', 'ioj', 'iopk udaranai', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `dss_medicine_used`
--

CREATE TABLE IF NOT EXISTS `dss_medicine_used` (
`ID` int(11) NOT NULL,
  `MedicineID` int(11) DEFAULT '0',
  `CaseID` int(11) DEFAULT '0',
  `DiseaseID` int(11) DEFAULT '0',
  `medicine` text,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_removed` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_medicine_used`
--

INSERT INTO `dss_medicine_used` (`ID`, `MedicineID`, `CaseID`, `DiseaseID`, `medicine`, `date_added`, `is_removed`) VALUES
(1, 1, 0, 4, 'Biogesic', '2017-08-07 15:17:54', 0),
(2, 1, 0, 5, 'Biogesic', '2017-08-07 18:15:05', 0),
(3, 1, 0, 6, 'Biogesic', '2017-08-08 16:26:16', 0),
(4, 1, 1, 0, 'Biogesic', '2017-08-08 17:11:32', 0),
(5, 1, 2, 0, 'Biogesic', '2017-08-08 17:17:45', 0),
(6, 1, 0, 7, 'Biogesic', '2017-08-08 17:48:43', 0),
(7, 1, 3, 0, 'Biogesic', '2017-08-08 18:12:55', 0),
(8, 1, 4, 0, 'Biogesic', '2017-08-08 18:19:54', 0),
(9, 1, 5, 0, 'Biogesic', '2017-08-13 11:33:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dss_patients`
--

CREATE TABLE IF NOT EXISTS `dss_patients` (
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
  `municipality` text NOT NULL,
  `province` text NOT NULL,
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
  `g_relationship` text NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_patients`
--

INSERT INTO `dss_patients` (`ID`, `PatientID`, `first_name`, `middle_name`, `last_name`, `ward`, `address`, `gender`, `status`, `brgy`, `municipality`, `province`, `telephone`, `date_of_birth`, `age`, `place_of_birth`, `nationality`, `religion`, `occupation`, `employer`, `emp_address`, `emp_telephone`, `mother`, `g_relationship`, `mom_address`, `mom_telephone`, `spouse`, `sp_address`, `sp_telephone`, `height`, `weight`, `blood_pressure`, `body_temperature`, `last_visit`, `admin_ulid`, `is_removed`, `picture_id`) VALUES
(1, '', 'Donald', 'J', 'Trump', 'Room', 'America', 'Male', 'Single', '', '', '', '000a', '1942-04-30', 74, 'America', 'American', 'RC', 'President', 'The White House', '', '', 'Unknown', '', 'Unknown', 'Unknown', 'Melania Trump', '', '', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '2017-07-31', 8, 1, 30),
(3, '', 'Steve', 'Stark', 'Rogers', 'Roomm', 'America', 'Male', 'Single', '', '', '', '555-5555', '1918-07-24', 98, 'America', 'American', 'RC', 'Avenging', '', '', '', 'Mama Rogers', '', 'America', '444-4444', '', '', '', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '2017-07-31', 8, 0, 30),
(4, '', 'Susume', 'Yesterday', 'Tomorrow', 'Ward', 'LAKJd', 'Female', 'Single', '', '', '', 'jio', '1995-03-22', 21, 'Japan', 'Japanese', 'Japanese Catholic', 'School Idol', '', '', '', 'Start Dash', '', 'Akihabara', '09999999', '', '', '', 'as', 'sad', 'asdf', 'asdfsa', '2017-08-01', 8, 0, 30),
(5, '', 'dsfmoj', 'hoih', 'ouig', 'uifvuy', 'guio', 'Male', 'Single', '', '', '', 'ne', '1994-11-11', 22, 'jsdfoi', 'oiujoi', 'houig', 'u', 'uhio', 'hoi', 'huio', 'ghuioh', '', 'uioh', 'iouhoui', 'hoiu', 'hoi', 'hioh', 'uioh', 'iuogiu', 'hiou', 'sadfsadfsa', '2017-08-01', 8, 0, 30),
(6, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', '', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 1, 30),
(7, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', '', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 1, 30),
(8, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', '', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 0, 31),
(9, '2008', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', '', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 32),
(10, '002017-000', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', '', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 33),
(11, '002017-00011', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', '', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 34),
(12, '17-00012', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', 'Danao', 'Pototan', 'Iloilo', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', 'A', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 1, 0, 45),
(13, '17-00013', 'Try', 'meh', 'Picture', 'lkjoi', 'ji', 'Male', 'Single', '', '', '', 'joi', '1994-11-11', 22, 'dsfg', 'nj', 'hiu', 'u', 'giug', 'iugiu', 'giu', 'giu', '', 'giu', 'giu', 'giug', 'iug', 'iug', 'iug', 'giu', 'giu', 'giu', '2017-08-12', 8, 0, 36),
(14, '17-00014', 'Try', 'meh', 'Picture', 'lkjoi', 'ji', 'Male', 'Single', '', '', '', 'joi', '1994-11-11', 22, 'dsfg', 'nj', 'hiu', 'u', 'giug', 'iugiu', 'giu', 'giu', '', 'giu', 'giu', 'giug', 'iug', 'iug', 'iug', 'giu', 'giu', 'giu', '2017-08-12', 8, 0, 37),
(15, '17-00015', 'Try', 'meh', 'Picture', 'lkjoi', 'ji', 'Male', 'Single', '', '', '', 'joi', '1994-11-11', 22, 'dsfg', 'nj', 'hiu', 'u', 'giug', 'iugiu', 'giu', 'giu', '', 'giu', 'giu', 'giug', 'iug', 'iug', 'iug', 'giu', 'giu', 'giu', '2017-08-12', 8, 0, 38),
(16, '17-00016', 'dsf', 'ioh', 'iuo', 'hioh', 'oih', 'Male', 'Single', '', '', '', 'm', '1994-11-11', 21, 'ioewgioh', 'oihio', 'hoi', 'hoih', 'ioh', 'iohoi', 'hio', 'hio', '', 'hio', 'hio', 'hio', 'hio', 'hio', 'dsg', 'fd', 'gdsgsdf', 'fsdg', '2017-08-12', 8, 0, 40),
(17, '17-00017', 'adsgfdas', 'ioj', 'oph', 'lihopi', 'jpoi', 'Male', 'Single', '', '', '', 'hio', '1994-11-11', 22, 'ojio', 'jio', 'jio', 'ji', 'oj', 'ioj', 'ioj', 'io', '', 'jio', 'jio', 'j', 'ioj', 'ioj', 'io', 'j', 'ioj', 'ioj', '2017-08-12', 8, 0, 41),
(18, '17-00018', 'jopeqjfoi', 'hjioh', 'ioh', 'ioh', 'ioh', 'Male', 'Single', '', '', '', 'm', '1111-11-11', 905, 'jlk', 'jio', 'j', 'ioji', 'oj', 'ioj', 'ioj', 'ioj', '', 'ioj', 'ioj', 'ioj', 'ioj', 'iohio', 'boi', 'b', 'oib', 'iob', '2017-08-12', 8, 0, 42),
(19, '17-00019', 'dsfds', 'h', 'oh', 'oihio', 'h', 'Male', 'Single', '', '', '', 'ioh', '1111-11-11', 905, 'lkj', 'lj', 'iojoi', 'ho', 'ihio', 'ho', 'ih', 'ioh', '', 'ioh', 'oih', 'ioh', 'ioh', 'ioh', 'oih', 'ioh', 'ioh', 'ioh', '2017-08-12', 8, 0, 44);

-- --------------------------------------------------------

--
-- Table structure for table `dss_symptoms`
--

CREATE TABLE IF NOT EXISTS `dss_symptoms` (
`ID` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `admin_ulid` int(11) NOT NULL DEFAULT '0',
  `is_removed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_symptoms`
--

INSERT INTO `dss_symptoms` (`ID`, `name`, `description`, `admin_ulid`, `is_removed`) VALUES
(1, 'Headache', 'kariage!', 8, 0),
(2, 'Aother ', 'adsfafas', 8, 1),
(3, 'Hot body', 'exceeds temperature', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dss_symptoms_used`
--

CREATE TABLE IF NOT EXISTS `dss_symptoms_used` (
`ID` int(11) NOT NULL,
  `SymptomID` int(11) NOT NULL DEFAULT '0',
  `CaseID` int(11) NOT NULL DEFAULT '0',
  `DiseaseID` int(11) NOT NULL DEFAULT '0',
  `symptom` text NOT NULL,
  `date_added` datetime NOT NULL,
  `is_removed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_symptoms_used`
--

INSERT INTO `dss_symptoms_used` (`ID`, `SymptomID`, `CaseID`, `DiseaseID`, `symptom`, `date_added`, `is_removed`) VALUES
(1, 1, 0, 4, 'Headache', '0000-00-00 00:00:00', 0),
(2, 1, 0, 5, 'Headache', '0000-00-00 00:00:00', 0),
(3, 1, 0, 6, 'Headache', '0000-00-00 00:00:00', 0),
(4, 1, 1, 0, 'Headache', '0000-00-00 00:00:00', 0),
(5, 1, 2, 0, 'Headache', '0000-00-00 00:00:00', 0),
(6, 1, 0, 7, 'Headache', '0000-00-00 00:00:00', 0),
(7, 3, 0, 7, '', '0000-00-00 00:00:00', 0),
(9, 1, 3, 0, 'Headache', '0000-00-00 00:00:00', 0),
(10, 1, 4, 0, 'Headache', '0000-00-00 00:00:00', 0),
(11, 3, 4, 0, 'Hot body', '0000-00-00 00:00:00', 0),
(12, 1, 5, 0, 'Headache', '0000-00-00 00:00:00', 0),
(13, 3, 5, 0, 'Hot body', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dss_uploads`
--

CREATE TABLE IF NOT EXISTS `dss_uploads` (
`ID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `url` text NOT NULL,
  `type` text NOT NULL,
  `date_uploaded` datetime DEFAULT NULL,
  `is_removed` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_uploads`
--

INSERT INTO `dss_uploads` (`ID`, `PatientID`, `url`, `type`, `date_uploaded`, `is_removed`) VALUES
(1, 1, 'uploads/1-donald-trump.jpg', 'patient_picture', '2017-07-31 00:00:00', 0),
(5, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-07-31 00:00:00', 0),
(6, 3, 'uploads/3-6-steve-rogers-ehr.jpg', 'patient_ehr', '2017-07-31 00:00:00', 0),
(7, 3, 'uploads/3-7-steve-rogers-ehr.jpg', 'patient_ehr', '2017-07-31 00:00:00', 0),
(8, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 00:00:00', 1),
(11, 3, 'uploads/3-11-steve-rogers-ehr.jpg', 'patient_ehr', '2017-08-01 00:00:00', 1),
(12, 3, 'uploads/3-12-steve-rogers-ehr.jpg', 'patient_ehr', '2017-08-01 00:00:00', 1),
(13, 3, 'uploads/3-13-steve-rogers-ehr.jpg', 'patient_ehr', '2017-08-01 00:00:00', 1),
(14, 3, 'uploads/3-14-steve-rogers-ehr.jpg', 'patient_ehr', '2017-08-01 01:24:12', 1),
(15, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:13:18', 1),
(16, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:17:49', 1),
(17, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:19:06', 1),
(18, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:22:27', 1),
(19, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:36:32', 1),
(20, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:37:33', 1),
(21, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:37:37', 1),
(22, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:38:40', 1),
(23, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:41:22', 1),
(24, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 19:41:27', 1),
(25, 4, 'uploads/4-susume-tomorrow.jpg', 'patient_picture', '2017-08-01 19:43:37', 0),
(26, 4, 'uploads/4-26-susume-tomorrow-ehr.jpg', 'patient_ehr', '2017-08-01 19:43:37', 0),
(27, 5, 'uploads/5-dsfmoj-ouig.jpg', 'patient_picture', '2017-08-01 19:48:10', 0),
(28, 3, 'uploads/3-steve-rogers.jpg', 'patient_picture', '2017-08-01 20:35:47', 0),
(29, 1, 'uploads/1-29-donald-trump-ehr.jpg', 'patient_ehr', '2017-08-02 11:27:07', 0),
(30, 7, 'uploads/7-ragnarok-sin.jpg', 'patient_picture', '2017-08-02 13:24:22', 0),
(31, 8, 'uploads/8-ragnarok-sin.jpg', 'patient_picture', '2017-08-02 13:24:43', 0),
(32, 9, 'uploads/9-alas-thoru.jpg', 'patient_picture', '2017-08-02 13:27:06', 0),
(33, 10, 'uploads/10-alas-thoru.jpg', 'patient_picture', '2017-08-02 13:27:41', 0),
(34, 11, 'uploads/11-alas-thoru.jpg', 'patient_picture', '2017-08-02 13:28:44', 0),
(35, 12, 'uploads/12-alas-thoru.jpg', 'patient_picture', '2017-08-02 13:29:56', 1),
(36, 13, 'uploads/13-try-picture.jpg', 'patient_picture', '2017-08-12 12:36:02', 0),
(37, 14, 'uploads/14-try-picture.jpg', 'patient_picture', '2017-08-12 12:36:29', 0),
(38, 15, 'uploads/15-try-picture.jpg', 'patient_picture', '2017-08-12 12:37:13', 0),
(39, 16, 'uploads/16-dsf-iuo.jpg', 'patient_picture', '2017-08-12 13:08:24', 0),
(40, 16, 'uploads/16-dsf-iuo.jpg', 'patient_picture', '2017-08-12 13:08:24', 0),
(41, 17, 'uploads/17-adsgfdas-oph.jpg', 'patient_picture', '2017-08-12 13:15:29', 0),
(42, 18, 'uploads/18-jopeqjfoi-ioh.jpg', 'patient_picture', '2017-08-12 13:16:11', 0),
(43, 19, 'uploads/19-dsfds-oh.jpg', 'patient_picture', '2017-08-12 13:16:57', 0),
(44, 19, 'uploads/19-dsfds-oh.jpg', 'patient_picture', '2017-08-12 13:16:57', 0),
(45, 12, 'uploads/12-alas-thoru.jpg', 'patient_picture', '2017-08-20 11:19:31', 0),
(46, 12, 'uploads/12-46-alas-thoru-ehr.jpg', 'patient_ehr', '2017-08-20 11:19:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ul_blocked_ips`
--

CREATE TABLE IF NOT EXISTS `ul_blocked_ips` (
  `ip` varchar(39) CHARACTER SET ascii NOT NULL,
  `block_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ul_log`
--

CREATE TABLE IF NOT EXISTS `ul_log` (
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
('2017-07-28T18:50:57+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-02T19:49:55+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-02T19:53:58+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-08-02T19:54:10+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-07T22:46:46+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-07T22:46:57+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-12T11:53:49+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-12T11:58:25+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-14T02:31:19+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-14T02:32:35+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-21T02:28:41+08:00', 'auth-success', '', 'admin2', '::1'),
('2017-08-21T02:31:40+08:00', 'auth-success', '', 'admin', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `ul_logins`
--

CREATE TABLE IF NOT EXISTS `ul_logins` (
`id` int(11) NOT NULL,
  `username` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(2048) CHARACTER SET ascii NOT NULL,
  `date_created` varchar(26) CHARACTER SET ascii NOT NULL,
  `last_login` varchar(26) CHARACTER SET ascii NOT NULL,
  `block_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ul_logins`
--

INSERT INTO `ul_logins` (`id`, `username`, `password`, `date_created`, `last_login`, `block_expires`) VALUES
(1, 'admin', '$2a$11$eZQdon4ne2zMwXBocMF8O.2X7hk12Dx5VOudoNtaZQS.zMOUMPJmu', '2017-07-26T11:24:09+02:00', '2017-08-21T02:31:39+08:00', '1017-07-26T11:24:09+01:00'),
(2, 'admin2', '$2a$11$w8F7Y7H0bnS7iGIjwUciDuUO4bbDVmjhwFkEWckYSmsBngNh3yrGO', '2017-07-26T19:18:13+02:00', '2017-08-21T02:28:40+08:00', '1017-07-26T19:18:13+01:00'),
(4, 'admin5', '$2a$11$6rZetoB/h9JpBCswoh8pC.83gw8TUMya0p6BK2IUYmW7gKxk7I8u.', '2017-07-27T17:58:26+08:00', '2017-07-27T17:58:26+08:00', '1017-07-27T17:58:26+08:00'),
(5, 'admin6', '$2a$11$KEGzQv8.Skf5vgO3ft8OEezy997gnLvl2rNmstmZYe/NUZWcfF5eK', '2017-07-27T18:02:37+08:00', '2017-07-27T18:02:37+08:00', '1017-07-27T18:02:37+08:00'),
(6, 'admin7', '$2a$11$0TBJgB2e318H7u7h08S7/uv63GawwxUpd20Oqbd.BJT02bB4WjYoK', '2017-07-27T18:03:30+08:00', '2017-07-27T18:03:30+08:00', '1017-07-27T18:03:30+08:00'),
(7, 'admin8', '$2a$11$M95FQrhnAFYH6ZDQwJsGnuri3anyVv8UzsFAP8U0VhwfWaGkkIfrC', '2017-07-27T18:15:36+08:00', '2017-07-27T18:15:36+08:00', '1017-07-27T18:15:36+08:00'),
(8, 'doctor_strange', '$2a$11$ZuqqiuPl8nooQN5puvmzDO/fMNnvF39EFoBylUkxoGMCdaqWWCyaG', '2017-07-27T18:17:23+08:00', '2017-08-12T11:58:25+08:00', '1017-07-27T18:17:23+08:00');

-- --------------------------------------------------------

--
-- Table structure for table `ul_nonces`
--

CREATE TABLE IF NOT EXISTS `ul_nonces` (
  `code` varchar(100) CHARACTER SET ascii NOT NULL,
  `action` varchar(850) CHARACTER SET ascii NOT NULL,
  `nonce_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ul_sessions`
--

CREATE TABLE IF NOT EXISTS `ul_sessions` (
  `id` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '',
  `data` blob NOT NULL,
  `session_expires` varchar(26) CHARACTER SET ascii NOT NULL,
  `lock_expires` varchar(26) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ul_sessions`
--

INSERT INTO `ul_sessions` (`id`, `data`, `session_expires`, `lock_expires`) VALUES
('arh4tlr2tsd4gt13ctr4ange80', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333235353231323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236313936313462383330376161666531663031343539653734623762303666393835666638393336346532643164653632623939353830646662386339626566223b733a363a22657870697265223b733a32353a22323031372d30382d32305432303a35333a33322b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-20T20:57:32+02:00', '1017-08-21T02:33:32+08:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dss_accounts`
--
ALTER TABLE `dss_accounts`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
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
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`(255));

--
-- Indexes for table `ul_nonces`
--
ALTER TABLE `ul_nonces`
 ADD PRIMARY KEY (`code`), ADD UNIQUE KEY `action` (`action`(255));

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
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
