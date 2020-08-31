-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2020 at 05:17 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esp`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(10) UNSIGNED NOT NULL,
  `branch_code` varchar(5) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `year` varchar(5) NOT NULL,
  `semester` varchar(5) NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_code`, `branch_name`, `year`, `semester`, `course_id`) VALUES
(1, 'IT', 'Information Technology', '2', '4', 1),
(2, 'CS', 'Computer Engineering', '1', '2', 1),
(3, 'CV', 'Civil Engineering', '3', '5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(10) NOT NULL,
  `course_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`) VALUES
(1, 'BE'),
(2, 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `plan_id` int(10) UNSIGNED NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `student_beg` int(10) NOT NULL,
  `student_end` int(10) NOT NULL,
  `room_id` int(10) NOT NULL,
  `total_student` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`plan_id`, `subject_id`, `date`, `student_beg`, `student_end`, `room_id`, `total_student`) VALUES
(1, 'ITR4C2', '2020-03-14', 1, 10, 3, 10),
(2, 'ITR4C2', '2020-03-14', 11, 20, 4, 10),
(3, 'ITR4C2', '2020-03-14', 21, 21, 1, 1),
(4, 'ITR4C3', '2020-03-14', 1, 5, 6, 5),
(5, 'ITR4C3', '2020-03-14', 6, 15, 5, 10),
(6, 'ITR4C3', '2020-03-14', 16, 21, 3, 6),
(7, 'ITR4C4', '2020-03-14', 1, 10, 3, 10),
(8, 'ITR4C4', '2020-03-14', 11, 20, 4, 10),
(9, 'ITR4C4', '2020-03-14', 21, 21, 5, 1),
(10, 'AIR4C1', '2020-03-14', 1, 8, 9, 8),
(11, 'AIR4C1', '2020-03-14', 9, 17, 10, 9),
(12, 'AIR4C1', '2020-03-14', 18, 21, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(10) UNSIGNED NOT NULL,
  `roomno` varchar(6) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `roomno`, `capacity`) VALUES
(1, 'F-103', 10),
(2, 'F-104', 10),
(3, 'F-301', 20),
(4, 'F-306', 20),
(5, 'M-201', 20),
(6, 'M-202', 10),
(7, 'B-201', 10),
(8, 'B-202', 10),
(9, 'D-101', 16),
(10, 'E-201', 18);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `roll_no` varchar(10) NOT NULL,
  `enrollment_no` varchar(10) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`roll_no`, `enrollment_no`, `student_name`, `branch_id`) VALUES
('18CS001', 'DE19701', 'ROHIT KUMAR', 2),
('18CS002', 'DE19702', 'ROHIT KUMAR', 2),
('18CS003', 'DE19703', 'ROHIT KUMAR', 2),
('18CS004', 'DE19704', 'ROHIT KUMAR', 2),
('18CS005', 'DE19705', 'ROHIT KUMAR', 2),
('18CS006', 'DE19706', 'ROHIT KUMAR', 2),
('18CS007', 'DE19707', 'ROHIT KUMAR', 2),
('18I4001', 'DE19601', 'KRISHNA KANT RAWAT', 1),
('18I4002', 'DE19602', 'HEMANT RAJPOOT', 1),
('18I4003', 'DE19603', 'RENUKA', 1),
('18I4004', 'DE19604', 'KRISHNA KANT RAWAT', 1),
('18I4005', 'DE19605', 'KRISHNA KANT RAWAT', 1),
('18I4006', 'DE19606', 'KRISHNA KANT RAWAT', 1),
('18I4007', 'DE19607', 'KRISHNA KANT RAWAT', 1),
('18I4008', 'DE19608', 'KRISHNA KANT RAWAT', 1),
('18I4009', 'DE19609', 'KRISHNA KANT RAWAT', 1),
('18I4010', 'DE19610', 'KRISHNA KANT RAWAT', 1),
('18I4011', 'DE19611', 'KRISHNA KANT RAWAT', 1),
('18I4012', 'DE19612', 'KRISHNA KANT RAWAT', 1),
('18I4013', 'DE19613', 'KRISHNA KANT RAWAT', 1),
('18I4014', 'DE19615', 'KRISHNA KANT RAWAT', 1),
('18I4017', 'DE19616', 'KRISHNA KANT RAWAT', 1),
('18I4018', 'DE19618', 'KRISHNA KANT RAWAT', 1),
('18I4019', 'DE19619', 'KRISHNA KANT RAWAT', 1),
('18I4020', 'DE19620', 'KRISHNA KANT RAWAT', 1),
('18I4021', 'DE196021', 'KRISHNA KANT RAWAT', 1),
('18I4022', 'DE19622', 'KRISHNA KANT RAWAT', 1),
('18I4023', 'DE19623', 'KRISHNA KANT RAWAT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` varchar(20) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `branch_id`) VALUES
('AIR4C1', 'NUMERICAL AND OPTIMIZATION TECHNIQES', 1),
('AIR4C2', 'NUMERICAL AND OPTIMIZATION TECHNIQES', 1),
('AVR5C2', 'COMMUNICATION SKILLS', 3),
('CSR2C1', 'PROGRAMMING IN C', 2),
('ITR4C2', 'OPERATING SYSTEM', 1),
('ITR4C3', 'SOFTWARE ENGINEERING', 1),
('ITR4C4', 'DATABASE MANAGEMENT SYSTEM', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `subject_id_fk` (`subject_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`roll_no`),
  ADD UNIQUE KEY `enrollment_no` (`enrollment_no`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `plan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `subject_id_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
