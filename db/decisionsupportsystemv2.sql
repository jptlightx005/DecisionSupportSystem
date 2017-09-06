-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 06, 2017 at 05:01 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(3, 3, 'admin2@yahoo.com', 0, 'Kim', NULL, 'Un', '0', NULL, 'Nurse', '', NULL, NULL),
(4, 4, 'Mendiola_Anne01@yahoo.com', 1, 'Anne Margaret', NULL, 'Mendiola', '0', NULL, 'Nurse1', '', NULL, NULL);

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
  `DiseaseID` int(11) NOT NULL,
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

INSERT INTO `dss_cases` (`ID`, `CaseID`, `disease`, `DiseaseID`, `PatientID`, `diagnosis`, `treatment`, `remarks`, `case_date`, `admin_ulid`, `is_removed`) VALUES
(6, 'C17-00006', 'Heartache', 4, 5, 'Broken Heart', 'Pain reliever ', NULL, '2017-09-06 20:46:29', 1, 0);

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
(4, 'Heartache', 'Broken Heart', 'Pain reliever ', 1, 0),
(5, 'Flu', 'Flu na yan', '1 time a day', 1, 0);

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
(2, 'ALBUTEROL ', 'albuterol', 'Ventolin, Proventil, Accuneb', ' Albuterol sulphate dilates the airways of the lung and is used for treating asthma and other conditions of the lung. Asthma is a breathing problem due to narrowing of the airways (bronchial tubes) that allow air to move in and out of the lungs. These airways can be narrowed due to the accumulation of mucus, spasm of the muscles that surround these airways (bronchospasm), or swelling of the lining of the airways. Airway narrowing leads to shortness of breath, wheezing, cough, and congestion. Albuterol sulphate dilates bronchial airways by relaxing the muscles that surround the airways. Albuterol also can be helpful in patients with emphysema and chronic bronchitis when symptoms are partially related to spasm of the airways\' muscles.', 'allergic reactions like skin rash, itching or hives, swelling of the face, lips, or tongue\r\nbreathing problems\r\nchest pain\r\nfeeling faint or lightheaded, falls\r\nhigh blood pressure\r\nirregular heartbeat\r\nfever\r\nmuscle cramps or weakness\r\npain, tingling, numbness in the hands or feet\r\nvomiting\r\n\r\ncough\r\ndiarrhea\r\ndifficulty sleeping\r\nfast heartbeat\r\nheadache\r\nnervousness, trembling\r\nstuffy or runny nose\r\nupset stomach', '-A jet nebulizer connected to an air compressor equipped with a mouthpiece or face mask is used to administer albuterol sulphate solution.\r\n-The recommended starting dose for patients 2 to 12 years of age is 0.63, 1.25, or 2.5 mg given by nebulization 3 or 4 times daily, as needed. More frequent administration is not recommended.\r\n-Children 6 to 12 years of age with more severe asthma may achieve a better initial response with the 1.25 or 2.5 mg dose.\r\n-The entire contents of one vial should be placed in the nebulizer and the flow rate should be adjusted to deliver albuterol sulphate over 5 to 15 minutes.', 'Tricyclic antidepressants, for example, amitriptyline (Elavil, Endep), and monoamine oxidase inhibitors (MAOIs), for example, tranylcypromine, should not be combined with albuterol sulfate because of their additive effects on the vascular system (increased blood pressure, heart rate, etc.). A period of two weeks should elapse between treatment with albuterol sulphate and tricyclic antidepressants or monoamine oxidase inhibitors.\r\nUse of albuterol sulphate with other stimulant medications is discouraged because of their combined effects on heart rate, blood pressure, and the potential for causing chest pain in patients with underlying coronary heart disease.\r\nBeta-blockers, for example, propranolol (Inderal, Inderal LA), block the effect of albuterol sulphate and may induce bronchospasm in asthmatics.\r\nAlbuterol sulphate may cause hypokalemia (low potassium). Therefore, combining albuterol sulphate with loop diuretics, for example, furosemide (Lasix) may increase the likelihood of hypokalemia.', 0, 1),
(3, 'ACEBUTOLOL', 'Acebutolol', 'Sectral', 'Sectral is used alone or with other drugs to treat high blood pressure and arrhythmias. It also is used to treat chest pain due to coronary artery disease (angina) in which the supply of blood and oxygen to the heart are inadequate for the heart to pump normally.\r\n\r\nCapsules: 200 and 400 mg.', 'Dizziness\r\nLightheadedness\r\nExcessive tiredness\r\nHeadache\r\nConstipation\r\nDiarrhea\r\nUpset stomach\r\nMuscle aches', 'Sectral can be taken with or without food, usually once or twice daily.\r\nThe dosage of Sectral should be reduced in patients with dysfunction of the kidneys or liver since kidney or liver disease reduce the elimination of Sectral.', 'There are no adequate studies of Sectral in pregnant women. It should be used during pregnancy only if the potential benefit justifies the risk to the fetus\r\nSectral is excreted in human milk, and use among nursing mothers is discouraged.', 0, 1),
(4, 'ATENOLOL', 'Atenolol', 'Tenormin', 'Atenolol is a beta-adrenergic blocking agent that blocks the effects of adrenergic chemicals, for example, adrenaline or epinephrine, released by nerves of the sympathetic nervous system. One of the important function of beta-adrenergic nerves is to stimulate the heart muscle to beat more rapidly. By blocking the stimulation by these nerves, atenolol reduces the heart rate and is useful in treating abnormally rapid heart rhythms. Atenolol also reduces the force of contraction of heart muscle and lowers blood pressure. By reducing the heart rate, the force of muscle contraction, and the blood pressure against which the heart must pump, atenolol reduces the work of heart muscle and the need of the muscle for oxygen. Since angina occurs when oxygen demand of the heart muscle exceeds the supply, atenolol is helpful in treating angina. \r\n\r\nTablets: 25, 50 and 100 mg. Injection: 5 mg/10 ml', 'abdominal cramps,\r\ndiarrhea,\r\nconstipation,\r\nfatigue,\r\ninsomnia,\r\nnausea,\r\ndepression,\r\ndreaming, memory loss,\r\nfever,\r\nimpotence,\r\nlightheadedness,\r\nslow heart rate,\r\nabnormal heart rhythm,\r\nlow blood pressure,\r\nnumbness,\r\ntingling,\r\ncold extremities, and\r\nsore throat.', 'The dose for treating high blood pressure or angina is 25-100 mg once daily.\r\nAcute myocardial infarction (heart attack) is treated with two 5 mg injections administered 10 minutes apart. Ten minutes after the last injection, give 50 mg every 12 hours followed by 100 mg oral atenolol daily for 6-9 days. If atenolol injections are not appropriate, patients may be treated with 100 mg daily of oral atenolol for 7 days.', 'Atenolol may cause harm and growth retardation in the fetus when given to pregnant women.\r\n\r\nAtenolol is excreted in breast milk and my cause adverse effects in an infant being breastfed.', 0, 1),
(5, 'IBUPROFEN', 'ibuprofen', 'Advil, Children\'s Advil/Motrin, Medipren, Motrin, Nuprin, PediaCare Fever', 'Ibuprofen belongs to a class of drugs called nonsteroidal anti-inflammatory drugs (NSAIDs). Other members of this class include aspirin, naproxen (Aleve), indomethacin (Indocin), nabumetone (Relafen) and several others. These drugs are used for the management of mild to moderate pain, fever, and inflammation. Pain, fever, and inflammation are promoted by the release in the body of chemicals called prostaglandins. Ibuprofen blocks the enzyme that makes prostaglandins (cyclooxygenase), resulting in lower levels of prostaglandins. As a consequence, inflammation, pain and fever are reduced. The FDA approved ibuprofen in 1974.\r\n\r\nA Guide to Migraine Headaches\r\nA Visual Guide to Migraine Headaches Slideshow\r\nHeadache and Migraine Triggers Slideshow\r\nTake the Migraines Quiz\r\nRelated Diseases\r\nImages & Quizzes\r\nIndex\r\nA Visual Guide to Migraine Headaches Slideshow\r\nHeadache and Migraine Triggers Slideshow\r\nTake the Migraines Quiz\r\nWhat is ibuprofen? How does it work (mechanism of action)?\r\nDo I need a prescription for ibuprofen?\r\nWhat are the side effects of ibuprofen?\r\nWhat is the dosage for ibuprofen?\r\nWhich drugs or supplements interact with ibuprofen?\r\nIs ibuprofen safe to take if I\'m pregnant or breastfeeding?\r\nWhat brand names are available for ibuprofen?\r\nWhat else should I know about ibuprofen?\r\n\r\nWhat is ibuprofen? How does it work (mechanism of action)?\r\nIbuprofen belongs to a class of drugs called nonsteroidal anti-inflammatory drugs (NSAIDs). Other members of this class include aspirin, naproxen (Aleve), indomethacin (Indocin), nabumetone (Relafen) and several others. These drugs are used for the management of mild to moderate pain, fever, and inflammation. Pain, fever, and inflammation are promoted by the release in the body of chemicals called prostaglandins. Ibuprofen blocks the enzyme that makes prostaglandins (cyclooxygenase), resulting in lower levels of prostaglandins. As a consequence, inflammation, pain and fever are reduced. \r\n\r\nDo I need a prescription for ibuprofen?\r\nYes for 400 to 800 mg strengths and injection. It also is availableOTC (over-the-counter) without a prescription.\r\n\r\nTablets: 100, 200, 400, 600, and 800 mg; Chewable tablets: 50 and 100 mg; Suspension: 100 mg/5 ml and 40 mg/ml', 'rash,\r\nringing in the ears,\r\nheadaches,\r\ndizziness,\r\ndrowsiness,\r\nabdominal pain,\r\nnausea,\r\ndiarrhea,\r\nconstipation, and\r\nheartburn.', 'For minor aches, mild to moderate pain, menstrual cramps, and fever, the usual adult dose is 200 or 400 mg every 4 to 6 hours.\r\nArthritis is treated with 300 to 800 mg 3 or 4 times daily.\r\nWhen under the care of a physician, the maximum dose of ibuprofen is 3.2 g daily. Otherwise, the maximum dose is 1.2 g daily.\r\nIndividuals should not use ibuprofen for more than 10 days for the treatment of pain or more than 3 days for the treatment of a fever unless directed by a physician.\r\nChildren 6 months to 12 years of age usually are given 5-10 mg/kg of ibuprofen every 6-8 hours for the treatment of fever and pain. The maximum dose is 40 mg/kg daily.\r\nJuvenile arthritis is treated with 20 to 40 mg/kg/day in 3-4 divided doses.\r\nIbuprofen should be taken with meals to prevent stomach upset.', 'Ibuprofen may cause ulceration of the stomach or intestine, and the ulcers may bleed. Sometimes, ulceration can occur without abdominal pain; and due to bleeding, the only signs or symptoms of an ulcer may be black, tarry stools, weakness, and dizziness upon standing (orthostatic hypotension).', 0, 1),
(6, 'Hydroxyzine Hcl', 'Hydroxyzine Hcl', 'Atarax', 'Hydroxyzine is used to treat itching caused by allergies. It is an antihistamine and works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction. Hydroxyzine may also be used short-term to treat anxiety or to help you feel sleepy/relaxed before and after surgery.', 'Drowsiness, dizziness, blurred vision, constipation, or dry mouth may occur. ', 'Take this medication by mouth with or without food as directed by your doctor, usually three or four times daily. If you are using the liquid form of this medication, carefully measure the dose using a special measuring device/spoon. Do not use a household spoon because you may not get the correct dose.\r\n\r\nThe dosage is based on your age, medical condition, and response to treatment. In children, the dosage may also be based on weight. Do not increase your dose or take this medication more often than directed.', '. This product may contain inactive ingredients, which can cause allergic reactions or other problems. ', 0, 1),
(7, ' Cetirizine', ' Cetirizine', ' Zyrtec', 'Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction.\r\n\r\nCetirizine does not prevent hives or prevent/treat a serious allergic reaction (such as anaphylaxis). Therefore, if your doctor has prescribed epinephrine to treat allergic reactions, always carry your epinephrine injector with you. Do not use cetirizine in place of your epinephrine.', 'Drowsiness, tiredness, and dry mouth may occur. Stomach pain may also occur, especially in children', '5 to 10 mg orally once a day\r\n-Maximum dose: 10 mg/day\r\n\r\n6 months to 2 years:\r\n-Initial dose: 2.5 mg orally once a day\r\n-Maintenance dose: 2.5 mg orally once to 2 times a day\r\n-Maximum dose: 5 mg/day\r\n\r\n2 to 5 years:\r\n-Initial dose: 2.5 mg orally once a day\r\n-Maintenance dose: 2.5 mg orally 2 times a day OR 5 mg orally once a day\r\n-Maximum dose: 5 mg/day\r\n\r\n6 years and older: 5 to 10 mg orally once a day\r\n-Maximum dose: 10 mg/day', '_', 0, 1),
(8, 'METFORMIN', 'metformin', 'Glucophage, Glucophage XR, Glumetza, Fortamet, Riomet', 'Metformin is used for treating type 2 diabetes in adults and children. It may be used alone or in combination with other diabetic medications.\r\nMetformin also has been used to prevent the development of diabetes in people at risk for diabetes, treatment of polycystic ovaries, and weight gain due to medications used for treating psychoses.', 'nausea,\r\nvomiting,\r\ngas,\r\nbloating,\r\ndiarrhea and\r\nloss of appetite.\r\n', 'For treating type 2 diabetes in adults, metformin (immediate release) usually is begun at a dose of 500 mg twice a day or 850 mg once daily. The dose is gradually increased by 500 mg weekly or 850 mg every two weeks as tolerated and based on the response of the levels of glucose in the blood. The maximum daily dose is 2550 mg given in three divided doses.\r\nIf extended tablets are used, the starting dose is 500 mg or 1000 mg daily with the evening meal. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg except for Fortamet (2500 mg of Fortamet, once daily or in two divided doses). Glumetza tablets (500 -1000mg formulations are given once daily (either 1000 to 2000mg). Fortamet and Glumetza are modified release formulations of metformin. Metformin should be taken with meals.\r\nFor pediatric patients 10-16 years of age, the starting dose is 500 mg twice a day. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg in divided doses.\r\nChildren older than 17 years of age may receive 500 mg of extended release tablets daily up to a maximum dose of 2000 mg daily. Extended release tablets are not approved for children younger than 17 years of age.\r\nMetformin-containing drugs may be safely used in patients with mild to moderate renal impairment. Renal function should be assessed before starting treatment and at least yearly.\r\nMetformin should not be used by patients with an estimated glomerular filtration rate (eGFR) below 30 mL/minute/1.73 m2  and starting metformin in patients with an eGFR between 30-45 mL/minute/1.73 m2 is not recommended.\r\nMetformin should be stopped at the time of or before administering iodinated contrast in patients with an eGFR between 30 and 60 mL/minute/1.73 m2; in patients with a history of liver disease, alcoholism, or heart failure; or in patients who will be administered intra-arterial iodinated contrast. Kidney function should be evaluated 48 hours after receiving contrast and metformin may be restarted if kidney function is stable.', 'Patients at risk for lactic acidosis include those with reduced function of the\r\n\r\nestive heart failure,\r\nsevere ackidneys or liver,\r\ncongute illnesses, and\r\ndehydration.', 0, 1);

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
(2, 5, 0, 4, 'IBUPROFEN', '2017-09-06 20:40:09', 0),
(3, 5, 6, 0, 'IBUPROFEN', '2017-09-06 20:46:29', 0),
(4, 5, 0, 5, 'IBUPROFEN', '2017-09-06 22:31:29', 0);

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
(1, '17-00001', 'MAUBEL', 'GO', 'HO', '13', '09', 'Female', 'Single', '', '', '', '09', '0000-00-00', 24, 'pototan, iloilo', 'fil', 'rc', 'engn.', 'oo', 'oo', 'ooo', 'oo', '', 'o', 'o', 'o', 'o', 'o', '9', '145', 'o9', '00', '2017-08-13', 1, 1, 1),
(2, '17-00002', 'MAUBEL', 'GO', 'HO', '13', '09', 'Female', 'Single', '', '', '', '09', '0000-00-00', 24, 'pototan, iloilo', 'fil', 'rc', 'engn.', 'oo', 'oo', 'ooo', 'oo', '', 'o', 'o', 'o', 'o', 'o', '9', '145', 'o9', '00', '2017-08-13', 1, 1, 0),
(3, '17-00003', 'Mary Cassandra', 'Jones', 'Molina', 'Outpatient', 'Brgy.Batuan, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09599954321', '1992-03-23', 25, 'Pototan, Iloilo', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Molina, Maria J.', '', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', 'Molina, James L.', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', '145.5 cm', '41 ', '80/90', '39', '2017-08-16', 1, 0, 2),
(4, '17-00004', 'Margaret', 'Cataluna', 'Sanchez', 'Out patient', 'Brgy. Malusgod, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09077123443', '1992-08-02', 24, 'City of Marikita, NCR-2nd District', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Sanchez, Rosemay C.', '', 'Brgy. Malusgod, Pototan, Iloilo', '09099788765', '_', '_', '_', '6\'', '65', '90/100', '37', '2017-08-16', 1, 0, 3),
(5, '17-00005', 'Noila ', 'Suple', 'Go', 'Out patient', 'Brgy. Zarrague, Pototan, Iloilo', 'Female', 'Married', '', '', '', '09075643231', '1985-09-11', 31, 'Dingle, Iloilo', 'Filipino', 'Catholic', 'Assistant 1', 'Stirling Company', 'Gen. Luna, Iloilo City', '520-0078', 'Suple, Ana F.', '', 'Brgy. Batuan, Pototan, Iloilo', '_', 'Go, Anthony H.', 'Brgy. Zarrague, Pototan, Iloilo', '090957777668', '5\'2\'\'', '50klg.', '80/100', '37', '2017-08-16', 1, 0, 4),
(6, '17-00006', 'Gemma', 'Labro', 'Cervantes', 'Out-patient', 'Brgy. Abangay, Pototan, Iloilo', 'Female', 'Married', '', '', '', '09224536758', '1980-07-07', 37, 'Leganes, Iloilo', 'Filipino', 'Catholic', 'Housewife', '_', '_', '_', 'Sanchez, Rosemay C.', '', 'Brgy. Cagamutan Sur, Leganes, Iloilo', '09027654398', 'Cervantes, Gerald J.', 'Brgy. Abangay, Pototan, Iloilo', '09354567698', '5\'6\'\'', '90 pounds', '80/100', '38', '2017-08-16', 1, 0, 5),
(7, '17-00007', 'Francis James', 'De Luna', 'Flores', 'Out-patient', 'Brgy. Callan, Pototan, Iloilo', 'Male', 'Single', '', '', '', '09287654387', '1992-07-23', 25, 'Antipolo City, Rizal', 'Filipino', 'Catholic', 'Sea Farrer', '_', '_', '_', 'Flores, Gina L.', '', 'Brgy. Batuan, Pototan, Iloilo', '09225436785', 'Flores, Fea G.', 'Brgy. Batuan, Pototan, Iloilo', '09225633409', '5\'8\'\'', '60klg.', '80/100', '37', '2017-08-16', 1, 0, 6),
(8, '17-00003', 'Mary Cassandra', 'Jones', 'Molina', 'Outpatient', 'Brgy.Batuan, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09599954321', '1992-03-23', 25, 'Pototan, Iloilo', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Molina, Maria J.', '', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', 'Molina, James L.', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', '145.5 cm', '41 ', '80/90', '39', '2017-08-16', 1, 0, 2);

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
(2, 'Wheezing', 'Wheezing is a whistling sound that occurs during breathing, usually during expiration (breathing air out of the lungs) through narrowed airways. Inflammation of the airways, bronchospasm (tightening of the muscles around the bronchial tubes), and hypersensitivity (reactivity to triggers such as allergens, irritants, or infections) all play a role in the development of wheezing. Any conditions or diseases that can constrict the airways can lead to wheezing. Wheezing can be accompanied by other symptoms such as coughing and shortness of breath. Wheezing may also occur in anaphylaxis, a severe and potentially life-threatening allergic reaction', 1, 0),
(3, 'Shortness of breath', 'Shortness of breath has many causes affecting either the breathing passages and lungs or the heart or blood vessels. An average 150-pound (70 kilogram) adult will breathe at an average rate of 14 breaths per minute at rest. Excessively rapid breathing is referred to as hyperventilation. Shortness of breath is also referred to as dyspnea.', 1, 0),
(4, 'Chronic cough', 'Chronic cough is a cough that persists over time. Chronic cough is not a disease in itself, but rather a symptom of an underlying condition.\r\n\r\nCauses of chronic cough include:\r\nsmoking,\r\nasthma,\r\nhay fever (allergic rhinitis),', 1, 0),
(5, 'Chest pain', 'You may feel chest pain anywhere from your neck to your upper abdomen. Depending on its cause, chest pain may be:\r\n\r\nSharp\r\nDull\r\nBurning\r\nAching\r\nStabbing\r\nA tight, squeezing, or crushing sensation', 1, 0),
(6, ' Nausea ', 'Nausea is the sensation that the stomach wants to empty itself', 1, 0),
(7, 'Dizziness', 'Dizziness is a feeling of being lightheaded or woozy. Disturbances of the brain, gastrointestinal system, vision, and the vestibular system of the inner ear are known causes of dizziness.', 1, 0),
(8, 'Blurred Vision', 'refers to a lack of sharpness of vision resulting in the inability to see fine detail.Blurred vision can also be a symptom of numerous conditions that do not directly involve the eye, such as migraine or stroke. A number of medications may also lead to temporary blurring of vision as a side effect.', 1, 0),
(9, 'Dehydration', 'Dehydration occurs when the amount of water leaving the body is greater than the amount being taken in. The body is very dynamic and always changing. This is especially true with water levels in the body. We lose water routinely when we:\r\n\r\nbreathe and humidified air leaves the body;\r\nsweat to cool the body; and\r\nurinate or have a bowel movement to rid the body of waste products.', 1, 0);

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
(2, 5, 0, 4, 'Chest pain', '0000-00-00 00:00:00', 0),
(3, 5, 6, 0, 'Chest pain', '0000-00-00 00:00:00', 0),
(4, 4, 0, 5, 'Chronic cough', '0000-00-00 00:00:00', 0),
(5, 7, 0, 5, 'Dizziness', '0000-00-00 00:00:00', 0);

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
(1, 1, 'uploads/1-maubel-ho.jpg', 'patient_picture', '2017-08-13 11:13:08', 0),
(2, 3, 'uploads/3-mary-cassandra-molina.jpg', 'patient_picture', '2017-08-16 09:05:37', 0),
(3, 4, 'uploads/4-margaret-sanchez.jpg', 'patient_picture', '2017-08-16 09:14:25', 0),
(4, 5, 'uploads/5-noila-go.jpg', 'patient_picture', '2017-08-16 09:34:58', 0),
(5, 6, 'uploads/6-gemma-cervantes.jpg', 'patient_picture', '2017-08-16 09:46:45', 0),
(6, 7, 'uploads/7-francis-james-flores.jpg', 'patient_picture', '2017-08-16 10:45:27', 0);

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
('2017-08-12T13:56:18+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-14T01:55:06+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-14T02:03:47+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-16T23:48:02+08:00', 'create login', '', 'NURSE1', '::1'),
('2017-08-16T23:48:20+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-16T23:50:34+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-17T00:47:37+08:00', 'auth-fail', '', 'NURSE1', '::1'),
('2017-08-17T00:48:01+08:00', 'auth-success', '', 'NURSE1', '::1'),
('2017-08-17T01:08:06+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-17T05:36:17+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-18T01:31:28+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-18T05:00:25+08:00', 'auth-success', '', 'NURSE1', '::1'),
('2017-08-18T05:06:19+08:00', 'auth-fail', '', 'admin', '::1'),
('2017-08-18T05:11:59+08:00', 'auth-success', '', 'admin', '::1'),
('2017-08-20T06:46:26+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-04T02:13:31+08:00', 'auth-fail', '', 'NURSE1', '::1'),
('2017-09-04T02:14:38+08:00', 'auth-success', '', 'NURSE1', '::1'),
('2017-09-06T20:02:00+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-06T20:39:18+08:00', 'auth-success', '', 'admin', '192.168.1.3');

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
(1, 'admin', '$2a$11$UUGKpE59qycoIck5hXdYueUj.sv5JdMijfB5BHTH.GX1xk463I66O', '2017-08-12T13:53:54+08:00', '2017-09-06T20:39:18+08:00', '1017-08-12T13:53:54+08:00'),
(2, 'admin1', '$2a$11$nWQo6OZKU58BQhnE9SZZY.V6bThC9.r62VvdembeMrSOwg9GKa8zy', '2017-08-12T13:55:46+08:00', '2017-08-12T13:55:46+08:00', '1017-08-12T13:55:46+08:00'),
(3, 'admin2', '$2a$11$zZsXm4h9zu6hScdmL01qCu.wcJ0IW7Ke4HPEZ0HQEdkzBJY3.DRq6', '2017-08-12T13:56:09+08:00', '2017-08-12T13:56:09+08:00', '1017-08-12T13:56:09+08:00'),
(4, 'NURSE1', '$2a$11$tu/n.ir6qKl8u4kOdVN6YeK3MR70NZfD3Ppd7fuTQOAOWYUOEHp2C', '2017-08-16T23:48:02+08:00', '2017-09-04T02:14:38+08:00', '1017-08-16T23:48:02+08:00');

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
('0cvlm5gqbh8krsuvggbkfkglm4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236313166346331323563626231366264636565666130313131633737633437373534306535333632373766383233653264366566353761326461663532636266223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('39hlvvifnsiqa6kik1napehmv4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383433353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230656463343663343237303662333566653233616265373665666334636564656261343766316363333635636432303133333239383761383730356666383635223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33333a35352b30323a3030223b7d7d, '2017-09-06T16:37:55+02:00', '1017-09-06T22:13:55+08:00'),
('3lrjotftldtf4lbelc4m1ah944', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393637353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236343239366666653538303165363666386536636466613336333363323331333932373636646566653164323765353761633363336433643665363238633839223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35343a33352b30323a3030223b7d7d, '2017-09-06T16:58:35+02:00', '1017-09-06T22:34:35+08:00'),
('4ts5qgp7jvvh4dfms3b2raoel5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393030363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232306234356337313466626435343138643666653962383738316237383038613964383561386263616431366461613136383761323430383937343335376431223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a34333a32362b30323a3030223b7d7d, '2017-09-06T16:47:26+02:00', '1017-09-06T22:23:26+08:00'),
('5722f8ksjadp5ph38od3eajfh0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383435393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263333334383161323863626261306263303038373937316535636332366133323436643965323639623632343565353532303162623233353734626633663765223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a31392b30323a3030223b7d7d, '2017-09-06T16:38:19+02:00', '1017-09-06T22:14:19+08:00'),
('65i9klugk5kr9av46lr4116tt6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264643235656333646365373534623730633166366266353335303761326436343436303464323366303239636333313634353231663963393966623734373065223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('6ar74afss2ort0v4ncti840gs4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261643833633338326363323564343334306364663235623666663934343836663232393034333138323734643735663232363639376537343062303736323034223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('7e9slm0m9j5dv20bdc0racpk77', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393634313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230396637346665653334333065636337303966633062326363356230323932396137393963306561663662393639623264336466663537353532663737633437223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35343a30312b30323a3030223b7d7d, '2017-09-06T16:58:01+02:00', '1017-09-06T22:34:01+08:00'),
('7mmoccg33qaild3in8o91gh1r2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237386135636136366630663963343939613462316664636530623038383635316237613036646331326136316164303265313936393632343530386338353435223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('8jtnkmgt3vb79j73gem2lpp7i6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383437303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266346138663531356363383163623734373236303734313735386266643739313034343236386161323437653033376634383730353661616237393132316365223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a33302b30323a3030223b7d7d, '2017-09-06T16:38:30+02:00', '1017-09-06T22:14:30+08:00'),
('90sv6bmriuvkvhq35vpn42aup5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383437303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235663738373435336638613266623866343263613432366439313561643863643432616564663936316432656539326462656361663566313933333235353335223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a33302b30323a3030223b7d7d, '2017-09-06T16:38:30+02:00', '1017-09-06T22:14:30+08:00'),
('99m2rl09lf9fci7u53lh8d1425', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393434323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262363139316661323032383133313738386566346137653431313837373738366533313662653031376166363235616261646131333761633764336139633066223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a34322b30323a3030223b7d7d, '2017-09-06T16:54:42+02:00', '1017-09-06T22:30:42+08:00'),
('af4btk54s9pjfkfh9avsitp5g5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239643061643635326364656462353863346464323837626261303461323036666335333661376464363663383438336532626631633366373939636138363864223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('bhjamqr2ohgemih83s00ae10v6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393434323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265626138626338303263336562386664383365616264646666343335373665356631643965326239363463313963366361376434306435356339653639643033223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a34322b30323a3030223b7d7d, '2017-09-06T16:54:42+02:00', '1017-09-06T22:30:42+08:00'),
('bu0lkidv2osua224086te30255', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393637383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232613036326232353131373561646662336539663933613762316164323239633934666365356462356233643034323737303436353333313164333134323132223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35343a33382b30323a3030223b7d7d, '2017-09-06T16:58:38+02:00', '1017-09-06T22:34:38+08:00'),
('c0rb8s13vmaajavi9dqm27tp36', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262653836323639353838336633643836396530333335373836336265303836376166333435376636633230663061363830316361383464356134376533646539223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33332b30323a3030223b7d7d, '2017-09-06T16:54:33+02:00', '1017-09-06T22:30:34+08:00'),
('c3q0jicfkpnb7gp211rq0dsgd4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343436333732363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236653135613836306137353030323131643936313834316334303538636462643661616362386165633562396263313635323031343435343265636164303030223b733a363a22657870697265223b733a32353a22323031372d30392d30335432303a33353a32362b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-09-03T20:39:26+02:00', '1017-09-04T02:15:26+08:00'),
('d4a4phi67u5i8md6sac6bi23d2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393137313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232646433306536616534303136653730666562343439643165386237386365376239383832393863343062633263396330323833346431313032633962643164223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a34363a31312b30323a3030223b7d7d, '2017-09-06T16:50:11+02:00', '1017-09-06T22:26:11+08:00'),
('e3klo6rbq59nltn4kn8r03nfj5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323932393034323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238306366386361666135363562313165393336343065313265343634373165386337653764633637346231653734326139363338366535643462663635353935223b733a363a22657870697265223b733a32353a22323031372d30382d31375430323a31373a32322b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-17T02:21:22+02:00', '1017-08-17T07:57:22+08:00'),
('ephf0ecbdepnbf83sk7lfrkd70', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230346238643138323637383563396566666363383565376634643364666563643437363433613334636162313164396339636662386132613564323961393064223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('evqb6u07jk301ilpclafil4oo0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a31313a223139322e3136382e312e33223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3134303a224d6f7a696c6c612f352e3020284c696e75783b20416e64726f696420362e302e313b20415355535f5a30304144204275696c642f4d4d4232395029204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313037204d6f62696c65205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730323736333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264633737383466316664393862336138636632373962666331353462313839353466306533616638623038316134383037653364366533333262636630396338223b733a363a22657870697265223b733a32353a22323031372d30392d30365431343a35393a32332b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-09-06T15:03:23+02:00', '1017-09-06T20:39:23+08:00'),
('g5a8hpb4b0tfbg9487gjvo7re1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261303563396638313263393538656338303737376634396434633238323238376139343264396265646566653438393838343436636439306139366133393633223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('grs5es9c3clsqkl46p02e51593', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393431383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232626537326634376464396361336163653065313831343366393032396535383764353363643235333364616236653331626566353137613961356365353463223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a31382b30323a3030223b7d7d, '2017-09-06T16:54:18+02:00', '1017-09-06T22:30:18+08:00'),
('h15iv0hku7k3pp1t338smm8l45', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266663763613866336434336265323330323365303835343262383837643837633233303633333936363361393766373861383965643937383535353237616365223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('hglsb636h576e111jo980ldfe0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393637383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266343830666231376663323237663465616538376530646461326332376361656465646530626135386638323435323461646466336564396562323034626132223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35343a33382b30323a3030223b7d7d, '2017-09-06T16:58:38+02:00', '1017-09-06T22:34:38+08:00'),
('hs3kunb00h7jq5evbskoa19o84', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263306233636336373337366364656134643061383863353766656363353563356661366266663638333562316434643663633566663439633461323662343336223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('i8bdbkm6r7s11s1abh1n2c3pi4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393238343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236646334636266343162653135376432346238313463643339333138353161626434353764666664633831376461663262666261363964313032373465383464223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a34383a30342b30323a3030223b7d7d, '2017-09-06T16:52:04+02:00', '1017-09-06T22:28:04+08:00'),
('ikmc5dluspor33d87c7fkevlv0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393434323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230396139303937303034633035383730616535383461613263316365663338383035633062393136656334386466383237373165353835636330613664323564223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a34322b30323a3030223b7d7d, '2017-09-06T16:54:42+02:00', '1017-09-06T22:30:42+08:00'),
('iut0akc2am14a7jhl05oj4f755', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265303834313563663764646234313861366437393763313264333833643261386135333765646261303161626134663830366637353434623765633231363034223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('k41uv321l65p13dkk6fpdovsr5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393530353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230626430616339383631336562353534356234376435616334646235373536613733323833363465666363613562303939363831366463666331643161303733223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35313a34352b30323a3030223b7d7d, '2017-09-06T16:55:45+02:00', '1017-09-06T22:31:45+08:00'),
('kh6ootbc71j11vjj9qpeadmv17', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230326436613965636432343736313361353133643331363638626164333231386531666361643963623634353338393733633338376239313030646665656633223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('l08o7bqpelfgqld7or8ivfp0h2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383433353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232633635646237373165366135313731333635376136626461346566363134323665363761353863306466613061326431343164373839363937313431353735223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33333a35352b30323a3030223b7d7d, '2017-09-06T16:37:55+02:00', '1017-09-06T22:13:55+08:00'),
('lb39gicmun8llqoq29dih4l8d4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343731303336363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265393264316636663761316665643434656261336661336564346364616238373337353962393961656137616462336431663139336635616434326630303839223b733a363a22657870697265223b733a32353a22323031372d30392d30365431373a30363a30362b30323a3030223b7d7d, '2017-09-06T17:10:06+02:00', '1017-09-06T22:46:06+08:00'),
('m9kisvmqdff668n7ka4nj66tu2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393137313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263343833383237636662663239316231306130363961373666386331393232373439623639343761623361666662366433663636616534663064623533663134223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a34363a31312b30323a3030223b7d7d, '2017-09-06T16:50:11+02:00', '1017-09-06T22:26:11+08:00'),
('mersul0di3dkkjbftnsjfkdag6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237386530353365646338343238626539643565306166326162666464333633343730646462383432646131346633313837633939363661353734396463666364223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('mmabqmhhhnh3nt997cu23d0bj2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235313730376536316335386131643134396534313761326533386532393465653765626564346534323262383661373961363930633665363534376337326537223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('ncc065d4jrpodtm911v8jmdnq6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333030353137393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230653166303563616631383231346134663334653832343433363635666262353139616633303563636331383161646635363964623831316433383037633730223b733a363a22657870697265223b733a32353a22323031372d30382d31375432333a32363a31382b30323a3030223b7d7d69734c6f67676564496e7c623a303b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-18T05:30:19+08:00', '1017-08-18T05:06:23+08:00'),
('nteh9e88i44u34ejeakkn6mpr0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233336436623332363433383834356136666439663562336339316561633965653261316330383066373231386464653537613733333431656438333132616637223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('oprsibueo6tpm0s13tdfan6ct6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393637353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238396566363466383035646633306266656264663935653163613830656435353630356364353332346331333462353361616461623264663161663439306332223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35343a33352b30323a3030223b7d7d, '2017-09-06T16:58:35+02:00', '1017-09-06T22:34:35+08:00'),
('p863ombld2to08331gkcrq0ll0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383433353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261346133333234373364643335663430366236663639333932633961663337373033306263396339646561393737366539636239386164336663353830656331223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33333a35352b30323a3030223b7d7d, '2017-09-06T16:37:55+02:00', '1017-09-06T22:13:55+08:00'),
('q2cq892puhv17mcvcf9gq1teo1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333138343130323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237316663633534613439633564383132623863643563343436366234386438346634393564303462643437343938363038653264396565336263613966633837223b733a363a22657870697265223b733a32353a22323031372d30382d32305430313a30383a32322b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-08-20T01:12:22+02:00', '1017-08-20T06:48:23+08:00'),
('q712g6o4i87rpflhka8po4pt61', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237666162666637373834313633386563623065396466373165303461306532356533646138333263383832636665656262353230353430316434386630356666223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32392b30323a3030223b7d7d, '2017-09-06T16:38:29+02:00', '1017-09-06T22:14:29+08:00'),
('qccsl2v6vi08s56ca7v378v0i1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231656661373338316533363362326163306366376434393439386166376336633135363535333536393537396362643436313534383763353965656163363035223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('qs2eih9k20m74sobvjg8bav633', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530333031323334383b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230623961333164396134353939313430663761653561366637346333643061663761653064316261353038663735653238656132346365306434343232393537223b733a363a22657870697265223b733a32353a22323031372d30382d31385430313a32353a34382b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2232383937383363393361393630373738396433356537646232613762373037656439626634653836323239343437383931616432326530653365623038353335223b733a363a22657870697265223b733a32353a22323031372d30382d31385430373a32303a34382b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-08-18T01:29:48+02:00', '1017-08-18T07:05:48+08:00'),
('sdvnbt7t05uq95qrr84luq31r5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393433343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262376636353662376263613237333366386335373534376138666230396165643535313739316339373134316166636531376233313066303839333262386162223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a33342b30323a3030223b7d7d, '2017-09-06T16:54:34+02:00', '1017-09-06T22:30:34+08:00'),
('tlsiu054rmes1nhueko734upc5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343731313233393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233366630303462346633363465346338363035316639363263303432613530356361313733333336343231346432376431326337626539303137626564316530223b733a363a22657870697265223b733a32353a22323031372d30392d30365431373a32303a33392b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-09-06T17:24:39+02:00', '1017-09-06T23:00:39+08:00'),
('ulpfoub6ceqdk9ikeehtmd82j0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730393431393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233663264343535376663326137613635633236346236383936313230366430323966303934633363626561303661313865353266363039383062643830353666223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a35303a31392b30323a3030223b7d7d, '2017-09-06T16:54:19+02:00', '1017-09-06T22:30:19+08:00'),
('v4l18ip21t2uit4lb55lvrg396', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343730383436303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230333632633063336563323666653433303930326435326364306238323333393734666161653132663862346239333334343265363665376339666334616433223b733a363a22657870697265223b733a32353a22323031372d30392d30365431363a33343a32302b30323a3030223b7d7d, '2017-09-06T16:38:20+02:00', '1017-09-06T22:14:20+08:00'),
('vpi51u1qjqscnkbsigutcj2233', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530323934353430363b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262306564643163633665323139316264626566353238613532346562376539333636656364636136323663306664336362326364613764373236653536616537223b733a363a22657870697265223b733a32353a22323031372d30382d31375430363a35303a30362b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2232393630376236653838326432316237306538643632313832383039353131306663373737666232613561366263363162666139346465336430396366386662223b733a363a22657870697265223b733a32353a22323031372d30382d31375431323a34353a30362b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-08-17T06:54:06+02:00', '1017-08-17T12:30:06+08:00');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
