-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2021 at 03:14 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitall`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Employee_ID` varchar(45) NOT NULL,
  `Employee_Type` int(1) NOT NULL,
  `Specialty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Employee_ID`, `Employee_Type`, `Specialty`) VALUES
('dBelle6', 1, 'Endocrinology'),
('dBri7', 1, 'Pulmonary'),
('dCheryl8', 1, 'Radiology'),
('dEric1', 1, 'Radiology'),
('dEunice5', 1, 'Pediatrics'),
('dJessica2', 1, 'Cardiology'),
('dManuela9', 1, 'Cardiology'),
('dNicki10', 1, 'Oncology'),
('dNicole4', 1, 'Oncology'),
('dTimmy3', 1, 'Oncology');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` varchar(45) NOT NULL,
  `Employee_Type` int(10) NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Employee_Type`, `FName`, `LName`) VALUES
('dBelle6', 1, 'Belle', 'Meeto'),
('dBri7', 1, 'Bri', 'Murphy'),
('dCheryl8', 1, 'Cheryl', 'Kwappong'),
('dEric1', 1, 'Eric', 'Gonzales'),
('dEunice5', 1, 'Eunice', 'Olorunshola'),
('dJessica2', 1, 'Jessica', 'Velasquez'),
('dManuela9', 1, 'Manuela', 'Hernandez'),
('dNicki10', 1, 'Nicole', 'Gomez'),
('dNicole4', 1, 'Nicole', 'Chavarria'),
('dTimmy3', 1, 'Timmy', 'Odonovan'),
('nJonathan5', 2, 'Jonathan', 'Chavarria'),
('nKj2', 2, 'Kj', 'Willis'),
('nKristen1', 2, 'Kristen', 'Hanold'),
('nMahalet10', 2, 'Mahalet', 'Ole'),
('nNikko6', 2, 'Nikko', 'Chavarria'),
('nNora7', 2, 'Nora', 'Estrada'),
('nOlivia9', 2, 'Olivia', 'Mickle'),
('nRigo8', 2, 'Rigo', 'Chavarria'),
('nThai4', 2, 'Thai', 'Hodgers'),
('nUchenna3', 2, 'Uchenna', 'Sanders'),
('rCathy10', 3, 'Cathy', 'Moreno'),
('rDalton3', 3, 'Dalton', 'Smith'),
('rGary8', 3, 'Gary', 'Bishop'),
('rGeri4', 3, 'Geri', 'Charles'),
('rMarissa7', 3, 'Marissa', 'Bruce'),
('rPatrick1', 3, 'Patrick', 'Scales'),
('rRon9', 3, 'Ron', 'Pena'),
('rSarah6', 3, 'Sarah', 'Thomas'),
('rTamara5', 3, 'Tamara', 'Jordan'),
('rWilliam2', 3, 'William', 'Reyes');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
    IF new.Employee_Type = 1 then
	Insert into doctor(Employee_ID, Employee_Type) 
    values(new.Employee_ID, new.Employee_Type);
    elseif new.Employee_Type = 2 then
	Insert into nurse(Employee_ID, Employee_Type) 
    values(new.Employee_ID, new.Employee_Type);
	elseif new.Employee_Type = 3 then
	Insert into receptionist(Employee_ID, Employee_Type) 
    values(new.Employee_ID, new.Employee_Type);
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_has_patient`
--

CREATE TABLE `employee_has_patient` (
  `employee_Employee_ID` varchar(45) NOT NULL,
  `patient_patient_ID` varchar(45) NOT NULL,
  `employee_Type` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_has_patient`
--

INSERT INTO `employee_has_patient` (`employee_Employee_ID`, `patient_patient_ID`, `employee_Type`) VALUES
('dBelle6', 'patient8', 1),
('dEric1', 'patient1', 1),
('dEric1', 'patient2', 1),
('dEunice5', 'patient10', 1),
('dJessica2', 'patient7', 1),
('dNicole4', 'patient9', 1),
('dTimmy3', 'patient8', 1),
('nJonathan5', 'patient5', 2),
('nKj2', 'patient10', 2),
('nKristen1', 'patient1', 2),
('nNikko6', 'patient8', 2),
('nThai4', 'patient6', 2),
('nThai4', 'patient7', 2),
('nUchenna3', 'patient7', 2);

