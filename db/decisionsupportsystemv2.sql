-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2017 at 03:33 PM
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
(1, 1, 'admin@yahoo.com', 3, 'Rodina', 'P', 'Mondragon', 'Male', '1995-11-12', 'Doctor', '', '', NULL),
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
(6, 'C17-00006', 'Heartache', 4, 5, 'Broken Heart', 'Pain reliever ', NULL, '2017-09-06 20:46:29', 1, 0),
(7, 'C17-00007', 'Heartache', 4, 3, 'Broken Heart', 'Pain reliever ', NULL, '2017-09-07 13:31:22', 1, 1),
(8, 'C17-00008', 'Heartache', 4, 3, 'Broken Heart', 'Pain reliever ', NULL, '2017-09-07 13:31:42', 1, 1),
(9, 'C17-00009', 'Heartache', 4, 3, 'Broken Heart', 'Pain reliever ', NULL, '2017-09-07 13:33:28', 1, 0),
(10, 'C17-00010', 'Flu', 5, 8, 'Flu na yan', '1 time a day', NULL, '2017-09-07 21:25:22', 1, 0);

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
(5, 'Flu', 'Flu na yan', '1 time a day', 1, 0),
(6, 'asd', 'asgasdg', 'sadgdsa', 1, 1);

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
(7, 'Cetirizine', ' Cetirizine', ' Zyrtec', 'Cetirizine is an antihistamine used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose, sneezing, hives, and itching. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction.\r\n\r\nCetirizine does not prevent hives or prevent/treat a serious allergic reaction (such as anaphylaxis). Therefore, if your doctor has prescribed epinephrine to treat allergic reactions, always carry your epinephrine injector with you. Do not use cetirizine in place of your epinephrine.', 'Drowsiness, tiredness, and dry mouth may occur. Stomach pain may also occur, especially in children', '5 to 10 mg orally once a day\r\n-Maximum dose: 10 mg/day\r\n\r\n6 months to 2 years:\r\n-Initial dose: 2.5 mg orally once a day\r\n-Maintenance dose: 2.5 mg orally once to 2 times a day\r\n-Maximum dose: 5 mg/day\r\n\r\n2 to 5 years:\r\n-Initial dose: 2.5 mg orally once a day\r\n-Maintenance dose: 2.5 mg orally 2 times a day OR 5 mg orally once a day\r\n-Maximum dose: 5 mg/day\r\n\r\n6 years and older: 5 to 10 mg orally once a day\r\n-Maximum dose: 10 mg/day', '_', 0, 1),
(8, 'METFORMIN', 'metformin', 'Glucophage, Glucophage XR, Glumetza, Fortamet, Riomet', 'Metformin is used for treating type 2 diabetes in adults and children. It may be used alone or in combination with other diabetic medications.\r\nMetformin also has been used to prevent the development of diabetes in people at risk for diabetes, treatment of polycystic ovaries, and weight gain due to medications used for treating psychoses.', 'nausea,\r\nvomiting,\r\ngas,\r\nbloating,\r\ndiarrhea and\r\nloss of appetite.\r\n', 'For treating type 2 diabetes in adults, metformin (immediate release) usually is begun at a dose of 500 mg twice a day or 850 mg once daily. The dose is gradually increased by 500 mg weekly or 850 mg every two weeks as tolerated and based on the response of the levels of glucose in the blood. The maximum daily dose is 2550 mg given in three divided doses.\r\nIf extended tablets are used, the starting dose is 500 mg or 1000 mg daily with the evening meal. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg except for Fortamet (2500 mg of Fortamet, once daily or in two divided doses). Glumetza tablets (500 -1000mg formulations are given once daily (either 1000 to 2000mg). Fortamet and Glumetza are modified release formulations of metformin. Metformin should be taken with meals.\r\nFor pediatric patients 10-16 years of age, the starting dose is 500 mg twice a day. The dose can be increased by 500 mg weekly up to a maximum dose of 2000 mg in divided doses.\r\nChildren older than 17 years of age may receive 500 mg of extended release tablets daily up to a maximum dose of 2000 mg daily. Extended release tablets are not approved for children younger than 17 years of age.\r\nMetformin-containing drugs may be safely used in patients with mild to moderate renal impairment. Renal function should be assessed before starting treatment and at least yearly.\r\nMetformin should not be used by patients with an estimated glomerular filtration rate (eGFR) below 30 mL/minute/1.73 m2  and starting metformin in patients with an eGFR between 30-45 mL/minute/1.73 m2 is not recommended.\r\nMetformin should be stopped at the time of or before administering iodinated contrast in patients with an eGFR between 30 and 60 mL/minute/1.73 m2; in patients with a history of liver disease, alcoholism, or heart failure; or in patients who will be administered intra-arterial iodinated contrast. Kidney function should be evaluated 48 hours after receiving contrast and metformin may be restarted if kidney function is stable.', 'Patients at risk for lactic acidosis include those with reduced function of the\r\n\r\nestive heart failure,\r\nsevere ackidneys or liver,\r\ncongute illnesses, and\r\ndehydration.', 0, 1),
(9, 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 1, 1);

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
(4, 5, 0, 5, 'IBUPROFEN', '2017-09-06 22:31:29', 0),
(5, 5, 9, 0, 'IBUPROFEN', '2017-09-07 13:33:28', 0),
(6, 7, 0, 6, 'Cetirizine', '2017-09-07 20:08:08', 0),
(7, 2, 10, 0, 'ALBUTEROL ', '2017-09-07 21:25:22', 0),
(8, 4, 10, 0, 'ATENOLOL', '2017-09-07 21:25:22', 0),
(9, 5, 10, 0, 'IBUPROFEN', '2017-09-07 21:25:22', 0);

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
  `last_visit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_ulid` int(11) NOT NULL,
  `is_removed` int(11) NOT NULL DEFAULT '0',
  `picture_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_patients`
