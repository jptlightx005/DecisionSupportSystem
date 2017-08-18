-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2017 at 04:35 PM
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
(1, 8, 'shamballa@khamartaj.com', 3, 'Steven', NULL, 'Strange', '0', NULL, 'Doctor', '', NULL, NULL),
(2, 1, 'jsmith@gmail.com', 0, 'John', 'Will', 'Smith', 'Male', '1995-11-12', 'Nurse', '090909090', 'Pototan', NULL),
(4, 2, 'djtrump@gmail.com', 1, 'Donald', 'John', 'Trump', 'Male', '1948-01-12', 'President of the United States', 'bb', 'Aa', NULL),
(5, 9, 'jdsmith@gmail.com', 0, 'John', NULL, 'Smith', '0', NULL, 'Programmer', '', NULL, NULL),
(6, 14, 'ajdsmith2@gmail.com', 3, 'Dwayne', 'The Rock', 'Johnson', 'Male', '1964-11-11', 'Wrestler', 'b', 'a', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dss_brgy`
--

CREATE TABLE `dss_brgy` (
  `ID` int(11) NOT NULL,
  `name` text NOT NULL,
  `municipality` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `dss_cases`
--

INSERT INTO `dss_cases` (`ID`, `CaseID`, `disease`, `PatientID`, `diagnosis`, `treatment`, `remarks`, `case_date`, `admin_ulid`, `is_removed`) VALUES
(1, '', 'disease', 3, 'asdfasdfsad', 'sadfsadf', NULL, '2017-08-08 17:11:32', 8, 1),
(2, '', 'sadfsafsad', 3, 'asdfsad', 'sdafsad', NULL, '2017-08-08 17:17:45', 8, 1),
(3, '', 'try', 3, 'asdfsda', 'asdfasdfsad', NULL, '2017-08-08 18:12:54', 8, 1),
(4, 'C17-00004', 'Fever', 4, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-08 18:19:54', 8, 0),
(5, 'C17-00005', 'Fever', 4, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-10 21:58:15', 8, 0),
(6, 'C17-00006', 'Fever', 5, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-10 21:58:31', 8, 0),
(7, 'C17-00007', 'Fever', 5, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-18 20:15:21', 14, 0);

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
(7, 'Fever', 'Body exceeds normal temperature', 'Take 4 times a day', 8, 0),
(8, 'Aoaa', 'asdasdsa', 'asdasdas', 14, 0),
(9, 'Aoaa', 'asdasdsa', 'asdasdas', 14, 0),
(10, 'Aoaaasdfasdf', 'asdasdsaasdfsad', 'asdasdassadfsad', 14, 0),
(11, 'asdfasdfs', 'adfsafsad', 'fsadfsdafsda', 14, 0),
(12, 'asdfasdfs', 'adfsafsad', 'fsadfsdafsda', 14, 0),
(13, 'asdfasdfs', 'adfsafsad', 'fsadfsdafsda', 14, 0),
(14, 'asdfsad', 'asdfasdfs', 'adfsadfsadfsad', 14, 0),
(15, 'asdfsadfsa', 'fsdafsad', 'fsadfsdafsad', 14, 0);

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

--
-- Dumping data for table `dss_medicine`
--

INSERT INTO `dss_medicine` (`ID`, `name`, `generic_name`, `brand_name`, `overview`, `side_effects`, `dosage`, `warning`, `is_removed`, `admin_ulid`) VALUES
(1, 'Biogesic', 'Paracetamol', 'Biogesic', 'This is an ii medicine da', 'dizzy luhh', '3 times a day', 'sdfasdfsad', 0, 8),
(2, 'sadf', 'gfdkl', 'j', 'lkj', 'ioj', 'ioj', 'iopk udaranai', 1, 8),
(3, 'Neozep', 'Chlorphenamine Maleate', 'Neozep', 'These medicine...', 'Unknown', '4 times a week', 'Ang produktong ito ay hindi gamot o hindi pwedeng gamiting panggamot sa anomang uri ng sakit', 0, 14);

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
(9, 1, 5, 0, 'Biogesic', '2017-08-10 21:58:16', 0),
(10, 1, 6, 0, 'Biogesic', '2017-08-10 21:58:31', 0),
(11, 1, 7, 0, 'Biogesic', '2017-08-18 20:15:21', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_patients`
--

INSERT INTO `dss_patients` (`ID`, `PatientID`, `first_name`, `middle_name`, `last_name`, `ward`, `address`, `gender`, `status`, `brgy`, `telephone`, `date_of_birth`, `age`, `place_of_birth`, `nationality`, `religion`, `occupation`, `employer`, `emp_address`, `emp_telephone`, `mother`, `g_relationship`, `mom_address`, `mom_telephone`, `spouse`, `sp_address`, `sp_telephone`, `height`, `weight`, `blood_pressure`, `body_temperature`, `last_visit`, `admin_ulid`, `is_removed`, `picture_id`) VALUES
(1, '', 'Donald', 'J', 'Trump', 'Room', 'America', 'Male', 'Single', '', '000a', '1942-04-30', 74, 'America', 'American', 'RC', 'President', 'The White House', '', '', 'Unknown', '', 'Unknown', 'Unknown', 'Melania Trump', '', '', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '2017-07-31', 8, 1, 30),
(3, '', 'Steve', 'Stark', 'Rogers', 'Roomm', 'America', 'Male', 'Single', '', '555-5555', '1918-07-24', 98, 'America', 'American', 'RC', 'Avenging', '', '', '', 'Mama Rogers', '', 'America', '444-4444', '', '', '', 'Unknown', 'Unknown', 'Unknown', 'Unknown', '2017-07-31', 8, 0, 30),
(4, '', 'Susume', 'Yesterday', 'Tomorrow', 'Ward', 'LAKJd', 'Female', 'Single', '', 'jio', '1995-03-22', 21, 'Japan', 'Japanese', 'Japanese Catholic', 'School Idol', '', '', '', 'Start Dash', '', 'Akihabara', '09999999', '', '', '', 'as', 'sad', 'asdf', 'asdfsa', '2017-08-01', 8, 0, 30),
(5, '', 'dsfmoj', 'hoih', 'ouig', 'uifvuy', 'guio', 'Male', 'Single', '', 'ne', '1994-11-11', 22, 'jsdfoi', 'oiujoi', 'houig', 'u', 'uhio', 'hoi', 'huio', 'ghuioh', '', 'uioh', 'iouhoui', 'hoiu', 'hoi', 'hioh', 'uioh', 'iuogiu', 'hiou', 'sadfsadfsa', '2017-08-01', 8, 0, 30),
(6, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 1, 30),
(7, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 1, 30),
(8, '', 'Ragnarok', 'Online', 'Sin', 'asd', 'KJH', 'Male', 'Single', '', 'OUHIU', '1995-11-11', 21, 'J', 'OIJOI', 'JUOIP', 'JIO', 'J', 'IOJ', 'POJ', 'OPJ', '', 'POJ', 'PO', 'JPO', 'JPO', 'J', 'POJ', 'POJ', 'POJ', 'PO', '2017-08-02', 8, 0, 31),
(9, '2008', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 32),
(10, '002017-000', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 33),
(11, '002017-00011', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', '', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 8, 1, 34),
(12, '17-00012', 'Alas', 'Tho', 'Thoru', 'oijoi', 'jh', 'Male', 'Single', '', 'hi', '0990-01-01', 1026, 'jklo', 'kji', 'jiop', 'jpo', 'jpo', 'jpo', 'jpo', 'jpo', 'Mother', 'j', 'poj', 'pojpo', 'huio', 'gui', 'ho', 'h', 'sf', 'sdf', '2017-08-02', 14, 0, 35);

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

CREATE TABLE `dss_symptoms_used` (
  `ID` int(11) NOT NULL,
  `SymptomID` int(11) NOT NULL DEFAULT '0',
  `CaseID` int(11) NOT NULL DEFAULT '0',
  `DiseaseID` int(11) NOT NULL DEFAULT '0',
  `symptom` text NOT NULL,
  `date_added` datetime NOT NULL,
  `is_removed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(13, 3, 5, 0, 'Hot body', '0000-00-00 00:00:00', 0),
(14, 1, 6, 0, 'Headache', '0000-00-00 00:00:00', 0),
(15, 3, 6, 0, 'Hot body', '0000-00-00 00:00:00', 0),
(16, 1, 7, 0, 'Headache', '0000-00-00 00:00:00', 0),
(17, 3, 7, 0, 'Hot body', '0000-00-00 00:00:00', 0);

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
(35, 12, 'uploads/12-alas-thoru.jpg', 'patient_picture', '2017-08-02 13:29:56', 0),
(36, 4, 'uploads/4-36-susume-tomorrow-ehr.jpg', 'patient_ehr', '2017-08-18 22:15:58', 0);

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
('2017-07-28T18:50:57+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-02T19:49:55+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-02T19:53:58+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-08-02T19:54:10+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-07T22:46:46+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-07T22:46:57+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-09T00:05:01+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-09T00:12:35+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-09T00:51:59+08:00', 'auth-success', '', 'admin2', '::1'),
('2017-08-09T00:57:08+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-08-09T00:57:19+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-09T00:58:04+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-09T18:36:05+08:00', 'auth-success', '', 'admin2', '::1'),
('2017-08-10T00:05:55+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-10T22:21:11+08:00', 'auth-fail', '', 'admin', '192.168.10.5'),
('2017-08-10T22:21:56+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-10T22:36:05+08:00', 'auth-success', '', 'doctor_strange', '192.168.10.5'),
('2017-08-10T23:01:11+08:00', 'auth-success', '', 'admin2', '::1'),
('2017-08-17T21:07:23+08:00', 'auth-fail', '', 'doctor_strange', '::1'),
('2017-08-17T21:07:54+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-17T21:08:42+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-17T21:22:15+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-17T21:45:24+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-17T21:54:41+08:00', 'create login', '', 'testaccount001', '::1'),
('2017-08-17T21:55:57+08:00', 'auth-success', '', 'testaccount001', '::1'),
('2017-08-17T22:02:39+08:00', 'create login', '', 'testaccount002', '::1'),
('2017-08-17T22:54:18+08:00', 'create login', '', 'testaccount003', '::1'),
('2017-08-17T22:56:13+08:00', 'create login', '', 'testaccount003', '::1'),
('2017-08-17T22:57:25+08:00', 'create login', '', 'testaccount003', '::1'),
('2017-08-17T22:57:35+08:00', 'auth-fail', '', 'testaccount003', '::1'),
('2017-08-17T22:57:50+08:00', 'auth-success', '', 'testaccount003', '::1');

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
(1, 'admin', '$2a$11$eZQdon4ne2zMwXBocMF8O.2X7hk12Dx5VOudoNtaZQS.zMOUMPJmu', '2017-07-26T11:24:09+02:00', '2017-08-17T21:07:54+08:00', '1017-07-26T11:24:09+01:00'),
(2, 'admin2', '$2a$11$w8F7Y7H0bnS7iGIjwUciDuUO4bbDVmjhwFkEWckYSmsBngNh3yrGO', '2017-07-26T19:18:13+02:00', '2017-08-10T23:01:11+08:00', '1017-07-26T19:18:13+01:00'),
(4, 'admin5', '$2a$11$6rZetoB/h9JpBCswoh8pC.83gw8TUMya0p6BK2IUYmW7gKxk7I8u.', '2017-07-27T17:58:26+08:00', '2017-07-27T17:58:26+08:00', '1017-07-27T17:58:26+08:00'),
(5, 'admin6', '$2a$11$KEGzQv8.Skf5vgO3ft8OEezy997gnLvl2rNmstmZYe/NUZWcfF5eK', '2017-07-27T18:02:37+08:00', '2017-07-27T18:02:37+08:00', '1017-07-27T18:02:37+08:00'),
(6, 'admin7', '$2a$11$0TBJgB2e318H7u7h08S7/uv63GawwxUpd20Oqbd.BJT02bB4WjYoK', '2017-07-27T18:03:30+08:00', '2017-07-27T18:03:30+08:00', '1017-07-27T18:03:30+08:00'),
(7, 'admin8', '$2a$11$M95FQrhnAFYH6ZDQwJsGnuri3anyVv8UzsFAP8U0VhwfWaGkkIfrC', '2017-07-27T18:15:36+08:00', '2017-07-27T18:15:36+08:00', '1017-07-27T18:15:36+08:00'),
(8, 'doctor_strange', '$2a$11$ZuqqiuPl8nooQN5puvmzDO/fMNnvF39EFoBylUkxoGMCdaqWWCyaG', '2017-07-27T18:17:23+08:00', '2017-08-17T21:45:24+08:00', '1017-07-27T18:17:23+08:00'),
(9, 'testaccount001', '$2a$11$5u3F.dgvO32doIIm2nDgFuuhTcK1RYthSZUj1mddGxW.DKcPo98Km', '2017-08-17T21:54:40+08:00', '2017-08-17T21:55:57+08:00', '1017-08-17T21:54:40+08:00'),
(10, 'testaccount002', '$2a$11$fMfeNqPRLZKzr0D.D80hguVH4coIwDzb6KVJn8ct7ngr0rsFAgKrW', '2017-08-17T22:02:39+08:00', '2017-08-17T22:02:39+08:00', '1017-08-17T22:02:39+08:00'),
(14, 'testaccount003', '$2a$11$BXXSVvMLtVMvUnE/15Ww3u3OMBEhj7Wc6mxExFgfMwAYNnq3ny4DW', '2017-08-17T22:57:25+08:00', '2017-08-17T22:57:50+08:00', '1017-08-17T22:57:25+08:00');

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
('7aficrpib31u2l75fp1dajrg95', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323239363137373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262336230613864313362616365616232326535613461643261343663613964396430386664616533383337643136353433326233666562656238333236383866223b733a363a22657870697265223b733a32353a22323031372d30382d30395431383a32393a33372b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-09T18:33:37+02:00', '1017-08-10T00:09:37+08:00'),
('9qeu548t3oh02k1ejdil09tf01', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323138363637383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230306164393662343861326432636263663935653732366366326634613333373631323539313834303933336332386463353937343730313766633365383536223b733a363a22657870697265223b733a32353a22323031372d30382d30385431323a30343a33382b30323a3030223b7d7d, '2017-08-08T12:08:38+02:00', '1017-08-08T17:44:39+08:00'),
('cbrai3pbjtkqruu2gjo3r14hk1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a31323a223139322e3136382e31302e35223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3134303a224d6f7a696c6c612f352e3020284c696e75783b20416e64726f696420362e302e313b20415355535f5a30304144204275696c642f4d4d4232395029204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313235204d6f62696c65205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323337373530383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238346562336630373330343062393932396464616531396664346236626362396336663531316661376536303639306264666538616139633065336235333434223b733a363a22657870697265223b733a32353a22323031372d30382d31305431373a30353a30382b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-10T17:09:08+02:00', '1017-08-10T22:45:08+08:00'),
('e3338ularr7m84c4f3ta2kivp6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323231333933353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232336332626134396633303430343433313737623364616238363634306664373365383531343332663835386338303134363938653762343266346136643162223b733a363a22657870697265223b733a32353a22323031372d30382d30385431393a33383a35352b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-08T19:42:55+02:00', '1017-08-09T01:18:55+08:00'),
('emp815dellso5svo1gssnmbik6', '', '2017-08-08T18:38:09+02:00', '1017-08-08T18:14:09+01:00'),
('hali4pbup7bjib9l44aebas5s2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313031205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323938333736353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265636134383831383238336665353064326363633263313965356631666139623066613331333737666635613939396562303336386430323663396535383731223b733a363a22657870697265223b733a32353a22323031372d30382d31375431373a32393a32352b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-17T17:33:25+02:00', '1017-08-17T23:09:25+08:00'),
('kvoabf9ao19di73tarjmfkepq4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323231303032303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265623933323466393232306665386665376533656537653161646431653164303830343231323865626566383530653263366636636165356430313563306131223b733a363a22657870697265223b733a32353a22323031372d30382d30385431383a33333a34302b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-08T18:37:39+02:00', '1017-08-09T00:13:40+08:00'),
('ltgnoqc5e6i06lv4p9581jau94', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323231323636303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239373331393330643330396330373235643565643466316130373461656339363363333563613864313261616635353133346331626162613732353239376665223b733a363a22657870697265223b733a32353a22323031372d30382d30385431393a31373a34302b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-08T19:21:40+02:00', '1017-08-09T00:57:40+08:00'),
('n4veqbf5igasedifeij9uvh8p2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313031205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333035393636333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230643932333532613638656130376637623663363162346662653063623232393930656431326231613230393133396431646261366463363631343432393164223b733a363a22657870697265223b733a32353a22323031372d30382d31385431343a33343a32332b30323a3030223b7d7d, '2017-08-18T14:38:23+02:00', '1017-08-18T20:14:23+08:00'),
('ntpkbnt3cllvbc1bqihqkc1om1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323131393938393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262323730313235653563393833336636366562353861633963336166383632313034393838373232376636366330663233663032653461653463653837656535223b733a363a22657870697265223b733a32353a22323031372d30382d30375431373a33333a30392b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-07T17:37:09+02:00', '1017-08-07T23:13:09+08:00'),
('o2oleouqbde45qm13jirdgm5v3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313031205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323937383732373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263383363346535626563643039646530663837303037306162396563663234336638633630613233623133633537376332313430666138386638653639613139223b733a363a22657870697265223b733a32353a22323031372d30382d31375431363a30353a32372b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-17T16:09:27+02:00', '1017-08-17T21:45:27+08:00'),
('o7sup1v1nhcqjq1a1p1mukq2k6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323231303032323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261396439393032303936656631336638393965363165316363323336376363393238643462333364333739393631303064633864623663646633616135366139223b733a363a22657870697265223b733a32353a22323031372d30382d30385431383a33333a34322b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-08T18:37:42+02:00', '1017-08-09T00:13:42+08:00'),
('qls95irnufcb8mpdfa5o51m061', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35392e302e333037312e313135205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323231303032303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266356632623238663433313234633033666239663931653964393337646238393236623264316439653637353136373930393631333435636366616464376232223b733a363a22657870697265223b733a32353a22323031372d30382d30385431383a33333a34302b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-08T18:37:40+02:00', '1017-08-09T00:13:41+08:00'),
('s0k84o11dltb1f44011lvp3mn7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a37323a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a35342e3029204765636b6f2f32303130303130312046697265666f782f35342e30223b733a373a2245585049524553223b693a313530323337383437343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261323366346637326237383465363163306435393935653239383533643732303962343533396436666137633861353838643438656565613839333239643235223b733a363a22657870697265223b733a32353a22323031372d30382d31305431373a32313a31342b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-10T17:25:14+02:00', '1017-08-10T23:01:14+08:00'),
('t4fou89gik4snu4k41d1c7m0b2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313031205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333036383038383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238346633393361633730323931386633313563396562356133306335363033613335376364306533616137316262383334646465666430366531643239613839223b733a363a22657870697265223b733a32353a22323031372d30382d31385431363a35343a34382b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-18T16:58:48+02:00', '1017-08-18T22:34:48+08:00'),
('u27uvgjqeestlnsakd7n0e5h13', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e3930205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323337363131393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266616537653461386331306130626335363437333862636531656364643666613136653137383731333737313438323538623539343534353764346662613333223b733a363a22657870697265223b733a32353a22323031372d30382d31305431363a34313a35392b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-10T16:45:59+02:00', '1017-08-10T22:21:59+08:00'),
('v7emndg1cthdujbfmhr6pnj801', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e3930205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323338303339333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238643736323535323337666331363762393766636535643430356264633638643963636438653664383139313138326531653562656131343835306230633430223b733a363a22657870697265223b733a32353a22323031372d30382d31305431373a35333a31332b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-08-10T17:57:13+02:00', '1017-08-10T23:33:13+08:00');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