--
-- Triggers `employee_has_patient`
--
DELIMITER $$
CREATE TRIGGER `employee_has_patient_BEFORE_INSERT` BEFORE INSERT ON `employee_has_patient` FOR EACH ROW BEGIN
     set new.employee_Type = (select Employee_Type from employee where Employee_ID = new.employee_Employee_ID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insuranceNum` varchar(45) CHARACTER SET utf8 NOT NULL,
  `insuranceName` varchar(45) CHARACTER SET utf8 NOT NULL,
  `patient` varchar(45) CHARACTER SET utf8 NOT NULL,
  `insuranceCover` varchar(45) DEFAULT NULL,
  `remainingCost` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insuranceNum`, `insuranceName`, `patient`, `insuranceCover`, `remainingCost`) VALUES
('0987', 'Bluecross', 'patient10', '0.00', '770.00'),
('1234', 'Bluecross', 'patient2', '100.00', '0.00'),
('2345', 'Bluecross', 'patient9', '80.00', '200.00'),
('7674', 'BlueCross', 'patient1', '50.00', '50.00'),
('9012', 'Bluecross', 'patient4', '7.00', '10.00'),
('0123', 'Medicare', 'patient6', '500.00', '8.00'),
('4567', 'Medicare', 'patient7', '25.00', '1000.00'),
('8901', 'Medicare', 'patient8', '5.00', '1.00'),
('5678', 'SafetyRed', 'patient3', '200.00', '80.00'),
('6789', 'SafetyRed', 'patient5', '700.00', '8.00');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `Employee_ID` varchar(45) NOT NULL,
  `Employee_Type` int(1) NOT NULL,
  `Specialty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`Employee_ID`, `Employee_Type`, `Specialty`) VALUES
('nJonathan5', 2, 'holistic nurse'),
('nKj2', 2, 'registered nurse'),
('nKristen1', 2, 'midwifery'),
('nMahalet10', 2, 'holistic nurse'),
('nNikko6', 2, 'genetics nurse'),
('nNora7', 2, 'legal nurse'),
('nOlivia9', 2, 'legal nurse'),
('nRigo8', 2, 'mental health nurse'),
('nThai4', 2, 'holistic nurse'),
('nUchenna3', 2, 'registered nurse');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_ID` varchar(45) NOT NULL,
  `Fname` varchar(45) NOT NULL,
  `Lname` varchar(45) NOT NULL,
  `Minit` varchar(1) DEFAULT NULL,
  `Birthday` varchar(10) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Weight` decimal(10,0) DEFAULT NULL,
  `Height` decimal(10,0) DEFAULT NULL,
  `blood_type` varchar(2) DEFAULT NULL,
  `chief_complaint` varchar(45) DEFAULT NULL,
  `diagnosis` varchar(45) DEFAULT NULL,
  `hadCovid` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_ID`, `Fname`, `Lname`, `Minit`, `Birthday`, `Sex`, `Address`, `Weight`, `Height`, `blood_type`, `chief_complaint`, `diagnosis`, `hadCovid`) VALUES
