-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2017 at 08:00 AM
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
(3, 3, 'admin2@yahoo.com', 1, 'Kim', NULL, 'Un', '0', NULL, 'Nurse', '', NULL, NULL),
(4, 4, 'Mendiola_Anne01@yahoo.com', 1, 'Anne Margaret', NULL, 'Mendiola', '0', NULL, 'Nurse1', '', NULL, NULL),
(5, 5, 'gracia03@yahoo.com', 1, 'Gracia', 'Dee', 'Luna', 'Female', '1992-02-13', 'Nurse', '09180706054', 'Brgy. Malusgod, Pototan, Iloilo', NULL);

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
(28, 'Primitivo Ledesma Ward', 'Pototan'),
(29, 'Lopez Jaena Ward', 'Pototan'),
(30, 'Lumbo', 'Pototan'),
(31, 'Macatol', 'Pototan'),
(32, 'Malusgod', 'Pototan'),
(33, 'Naslo', 'Pototan'),
(34, 'Nabitasan', 'Pototan'),
(35, 'Naga', 'Pototan'),
(36, 'Nanga', 'Pototan'),
(37, 'Pajo', 'Pototan'),
(38, 'Palanguia', 'Pototan'),
(39, 'Fernando Parcon Ward', 'Pototan'),
(40, 'Pitogo', 'Pototan'),
(41, 'Polot-an', 'Pototan'),
(42, 'Purog', 'Pototan'),
(43, 'Rumbang', 'Pototan'),
(44, 'San Jose Ward', 'Pototan'),
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
(10, 'C17-00010', 'Flu', 5, 3, 'Flu na yan', '1 time a day', NULL, '2017-09-07 21:25:22', 1, 0),
(11, 'C17-00011', 'Flu', 5, 9, 'Flu na yan', '1 time a day', NULL, '2017-09-11 15:16:22', 1, 0),
(12, 'C17-00012', 'Diabetes', 7, 7, 'Diabetes Melitus\r\n Type II\r\n\r\nDiabetes Melitus Type I', 'Hydroxyzine HcI\r\n- 1 capsule daily after dinner\r\n\r\nMetformin\r\n-1 tablet daily before breakfast', NULL, '2017-09-11 20:40:05', 1, 1),
(13, 'C17-00013', 'Diabetes', 7, 13, 'Diabetes Melitus\r\n Type II\r\n\r\n', 'Hydroxyzine HcI\r\n- 1 capsule daily after dinner\r\n\r\nMetformin\r\n-1 tablet daily before breakfast', NULL, '2017-09-12 11:53:10', 1, 0),
(14, 'C17-00014', 'Heartache', 4, 13, 'Broken Heart', 'take 1 capsule after breakfast', NULL, '2017-09-13 13:27:20', 1, 0),
(15, 'C17-00015', 'Diabetes', 7, 7, 'Diabetes Melitus\r\n Type II\r\n\r\n', 'Hydroxyzine HcI\r\n- 1 capsule daily after dinner\r\n\r\nMetformin\r\n-1 tablet daily before breakfast', NULL, '2017-09-13 14:22:29', 1, 0),
(16, 'C17-00016', 'Asthma', 8, 7, 'Asthma A\r\n', 'Acebutolol\r\n- take 1 capsule once a day after dinner\r\n\r\nCetirizine\r\n-take 1 tablet a day before sleeping', NULL, '2017-09-14 15:40:02', 1, 0),
(17, 'C17-00017', 'Stoke', 0, 7, 'stoke', '-', NULL, '2017-10-13 10:42:25', 1, 1),
(18, 'C17-00018', 'Brainerd Diarrhea', 10, 6, 'rr', 'rr', NULL, '2017-10-13 11:56:15', 1, 0);

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
(6, 'asd', 'asgasdg', 'sadgdsa', 1, 1),
(7, 'Diabetes', 'Diabetes Melitus\r\n Type II\r\n\r\nDiabetes Melitus Type I', 'Hydroxyzine HcI\r\n- 1 capsule daily after dinner\r\n\r\nMetformin\r\n-1 tablet daily before breakfast', 1, 0),
(8, 'Asthma', 'Asthma A\r\n\r\nAsthma B', 'Acebutolol\r\n- take 1 capsule once a day after dinner\r\n\r\nCetirizine\r\n-take 1 tablet a day before sleeping', 1, 0),
(9, 'Hepatitis B', 'Hepatitis B', 'Methotrexate may be taken with or without food.', 1, 0),
(10, 'Brainerd Diarrhea', 'rr', 'rr', 1, 1),
(11, 'Bronchitis', 'fjj', 'yyy', 1, 1),
(12, 'Lung Cancer', 'tytytyty', 'ttt', 1, 1),
(13, 'Tuberculosis', '-', 'Within 48 to 72 hours', 1, 1),
(14, 'Tuberculosis', 'Tuberculosis (TB)', 'Within 48 to 72 hours', 1, 0),
(15, 'Dengue Fever', 'Dengue Fever', 'Rest and drink plenty of fluids.', 1, 0),
(16, 'Cardiovascular Diseases', 'Coronary heart diseases (CHD)', 'Take atenolol exactly as it was prescribed for you. It may take up to 2 weeks before you get the full effect of atenolol.', 1, 0),
(17, 'Achondroplasia', 'Achondroplasia', 'Achondroplasia is usually taken once daily for only 2 or 3 weeks.Take the medicine at the same time.', 1, 0),
(18, 'Radiculopathy', 'Radiculopathy', 'Take in divided doses 2 to 3 timesa day with meals', 1, 0),
(19, 'Biorhythm', 'Biorhythm', '50 to 100 mg 4 times a day, 50 to 100 mg immediately, then every 4 to 6 hours as needed', 1, 0),
(20, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(21, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(22, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(23, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(24, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(25, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 1),
(26, 'Blood in Urine', 'Hematuria', 'Take with food if  aspirin upsets your stomach.', 1, 0);

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
(9, 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 'Salbotamol', 1, 1),
(10, 'ALEVE', 'naproxen', 'ALEVE', 'Aleve (naproxen) is a nonsteroidal anti-inflammatory drug (NSAID). Naproxen works by reducing hormones that cause inflammation and pain in the body.\r\nAleve is used to temporarily relieve minor aches and pains due to arthritis, muscular aches, backache, menstrual cramps, headache, toothache,and the common cold. Aleve is also used to temporarily reduce fever.Aleve may also be used for purposes not listed in this medication guide.', 'indigestion, heartburn, stomachpain,nausea;headache,dizziness,drowsiness;bruising, itching, rash;swelling; orringing in your ears.', 'Use Aleve exactly as directed on the label, or as prescribed by your doctor. Do not take this medicine in larger amounts or for longer than recommended. Use the lowest dose that is effective in treating your condition.Do not crush, chew, or break a Aleve tablet. Swallow the tablet whole.If a child is using this medicine, tell your doctor if the child has any changes in weight. Naproxen doses are based on weight in children, and any changes may affect your child\'s dose.If you use Aleve long-term, you may need frequent medical tests.This medicine can cause unusual results with certain medical tests. Tell any doctor who treats you that you are using Aleve.Store at room temperature away from moisture, heat, and light. Keep the bottle tightly closed when not in use.', 'Avoid drinking alcohol. It may increase your risk of stomach bleeding.Avoid taking aspirin while you are taking naproxen.Ask your doctor before taking any other medication for pain, arthritis, fever, or swelling. Many medicines available over the counter contain aspirin, salicylates, or other medicines similar to naproxen (such as ibuprofen or ketoprofen). Taking certain products together can cause you to get too much of this type of medication.Ask your doctor before using an antacid, and use only the type your doctor recommends. Some antacids can make it harder for your body to absorb Aleve.', 0, 1),
(11, 'Albuterol Inhalation', 'ProAir HFA, ProAir RespiClick', 'Albuterol Inhalation', 'Albuterol is a bronchodilator that relaxes muscles in the airways and increases air flow to the lungs.Albuterol inhalation is used to treat or prevent bronchospasm in people with reversible obstructive airway disease. It is also used to prevent exercise-induced bronchospasm.Albuterol inhalation is for use in adults and children who are at least 4 years old.', 'Wheezing, choking, or other breathing problems after using this medicine;\r\nchest pain, fast heart rate, pounding heartbeats or fluttering in your chest;\r\npain or burning when you urinate;\r\nhigh blood sugar - increased thirst, increased urination, hunger, dry mouth, fruity breath odor, drowsiness, dry skin, blurred vision, weight loss', 'Use albuterol inhalation exactly as prescribed by your doctor. Follow all directions on your prescription label. Do not use albuterol inhalation in larger or smaller amounts or for longer than recommended.Read all patient information, medication guides, and instruction sheets provided to you. Ask your doctor or pharmacist if you have any questions.You may need to prime your albuterol inhaler device before the first use. Your medicine comes with directions for priming if needed.You may also need to shake your albuterol device just before each use.Follow all medication instructions very carefully.Do not allow a young child to use albuterol inhalation without help from an adult.The usual dose of albuterol inhalation is 2 inhalations every 4 to 6 hours. To prevent exercise-induced bronchospasm, use 2 inhalations 15 to 30 minutes before you exercise. The effects of albuterol inhalation should last about 4 to 6 hours.', 'This list is not complete. Other drugs may interact with albuterol inhalation, including prescription and over-the-counter medicines, vitamins, and herbal products. Not all possible interactions are listed in this medication guide.', 0, 1),
(12, 'Moxatag', 'amoxicillin', 'Moxatag', 'Amoxicillin is a penicillin antibiotic that fights bacteria.Amoxicillin is used to treat many different types of infection caused by bacteria, such as tonsillitis, bronchitis, pneumonia, gonorrhea, and infections of the ear, nose, throat, skin, or urinary tract.Amoxicillin is also sometimes used together with another antibiotic called clarithromycin (Biaxin) to treat stomach ulcers caused by Helicobacter pylori infection. This combination is sometimes used with a stomach acid reducer called lansoprazole (Prevacid).', 'stomach pain, nausea, vomiting, diarrhea;\r\nvaginal itching or discharge;\r\nheadache; or\r\nswollen, black, or \"hairy\" tongue.', 'Take amoxicillin exactly as prescribed by your doctor. Follow all directions on your prescription label. Do not take this medicine in larger or smaller amounts or for longer than recommended.Take this medicine at the same time each day.The Moxatag brand of amoxicillin should be taken with food, or within 1 hour after eating a meal.Some forms of amoxicillin may be taken with or without food. Check your medicine label to see if you should take your medicine with food or not.You may need to shake the liquid medicine well just before you measure a dose. Follow the directions on your medicine label.Measure liquid medicine with the dosing syringe provided, or with a special dose-measuring spoon or medicine cup. If you do not have a dose-measuring device, ask your pharmacist for one. You may place the liquid directly on the tongue, or you may mix it with water, milk, baby formula, fruit juice, or ginger ale. Drink all of the mixture right away. Do not save any for later use.', '-', 0, 1),
(13, 'Aspirin', 'Acetyl Salicylic acid', 'Aspirin', 'Aspirin is a salicylate (sa-LIS-il-ate). It works by reducing substances in the body that cause pain, fever, and inflammation.Aspirin is used to treat pain, and reduce fever or inflammation. It is sometimes used to treat or prevent heart attacks, strokes, and chest pain (angina).Aspirin should be used for cardiovascular conditions only under the supervision of a doctor.', 'upset stomach, heartburn;\r\ndrowsiness; or\r\nmild headache.', 'Avoid drinking alcohol while you are taking aspirin. Alcohol may increase your risk of stomach bleeding.If you are taking this medicine to prevent heart attack or stroke, avoid also taking ibuprofen (Advil, Motrin). Ibuprofen may make this medicine less effective. If you must use both medications, take the ibuprofen at least 8 hours before or 30 minutes after you take the aspirin (non-enteric coated form).Ask a doctor or pharmacist before using any cold, allergy, or pain medication. Many medicines available over the counter contain aspirin or an NSAID. Taking certain products together can cause you to get too much of this type of medication. Check the label to see if a medicine contains aspirin, ibuprofen, ketoprofen, naproxen, or an NSAID.', '-', 0, 1),
(14, 'Baclofen', 'Lioresal, Lioresal Intrathecal, Gablofen, FIRST Baclofen', 'Baclofen', 'Baclofen is a muscle relaxer and an antispastic agent.Baclofen is used to treat muscle symptoms caused by multiple sclerosis, including spasm, pain, and stiffness.Baclofen is sometimes used to treat muscle spasms and other symptoms in people with injury or disease of the spinal cord.', 'drowsiness, dizziness, weakness, tired feeling;\r\nheadache;\r\nsleep problems (insomnia);\r\nnausea, constipation; or\r\nurinating more often than usual.', 'Take baclofen exactly as prescribed by your doctor. Follow all directions on your prescription label. Your doctor may occasionally change your dose to make sure you get the best results. Do not use this medicine in larger or smaller amounts or for longer than recommended.Call your doctor if your muscle symptoms do not improve, or if they get worse.Do not stop using this medicine suddenly, or you could have unpleasant withdrawal symptoms such as hallucinations or a seizure. Ask your doctor how to safely stop using this medicine.Store at room temperature away from moisture and heat.', 'Do not use baclofen at a time when you need muscle tone for safe balance and movement during certain activities. In some situations, it may be dangerous for you to have reduced muscle tone.Drinking alcohol with this medicine can cause side effects.This medication may impair your thinking or reactions. Be careful if you drive or do anything that requires you to be alert.', 0, 1),
(15, 'cyclobenzaprine', 'Amrix, Comfort Pac with Cyclobenzaprine, Fexmid, Flexeril', 'cyclobenzaprine', 'Cyclobenzaprine is a muscle relaxant. It works by blocking nerve impulses (or pain sensations) that are sent to your brain.Cyclobenzaprine is used together with rest and physical therapy to treat skeletal muscle conditions such as pain or injury.Cyclobenzaprine may also be used for purposes not listed in this medication guide.', 'headache, dizziness;\r\ndrowsiness, tired feeling;\r\ntrouble concentrating;\r\nblurred vision, dry mouth or throat, altered sense of taste; or\r\nnausea, upset stomach, constipation.', 'Cyclobenzaprine is usually taken once daily for only 2 or 3 weeks. Follow all directions on your prescription label. Do not take this medicine in larger or smaller amounts or for longer than recommended.Take the medicine at the same time each day.Do not crush, chew, break, or open an extended-release capsule. Swallow it whole.You may have unpleasant withdrawal symptoms when you stop taking cyclobenzaprine after long-term use. Ask your doctor how to avoid withdrawal symptoms when you stop using this medicine.Cyclobenzaprine is only part of a complete program of treatment that may also include rest, physical therapy, or other pain relief measures. Follow your doctor\'s instructions.Store at room temperature away from moisture, heat, and light.', '-', 0, 1),
(16, 'clonidine', 'Catapres, Kapvay', 'clonidine', 'Clonidine lowers blood pressure by decreasing the levels of certain chemicals in your blood. This allows your blood vessels to relax and your heart to beat more slowly and easily.The Catapres brand of clonidine is used to treat hypertension (high blood pressure). The Kapvay brand is used to treat attention deficit hyperactivity disorder (ADHD).Clonidine is sometimes given with other medications.', 'drowsiness, dizziness;\r\nfeeling tired or irritable;\r\ndry mouth, loss of appetite;\r\nconstipation;\r\ndry eyes, contact lens discomfort; or\r\nsleep problems (insomnia), nightmares.', 'Take clonidine exactly as it was prescribed for you. Follow all directions on your prescription label. Your doctor may occasionally change your dose to make sure you get the best results. Do not take this medicine in larger or smaller amounts or for longer than recommended.Clonidine is usually taken in the morning and at bedtime. If you take different doses of this medicine at each dosing time, it may be best to take the larger dose at bedtime.Clonidine may be taken with or without food.Do not use two forms of clonidine at the same time. This medicine is also available as a transdermal patch worn on the skin.Do not crush, chew, or break an extended-release tablet. Swallow it whole. Tell your doctor if you have trouble swallowing the tablet.If you need surgery, tell the surgeon ahead of time that you are using clonidine. You may need to stop using the medicine for a short time.Do not stop using clonidine suddenly, or you could have unpleasant withdrawal symptoms. Ask your doctor how to safely stop using this medicine.Call your doctor if you are sick with vomiting. Prolonged illness can make it harder for your body to absorb this medicine, which may lead to withdrawal symptoms. This is especially important for a child taking clonidine.If you are being treated for high blood pressure, keep using this medication even if you feel well. High blood pressure often has no symptoms. You may need to use blood pressure medication for the rest of your life.Store at room temperature away from moisture, heat, and light.', 'Avoid drinking alcohol. It may increase certain side effects of clonidine. Clonidine may impair your thinking or reactions. Avoid driving or operating machinery until you know how this medicine will affect you. Dizziness or severe drowsiness can cause falls or other accidents.', 0, 1),
(17, 'diclofenac ', 'Cambia, Cataflam, Voltaren-XR, Zipsor, Zorvolex, Voltaren, Dyloject', 'diclofenac', 'Diclofenac is a nonsteroidal anti-inflammatory drug (NSAID). This medicine works by reducing substances in the body that cause pain and inflammation.Diclofenac is used to treat mild to moderate pain, or signs and symptoms of osteoarthritis or rheumatoid arthritis. The Cataflam brand of this medicine is also used to treat menstrual cramps.Diclofenac powder (Cambia) is used to treat a migraine headache attack. Cambia will only treat a headache that has already begun. It will not prevent headaches or reduce the number of attacks.', 'indigestion, gas, stomach pain, nausea, vomiting;\r\ndiarrhea, constipation;\r\nheadache, dizziness, drowsiness;\r\nstuffy nose;\r\nitching, increased sweating;\r\nincreased blood pressure; or\r\nswelling or pain in your arms or legs.', 'Diclofenac free acid capsules: 35 mg orally 3 times a day\r\nDiclofenac potassium immediate-release tablets: 50 mg orally 2 or 3 times a day\r\nDiclofenac sodium enteric-coated tablets: 50 mg orally 2 or 3 times a day or 75 mg orally 2 times a day\r\nMaximum dose: 150 mg daily.Diclofenac sodium extended-release tablets: 100 mg orally once a day', '-', 0, 1),
(18, 'Danocrine ', 'DANAZOL - ORAL (DAY-nuh-zole)', 'Danocrine', 'Danazol has rarely caused very serious (possibly fatal) blood clots (such as stroke), liver disease, and increased pressure on the brain (benign intracranial hypertension). Seek immediate medical attention if you have any symptoms of these side effects, including weakness on one side of the body, slurred speech, vision changes, severe stomach/abdominal pain, dark urine, persistent nausea/vomiting, yellowing eyes/skin, mental/mood changes (such as confusion), severe/persistent headache.', 'Weight gain, acne, flushing, sweating, voice changes (hoarseness, change in pitch), abnormal growth of body hair (in women), vaginal dryness/irritation, or decreased breast size may occur. If any of these effects persist or worsen, tell your doctor or pharmacist promptly.Remember that your doctor has prescribed this medication because he or she has judged that the benefit to you is greater than the risk of side effects. Many people using this medication do not have serious side effects.Tell your doctor immediately if any of these unlikely but serious side effects occur: swelling hands/ankles/feet, menstrual changes (such as spotting, missed periods), mental/mood changes (such as nervousness, mood swings).A very serious allergic reaction to this drug is rare. However, seek immediate medical attention if you notice any symptoms of a serious allergic reaction, including: rash, itching/swelling (especially of the face/tongue/throat), severe dizziness, trouble breathing.', 'Take this medication by mouth, usually twice daily or as directed by your doctor. You may take this medication with or without food, but it is important to choose one way and take this medication the same way with every dose.The dosage is based on your medical condition and response to treatment.Use this medication regularly to get the most benefit from it. To help you remember, take it at the same times each day.Tell your doctor if your condition does not improve or if it worsens.', 'This medication must not be used during pregnancy. It may harm an unborn baby. In women of childbearing age, this medication should be started during their menstrual period. If not, then they should have a negative pregnancy test before starting this medication. It is important to prevent pregnancy while using this medication. Consult your doctor for more details and to discuss the use reliable forms of non-hormonal birth control (such as condoms, diaphragm with spermicide) while using this medication. If you become pregnant or think you may be pregnant, tell your doctor immediately.', 0, 1),
(19, 'Nalfon 200', 'Fenoprofen', 'Nalfon 200', 'Fenoprofen is a nonsteroidal anti-inflammatory drug (NSAID) that is effective for treating the fever, pain, and swelling caused by inflammation. Fenoprofen belongs to a class of drugs called nonsteroidal anti-inflammatory drugs (NSAIDs). Other members of the NSAID class of drugs include ibuprofen (Motrin), indomethacin (Indocin), nabumetone (Relafen), naproxen (Aleve) and several others. These drugs are used for the management of mild to moderate pain, fever, and inflammation. They work by reducing the levels of prostaglandins, chemicals that are responsible for the pain, fever, and swelling of inflammation. Fenoprofen blocks the enzymes that make prostaglandins (cyclooxygenases), resulting in lower concentrations of prostaglandins. As a consequence, inflammation, swelling, pain and fever are reduced. Fenoprofen was approved by the FDA in March 1976.', 'rash,\r\nringing in the ears,\r\nheadaches,\r\ndizziness,\r\ndrowsiness,\r\nabdominal pain,\r\nnausea,\r\ndiarrhea,', 'The recommended adult dose for mild to moderate pain is 200 mg every 4-6 hours.Rheumatoid arthritis and osteoarthritis are treated with 300 to 600 mg 3-4 times daily (every 6 to 8 hours). The maximum daily dose is 3200 mg daily.Fenoprofen should be administered with meals in order to avoid stomach upset.The safety and effectiveness of this drug in patients under age 18 has not been examined.', 'People who are allergic to other NSAIDs should not use fenoprofen. NSAIDs reduce the flow of blood to the kidneys and impair function of the kidneys. The impairment is most likely to occur in patients with preexisting impairment of kidney function or congestive heart failure, and use of NSAIDs in these patients should be done cautiously. Individuals with asthma are more likely to experience allergic reactions to fenoprofen and other NSAIDs. Fluid retention, blood clots, heart attacks, high blood pressure (hypertension), and heart failure also have been associated with the use of NSAIDs.', 0, 1),
(20, 'Actizid (1000mg)', 'Pyrazinamide', 'Actizid (1000mg)', 'Pyrazinamide is an antibiotic. The exact way that pyrazinamide works is unknown.Pyrazinamide is used to treat tuberculosis (TB).Pyrazinamide may also be used for purposes other than those listed in this medication guide.', 'fever;\r\nunusual weakness or fatigue;\r\nnausea, vomiting, or loss of appetite;\r\nyellow skin or eyes;\r\ndark urine;\r\ndifficult or painful urination;', 'Take pyrazinamide exactly as directed by your doctor. If you do not understand these instructions, ask your pharmacist, nurse, or doctor to explain them to you.\r\nTake each dose with a full glass (8 ounces) of water.\r\nTake all of the pyrazinamide that has been prescribed for you even if you begin to feel better. Your symptoms may begin to improve before the infection is completely treated.\r\nPyrazinamide is usually combined with one or more other tuberculosis medicines.\r\nStore this medication at room temperature away from moisture and heat.', 'Symptoms of an pyrazinamide overdose are not well known. Liver damage has been detected.', 0, 1),
(21, 'co', 'ce', 'co', 'rrrr', 'rr', 'rr', 'rr', 1, 1);

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
(9, 5, 10, 0, 'IBUPROFEN', '2017-09-07 21:25:22', 0),
(10, 5, 11, 0, 'IBUPROFEN', '2017-09-11 15:16:22', 0),
(11, 6, 0, 7, 'Hydroxyzine Hcl', '2017-09-11 20:36:17', 0),
(12, 8, 0, 7, 'METFORMIN', '2017-09-11 20:36:17', 0),
(13, 6, 12, 0, 'Hydroxyzine Hcl', '2017-09-11 20:40:05', 0),
(14, 8, 12, 0, 'METFORMIN', '2017-09-11 20:40:05', 0),
(15, 6, 13, 0, 'Hydroxyzine Hcl', '2017-09-12 11:53:11', 0),
(16, 8, 13, 0, 'METFORMIN', '2017-09-12 11:53:11', 0),
(17, 5, 14, 0, 'IBUPROFEN', '2017-09-13 13:27:20', 0),
(18, 3, 0, 8, 'ACEBUTOLOL', '2017-09-13 14:00:50', 0),
(19, 7, 0, 8, 'Cetirizine', '2017-09-13 14:00:50', 0),
(20, 6, 15, 0, 'Hydroxyzine Hcl', '2017-09-13 14:22:29', 0),
(21, 8, 15, 0, 'METFORMIN', '2017-09-13 14:22:29', 0),
(22, 3, 16, 0, 'ACEBUTOLOL', '2017-09-14 15:40:03', 0),
(23, 7, 16, 0, 'Cetirizine', '2017-09-14 15:40:03', 0),
(24, 7, 0, 9, 'Cetirizine', '2017-10-05 11:02:05', 0),
(25, 2, 0, 10, 'ALBUTEROL ', '2017-10-08 19:29:27', 0),
(26, 10, 0, 11, 'ALEVE', '2017-10-08 19:30:19', 0),
(27, 4, 0, 12, 'ATENOLOL', '2017-10-08 19:31:36', 0),
(28, 10, 0, 13, 'ALEVE', '2017-10-12 19:18:34', 0),
(29, 20, 0, 14, ' Pyrazinamide', '2017-10-12 19:43:21', 0),
(30, 13, 0, 15, 'Aspirin', '2017-10-12 19:56:24', 0),
(31, 4, 0, 16, 'ATENOLOL', '2017-10-12 20:15:55', 0),
(32, 15, 0, 17, 'cyclobenzaprine', '2017-10-12 21:44:40', 0),
(33, 8, 0, 18, 'METFORMIN', '2017-10-12 21:51:44', 0),
(34, 6, 0, 19, 'Hydroxyzine Hcl', '2017-10-13 10:03:05', 0),
(35, 13, 0, 20, 'Aspirin', '2017-10-13 10:12:39', 0),
(36, 13, 0, 21, 'Aspirin', '2017-10-13 10:12:39', 0),
(37, 13, 0, 22, 'Aspirin', '2017-10-13 10:12:42', 0),
(38, 13, 0, 23, 'Aspirin', '2017-10-13 10:12:43', 0),
(39, 13, 0, 24, 'Aspirin', '2017-10-13 10:12:43', 0),
(40, 13, 0, 25, 'Aspirin', '2017-10-13 10:12:43', 0),
(41, 13, 0, 26, 'Aspirin', '2017-10-13 10:12:44', 0),
(42, 10, 17, 0, 'ALEVE', '2017-10-13 10:42:25', 0),
(43, 2, 18, 0, 'ALBUTEROL ', '2017-10-13 11:56:15', 0);

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
(3, '17-00003', 'Mary Cassandra', 'Jones', 'Molina', 'Outpatient', 'Brgy.Bagacay, Pototan, Iloilo', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09599954321', '1992-03-23', 25, 'Pototan, Iloilo', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Molina, Maria J.', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', 'Molina, James L.', 'Brgy. Batuan, Pototan, Iloilo', '537-9902', '145.5 cm', '41 ', '80/90', '39', '2017-09-07 13:33:28', 1, 0, 12),
(4, '17-00004', 'Margaret', 'Cataluna', 'Sanchez', 'Out patient', 'Brgy. Malusgod, Pototan, Iloilo', 'Female', 'Single', '', '', '', '09077123443', '1992-08-02', 24, 'City of Marikita, NCR-2nd District', 'Filipino', 'Catholic', 'Self Employed', '_', '_', '_', 'Sanchez, Rosemay C.', '', 'Brgy. Malusgod, Pototan, Iloilo', '09099788765', '_', '_', '_', '6\'', '65', '90/100', '37', '2017-08-16 00:00:00', 1, 0, 18),
(5, '17-00005', 'Noila ', 'Suple', 'Sy', 'Out patient', 'Brgy. Zarrague, Pototan, Iloilo', 'Female', 'Married', 'Amamaros', 'Pototan', 'Iloilo', '09075643231', '1985-09-11', 31, 'Dingle, Iloilo', 'Filipino', 'Catholic', 'Assistant 1', 'Stirling Company', 'Gen. Luna, Iloilo City', '520-0078', 'Suple, Ana F.', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '_', 'Go, Anthony H.', 'Brgy. Zarrague, Pototan, Iloilo', '090957777668', '5\'2\'\'', '50klg.', '80/100', '37', '2017-08-16 00:00:00', 1, 0, 19),
(6, '17-00006', 'Gemma', 'Labro', 'Cervantes', 'Out-patient', 'Brgy. Abangay, Pototan, Iloilo', 'Female', 'Married', 'Batuan', 'Pototan', 'Iloilo', '09224536758', '1980-07-07', 37, 'Leganes, Iloilo', 'Filipino', 'Catholic', 'Housewife', '_', '_', '_', 'Sanchez, Rosemay C.', 'Mother', 'Brgy. Cagamutan Sur, Leganes, Iloilo', '09027654398', 'Cervantes, Gerald J.', 'Brgy. Abangay, Pototan, Iloilo', '09354567698', '5\'6\'\'', '90 pounds', '80/100', '38', '2017-10-13 11:56:15', 1, 0, 20),
(7, '17-00007', 'Francis James', 'De Luna', 'Flores', 'Out-patient', 'Brgy. Callan, Pototan, Iloilo', 'Male', 'Single', 'Callan', 'Pototan', 'Iloilo', '09287654387', '1992-07-23', 40, 'Antipolo City, Rizal', 'Filipino', 'Catholic', 'Sea Farrer', '_', '_', '_', 'Flores, Gina L.', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '09225436785', 'Flores, Fea G.', 'Brgy. Batuan, Pototan, Iloilo', '09225633409', '5\'8\'\'', '60klg.', '80/100', '37', '2017-10-13 10:42:25', 1, 0, 21),
(9, '17-00009', 'Eli', 'Chi', 'Ayase', '11', 'Ledesma Street', 'Female', 'Single', 'Primitivo Ledesma Ward', 'Pototan', 'Iloilo', '09098058503', '1995-02-01', 35, 'Russia', 'Russiajin', 'Shinto', 'School Idol', '', '', '', 'Lola Harasho', 'Grandmother', 'Russia', '09090909090', '', '', '', '5\'5', '47kg', '112', '37', '2017-09-11 15:16:22', 1, 0, 22),
(10, '17-00010', 'Eli', 'Chi', 'Ayase', '11', 'Tokyo, Japan', 'Female', 'Single', 'Primitivo Ledesma Ward', 'Pototan', 'Iloilo', '09098058503', '1995-02-01', 22, 'Russia', 'Russiajin', 'Shinto', 'School Idol', '', '', '', 'Lola Harasho', 'Grandmother', 'Russia', '09090909090', '', '', '', '5\'5\"', '47kg', '112', '37', '2017-09-07 00:00:00', 1, 1, 8),
(11, '17-00011', 'Nozomi', 'Ayase', 'Tojou', '11', 'Tokyo, Japan', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 21, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-07 13:16:26', 1, 1, 9),
(12, '17-00012', 'Nozomi', 'Ayase', 'Tojou', '11', 'Tokyo, Japan', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 21, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-07 13:25:58', 1, 1, 10),
(13, '17-00013', 'Nozomi', 'yase', 'Tojou', '11', 'Brgy.Bagacay, Pototan, Iloilo', 'Female', 'Single', 'Bagacay', 'Pototan', 'Iloilo', '09090909090', '1995-12-11', 60, 'Osaka yan', 'Nihonjin', 'Shinto', 'School Idol', '', '', '', 'Mama Tojo', 'Mother', 'Osaka yan', '090909', '', '', '', 'too tall', 'too big at many places', '112', '37', '2017-09-13 13:27:20', 1, 0, 23),
(14, '17-00014', 'El', 'Ronco', 'Compas', '', 'Brgy. Abangay, Pototan, Iloilo', 'Male', 'Separated', 'Abangay', 'Pototan', 'Iloilo', '09073964368', '1980-12-26', 72, 'zarraga', 'Fil', 'RC', 'Guard', '_', '_', '_', 'Mabel C. Mijares', 'Mother', 'Romblon', 'Mother', '_', '_', '', '145.5 cm', '41 ', '90/100', '90', '2017-09-11 15:15:24', 1, 0, 24),
(15, '17-00015', 'Rachel', 'Subebe', 'Labadia', 'Outpatient', 'Brgy. Abangay, Pototan, Iloilo', 'Female', 'Single', 'Abangay', 'Pototan', 'Iloilo', '0909887765', '1992-03-02', 25, 'Duenas,iloio', 'fil.', 'Rc', 'None', '_', '_', '_', 'Ernilina S. Labadia', 'Mother', 'Brgy. Batuan, Pototan, Iloilo', '0909097655', '_', '_-', '_', '5\'1\'\'', '45', '90/100', '37', '2017-09-13 14:17:06', 1, 0, 16),
(16, '17-00016', 'Lina', 'Sy', 'Chang', '', 'Brgy.Bagacay, Pototan, Iloilo', 'Female', 'Divorced', 'Fundacion', 'Pototan', 'Iloilo', '09303211234', '1980-09-03', 37, 'City of Marikita, NCR-2nd District', 'Half Pilipino', 'Catholic', 'None', '', '', '', 'Anna Chang', 'Mother', 'Brgy. Cagamutan Sur, Leganes, Iloilo', '09099788765', '', '', '', '6\'5', '41 ', '90/100', '37', '2017-10-07 18:30:06', 1, 0, 26);

-- --------------------------------------------------------

--
-- Table structure for table `dss_presc`
--

CREATE TABLE `dss_presc` (
  `ID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `DiseaseID` int(11) NOT NULL,
  `MedicineID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `intake` text NOT NULL,
  `date_prescribed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dss_presc`
--

INSERT INTO `dss_presc` (`ID`, `CaseID`, `DiseaseID`, `MedicineID`, `amount`, `intake`, `date_prescribed`) VALUES
(1, 11, 0, 3, 6, '2 times a day for 3 days', '0000-00-00 00:00:00'),
(2, 11, 0, 4, 5, '1 time a day for 5 days', '0000-00-00 00:00:00'),
(3, 11, 0, 5, 9, '3 times a day for 3 days', '0000-00-00 00:00:00'),
(4, 18, 0, 2, 5, '5 times a day for 1 day', '0000-00-00 00:00:00');

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
(10, 'terr', 'asdfdsa', 1, 1),
(11, 'Fatigue, Loss of appetite, Nausea, Jaundice, Pain', 'Fatigue (either physical, mental or both) is a symptom that may be difficult for the patient to describe and words like lethargic, exhausted and tired may be used.', 1, 0),
(12, 'Headache causes', 'A headache can occur in any part of the head, on both sides of the head, or in just one location.Headaches can radiate across the head from a central point or have a vise-like quality. They can be sharp, throbbing or dull, appear gradually or suddenly. They can last from less than an hour up to several days.There are different ways to define headaches. The International Headache Society (IHS) categorize headaches as primary, when they are not caused by another condition, or secondary, when there is a further underlying cause.', 1, 0),
(13, 'Depression', 'Depression is a mental health disorder. It is a mood disorder characterized by persistently low mood and a feeling of sadness and loss of interest. Depression is a persistent problem, not a passing one - the average length of a depressive episode is 6-8 months.', 1, 0),
(14, 'Vomiting', 'Vomiting, along with nausea, is a symptom of an underlying disease rather than a specific illness itself. Emesis is the medical term for vomiting. Vomiting is the forcible emptying of the stomach in which the stomach has to overcome the pressures that are normally in place to keep food and secretions within the stomach. Causes of vomiting are varied and include food-borne illnesses (food poisoning), infections, problems with the brain and central nervous system, and systemic (body-wide) diseases. Some illnesses will cause nausea and vomiting, even though there is no direct involvement of the stomach or gastrointestinal tract. Examples can include pneumonia, heart attack, and sepsis. Vomiting may be a side effect of medications, including drugs used in cancer chemotherapy, as well as a side effect of radiation therapy.', 1, 0),
(15, 'Insomnia', 'Insomnia can affect people of any age; it is more common in adult females than adult males. The sleeping disorder can undermine school and work performance, as well as contributing to obesity, anxiety, depression, irritability, concentration problems, memory problems, poor immune system function, and reduced reaction time.Insomnia has also been associated with a higher risk of developing chronic diseases. According to the National Sleep Foundation, 30-40 percent of American adults report that they have had symptoms of insomnia within the last 12 months, and 10-15 percent of adults claim to have chronic insomnia.', 1, 0),
(16, 'Hypertension', 'Blood pressure is the force exerted by the blood against the walls of the blood vessels.How great the pressure is depends on the work being done by the heart and the resistance of the blood vessels.Medical guidelines define hypertension as a blood pressure higher than 140 over 90 millimeters of mercury (mmHg).The systolic reading of 140 mmHg refers to the pressure as the heart pumps blood around the body. The diastolic reading of 90 mmHg refers to the pressure as the heart relaxes and refills with blood.', 1, 0),
(17, 'Arthritis', 'Rheumatic conditions are typically characterized by pain, aching, stiffness and swelling in and around one or more joints. The symptoms can develop gradually or suddenly. Certain rheumatic conditions can also involve the immune system and various internal organs of the body.Some forms of arthritis, such as rheumatoid arthritis and lupus (SLE), can affect multiple organs and cause widespread symptoms.Arthritis is more common among adults aged 65 years or older, but people of all ages (including children) can be affected.', 1, 0),
(18, 'Muscle aches', 'Muscle aches, or myalgia, are extremely common. Almost everybody has experienced discomfort in their muscles at some point.Because there is muscle tissue in nearly all parts of the body, this type of pain can be felt practically anywhere...', 1, 0),
(19, 'Anemia', 'Anemia is the condition of having less than the normal number of red blood cells or less than the normal quantity of hemoglobin in the blood. The oxygen-carrying capacity of the blood is, as a result, decreased.People with anemia may experience the following symptoms and signs:\r\nFeel tired or lightheaded (sometimes with fainting)\r\nWeakness\r\nFatigue easily\r\nHave decreased energy\r\nAppear pale\r\nDevelop palpitations or rapid heart rate\r\nExperience shortness of breath\r\nChildren with chronic anemia are prone to infections and learning problems.\r\nIn general, anemia has four basic categories of causes. Sometimes more than one of these problems are causing the anemia:Bleeding (hemorrhage\r\nExcessive destruction of red blood cells (hemolysis)\r\nUnderproduction of red blood cells (such as from bone marrow disorders)\r\nNot enough normal hemoglobin\r\nWomen are more likely than men to have anemia because of the loss of blood from menstruation. Iron-deficiency anemia is common and in adults is most often due to chronic blood loss. This can be from menstruation or from gastrointestinal bleeding (which can be very subtle). Anemia in children is due mainly to inadequate iron in the diet. Anemia is common from gastrointestinal bleeding caused by medications, including such common drugs as aspirin and ibuprofen (Advil or Motrin).', 1, 0),
(20, 'Mood swing', 'Mood swings refer to rapid changes in mood. The term may refer to minor daily mood changes or to significant mood changes as seen with mood disorders such as major depression or bipolar depression. Mood swings can also occur in women who suffer from premenstrual syndrome or premenstrual dysphoric disorder. The menopausal transition, specifically the time around approaching menopause or perimenopause, is associated with mood swings in some women. Mood swings can be seen with other conditions as well, including schizophrenia, attention deficit hyperactivity disorder, dementia, and thyroid conditions.', 1, 0),
(21, 'Muscle pain', 'Muscle pain originates in any of the muscles in the body. The medical term for muscle pain is myalgia. Muscle pain may arise due to injury or overexertion, infections of the soft tissues, or inflammatory conditions. A number of conditions can be associated with generalized aches and pain, such as influenza, that are perceived to be muscle pain. Muscle pain can be localized to one muscle group or diffuse, involving multiple muscle groups. Muscle pain due to injury or overuse is most commonly localized to one area. Depending upon the cause, muscle pain can be mild or severe and debilitating. Muscle pain is the hallmark symptom of some chronic conditions like fibromyalgia. Related symptoms that can occur with muscle pain are tenderness, swelling, redness, or fever.', 1, 0),
(22, 'Seizure', 'A seizure is the uncontrolled electrical activity in the brain, which may produce a physical convulsion, minor physical signs, thought disturbances, or a combination of symptoms.The type of symptoms and seizures depend on where the abnormal electrical activity takes place in the brain, what its cause is, and such factors as the patient\'s age and general state of health.Seizures can be caused by head injuries, brain tumors, lead poisoning, maldevelopment of the brain, genetic and infectious illnesses, and fevers. In fully half of the patients with seizures, no cause can yet be found.', 1, 0),
(23, 'Stiff neck', 'Stiffness in the neck can arise as a result of disorders and diseases of any structure in the neck. The neck contains seven cervical vertebrae that are the bony building blocks of the spine in the neck; these vertebrae surround the spinal cord and canal. Between these vertebrae are discs, and nearby pass the nerves of the neck. Within the neck, other structures and organs include the neck muscles, arteries, veins, lymph glands, thyroid gland, parathyroid glands, esophagus, larynx, and trachea. Neck stiffness can be associated with symptoms such asheadache,\r\nshoulder pain, and\r\nstiffness in the shoulder.Stiff neck is most commonly due to damage to the bones, nerves, and/or muscles of the neck. However, stiff neck is also a symptom of meningitis (along with headache and fever). Neck stiffness may also develop as a reaction and result of muscle spasm in various conditions that cause neck pain, including traumatic injuries.', 1, 0),
(24, 'Swollen tonsils', 'Swollen tonsils can accompany a number of different infections of the upper respiratory tract. Some people have larger tonsils than others, and it is possible to have large tonsils without associated symptoms or problems. Tonsillitis refers to inflammation of the tonsils, which typically occurs due to infection. Infection is most commonly due to viruses or bacteria. Tonsillitis is a common illness, especially in children. It is possible to have multiple episodes of tonsillitis throughout life. Tonsillitis is often accompanied by other symptoms, including sore throat, cough, sneezing, enlarged lymph nodes, fever, chills, hoarseness, headache, muscle aches, or fatigue. When the tonsils are infected, they may also appear to be coated with yellowish-white pus.', 1, 0),
(25, 'Shoulder pain', 'Shoulder pain can be a result of injury or disease of the shoulder joint. Injury can affect any of the ligaments, bursae, or tendons surrounding the shoulder joint. Injury can also affect the ligaments, cartilage, menisci (plural for meniscus), and bones of the joint. The design of the shoulder joint is such that it sacrifices stability for mobility. As an extremely mobile joint that plays a central role in the action of a major extremity, the shoulder is at risk for injury. Common injuries of the shoulder can lead to inflammation of the bursae (bursitis) or tendons (tendonitis or tendinitis) and result in a torn rotator cuff with dysfunction, impingement, as well as instability and frozen shoulder. Labral tears can be from torn cartilage. Fracture of the bones of the shoulder (such as from biking falls) can cause intense shoulder pain.Pain can also occur in the shoulder from diseases or conditions that involve the shoulder joint (including arthritis such as osteoarthritis or degenerative arthritis with bone spurs), the soft tissues and bones surrounding the shoulder, or the nerves that supply sensation to the shoulder area. Occasionally, shoulder pain can be a result of a heart attack. It is unusual for cancer to cause shoulder pain.', 1, 0),
(26, 'Toothache', 'The symptoms of toothache include sharp pain or dull pain in or around a tooth. The most common cause of a toothache is a dental cavity as a result of tooth decay. Dental cavities and toothache can be prevented by proper oral hygiene. Another common cause of toothache is gum disease. Toothache can also be a result of an injury or an abscess of the tooth. Toothache symptoms can be caused by a problem that does not originate from a tooth or the jaw. Symptoms of toothache can be mimicked by sinus infection, shingles, and other diseases.', 1, 0),
(27, 'Urine Odor', 'Normal urine is clear and has a straw-yellow color. While the odor of urine can vary somewhat, in most cases, it does not have a strong smell. With dehydration, the urine is more concentrated and may have a stronger ammonia scent than normal. Consumption of certain foods, such as asparagus (which can impart a characteristic odor to urine), and taking some medications may be causes for changes in the odor of urine. The presence of bacteria in the urine, such as with a urinary tract infection (UTI), can affect the appearance and smell of urine. When there is an infection in the urinary tract, the urine may take on a foul-smelling odor as well as appear cloudy or bloody. A burning sensation during urination may be a symptom of a UTI. The urine may also have an abnormally sweet odor in uncontrolled diabetes, and some rare genetic conditions can also cause the urine to have an abnormal or strange odor.', 1, 0);

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
(11, 7, 10, 0, 'Dizziness', '0000-00-00 00:00:00', 0),
(12, 7, 11, 0, 'Dizziness', '0000-00-00 00:00:00', 0),
(13, 6, 0, 7, 'Nausea ', '0000-00-00 00:00:00', 0),
(14, 7, 0, 7, 'Dizziness', '0000-00-00 00:00:00', 0),
(15, 8, 0, 7, 'Blurred Vision', '0000-00-00 00:00:00', 0),
(16, 9, 0, 7, 'Dehydration', '0000-00-00 00:00:00', 0),
(17, 6, 12, 0, 'Nausea ', '0000-00-00 00:00:00', 0),
(18, 7, 12, 0, 'Dizziness', '0000-00-00 00:00:00', 0),
(19, 8, 12, 0, 'Blurred Vision', '0000-00-00 00:00:00', 0),
(20, 9, 12, 0, 'Dehydration', '0000-00-00 00:00:00', 0),
(21, 6, 13, 0, 'Nausea ', '0000-00-00 00:00:00', 0),
(22, 7, 13, 0, 'Dizziness', '0000-00-00 00:00:00', 0),
(23, 8, 13, 0, 'Blurred Vision', '0000-00-00 00:00:00', 0),
(24, 9, 13, 0, 'Dehydration', '0000-00-00 00:00:00', 0),
(25, 5, 14, 0, 'Chest pain', '0000-00-00 00:00:00', 0),
(26, 4, 0, 8, 'Chronic cough', '0000-00-00 00:00:00', 0),
(27, 5, 0, 8, 'Chest pain', '0000-00-00 00:00:00', 0),
(28, 6, 15, 0, 'Nausea ', '0000-00-00 00:00:00', 0),
(29, 7, 15, 0, 'Dizziness', '0000-00-00 00:00:00', 0),
(30, 8, 15, 0, 'Blurred Vision', '0000-00-00 00:00:00', 0),
(31, 9, 15, 0, 'Dehydration', '0000-00-00 00:00:00', 0),
(32, 4, 16, 0, 'Chronic cough', '0000-00-00 00:00:00', 0),
(33, 5, 16, 0, 'Chest pain', '0000-00-00 00:00:00', 0),
(34, 7, 0, 9, 'Dizziness', '0000-00-00 00:00:00', 0),
(35, 13, 0, 10, 'Depression', '0000-00-00 00:00:00', 0),
(36, 9, 0, 11, 'Dehydration', '0000-00-00 00:00:00', 0),
(37, 16, 0, 12, 'Hypertension', '0000-00-00 00:00:00', 0),
(38, 11, 0, 13, 'Fatigue, Loss of appetite, Nausea, Jaundice, Pain', '0000-00-00 00:00:00', 0),
(39, 11, 0, 14, 'Fatigue, Loss of appetite, Nausea, Jaundice, Pain', '0000-00-00 00:00:00', 0),
(40, 6, 0, 15, 'Nausea ', '0000-00-00 00:00:00', 0),
(41, 5, 0, 16, 'Chest pain', '0000-00-00 00:00:00', 0),
(42, 6, 0, 17, 'Nausea ', '0000-00-00 00:00:00', 0),
(43, 16, 0, 18, 'Hypertension', '0000-00-00 00:00:00', 0),
(44, 11, 0, 19, 'Fatigue, Loss of appetite, Nausea, Jaundice, Pain', '0000-00-00 00:00:00', 0),
(45, 27, 0, 20, 'Urine Odor', '0000-00-00 00:00:00', 0),
(46, 27, 0, 21, 'Urine Odor', '0000-00-00 00:00:00', 0),
(47, 27, 0, 22, 'Urine Odor', '0000-00-00 00:00:00', 0),
(48, 27, 0, 23, 'Urine Odor', '0000-00-00 00:00:00', 0),
(49, 27, 0, 24, 'Urine Odor', '0000-00-00 00:00:00', 0),
(50, 27, 0, 25, 'Urine Odor', '0000-00-00 00:00:00', 0),
(51, 27, 0, 26, 'Urine Odor', '0000-00-00 00:00:00', 0),
(52, 19, 17, 0, 'Anemia', '0000-00-00 00:00:00', 0),
(53, 13, 18, 0, 'Depression', '0000-00-00 00:00:00', 0);

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
(2, 3, 'uploads/3-mary-cassandra-molina.jpg', 'patient_picture', '2017-08-16 09:05:37', 1),
(3, 4, 'uploads/4-margaret-sanchez.jpg', 'patient_picture', '2017-08-16 09:14:25', 1),
(4, 5, 'uploads/5-noila-go.jpg', 'patient_picture', '2017-08-16 09:34:58', 1),
(5, 6, 'uploads/6-gemma-cervantes.jpg', 'patient_picture', '2017-08-16 09:46:45', 1),
(6, 7, 'uploads/7-francis-james-flores.jpg', 'patient_picture', '2017-08-16 10:45:27', 1),
(7, 9, 'uploads/9-eli-ayase.jpg', 'patient_picture', '2017-09-07 13:11:29', 1),
(8, 10, 'uploads/10-eli-ayase.jpg', 'patient_picture', '2017-09-07 13:13:58', 0),
(9, 11, 'uploads/11-nozomi-tojou.jpg', 'patient_picture', '2017-09-07 13:16:26', 0),
(10, 12, 'uploads/12-nozomi-tojou.jpg', 'patient_picture', '2017-09-07 13:25:58', 0),
(11, 14, 'uploads/14-11-el-compas-ehr.jpg', 'patient_ehr', '2017-09-11 15:15:24', 0),
(12, 3, 'uploads/3-mary-cassandra-molina.jpg', 'patient_picture', '2017-09-13 12:52:53', 0),
(13, 3, 'uploads/3-13-mary-cassandra-molina-ehr.jpg', 'patient_ehr', '2017-09-13 12:53:09', 0),
(14, 3, 'uploads/3-14-mary-cassandra-molina-ehr.jpg', 'patient_ehr', '2017-09-13 14:11:39', 0),
(15, 3, 'uploads/3-15-mary-cassandra-molina-ehr.jpg', 'patient_ehr', '2017-09-13 14:11:47', 0),
(16, 15, 'uploads/15-rachel-labadia.jpg', 'patient_picture', '2017-09-13 14:17:06', 0),
(17, 3, 'uploads/3-17-mary-cassandra-molina-ehr.jpg', 'patient_ehr', '2017-09-14 15:46:16', 0),
(18, 4, 'uploads/4-margaret-sanchez.jpg', 'patient_picture', '2017-10-07 18:09:57', 0),
(19, 5, 'uploads/5-noila-sy.jpg', 'patient_picture', '2017-10-07 18:11:04', 0),
(20, 6, 'uploads/6-gemma-cervantes.jpg', 'patient_picture', '2017-10-07 18:11:58', 0),
(21, 7, 'uploads/7-francis-james-flores.jpg', 'patient_picture', '2017-10-07 18:12:19', 0),
(22, 9, 'uploads/9-eli-ayase.jpg', 'patient_picture', '2017-10-07 18:13:54', 0),
(23, 13, 'uploads/13-nozomi-tojou.jpg', 'patient_picture', '2017-10-07 18:14:39', 0),
(24, 14, 'uploads/14-el-compas.jpg', 'patient_picture', '2017-10-07 18:15:42', 0),
(25, 16, 'uploads/16-lina-chang.jpg', 'patient_picture', '2017-10-07 18:30:06', 1),
(26, 16, 'uploads/16-lina-chang.jpg', 'patient_picture', '2017-10-07 18:30:58', 0);

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
('2017-09-07T15:43:25+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-12T06:10:44+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-12T11:15:57+08:00', 'create login', '', 'NURSE3', '127.0.0.1'),
('2017-09-12T11:16:20+08:00', 'auth-success', '', 'admin', '127.0.0.1'),
('2017-09-13T02:50:03+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-14T03:45:05+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-14T04:54:25+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-15T02:54:03+08:00', 'auth-success', '', 'admin2', '127.0.0.1'),
('2017-09-15T03:51:24+08:00', 'auth-success', '', 'admin', '127.0.0.1'),
('2017-09-15T11:07:07+08:00', 'auth-fail', '', 'password', '127.0.0.1'),
('2017-09-15T11:07:32+08:00', 'auth-success', '', 'admin', '127.0.0.1'),
('2017-09-20T12:27:52+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-21T12:05:38+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-21T12:15:45+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-21T12:20:37+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-21T12:22:41+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-25T13:29:09+08:00', 'auth-fail', '', 'admin', '::1'),
('2017-09-25T13:29:27+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-26T03:40:22+08:00', 'auth-success', '', 'admin', '::1'),
('2017-09-26T03:42:21+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-05T01:19:00+08:00', 'auth-fail', '', 'admin', '::1'),
('2017-10-05T01:19:10+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-05T01:45:41+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-05T13:24:43+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-05T13:27:58+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-06T01:33:07+08:00', 'auth-fail', '', 'admin', '::1'),
('2017-10-06T01:33:26+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-06T03:35:35+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-06T09:19:06+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-07T04:30:22+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-08T08:32:01+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-09T10:05:25+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-14T00:43:02+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-14T01:28:48+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-14T02:32:15+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-14T03:06:29+08:00', 'auth-success', '', 'admin', '::1'),
('2017-10-15T13:57:41+08:00', 'auth-success', '', 'admin', '192.168.1.6');

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
(1, 'admin', '$2a$11$UUGKpE59qycoIck5hXdYueUj.sv5JdMijfB5BHTH.GX1xk463I66O', '2017-08-12T13:53:54+08:00', '2017-10-15T13:57:41+08:00', '1017-08-12T13:53:54+08:00'),
(2, 'admin1', '$2a$11$nWQo6OZKU58BQhnE9SZZY.V6bThC9.r62VvdembeMrSOwg9GKa8zy', '2017-08-12T13:55:46+08:00', '2017-08-12T13:55:46+08:00', '1017-08-12T13:55:46+08:00'),
(3, 'admin2', '$2a$11$zZsXm4h9zu6hScdmL01qCu.wcJ0IW7Ke4HPEZ0HQEdkzBJY3.DRq6', '2017-08-12T13:56:09+08:00', '2017-09-15T02:54:03+08:00', '1017-08-12T13:56:09+08:00'),
(4, 'NURSE1', '$2a$11$tu/n.ir6qKl8u4kOdVN6YeK3MR70NZfD3Ppd7fuTQOAOWYUOEHp2C', '2017-08-16T23:48:02+08:00', '2017-09-04T02:14:38+08:00', '1017-08-16T23:48:02+08:00'),
(5, 'NURSE3', '$2a$11$pCG5toF5BlQ4abQEvBn5keRAaathDq6jYGNskGXuSp5p1GNtU/JXi', '2017-09-12T11:15:57+08:00', '2017-09-12T11:15:57+08:00', '1017-09-12T11:15:57+08:00');

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
('0mag2rakqfgk1cqmmcrqh3v8o2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373834373733383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264333161653061373238303166393261373064343538366361396136303734666164643732653230323362636131626331323030323561666231383462626136223b733a363a22657870697265223b733a32353a22323031372d31302d31335430303a33353a33382b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T00:39:38+02:00', '1017-10-13T06:15:38+08:00'),
('0r5rmpnelbimjs3t83vri5btk3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931353936333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236356363356434623863356539666231383030303232393761666335666432333734316630303930363733646466386464356337623139643739386430323562223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33323a34332b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T19:36:43+02:00', '1017-10-14T01:12:43+08:00'),
('165pge24rp2ho12nqckp1mgi04', '', '2017-10-13T21:30:23+02:00', '1017-10-13T21:06:23+01:00'),
('1go33suih99oeh9m1k2fddhgb7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235633161303939613635383433656261643732346635306261306233613931663232386430306232303961313464376233306663333861356131356534386535223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32382b30323a3030223b7d7d, '2017-10-13T21:14:28+02:00', '1017-10-14T02:50:28+08:00'),
('1mntk24huahu5chem1qv4d1hf3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230363939363536643065363733333632353536353330356634303264336634393436336634666337653364353965396535323366653337653464633566383565223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35372b30323a3030223b7d7d, '2017-10-13T20:03:57+02:00', '1017-10-14T01:39:57+08:00'),
('1nf1f6qldn262s3hh6s9useee0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034383431333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231343166373764306265393062623733343563306661333265383864316561323635643065393733326163643432303138326230623037393261646535643735223b733a363a22657870697265223b733a32353a22323031372d31302d31355430383a32303a31332b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-15T08:24:13+02:00', '1017-10-15T14:00:13+08:00'),
('1ntel476l49n5auc90gs0scqe7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231356439323264653964323762343334353164616665386439613131363131346230663637623831323434653830373864656264303962376434663633656633223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34332b30323a3030223b7d7d, '2017-10-09T05:39:43+02:00', '1017-10-09T11:15:44+08:00'),
('1osa1utt78kmhsdfpjr7veitm6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373730383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236303534303035633265336363316630376662633233663537643164393663653037373134626535356263356663316434396431656538326263643631643236223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30313a34382b30323a3030223b7d7d, '2017-10-13T20:05:48+02:00', '1017-10-14T01:41:48+08:00'),
('28e4ou2aqnu1huebqhca654ig0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931353936333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236363038393736316266343762333136383839313936343563623965383265646633643630326635636630663265636434613532336235366533396339613662223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33323a34332b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T19:36:43+02:00', '1017-10-14T01:12:44+08:00'),
('2be4ttfeouqkcg0flbo56t8vc1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931383637363b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266323439313865373961303564306133363432383365663831383264373564393336316463636237653438366631643833343733666264356565613462383366223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a31373a35362b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2236393465306661353765653533646535333166393536323434326463313530633233313566373362376138356665303261626138386131313736633962356266223b733a363a22657870697265223b733a32353a22323031372d31302d31345430323a31323a35362b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-10-13T20:21:56+02:00', '1017-10-14T01:57:56+08:00'),
('2g4h0fegu80su26t20j52tb0q3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263646431393634336135353237343762326232656539363732356333636537323133323338343430643630626463373735333133613832393638633965653735223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34342b30323a3030223b7d7d, '2017-10-09T05:39:44+02:00', '1017-10-09T11:15:45+08:00'),
('2h5k3nuo02od4u5bigkkpbtde3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237656534663732646366353236643730373435613435626238653166613934306564313735346137643462613034373463396637303065663435346461656163223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('2hc6kcku68ni611j0o9dp05o15', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237316632373533643235653339326165643437643462613036623830383761313964393730363439653362663834343537613163653138613535373662613936223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('2vkro0o908673iidjd2o6vp361', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373837313534313b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230616664386439363436393466653135373637353839353030323431363464343136656663386565346362373438613734353364366164303930646464643965223b733a363a22657870697265223b733a32353a22323031372d31302d31335430373a31323a32312b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2232343062373437363434383964613535663438373339383038616163623534313832653133623734616339363363313030373539386434643161366166323830223b733a363a22657870697265223b733a32353a22323031372d31302d31335431333a30373a32312b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-10-13T07:16:21+02:00', '1017-10-13T12:52:21+08:00'),
('3eodlqtkn0u1ua4u0md58kibm4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264353865373739646332376438613264613832386664623739326263343031363437643639323663656266306232613561393237363931333436353330303561223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34342b30323a3030223b7d7d, '2017-10-09T05:39:44+02:00', '1017-10-09T11:15:44+08:00'),
('3lfs76kcolmg97nc2mbc4folv1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230656434616263323835643961336532646431623063353433383134393035613431363933306463326338333530316265353933383031326663626338656265223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35342b30323a3030223b7d7d, '2017-10-13T21:29:54+02:00', '1017-10-14T03:05:54+08:00'),
('3lq9d1ccugt7l4nppr51s1sb50', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262353931623239383131633837663631393563363838626365623532363437393533623931343364313836326166646362356638353064326462626435633831223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34352b30323a3030223b7d7d, '2017-10-09T05:39:45+02:00', '1017-10-09T11:15:45+08:00'),
('3uhbt3vdc6pjk151qvkm9j5dg4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232376562613132333739323861373462396263386365373038363961303836366531626261373437363832343431393939333630616634353730633932666533223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('3v0lgrfjpn83hpi4fpv3nsief2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235316336303536396133326561333236326636336230333932373863333634613538633862313233356665633964363738353436303138613633663163386536223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34342b30323a3030223b7d7d, '2017-10-13T20:04:43+02:00', '1017-10-14T01:40:44+08:00'),
('3vbrdg6r4pevbtpoj2ecff0gv0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230306338393739643239653739383635313162353437646333323766326335653938306235666637373266646439313364313134666138613336303039363864223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32362b30323a3030223b7d7d, '2017-10-13T21:14:26+02:00', '1017-10-14T02:50:26+08:00'),
('440kc9a2coj810rlid07did852', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262323735376432623034393832646134393561666361346363353966323638323966383838323363633238356266303232386462636539323137653437363130223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34372b30323a3030223b7d7d, '2017-10-09T05:39:46+02:00', '1017-10-09T11:15:47+08:00'),
('4flmp9qr6s2ugfrqq85p0m5ft7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237613261336634633335353931646538633665363937353765626238386331333538636265623738333335323361366538313133326637343931333631366532223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:45+02:00', '1017-10-14T01:40:45+08:00'),
('4kvct0ch0n2pdh2jn2nqub5043', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264623236396433313539646138643862636561356134343561333937393365643439656337343634613065636534396233316434353832366565373065346539223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35382b30323a3030223b7d7d, '2017-10-13T20:03:58+02:00', '1017-10-14T01:39:58+08:00'),
('5076jpocgcorjl4r5pdiq4k1g6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261343231643633663164303830646539623632323931643633356631633134343432303838343965393163663662613131323839666530643165613964373438223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32392b30323a3030223b7d7d, '2017-10-13T21:14:29+02:00', '1017-10-14T02:50:30+08:00'),
('5anou8aup2gnj9iou12a47f4p0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931353936333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231383036393337346531393935393830626432303834643538626136323166373539623165626561313333626366396134313734333961663734313238633034223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33323a34332b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T19:36:43+02:00', '1017-10-14T01:12:43+08:00'),
('5bobldr1lg623r0chh7sstk144', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233376466326233313932396662656663363439636333653230653732336633666633643633353732333837663439323632393232356563346533313963316138223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33312b30323a3030223b7d7d, '2017-10-13T21:14:31+02:00', '1017-10-14T02:50:31+08:00'),
('5if55rejlaiukubkc56ij0ho66', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230646637313635333637323739636330646433306539363161303162653239343562316230343563646538623939646439663831353264613862616530663566223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35392b30323a3030223b7d7d, '2017-10-13T21:29:58+02:00', '1017-10-14T03:05:59+08:00'),
('5sl7m2c7tfhove714013k0im81', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373637323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231616262623161626335333565626561343634643463356661643331373438333936653137353439656161313065353232343734636561363061376566616365223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30313a31322b30323a3030223b7d7d, '2017-10-13T20:05:12+02:00', '1017-10-14T01:41:13+08:00'),
('5usdmj0muude5jk95ehpfd5216', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262396139396531356338656137623161373265633232366339346233326436326562633033623961373564323735653833613162353962343530303830303839223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33322b30323a3030223b7d7d, '2017-10-13T21:14:32+02:00', '1017-10-14T02:50:32+08:00'),
('6i44rdejtq34h4u8get97f47q2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230363631646235356130656563646465393566636664386166363330396130623437353533363934326233333963336535323833373839353234626439343733223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35392b30323a3030223b7d7d, '2017-10-13T20:03:59+02:00', '1017-10-14T01:39:59+08:00'),
('6q6nuspmsuvmgh34km3e37us61', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231303934383162666365346332623764313061386137346666656166383531643533353431323263303861303464343133356631356162373166366663383437223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35372b30323a3030223b7d7d, '2017-10-13T21:29:57+02:00', '1017-10-14T03:05:57+08:00'),
('6qoqv1su531rrtja2hl3782f83', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238653561356663313665356463333935306538623636343938636335303762303838316633396462356636623436326434316264393336383662663865316564223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35392b30323a3030223b7d7d, '2017-10-13T20:03:59+02:00', '1017-10-14T01:39:59+08:00'),
('72vgp5j501ulk4kg79foda3sk4', '', '2017-10-13T21:14:55+02:00', '1017-10-13T20:50:55+01:00'),
('75otd697prod208ccmjh8cih51', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231326633393866663963386164396632386166613739366664373563346130633034343836313964396239386561393938343764613930363363663736326261223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35362b30323a3030223b7d7d, '2017-10-13T21:29:56+02:00', '1017-10-14T03:05:56+08:00'),
('7dfb6cbvs1n9dhdn3562544ts5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232663662326666393234346463653430386562323866663862393534303238626663383266643234373364653866613933623635363365353838633138623734223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34342b30323a3030223b7d7d, '2017-10-13T20:04:44+02:00', '1017-10-14T01:40:44+08:00'),
('7o7mp8ttdj6h5sbqj5o3e6eof3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373533333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231313234306566373561306437323534393039323963336664393934383162353038656365633730643663303539626163393736633964316531646464313463223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35383a35332b30323a3030223b7d7d, '2017-10-13T20:02:53+02:00', '1017-10-14T01:38:53+08:00'),
('811kv5h5en1fm6psd4bvggf5r2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239393661633864643263393932326262663765356234353530613430356665303937393339323761663737656164343231326233386133616436353639643661223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32372b30323a3030223b7d7d, '2017-10-13T21:14:27+02:00', '1017-10-14T02:50:27+08:00'),
('8d7d8i98ssq76pmvruf9ttas44', '', '2017-10-13T20:04:06+02:00', '1017-10-13T19:40:06+01:00'),
('8e59bbuld511thdtnu3b7gnd05', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373534343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237313963643962373364636161356433343762616639633136383361323932323939373861366139643763636163303261656364376263326237646538373132223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a30342b30323a3030223b7d7d, '2017-10-13T20:03:03+02:00', '1017-10-14T01:39:04+08:00'),
('8sqvtrj2pvcie3gv2l0b7hdq06', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236373437626238613036363261323062663265353834626139303538643661393338313738376135306430666166356262393039356133353538333132313462223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35352b30323a3030223b7d7d, '2017-10-13T21:29:55+02:00', '1017-10-14T03:05:55+08:00'),
('94351to2lkvmci4o8unjfu3004', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239643861343431336535636631346336666533343538393939646430333632633336613464356261303633376634663736643363313365363438336633373364223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:45+02:00', '1017-10-14T01:40:45+08:00'),
('965q3vnep3o6qgh9jdku46ibo7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236383435323765643165373561323934363334633137336537396364336363386363373066646530313731343436393465633632366264383066373035363037223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32372b30323a3030223b7d7d, '2017-10-13T21:14:27+02:00', '1017-10-14T02:50:27+08:00'),
('98oiqi6676jc6tf1oauvuakot1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263383262616132636263316439626539316336383438613061333030313633346463363036666130373462353766303234343438643133636535393466653766223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33312b30323a3030223b7d7d, '2017-10-13T21:14:31+02:00', '1017-10-14T02:50:31+08:00'),
('9ala82eq3muc76j5ttndl4djo2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235393038326137633232386262383339383339386133306665343437366165666534376438386335616133313632303235396266656536656633666139306134223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35362b30323a3030223b7d7d, '2017-10-13T21:29:56+02:00', '1017-10-14T03:05:56+08:00'),
('9auncdl3fijbkjqddiufavg3l6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262656336613338333863653238333038323436336235623431616261376266376464663562376263306161373532313265366237313833333333373631323035223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35392b30323a3030223b7d7d, '2017-10-13T20:03:59+02:00', '1017-10-14T01:39:59+08:00'),
('9iou396fm98tciqiposm44o765', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234353764343333663835663232616664336263633563396634303633653861633061393865623161306266396264616135393731306263363366353530643633223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33322b30323a3030223b7d7d, '2017-10-13T21:14:32+02:00', '1017-10-14T02:50:32+08:00'),
('9vbo0u8futbptu90qd8encab45', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239343237666336613430373562396237626362356234396366353563303136333564363465356238353132303932623830313835353961393465306537303432223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32392b30323a3030223b7d7d, '2017-10-13T21:14:29+02:00', '1017-10-14T02:50:29+08:00'),
('b2ev0mosvlfbpt8cpn8ecmvni5', '', '2017-10-09T20:03:06+02:00', '1017-10-09T19:39:06+01:00'),
('bhd8ipbepkr0tbvdcij79nopb3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262303838646462306236646437323761663839316634366365323030303032363130306239396436643034323430663663313764663833323234623765616363223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('bomvumq43c693bhfsf8tampqn3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238343364633437623038656437373138343561303237366461303261303462623839383664633264383937623235633032663433636331373939343365383937223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35362b30323a3030223b7d7d, '2017-10-13T20:03:56+02:00', '1017-10-14T01:39:56+08:00'),
('bvodr68pt5h8oelgucf120ta97', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232653035343262623436653638343838363866643632323730656434393564303664306166633730376630323863363864373261323762303035626135313239223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35382b30323a3030223b7d7d, '2017-10-13T20:03:58+02:00', '1017-10-14T01:39:58+08:00'),
('c4q3ak40c9h150rmkf103kdg12', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231383162353964636635343262373664396662303364363435373935656330373762613930326132306365616331346465653433346661373032623231313432223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33302b30323a3030223b7d7d, '2017-10-13T21:14:30+02:00', '1017-10-14T02:50:30+08:00'),
('cm9eu3s1kapa9hnb5aee21oek3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232376434623634336333643862616663363165353438613036393766633639363132373533613731343234373762663431353262653962333432656236623436223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('cpavtu0v704haq0smtqt4pfk83', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231646564633361383032363032373334653131366434636566353165623932366466393635356666653437633131303936306137363962336533356330663835223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34362b30323a3030223b7d7d, '2017-10-13T20:04:46+02:00', '1017-10-14T01:40:46+08:00'),
('d9iumni8far3esbcmjpp20p7e5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230346633636435386538623864306131353638366264313731626265303730666339306437646235333438313834646461353534313564383730383065346461223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34332b30323a3030223b7d7d, '2017-10-09T05:39:43+02:00', '1017-10-09T11:15:43+08:00'),
('dqlubjmcr7f0dhisa79a8u9up7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239646132326262363465646666303761336461613938323634653562656364323832623032343565303938663265663435633832396463653732356534613438223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35322b30323a3030223b7d7d, '2017-10-13T21:29:52+02:00', '1017-10-14T03:05:52+08:00'),
('e2c0r45bv9b12s0kj8j50mgtr4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237353064376165303338303335303135623735333137313531643865343163383964303132646163653233363036313362303633353638636161663130376566223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('e64qe9rhf3d5dflnim8udgtuf5', '', '2017-10-13T20:03:34+02:00', '1017-10-13T19:39:34+01:00');
INSERT INTO `ul_sessions` (`id`, `data`, `session_expires`, `lock_expires`) VALUES
('ee1nv0h8oubfuoqus511b8gll4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235323764373233323462333764373232666536646431613438366462636138326331623234303166383231366561376663613336623665636439643637386363223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('enaa4ebubgg1672tg79foq5962', '', '2017-10-13T20:06:18+02:00', '1017-10-13T19:42:18+01:00'),
('f5d8lvr3d5uhopgp0vk7ui2nb1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263343533666134613331356564343231633732656335643165636238336335303366303663616336323035393132646366383466376336313135656334373262223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35342b30323a3030223b7d7d, '2017-10-13T21:29:54+02:00', '1017-10-14T03:05:54+08:00'),
('f7ecuuqvvnc2dm6m5jeucvmdl1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233663932313737653861383737316630393333653031383630626138633564353466316565396534343836613864383265376363336434653632383065376336223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35332b30323a3030223b7d7d, '2017-10-13T21:29:53+02:00', '1017-10-14T03:05:53+08:00'),
('f7or07hov7j27qb1n3uvj26fb4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931353936323b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233303235383962373166646630623535303862646462333733626638626430313736373831363063346335643933386363333335353836393463613465656364223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33323a34322b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T19:36:42+02:00', '1017-10-14T01:12:42+08:00'),
('fqpinftrkiliorul8csp0e3ej7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231306562653764323762356534333032396565666461663130636336313731363034346362306366353636363637356436336564313731373239346264646362223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32352b30323a3030223b7d7d, '2017-10-13T21:14:25+02:00', '1017-10-14T02:50:25+08:00'),
('ft8035ncrc62qmc3d1bu6vi7e3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234353838303635333935333663363464336231343339643330346230313963326264376437386336613161663734653364383737663432346139396437383838223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32382b30323a3030223b7d7d, '2017-10-13T21:14:28+02:00', '1017-10-14T02:50:28+08:00'),
('g5ericrejf6e6tt8qnf973mm45', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262336239383761636433666462623031313663323532623661393333313633336236663133653736396130323162323063383666316532353231636165343261223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('g6t0va11gvjrmhu8lleh7eslb6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234623635383536333535353238613361653836623335376162636264333864663632306462653362313164346565353663393565613938333534633733363333223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:45+02:00', '1017-10-14T01:40:45+08:00'),
('gb46i8n97c52arivsekl6vhol2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234646166623162373438326137663936343835313736393165373538623837373430343065653433333538396338646133643734633738316166653834346537223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('gbv7b3dqd0623c19hqklh4ho83', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373433303531393b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263333264626262613635313033363938346634613939393737306161643065383039663730623232626636633761663237383835303031623466643463633662223b733a363a22657870697265223b733a32353a22323031372d31302d30385430343a34313a35392b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2235306537383730333836633763383864343062616138346465313265643239386665353363386662316462663535333838386437643563616164633332383039223b733a363a22657870697265223b733a32353a22323031372d31302d30385431303a33363a35392b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-10-08T04:45:59+02:00', '1017-10-08T10:21:59+08:00'),
('hdg5c9k14bf2m63btueeq91cv1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233323962613437646564303332346565383162643430306563653930343830383339306661613862383761393134653861366638386436353461663630363834223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34362b30323a3030223b7d7d, '2017-10-13T20:04:46+02:00', '1017-10-14T01:40:46+08:00'),
('hq3b1vkoi0nh1au114kuf8kes1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2261303130356334353331303437616662626633303536386263366435613739333136333034623461343264623630623831386362633863326132323031643538223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('idrjs1dbd9f23dle2g9ijgjek0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313833313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237343436383137393161636632326635333136643933636631373136396164643165653835653437353234383564626337663737626466626136343138353531223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a33312b30323a3030223b7d7d, '2017-10-13T21:14:31+02:00', '1017-10-14T02:50:31+08:00'),
('ie14di08e5iln9330ian443io3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931363236383b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235343634623536656162346632343761653131653738303337353861666564633763326334323630313431613036343135353631336666366566316664393365223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33373a34382b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2266383637376435663839316561636566636365346635333865356464343138393739393432363234666239373838363333373561623534393531616136356666223b733a363a22657870697265223b733a32353a22323031372d31302d31345430313a33323a34382b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-10-13T19:41:48+02:00', '1017-10-14T01:17:48+08:00'),
('iube99fqdne3e1uofma7lsvp77', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237323133336165383864633132316664306166653736356630373166366164333236306134353934663864323063653233306533323731383435316465303534223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('j7g7e1klv1t66d2gb73e2jqs24', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373539393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266306637646366623237373661626461343936366364356437626231343231333436326233353436633262633839616436303430386233303663613766323033223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a35392b30323a3030223b7d7d, '2017-10-13T20:03:59+02:00', '1017-10-14T01:39:59+08:00'),
('jd8eic7rnf55do5aattl7al1l6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233343364376565633661646134323930643264626338383335623430646136633962356435636132343130316661393137386263383963633836343664323934223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('jkgte81hmm3bklqi7j8a5v50v0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236663037373365376534653332623433646233353265303838383961356566363637613433383264396439636462666133653930333463333138346561616239223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34362b30323a3030223b7d7d, '2017-10-13T20:04:46+02:00', '1017-10-14T01:40:46+08:00'),
('jvtkn7gjhuvvda7smvoqj6hh22', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237366335616335613537313637353136656332383432396364306138613737363834346331326234393730613665616563356363623163363861613561633233223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('k5ea4bick0fr3vj8ubpq416043', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323736313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236646366313232393230366236326536383032396137393434333166306534613766306564306138656230663534363635316637383333373965313434623862223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32363a30312b30323a3030223b7d7d, '2017-10-13T21:30:01+02:00', '1017-10-14T03:06:01+08:00'),
('l2suu1jrmiho90bpbq2b9gejt5', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262633763353362303639323735613435626335346662333536653664616633373338646363303635623636656133636664346261383531376339373362396363223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35372b30323a3030223b7d7d, '2017-10-13T21:29:57+02:00', '1017-10-14T03:05:57+08:00'),
('lkct4m29i8h63ncpldl7i1fjo2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235323765623364646162316434343465626532373538343963386432303136373537316266666465313962386534316634623134366537363634643938386437223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32362b30323a3030223b7d7d, '2017-10-13T21:14:26+02:00', '1017-10-14T02:50:26+08:00'),
('ls0kvq5p43gj5j7gi3rq3ma272', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234393933623430643635646432653638666435633964346138393664306638306635616466343264616663366631656434613265623636616664363733366264223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('m0qlfectd8r4c92561itha4t40', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2238376334643331346464386236343964343164623137626237393039323862393331653363303830373331396564313632366565383932333262393833323664223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34342b30323a3030223b7d7d, '2017-10-13T20:04:44+02:00', '1017-10-14T01:40:44+08:00'),
('m66ca9id5hrt3eg1a7u81ld353', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373537363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263356239376161666266303864656530336539346130356638633835353934616237643434333637623962653036396135666566623761396436613139653338223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a35393a33362b30323a3030223b7d7d, '2017-10-13T20:03:36+02:00', '1017-10-14T01:39:36+08:00'),
('mb8nmtfhmedev5v1rus4a5a1o0', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264636461303063643839306430326433303330623832613836303564633338313430383838383534353662326437363434393664376162656632353866326531223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34362b30323a3030223b7d7d, '2017-10-13T20:04:46+02:00', '1017-10-14T01:40:46+08:00'),
('mept8k3pn75fmorrlm65jsnb26', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234323637393666633635353630656332323835323130313465343034363436356235353461333031326434363634383864303761643836623164353631666131223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('mfeajiu740ql33cbcj7ii193d4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a31313a223139322e3136382e312e36223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3132383a224d6f7a696c6c612f352e302028695061643b20435055204f532031315f305f32206c696b65204d6163204f53205829204170706c655765624b69742f3630342e312e333820284b48544d4c2c206c696b65204765636b6f292056657273696f6e2f31312e30204d6f62696c652f313541343231205361666172692f3630342e31223b733a373a2245585049524553223b693a313530383034383331333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266653366333638383763353730663638383635663761623266343866646363333663316531323632343136323538343936396130343636393438623230326366223b733a363a22657870697265223b733a32353a22323031372d31302d31355430383a31383a33332b30323a3030223b7d7d69734c6f67676564496e7c623a313b61707052656d656d6265724d655265717565737465647c623a313b, '2017-10-15T08:22:33+02:00', '1017-10-15T13:58:33+08:00'),
('mgfoc1k1h91gml6hcn8gteg094', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373630333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237393237356536653437666266333763653831313031396435303331623038363439323831376162643433636165323562636630396161393539376537616362223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a30332b30323a3030223b7d7d, '2017-10-13T20:04:03+02:00', '1017-10-14T01:40:03+08:00'),
('mk7fnnfnmi319020be0fs74co2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323736303b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237366134633235363139316537386635653238336162353837666535353538656166313336633666613963373236313930373836613236346336646631353434223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32363a30302b30323a3030223b7d7d, '2017-10-13T21:30:00+02:00', '1017-10-14T03:06:00+08:00'),
('ohn0rsmqg185r6ag9kjjisdrl6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237383032656636643465356338393865353737656439333332373764353334623632363538326363613361613062383534366436376631343839373234303639223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32352b30323a3030223b7d7d, '2017-10-13T21:14:25+02:00', '1017-10-14T02:50:26+08:00'),
('oku9tv7slqt239tll87b8vhep2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264616536373338623161383534343533663561316439666533633466376133303635653033396436333332343034383466353239613761336365383562623362223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34342b30323a3030223b7d7d, '2017-10-09T05:39:44+02:00', '1017-10-09T11:15:44+08:00'),
('ols3m7rrnom7oeuqq4rsjr0h26', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263613134633239396639663234356134653430333564666436313032656661363133336134336431646138393562373638383262643161333161303038613761223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35352b30323a3030223b7d7d, '2017-10-13T21:29:55+02:00', '1017-10-14T03:05:55+08:00'),
('onsrt4skvob8ne6gc0vsuc3kj4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231316532393762666237663865373536343237333331643361633436613266333065396131366436633561653736313337323230643233386432306137623430223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34372b30323a3030223b7d7d, '2017-10-09T05:39:47+02:00', '1017-10-09T11:15:47+08:00'),
('osikbb4si9eonurhdo77c5lap7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239633562313662626133313937613832363334643530366330353461373036393066303334323061363638386137313138386366393433346561363265366435223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35332b30323a3030223b7d7d, '2017-10-13T21:29:53+02:00', '1017-10-14T03:05:53+08:00'),
('p07qdn0eajpq8t65lc1gtm9dv3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931353935393b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230653963613637666163383932656265656236333830636364626136323731636532643964383031386430393130343632303638356532373862626536306434223b733a363a22657870697265223b733a32353a22323031372d31302d31335431393a33323a33392b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T19:36:39+02:00', '1017-10-14T01:12:39+08:00'),
('ptlfvrnbro71l7a3pn1rbrm0k6', '', '2017-10-13T20:03:22+02:00', '1017-10-13T19:39:23+01:00'),
('q09ic68teqjhdgk7st6b5guho1', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239623761623734333962363037656261373933623061363433633031346638616539386663663366643363323964336264663638616165363934376461376330223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34362b30323a3030223b7d7d, '2017-10-09T05:39:46+02:00', '1017-10-09T11:15:46+08:00'),
('q0n6uesijlfohbsl25cp6q7qr4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373730373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236616235666633313330306162383065626338343230326561373830303536343238613163613664386437366336313839393330303832643131643034656434223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30313a34372b30323a3030223b7d7d, '2017-10-13T20:05:47+02:00', '1017-10-14T01:41:47+08:00'),
('q2ojrl1uo23au00uvl3nkr1an6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932333238383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239393934363731616339656365653131336136383738396562613130333331373165303239313665623565633666316262313165663163323233333261363434223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a33343a34382b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T21:38:48+02:00', '1017-10-14T03:14:48+08:00'),
('qennjlaej6vp4tbkejia1ggbi7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239356231313264356465623538663035313430353838373633663938373139376266626562313262383135656138643835343535373064653662303438353437223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34352b30323a3030223b7d7d, '2017-10-09T05:39:45+02:00', '1017-10-09T11:15:45+08:00'),
('qne0lrcd35updehn7ubdit2f05', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2239363936653433353431356461356333613665373430313331643566366461303663666463663433393631323166626134353737323134636166323634323839223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35362b30323a3030223b7d7d, '2017-10-13T21:29:56+02:00', '1017-10-14T03:05:56+08:00'),
('qr8nk21sa08pd69sm915tnc2q7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2236343737336165396538646631626237383134623264616532613534343333303238656437346664326332653430346632373632663531626537306431326564223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34332b30323a3030223b7d7d, '2017-10-09T05:39:43+02:00', '1017-10-09T11:15:43+08:00'),
('qvoprlt8c1jjuf9pm3f09ost01', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373730373b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2263636537363564353332333466656137333365323338363232303365653266643363623931396534643661333962653431356666393039346139346465663431223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30313a34372b30323a3030223b7d7d, '2017-10-13T20:05:47+02:00', '1017-10-14T01:41:47+08:00'),
('r1hn6112d4qk74h71ee8r416g2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264383964623363363533356264376338326562663133323730313064323133376438636161316163373438353033383636363066333163343530323164333534223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:45+02:00', '1017-10-14T01:40:45+08:00'),
('r61vj6391u80eee8qikmghno27', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323736313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2237353564313334356663643233333235346364363739303139323435316439336637313939303331653663646364636262356232333334383038643538343737223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32363a30312b30323a3030223b7d7d, '2017-10-13T21:30:01+02:00', '1017-10-14T03:06:01+08:00'),
('rrgqohj63cpiiufc5lv4o75861', '', '2017-10-13T19:37:09+02:00', '1017-10-13T19:13:09+01:00'),
('scr2e9225bpi9d5jjv4ffp30g6', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231363465613638393336313239353964316466343235653261393463623830616537643336616137643134653236353539383761373862643838326461646436223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34362b30323a3030223b7d7d, '2017-10-09T05:39:45+02:00', '1017-10-09T11:15:46+08:00'),
('sqbqee2kkqm2ao5jacciid9vi4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2231303832383065646333636332346330373965643931373364366639666339633766316664343565656263376437323261643530353633366634386138393562223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35352b30323a3030223b7d7d, '2017-10-13T21:29:55+02:00', '1017-10-14T03:05:55+08:00'),
('srv4uhfa6lj1v91bhl4i739df7', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2232313065313861333265366662303964343437303766326664646163353961336232373031656332623864623863306531626166396634316666616131313534223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:45+02:00', '1017-10-14T01:40:46+08:00'),
('t0e9fh72fimnidh0gug4hfjka4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131333a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f35362e302e323932342e3837205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373532303134373b7d756c4e6f6e6365737c613a323a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2266393932653562356233373937336666376230623830623136613464303238356636336137333035393965633334306163626163336463323039626138623834223b733a363a22657870697265223b733a32353a22323031372d31302d30395430353a33353a34372b30323a3030223b7d733a353a226c6f67696e223b613a323a7b733a343a22636f6465223b733a36343a2264366531306562616636646261643837396534643539623566353064626638386533626261356133623464306366663930663862323437366432633131646461223b733a363a22657870697265223b733a32353a22323031372d31302d30395431313a33303a34372b30383a3030223b7d7d69734c6f67676564496e7c623a303b, '2017-10-09T05:39:47+02:00', '1017-10-09T11:15:47+08:00'),
('t229p9a6t4tpvkaj9s8dsgr3g3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262386331646461363465306630313038643833646136326435626533363438623366353539353166396261613065613234623233353236316364656465346164223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35342b30323a3030223b7d7d, '2017-10-13T21:29:54+02:00', '1017-10-14T03:05:54+08:00'),
('t9oermbsqjv665r5k3ugm9s510', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2235333234636661356137343763313933616139643163636235666362323530626232626630393163333433376431353831393030623235306334626237613265223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32352b30323a3030223b7d7d, '2017-10-13T21:14:24+02:00', '1017-10-14T02:50:25+08:00'),
('tecsiffmgvu948t8u19mef2m97', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634353b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230616139313666653731343063343831363931333866613839306466323634623937366532343137336466633638316232303830343637616435666666633833223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34352b30323a3030223b7d7d, '2017-10-13T20:04:44+02:00', '1017-10-14T01:40:45+08:00'),
('u3m1eja4hqmm0vt16qa73bvg50', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a303a22223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373834373833313b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264656362393637326239363038376362626364373261336164323666316236656662316532306439343533313139613335333463643466383165386535633230223b733a363a22657870697265223b733a32353a22323031372d31302d31335430303a33373a31312b30323a3030223b7d7d69734c6f67676564496e7c623a313b, '2017-10-13T00:41:11+02:00', '1017-10-13T06:17:11+08:00');
INSERT INTO `ul_sessions` (`id`, `data`, `session_expires`, `lock_expires`) VALUES
('u4t8vkc27er6sus6shje1t4nj3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634363b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2234633534323439313039663835373466393230633362656462653430636164643861336138383537313264383363376234346439386334343362313265396263223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34362b30323a3030223b7d7d, '2017-10-13T20:04:46+02:00', '1017-10-14T01:40:47+08:00'),
('uc31rov4sk4nl70obhdouehnn3', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2230656461633237363031633366623966353663623461663136343339303635343761323437356535323231393832616337386361336162363237656431613637223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('vgc6qgpi6ufdrih4m393ncjn86', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3132313a224d6f7a696c6c612f352e3020284d6163696e746f73683b20496e74656c204d6163204f5320582031305f31325f3629204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530383034363634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2233383463613737646261353930663539366630333934393433663636653366383330623763363233616565616238636632313237613966383763643462616365223b733a363a22657870697265223b733a32353a22323031372d31302d31355430373a35303a34342b30323a3030223b7d7d, '2017-10-15T07:54:44+02:00', '1017-10-15T13:30:44+08:00'),
('vm8gfotksmf1k9sa53bnj24kt4', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932323735333b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2265323035636438656662643063663530383332303531303965346333393730333661373631396439333265343363303039353531646665656464653466363362223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a32353a35332b30323a3030223b7d7d, '2017-10-13T21:29:53+02:00', '1017-10-14T03:05:53+08:00'),
('vomh9j73uj32t1dbutjlf8te30', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373931373634343b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2264313365626166356536633638636138616535356266663661303166353236316161346631303039633264663430316136623034653432306436346433663335223b733a363a22657870697265223b733a32353a22323031372d31302d31335432303a30303a34342b30323a3030223b7d7d, '2017-10-13T20:04:44+02:00', '1017-10-14T01:40:44+08:00'),
('vspp6c365vs5o14nqjl2du0eh2', 0x737365737c613a343a7b733a393a22495061646472657373223b733a333a223a3a31223b733a31303a22686f7374446f6d61696e223b733a393a226c6f63616c686f7374223b733a393a22757365724167656e74223b733a3131343a224d6f7a696c6c612f352e30202857696e646f7773204e5420362e333b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f36312e302e333136332e313030205361666172692f3533372e3336223b733a373a2245585049524553223b693a313530373932313832383b7d756c4e6f6e6365737c613a313a7b733a31343a22756c53657373696f6e546f6b656e223b613a323a7b733a343a22636f6465223b733a36343a2262633938653163626631616338643732346463643735333739353037373337373435306333396466383666376431623366373035346266663839396363656462223b733a363a22657870697265223b733a32353a22323031372d31302d31335432313a31303a32382b30323a3030223b7d7d, '2017-10-13T21:14:28+02:00', '1017-10-14T02:50:28+08:00');

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
-- Indexes for table `dss_presc`
--
ALTER TABLE `dss_presc`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dss_brgy`
--
ALTER TABLE `dss_brgy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `dss_cases`
--
ALTER TABLE `dss_cases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `dss_diseases`
--
ALTER TABLE `dss_diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `dss_medicine`
--
ALTER TABLE `dss_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `dss_medicine_used`
--
ALTER TABLE `dss_medicine_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `dss_patients`
--
ALTER TABLE `dss_patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `dss_presc`
--
ALTER TABLE `dss_presc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dss_symptoms`
--
ALTER TABLE `dss_symptoms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `dss_symptoms_used`
--
ALTER TABLE `dss_symptoms_used`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `dss_uploads`
--
ALTER TABLE `dss_uploads`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `ul_logins`
--
ALTER TABLE `ul_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