--

INSERT INTO `dss_patients` (`ID`, `PatientID`, `first_name`, `middle_name`, `last_name`, `ward`, `address`, `gender`, `status`, `brgy`, `municipality`, `province`, `telephone`, `date_of_birth`, `age`, `place_of_birth`, `nationality`, `religion`, `occupation`, `employer`, `emp_address`, `emp_telephone`, `mother`, `g_relationship`, `mom_address`, `mom_telephone`, `spouse`, `sp_address`, `sp_telephone`, `height`, `weight`, `blood_pressure`, `body_temperature`, `last_visit`, `admin_ulid`, `is_removed`, `picture_id`) VALUES
(1, '17-00001', 'MAUBEL', 'GO', 'HO', '13', '09', 'Female', 'Single', '', '', '', '09', '0000-00-00', 24, 'pototan, iloilo', 'fil', 'rc', 'engn.', 'oo', 'oo', 'ooo', 'oo', '', 'o', 'o', 'o', 'o', 'o', '9', '145', 'o9', '00', '2017-08-13 00:00:00', 1, 1, 1),
(2, '17-00002', 'MAUBEL', 'GO', 'HO', '13', '09', 'Female', 'Single', '', '', '', '09', '0000-00-00', 24, 'pototan, iloilo', 'fil', 'rc', 'engn.', 'oo', 'oo', 'ooo', 'oo', '', 'o', 'o', 'o', 'o', 'o', '9', '145', 'o9', '00', '2017-08-13 00:00:00', 1, 1, 0),
(3, '17-00003', 'Mary Cassandra', 'Jones', 'Molina', 'Outpatient', 'Brgy.Batuan, Pototan, Iloilo', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09599954321', '1992-03-23', 25, 'Pototan, Iloilo', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Molina, Maria J.', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', 'Molina, James L.', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', '145.5 cm', '41 ', '80/90', '39', '2017-09-07 13:33:28', 1, 0, 2),
(4, '17-00004', 'Margaret', 'Cataluna', 'Sanchez', 'Out patient', 'Brgy. Malusgod, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09077123443', '1992-08-02', 24, 'City of Marikita, NCR-2nd District', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Sanchez, Rosemay C.', '', 'Brgy. Malusgod, Pototan, Iloilo', '09099788765', '_', '_', '_', '6\'', '65', '90/100', '37', '2017-08-16 00:00:00', 1, 0, 3),
(5, '17-00005', 'Noila ', 'Suple', 'Go', 'Out patient', 'Brgy. Zarrague, Pototan, Iloilo', 'Female', 'Married', 'Amamaros', 'Pototan', 'Iloilo', '09075643231', '1985-09-11', 31, 'Dingle, Iloilo', 'Filipino', 'Catholic', 'Assistant 1', 'Stirling Company', 'Gen. Luna, Iloilo City', '520-0078', 'Suple, Ana F.', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '_', 'Go, Anthony H.', 'Brgy. Zarrague, Pototan, Iloilo', '090957777668', '5\'2\'\'', '50klg.', '80/100', '37', '2017-08-16 00:00:00', 1, 0, 4),
(6, '17-00006', 'Gemma', 'Labro', 'Cervantes', 'Out-patient', 'Brgy. Abangay, Pototan, Iloilo', 'Female', 'Married', '', '', '', '09224536758', '1980-07-07', 37, 'Leganes, Iloilo', 'Filipino', 'Catholic', 'Housewife', '_', '_', '_', 'Sanchez, Rosemay C.', '', 'Brgy. Cagamutan Sur, Leganes, Iloilo', '09027654398', 'Cervantes, Gerald J.', 'Brgy. Abangay, Pototan, Iloilo', '09354567698', '5\'6\'\'', '90 pounds', '80/100', '38', '2017-08-16 00:00:00', 1, 0, 5),
(7, '17-00007', 'Francis James', 'De Luna', 'Flores', 'Out-patient', 'Brgy. Callan, Pototan, Iloilo', 'Male', 'Single', '', '', '', '09287654387', '1992-07-23', 25, 'Antipolo City, Rizal', 'Filipino', 'Catholic', 'Sea Farrer', '_', '_', '_', 'Flores, Gina L.', '', 'Brgy. Batuan, Pototan, Iloilo', '09225436785', 'Flores, Fea G.', 'Brgy. Batuan, Pototan, Iloilo', '09225633409', '5\'8\'\'', '60klg.', '80/100', '37', '2017-08-16 00:00:00', 1, 0, 6),
(8, '17-00003', 'Mary Cassandra', 'Jones', 'Molina', 'Outpatient', 'Brgy.Batuan, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09599954321', '1992-03-23', 25, 'Pototan, Iloilo', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Molina, Maria J.', '', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', 'Molina, James L.', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', '145.5 cm', '41 ', '80/90', '39', '2017-09-07 21:25:22', 1, 0, 2),
(9, '17-00009', 'Eli', 'Chi', 'Ayase', '11', 'Tokyo, Japan', 'Female', 'Single', 'Primitivo Ledesma Ward (Pob.', 'Pototan', 'Iloilo', '09098058503', '1995-02-01', 22, 'Russia', 'Russiajin', 'Shinto', 'School Idol', '', '', '', 'Lola Harasho', 'Grandmother', 'Russia', '09090909090', '', '', '', '5\'5\"', '47kg', '112', '37', '2017-09-07 00:00:00', 1, 0, 7),
(10, '17-00010', 'Eli', 'Chi', 'Ayase', '11', 'Tokyo, Japan', 'Female', 'Single', 'Primitivo Ledesma Ward (Pob.', 'Pototan', 'Iloilo', '09098058503', '1995-02-01', 22, 'Russia', 'Russiajin', 'Shinto', 'School Idol', '', '', '', 'Lola Harasho', 'Grandmother', 'Russia', '09090909090', '', '', '', '5\'5\"', '47kg', '112', '37', '2017-09-07 00:00:00', 1, 1, 8),
(11, '17-00011', 'Nozomi', 'Ayase', 'Tojou', '11', 'Tokyo, Japan', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 21, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-07 13:16:26', 1, 1, 9),
(12, '17-00012', 'Nozomi', 'Ayase', 'Tojou', '11', 'Tokyo, Japan', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 21, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-07 13:25:58', 1, 1, 10),
(13, '17-00013', 'Nozomi', 'Ayase', 'Tojou', '11', 'Tokyo, Japan', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 21, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-07 13:27:42', 1, 0, 0);

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
(6, 'Nausea ', 'Nausea is the sensation that the stomach wants to empty itself', 1, 0),
(7, 'Dizziness', 'Dizziness is a feeling of being lightheaded or woozy. Disturbances of the brain, gastrointestinal system, vision, and the vestibular system of the inner ear are known causes of dizziness.', 1, 0),
(8, 'Blurred Vision', 'refers to a lack of sharpness of vision resulting in the inability to see fine detail.Blurred vision can also be a symptom of numerous conditions that do not directly involve the eye, such as migraine or stroke. A number of medications may also lead to temporary blurring of vision as a side effect.', 1, 0),
(9, 'Dehydration', 'Dehydration occurs when the amount of water leaving the body is greater than the amount being taken in. The body is very dynamic and always changing. This is especially true with water levels in the body. We lose water routinely when we:\r\n\r\nbreathe and humidified air leaves the body;\r\nsweat to cool the body; and\r\nurinate or have a bowel movement to rid the body of waste products.', 1, 0),
(10, 'terr', 'asdfdsa', 1, 1);

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
(5, 7, 0, 5, 'Dizziness', '0000-00-00 00:00:00', 0),
(6, 5, 9, 0, 'Chest pain', '0000-00-00 00:00:00', 0),
(7, 3, 0, 6, 'Shortness of breath', '0000-00-00 00:00:00', 0),
(8, 4, 0, 6, 'Chronic cough', '0000-00-00 00:00:00', 0),
(9, 6, 0, 6, 'Nausea ', '0000-00-00 00:00:00', 0),
(10, 4, 10, 0, 'Chronic cough', '0000-00-00 00:00:00', 0),
(11, 7, 10, 0, 'Dizziness', '0000-00-00 00:00:00', 0);

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
(6, 7, 'uploads/7-francis-james-flores.jpg', 'patient_picture', '2017-08-16 10:45:27', 0),
(7, 9, 'uploads/9-eli-ayase.jpg', 'patient_picture', '2017-09-07 13:11:29', 0),
(8, 10, 'uploads/10-eli-ayase.jpg', 'patient_picture', '2017-09-07 13:13:58', 0),
(9, 11, 'uploads/11-nozomi-tojou.jpg', 'patient_picture', '2017-09-07 13:16:26', 0),
(10, 12, 'uploads/12-nozomi-tojou.jpg', 'patient_picture', '2017-09-07 13:25:58', 0);

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
('2017-09-06T20:39:18+08:00', 'auth-success', '', 'admin', '192.168.1.3'),
('2017-09-07T15:43:25+08:00', 'auth-success', '', 'admin', '::1');

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
(1, 'admin', '$2a$11$UUGKpE59qycoIck5hXdYueUj.sv5JdMijfB5BHTH.GX1xk463I66O', '2017-08-12T13:53:54+08:00', '2017-09-07T15:43:24+08:00', '1017-08-12T13:53:54+08:00'),
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
('45q6civvogjhadui4ot6t9bq92', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343739323234323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262353037353539626436313437323861363038643535303265386338626130376336613737366663393535656232656635303661653538376435393639366262223b733a363a22657870697265223b733a32353a22323031372d30392d30375431353a35303a34322b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-09-07T15:54:42+02:00', '1017-09-07T21:30:43+08:00'),
('dgthpvukk27oei8av68g02rsk3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343737383832363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237323366613938343865306264313132353131373065353130356465303331376333346261376261393733393265323364316530636331626136313933613561223b733a363a22657870697265223b733a32353a22323031372d30392d30375431323a30373a30362b30323a3030223b7d7d, '2017-09-07T12:11:06+02:00', '1017-09-07T17:47:07+08:00'),
('ir6njijp6h52ilhsuu63f8g4e7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343737383836353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231343233366665353264386337626131353731376161303365633332363830376335326666393438373465346663383939396366376532643333356361646135223b733a363a22657870697265223b733a32353a22323031372d30392d30375431323a30373a34352b30323a3030223b7d7d, '2017-09-07T12:11:45+02:00', '1017-09-07T17:47:45+08:00'),
('m4jlivc2bmha05l43ccrn7q4o0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36302e302e333131322e313133205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530343739313931373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230663635393564303633386235386639343061396632383866613630323835393633326532306131366461616535633262633931333834663130613030386333223b733a363a22657870697265223b733a32353a22323031372d30392d30375431353a34353a31372b30323a3030223b7d7d, '2017-09-07T15:49:17+02:00', '1017-09-07T21:25:17+08:00'),
('neaklaajbqi45rukr153bgpn55', '', '2017-09-07T12:11:49+02:00', '1017-09-07T11:47:49+01:00');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