('patient 12', 'Nicole', 'Chavarria', 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('patient1', 'Bella', 'Hadid', 'A', '1/1/1992', 'F', '123 Monkey Lane', '120', '60', 'AB', 'Stomach ache', 'Food Poisoning', 'yes'),
('patient10', 'Gigi', 'Hadid', 'B', '2/2/1993', 'F', '130 Zebra Lane', '187', '70', 'AB', 'Can\'t focus', 'ADHD', 'no'),
('patient2', 'James', 'Edwards', 'C', '3/3/1994', 'M', '1300 Hamster Lane', '131', '70', 'B', 'Headache', 'High Blood Pressure', 'no'),
('patient3', 'Kim', 'Kardashian', 'D', '6/26/1995', 'F', '1300 Bird Lane', '137', '68', 'A', 'Cold', 'Flu', 'no'),
('patient4', 'Jennifer', 'Padilla', 'E', '5/19/1996', 'F', '1300 Panda Lane', '177', '68', 'AB', 'Heart Hurts', 'Flu', 'no'),
('patient5', 'Elizabeth', 'Valasquez', 'F', '12/4/1997', 'F', '1300 Snake Lane', '176', '58', 'A', 'Exhaustion', 'Flu', 'yes'),
('patient6', 'Magarita', 'Estrada', 'G', '8/5/1998', 'F', '1300 Bear Lane', '187', '69', 'AB', 'Cold', 'Common Cold', 'no'),
('patient7', 'Savannah', 'Peele', 'H', '3/15/1999', 'F', '1300 Cat Lane', '147', '65', 'O', 'Head Hurts', 'High Blood Pressure', 'yes'),
('patient8', 'Hannah', 'Kim', 'I', '7/30/2000', 'F', '1300 Dog Lane', '177', '68', 'B', 'Stomach ache', 'Flue', 'no'),
('patient9', 'Catherine', 'Paiz', 'J', '5/29/2001', 'F', '1300 Cali Lane', '178', '69', 'A', 'Can\'t Sleep', 'Insomnia', 'yes');

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `patient_AFTER_INSERT` AFTER INSERT ON `patient` FOR EACH ROW BEGIN
   Insert into patient_record(patient_ID)
   values(new.patient_ID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_record`
--

CREATE TABLE `patient_record` (
  `record_ID` int(45) NOT NULL,
  `patient_ID` varchar(45) NOT NULL,
  `date_admitted` date DEFAULT NULL,
  `date_released` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_record`
--

INSERT INTO `patient_record` (`record_ID`, `patient_ID`, `date_admitted`, `date_released`) VALUES
(1, 'patient1', '2020-01-01', '2020-01-03'),
(2, 'patient2', '2020-02-01', '2020-02-03'),
(3, 'patient3', '2020-03-01', '2020-03-03'),
(4, 'patient4', '2020-04-01', '2020-04-03'),
(5, 'patient5', '2020-05-01', '2020-05-03'),
(6, 'patient6', '2020-06-01', '2020-06-03'),
(7, 'patient7', '2020-07-01', '2020-08-01'),
(8, 'patient8', '2020-08-01', '2020-08-20'),
(9, 'patient9', '2020-09-01', '2020-09-20'),
(10, 'patient10', '2020-10-01', '2020-10-03'),
(54, 'patient 12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `Employee_ID` varchar(45) NOT NULL,
  `Employee_Type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`Employee_ID`, `Employee_Type`) VALUES
('rCathy10', 3),
('rDalton3', 3),
('rGary8', 3),
('rGeri4', 3),
('rMarissa7', 3),
('rPatrick1', 3),
('rRon9', 3),
('rSarah6', 3),
('rTamara5', 3),
('rWilliam2', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `FK_Doctor` (`Employee_ID`,`Employee_Type`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD UNIQUE KEY `UQ_Employee` (`Employee_ID`,`Employee_Type`);

--
-- Indexes for table `employee_has_patient`
--
ALTER TABLE `employee_has_patient`
  ADD PRIMARY KEY (`employee_Employee_ID`,`patient_patient_ID`),
  ADD KEY `fk_employee_has_patient_patient1_idx` (`patient_patient_ID`),
  ADD KEY `fk_employee_has_patient_employee1_idx` (`employee_Employee_ID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insuranceName`,`insuranceNum`) USING BTREE,
  ADD KEY `patient` (`patient`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `FK_Nurse` (`Employee_ID`,`Employee_Type`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`),
  ADD KEY `covid_fk` (`hadCovid`);

--
-- Indexes for table `patient_record`
--
ALTER TABLE `patient_record`
  ADD PRIMARY KEY (`record_ID`,`patient_ID`),
  ADD KEY `FK_patient_ID` (`patient_ID`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `FK_Recpetionist` (`Employee_ID`,`Employee_Type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_record`
--
ALTER TABLE `patient_record`
  MODIFY `record_ID` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `FK_Doctor` FOREIGN KEY (`Employee_ID`,`Employee_Type`) REFERENCES `employee` (`Employee_ID`, `Employee_Type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_has_patient`
--
ALTER TABLE `employee_has_patient`
  ADD CONSTRAINT `fk_employee_has_patient_employee1` FOREIGN KEY (`employee_Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee_has_patient_patient1` FOREIGN KEY (`patient_patient_ID`) REFERENCES `patient` (`patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_ID`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `FK_Nurse` FOREIGN KEY (`Employee_ID`,`Employee_Type`) REFERENCES `employee` (`Employee_ID`, `Employee_Type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_record`
--
ALTER TABLE `patient_record`
  ADD CONSTRAINT `FK_patient_ID` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `FK_Recpetionist` FOREIGN KEY (`Employee_ID`,`Employee_Type`) REFERENCES `employee` (`Employee_ID`, `Employee_Type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
