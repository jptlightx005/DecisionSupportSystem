-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2017 at 05:50 PM
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
(1, 8, 'shamballa@khamartaj.com', 3, 'Steven', NULL, 'Strange', '0', NULL, 'Doctor', '', NULL, NULL),
(2, 1, 'admin@yahoo.com', 3, 'Stephen', 'Stark', 'Strange', 'Male', '0000-00-00', 'Doctor', '09098058053', 'Pototan', NULL);

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
(5, 'C17-00005', 'Fever', 15, 'Body exceeds normal temperature', 'Take 4 times a day', NULL, '2017-08-13 11:33:44', 1, 0),
(7, 'C17-00007', 'Hemophilia', 6, 'Hemophilia A', 'Blood Transfusion ', '', '2017-03-26 20:30:56', 1, 0),
(8, 'C17-00008', 'Diabetes Mellitus', 10, 'Diabetes Mellitus Type 2', 'Eating a good balance of protein, carbohydrates, and healthy fats is crucial to controlling your blood sugar and weight. Regular exercise, including walking, can help people with type 2 diabetes lower their blood glucose levels. Physical activity also reduces body fat, lowers blood pressure, and helps prevent cardiovascular disease. Itâ€™s recommended that people with type 2 diabetes get 30 minutes of moderate exercise on most days.\r\n\r\n Fasting Blood Glucose (sugar) test every month.\r\n\r\n Metformin (immediate release)( Glumetza tablets) at a dose of 500 mg twice a day or 850 mg once daily.\r\nMetformin should be taken with meals.\r\n\r\n', '', '2017-03-26 22:57:17', 1, 0),
(9, 'C17-00009', 'A', 21, 'ASDASDAS', 'SDGASGAS', NULL, '2017-09-02 23:25:50', 1, 0);

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
(8, 'New disease', 'asdf', 'asdf', 1, 0);

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
(1, 'Biogesic', 'Paracetamol', 'Biogesic', 'Paracetamol (acetaminophen) is a pain reliever and a fever reducer. The exact mechanism of action of is not known.', 'Rare\r\nBloody or black, tarry stools\r\nbloody or cloudy urine\r\nfever with or without chills (not present before treatment and not caused by the condition being treated)\r\npain in the lower back and/or side (severe and/or sharp)\r\npinpoint red spots on the skin\r\nskin rash, hives, or itching\r\nsore throat (not present before treatment and not caused by the condition being treated)\r\nsores, ulcers, or white spots on the lips or in the mouth\r\nsudden decrease in the amount of urine\r\nunusual bleeding or bruising\r\nunusual tiredness or weakness\r\nyellow eyes or skin', 'Acetaminophen (oral tablet, chewable, oral liquid, oral suspension, oral tablet, oral tablet, extended release, rectal suppository, oral capsule, oral tablet, disintegrating, compounding powder, oral granule, effervescent, intravenous solution)', 'Do not use any other over-the-counter cough, cold, allergy, or pain medication without first asking your doctor or pharmacist. Paracetamol is contained in many combination medicines. If you use certain products together you may accidentally use too much paracetamol . Read the label of any other medicine you are using to see if it contains paracetamol, acetaminophen or APAP. Avoid drinking alcohol while taking this medication. Alcohol may increase your risk of liver damage while taking paracetamol .', 0, 2),
(4, 'sdfsdafsda', 'kjklj', 'lkjio', 'hui', 'hui', 'hoj', 'poihu', 0, 1),
(5, 'kyou', 'kljh', 'uhgui', 'uiqeiuq', 'hgeiu', 'qgbeq', 'bvqr', 0, 1),
(6, 'Ibuprofen', 'Ibuprofen', 'Advil, Children''s Advil/Motrin, Medipren, Motrin, Nuprin, PediaCare Fever', 'Ibuprofen belongs to a class of drugs called nonsteroidal anti-inflammatory drugs (NSAIDs). Other members of this class include aspirin, naproxen (Aleve), indomethacin (Indocin), nabumetone (Relafen) and several others. These drugs are used for the management of mild to moderate pain, fever, and inflammation. Pain, fever, and inflammation are promoted by the release in the body of chemicals called prostaglandins. Ibuprofen blocks the enzyme that makes prostaglandins (cyclooxygenase), resulting in lower levels of prostaglandins. As a consequence, inflammation, pain and fever are reduced. The FDA approved ibuprofen in 1974.\r\n\r\nIbuprofen is used in adults and children who are at least 6 months old.\r\n\r\nPRESCRIBED FOR: Ibuprofen is used for the treatment of mild to moderate pain, inflammation and fever caused by many and diverse diseases. It also is used for treating:\r\n\r\nmenstrual cramps (dysmenorrhea),\r\nosteoarthritis,\r\nrheumatoid arthritis, and\r\njuvenile idiopathic arthritis.', 'SIDE EFFECTS: The most common side effects from ibuprofen are:\r\n\r\nrash,\r\nringing in the ears,\r\nheadaches,\r\ndizziness,\r\ndrowsiness,\r\nabdominal pain,\r\nnausea,\r\ndiarrhea,\r\nconstipation, and\r\nheartburn.\r\nNSAIDs reduce the ability of blood to clot and therefore increase bleeding after an injury.\r\n\r\nIbuprofen may cause ulceration of the stomach or intestine, and the ulcers may bleed. Sometimes, ulceration can occur without abdominal pain; and due to bleeding, the only signs or symptoms of an ulcer may be black, tarry stools, weakness, and dizziness upon standing (orthostatic hypotension).\r\n\r\nSometimes, ulceration can occur without abdominal pain, due to the bleeding, and the only signs or symptoms of an ulcer are:\r\n\r\nblack, tarry stools,\r\nweakness, and\r\ndizziness upon standing (orthostatic hypotension)\r\nNSAIDs reduce the flow of blood to the kidneys and impair function of the kidneys. The impairment is most likely to occur in patients who already have impaired function of the kidney or congestive heart failure, and use of NSAIDs in these patients should be cautious.\r\n\r\nPeople who are allergic to other NSAIDs, including aspirin, should not use ibuprofen.\r\n\r\nIndividuals with asthma are more likely to experience allergic reactions to ibuprofen and other NSAIDs.\r\n\r\nOther serious side effects associated with NSAIDs are:\r\n\r\nfluid retention (edema),\r\nblood clots,\r\nheart attacks,\r\nhypertension (high blood pressure), and\r\nheart failure.\r\nNSAIDs (except low- dose aspirin) may increase the risk of potentially fatal heart attacks, stroke, and related conditions in people with or without heart disease or risk factors for heart disease. The increased risk of heart attack or stroke may occur as early as the first week of use and the risk may increase with longer use and is higher in patients who have underlying risk factors for heart and blood vessel disease. Therefore, NSAIDs should not be used for the treatment of pain resulting from coronary artery bypass graft (CABG) surgery.', 'DOSING: For minor aches, mild to moderate pain, menstrual cramps, and fever, the usual adult dose is 200 or 400 mg every 4 to 6 hours.\r\nPRESCRIPTION: Yes (400 to 800 mg strengths), and also OTC (over-the-counter)\r\nPREPARATIONS: Tablets: 100, 200, 400, 600, and 800 mg; Chewable tablets: 50 and 100 mg; Suspension: 100 mg/5 ml and 40 mg/ml\r\nSTORAGE: Ibuprofen should be stored at room temperature, between 15 C to 30 C (59 F to 86 F).\r\nDOSING:\r\n\r\nFor minor aches, mild to moderate pain, menstrual cramps, and fever, the usual adult dose is 200 or 400 mg every 4 to 6 hours.\r\nArthritis is treated with 300 to 800 mg 3 or 4 times daily.\r\nWhen under the care of a physician, the maximum dose of ibuprofen is 3.2 g daily. Otherwise, the maximum dose is 1.2 g daily.\r\nIndividuals should not use ibuprofen for more than 10 days for the treatment of pain or more than 3 days for the treatment of a fever unless directed by a physician.\r\nChildren 6 months to 12 years of age usually are given 5-10 mg/kg of ibuprofen every 6-8 hours for the treatment of fever and pain. The maximum dose is 40 mg/kg daily.\r\nJuvenile arthritis is treated with 20 to 40 mg/kg/day in 3-4 divided doses.\r\nIbuprofen should be taken with meals to prevent stomach upset.', 'DRUG INTERACTIONS: Ibuprofen is associated with several suspected or probable interactions that can affect the action of other drugs.\r\n\r\nIbuprofen may increase the blood levels of lithium (Eskalith, Lithobid) by reducing the excretion of lithium by the kidneys. Increased levels of lithium may lead to lithium toxicity.\r\nIbuprofen may reduce the blood pressure-lowering effects of drugs that are given to reduce blood pressure. This may occur because prostaglandins play a role in the regulation of blood pressure.\r\nWhen ibuprofen is used in combination with methotrexate (Rheumatrex, Trexall) or aminoglycosides (for example, gentamicin) the blood levels of the methotrexate or aminoglycoside may increase, presumably because their elimination from the body is reduced. This may lead to more methotrexate or aminoglycoside-related side effects.\r\nIbuprofen increases the negative effect of cyclosporine on kidney function.\r\nIndividuals taking oral blood thinners or anticoagulants, for example, warfarin (Coumadin), should avoid ibuprofen because ibuprofen also thins the blood, and excessive blood thinning may lead to bleeding.\r\nIf aspirin is taken with ibuprofen there may be an increased risk for developing an ulcer.\r\nPersons who have more than three alcoholic beverages per day may be at increased risk of developing stomach ulcers when taking ibuprofen or other NSAIDs.\r\nCombining SSRIs or selective serotonin reuptake inhibitors (for example, fluoxetine [Prozac], citalopram [Celexa], paroxetine [Paxil, Paxil CR, Pexeva) with NSAIDs may increase the likelihood of upper gastrointestinal bleeding.\r\nPREGNANCY: There are no adequate studies of ibuprofen in pregnant women. Therefore, ibuprofen is not recommended during pregnancy. Ibuprofen should be avoided in late pregnancy due to the risk of premature closure of the ductus arteriosus in the fetal heart.\r\n\r\nNURSING MOTHERS: Ibuprofen is excreted in breast milk but the American Academy of Pediatrics states that ibuprofen is compatible with breastfeeding.', 0, 1),
(7, 'Metformin', 'Metformin', 'Glucophage, Glucophage XR, Glumetza, Fortamet, Riomet', '\r\nMetformin is used for treating type 2 diabetes in adults and children. It may be used alone or in combination with other diabetic medications.\r\nMetformin also has been used to prevent the development of diabetes in people at risk for diabetes, treatment of polycystic ovaries, and weight gain due to medications used for treating psychoses.\r\n\r\nMetformin is an oral medication that lowers blood glucose (sugar) by influencing the body''s sensitivity to insulin and is used for treating type 2 diabetes. Insulin is a hormone produced by the pancreas that controls glucose levels in blood by reducing the amount of glucose made by the liver and by increasing the removal of glucose from the blood by muscle and fat tissues. As a result, insulin causes blood glucose levels fall. Diabetes caused by a decrease in production of insulin that causes increased production of glucose by the liver, and reduced uptake (and effects) of insulin on fat and muscle tissues. Metformin acts by increasing the sensitivity of liver, muscle, fat, and other tissues to the uptake and effects of insulin. These actions lower the level of sugar in the blood.\r\nUnlike glucose-lowering drugs of the sulfonylurea class, for example glyburide (Micronase; DiaBeta) or glipizide (Glucotrol), metformin does not increase the concentration of insulin in the blood and, therefore, does not cause excessively low blood glucose levels (hypoglycemia) when used alone. In scientific studies, metformin reduced the complications of diabetes such as heart disease, blindness, and kidney disease.\r\n', 'nausea,\r\nvomiting,\r\ngas,\r\nbloating,\r\ndiarrhea and\r\nloss of appetite.\r\n\r\nMetformin may also cause:\r\n\r\nweakness,\r\nrespiratory tract infections,\r\nlow levels of vitamin B-12,\r\nlow blood glucose,\r\nheartburn, and\r\nchills.\r\n\r\nPatients at risk for lactic acidosis include those with reduced function of the\r\n\r\nkidneys or liver,\r\ncongestive heart failure,\r\nsevere acute illnesses, and\r\ndehydration.', 'PREPARATIONS:\r\n\r\nTablets: 500, 850, and 1000 mg\r\nTablets (extended release): 500, 750, and 1000 mg.\r\nSolution: 100 mg/ ml\r\n\r\nDOSAGE:\r\n\r\nFor treating type 2 diabetes in adults, metformin (immediate release) usually is begun at a dose of 500 mg twice a day or 850 mg once daily. The dose is gradually increased by 500 mg weekly or 850 mg every two weeks as tolerated and based on the response of the levels of glucose in the blood. The maximum daily dose is 2550 mg given in three divided doses.\r\nIf extended tablets are used, the starting dose is 500 mg or 1000 mg daily with the evening meal. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg except for Fortamet (2500 mg of Fortamet, once daily or in two divided doses). Glumetza tablets (500 -1000mg formulations are given once daily (either 1000 to 2000mg). Fortamet and Glumetza are modified release formulations of metformin. Metformin should be taken with meals.\r\nFor pediatric patients 10-16 years of age, the starting dose is 500 mg twice a day. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg in divided doses.\r\nChildren older than 17 years of age may receive 500 mg of extended release tablets daily up to a maximum dose of 2000 mg daily. Extended release tablets are not approved for children younger than 17 years of age.\r\nMetformin-containing drugs may be safely used in patients with mild to moderate renal impairment. Renal function should be assessed before starting treatment and at least yearly.\r\nMetformin should not be used by patients with an estimated glomerular filtration rate (eGFR) below 30 mL/minute/1.73 m2  and starting metformin in patients with an eGFR between 30-45 mL/minute/1.73 m2 is not recommended.\r\nMetformin should be stopped at the time of or before administering iodinated contrast in patients with an eGFR between 30 and 60 mL/minute/1.73 m2; in patients with a history of liver disease, alcoholism, or heart failure; or in patients who will be administered intra-arterial iodinated contrast. Kidney function should be evaluated 48 hours after receiving contrast and metformin may be restarted if kidney function is stable.', 'DRUG INTERACTIONS:\r\n\r\nCimetidine (Tagamet), by decreasing the elimination of metformin from the body, can increase the amount of metformin in the blood by 40%. This may increase the frequency of side effects from metformin.\r\nIoversol (Optiray) and other iodinated contrast media may reduce kidney function, which reduces elimination of metformin, leading to increased concentrations of metformin in the blood. Metformin should be stopped 48 hours before and after use of contrast media.\r\nThiazide diuretics, steroids, estrogens, and oral contraceptives may increase blood glucose and reduce the effect of metformin. When these drugs are stopped, patients should be closely observed for signs of low blood glucose.\r\nAlcohol consumption increases the effect of metformin on lactate production, increasing the risk of lactic acidosis.\r\nPREGNANCY:\r\n\r\nThere are no adequate studies in pregnant women. Most experts agree that insulin is the best treatment for pregnant women with diabetes.\r\n\r\nMetformin is excreted into breast milk and can therefore be transferred to the nursing infant. Nursing mothers should not use metformin.', 0, 1);

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
(7, 6, 7, 0, 'Ibuprofen', '2017-03-26 20:30:56', 0),
(8, 7, 8, 0, 'Metformin', '2017-03-26 22:57:18', 0),
(10, 4, 9, 0, 'sdfsdafsda', '2017-09-02 23:25:50', 0),
(11, 5, 9, 0, 'kyou', '2017-09-02 23:25:50', 0),
(12, 6, 9, 0, 'Ibuprofen', '2017-09-02 23:25:50', 0),
(13, 4, 0, 8, 'sdfsdafsda', '2017-09-02 23:42:50', 0),
(14, 6, 0, 8, 'Ibuprofen', '2017-09-02 23:42:50', 0),
(15, 7, 0, 8, 'Metformin', '2017-09-02 23:42:50', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_patients`
--

INSERT INTO `dss_patients` (`ID`, `PatientID`, `first_name`, `middle_name`, `last_name`, `ward`, `address`, `gender`, `status`, `brgy`, `municipality`, `province`, `telephone`, `date_of_birth`, `age`, `place_of_birth`, `nationality`, `religion`, `occupation`, `employer`, `emp_address`, `emp_telephone`, `mother`, `g_relationship`, `mom_address`, `mom_telephone`, `spouse`, `sp_address`, `sp_telephone`, `height`, `weight`, `blood_pressure`, `body_temperature`, `last_visit`, `admin_ulid`, `is_removed`, `picture_id`) VALUES
(20, '', 'Chika', 'Takami', 'Kousaka', '11', '12 Ledesma St. Pototan, Iloilo', 'Female', 'Separated', '', '', '', '230915', '1993-01-02', 15, 'Japan', 'Japanese', 'Roman Catholic', 'Teacher', '', '', 'jkl', 'Loli\r\nTakami', '', 'Tokyo, Japan', '09552122121', 'Â ', 'Â ', 'Â ', '5'' 1', '45kg', '120hg', '37degree', '2017-03-26', 1, 0, 0),
(21, '', 'Marry Margaret', 'Mendiola', 'Mercado', 'Consultation', 'Brgy. Barasan,\r\nPototan, Iloilo', 'Female', 'Single', '', '', '', '535-8889', '1992-02-16', 25, 'Calumpit, Bulacan', 'Filipino', 'Catholic', 'Business Woman ', 'Merchandising ', 'Dingle, Iloilo', ' Cellphone No. 09999232425', 'Ana M. Mercado', '', 'Brgy.Barasan,\r\nPototan, Iloilo', 'Cellphone No. 09998877661', 'Benjamin L. Mercado', 'Brgy.Barasan, Pototan, Iloilo', 'Cellphone No.\r\n09998877662', '5''6"', '60 klg.', '90/80', '36', '2017-03-26', 3, 0, 0);

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
(3, 'Dizziness', 'Dizziness is an impairment in spatial perception and stability.', 2, 0),
(4, 'Swelling', 'Swelling occurs whenever the organs, skin, or other parts of your body enlarge. It is typically the result of inflammation or a buildup of fluid.', 1, 0),
(8, 'Hemarthrosis', ' (bleeding into the joints) is characteristic of hemophilia. The knees and ankles are most often affected. The bleeding causes distension of the joint spaces, significant pain, and over time, can be disfiguring. Over time, joint destruction occurs, and joint replacement surgeries can be required.', 1, 0),
(9, 'Bleeding into the muscles', 'may occur with hematoma formation (compartment syndrome).', 1, 0),
(10, 'Bleeding from the mouth or nosebleeds', 'may occur. Bleeding after dental procedures is common, and oozing of blood from the gums may occur in young children when new teeth are erupting.', 1, 0),
(11, 'Bleeding from the gastrointestinal tract', 'can lead to blood in the stool.', 1, 0),
(12, 'Bleeding from the urinary tract', 'can lead to blood in the urine (hematuria)', 1, 0),
(13, 'Intracranial hemorrhage ', '(bleeding into the brain or skull) can lead to symptoms such as nausea, vomiting, and/or lethargy, and can lead to death.', 1, 0),
(14, 'Increased bleeding after surgery or trauma', 's characteristic of hemophilia', 1, 0),
(15, 'increased urine output', 'increased urine output', 1, 0),
(16, 'excessive thirst', '-', 1, 0),
(17, 'weight loss', '-', 1, 0),
(18, 'hunger', '-', 1, 0),
(19, 'fatigue', '(either physical, mental or both) is a symptom that may be difficult for the patient to describe and words like lethargic, exhausted and tired may be used.', 1, 0),
(20, 'skin problems', 'l Scleroderma diabeticorum:  While rare, this skin problem affects people with type 2 diabetes, causing a thickening of the skin on the back of the neck and upper back. \r\nVitiligo, a skin problem more commonly associated with type 1 diabetes than type 2 diabetes, affects skin coloration. With vitiligo, the special cells that make pigment (the substance that controls skin color) are destroyed, resulting in patches of discolored skin. Vitiligo often affects the chest and abdomen, but may be found on the face around the mouth, nostrils, and eyes', 1, 0),
(21, 'slow healing wounds', '_', 1, 0),
(22, 'Yeast Infections', 'causes itching or soreness in the vagina and sometimes causes pain or burning when you urinate or have sex. Some women also have a thick, clumpy, white discharge that has no odor and looks a little like cottage cheese.', 1, 0),
(23, 'Tingling or numbness in the feet or toes', 'Numbness of the toes generally is a result of conditions that affect the nerves and/or blood vessels that supply the foot. Numbness of the toes is often associated with tingling. Numbness and tingling sensations in the toes is referred to as paresthesia of the toes.', 1, 0);

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
(8, 10, 7, 0, 'Bleeding from the mouth or nosebleeds', '2017-03-26 20:30:56', 0),
(9, 11, 7, 0, 'Bleeding from the gastrointestinal tract', '2017-03-26 20:30:56', 0),
(10, 12, 7, 0, 'Bleeding from the urinary tract', '2017-03-26 20:30:56', 0),
(11, 15, 8, 0, 'increased urine output', '2017-03-26 22:57:17', 0),
(12, 16, 8, 0, 'excessive thirst', '2017-03-26 22:57:17', 0),
(13, 18, 8, 0, 'hunger', '2017-03-26 22:57:17', 0),
(14, 21, 8, 0, 'slow healing wounds', '2017-03-26 22:57:17', 0),
(15, 23, 8, 0, 'Tingling or numbness in the feet or toes', '2017-03-26 22:57:17', 0),
(16, 4, 9, 0, 'Swelling', '0000-00-00 00:00:00', 0),
(17, 8, 9, 0, 'Hemarthrosis', '0000-00-00 00:00:00', 0),
(18, 9, 9, 0, 'Bleeding into the muscles', '0000-00-00 00:00:00', 0),
(19, 8, 0, 8, 'Hemarthrosis', '0000-00-00 00:00:00', 0),
(20, 10, 0, 8, 'Bleeding from the mouth or nosebleeds', '0000-00-00 00:00:00', 0);

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
('2017-08-12T11:53:49+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-12T11:58:25+08:00', 'auth-success', '', 'doctor_strange', '::1'),
('2017-08-14T02:31:19+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-14T02:32:35+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-21T02:28:41+08:00', 'auth-success', '', 'admin2', '::1'),
('2017-08-21T02:31:40+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-02T08:48:13+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-02T22:59:04+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-02T22:59:34+08:00', 'auth-success', '', 'admin', '::1');

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
(1, 'admin', '$2a$11$eZQdon4ne2zMwXBocMF8O.2X7hk12Dx5VOudoNtaZQS.zMOUMPJmu', '2017-07-26T11:24:09+02:00', '2017-09-02T22:59:34+08:00', '1017-07-26T11:24:09+01:00'),
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
('ajvevucmp5gdpk4lvdd64g9uf1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343336383633353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234396133346466353938366632363538323165373133643839383637303666646431653834303562353735326239666564346164623064316131646331663939223b733a363a22657870697265223b733a32353a22323031372d30392d30325431383a31303a33352b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-09-02T18:14:35+02:00', '1017-09-02T23:50:35+08:00'),
('arh4tlr2tsd4gt13ctr4ange80', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333235353231323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236313936313462383330376161666531663031343539653734623762303666393835666638393336346532643164653632623939353830646662386339626566223b733a363a22657870697265223b733a32353a22323031372d30382d32305432303a35333a33322b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-20T20:57:32+02:00', '1017-08-21T02:33:32+08:00'),
('gps01ecfpghda4e8q4bbqj93v2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343336373338393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234316463626363643931643933393930303166393834383430666432626538396537643732373363303436303633343337613836366666383765343732313461223b733a363a22657870697265223b733a32353a22323031372d30392d30325431373a34393a34392b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-09-02T17:53:49+02:00', '1017-09-02T23:29:49+08:00');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
