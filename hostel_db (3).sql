-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2026 at 06:58 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `activity`, `created_at`) VALUES
(1, 1, 'Logged into the system', '2026-05-12 04:46:11'),
(2, 2, 'Logged into the system', '2026-05-14 16:39:34'),
(3, 3, 'Logged into the system', '2026-05-14 16:41:54'),
(4, 1, 'Logged into the system', '2026-05-14 16:42:36'),
(5, 4, 'Logged into the system', '2026-05-14 16:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `PASSWORD`, `role`) VALUES
(1, 'admins@hostel.com', 'admin123', ''),
(2, 'superadmin@gmail.com', '12345', 'super_admin'),
(3, 'admin@gmail.com', '12345', 'admin'),
(4, 'porter@gmail.com', '12345', 'porter'),
(5, 'security@gmail.com', '12345', 'security');

-- --------------------------------------------------------

--
-- Table structure for table `allocations`
--

CREATE TABLE `allocations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `allocated_by` int(11) NOT NULL,
  `allocation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `allocated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allocations`
--

INSERT INTO `allocations` (`id`, `student_id`, `hostel_id`, `room_id`, `allocated_by`, `allocation_date`, `allocated_at`) VALUES
(1, 4, 0, 6, 0, '2026-05-07 15:23:19', '2026-05-07 15:49:11');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `message`, `created_at`) VALUES
(1, 'hostel udate', 'hostel locks at 6pm today', '2026-05-12 04:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `student_id`, `room_id`, `status`, `applied_at`) VALUES
(1, 2, 5, 'approved', '1980-01-05 15:57:33'),
(2, 2, 2, 'rejected', '1980-01-05 20:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` enum('pending','in_progress','resolved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complaint_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `student_id`, `title`, `description`, `status`, `created_at`, `complaint_type`) VALUES
(2, 2, NULL, 'no lights ', 'resolved', '2026-05-08 00:57:57', 'Electrical'),
(3, 2, NULL, 'light not working', 'resolved', '2026-05-08 00:58:24', 'Electrical');

-- --------------------------------------------------------

--
-- Table structure for table `hostels`
--

CREATE TABLE `hostels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('male','female','mixed') DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hostel_type` varchar(50) NOT NULL,
  `hostel_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostels`
--

INSERT INTO `hostels` (`id`, `name`, `type`, `capacity`, `created_at`, `hostel_type`, `hostel_name`) VALUES
(1, NULL, NULL, NULL, '2026-05-07 04:33:20', 'Male', 'Block A'),
(2, NULL, NULL, NULL, '2026-05-07 04:33:20', 'Female', 'Block B'),
(3, NULL, NULL, NULL, '2026-05-07 04:33:20', 'Male', 'Block C'),
(4, NULL, NULL, NULL, '2026-05-07 04:33:20', 'Female', 'Block D');

-- --------------------------------------------------------

--
-- Table structure for table `hostel_applications`
--

CREATE TABLE `hostel_applications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hostel_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel_applications`
--

INSERT INTO `hostel_applications` (`id`, `student_id`, `hostel_name`, `room_type`, `status`, `created_at`) VALUES
(1, 2, 'Male Hostel', '2 in a room', 'Approved', '2026-05-08 15:10:38'),
(2, 2, 'Male Hostel', '4 in a room', 'Approved', '2026-05-08 16:45:48'),
(3, 2, 'Male Hostel', '4 in a room', 'Pending', '2026-05-12 03:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `movement_logs`
--

CREATE TABLE `movement_logs` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `movement_type` varchar(20) DEFAULT NULL,
  `movement_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movement_logs`
--

INSERT INTO `movement_logs` (`id`, `student_id`, `movement_type`, `movement_time`) VALUES
(1, 4, 'CHECK-IN', '2026-05-07 22:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(20) DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `student_id`, `message`, `status`, `created_at`) VALUES
(1, 2, 'Your complaint has been resolved successfully.', 'read', '2026-05-12 02:05:07'),
(2, 2, 'Your complaint has been resolved successfully.', 'read', '2026-05-12 02:07:07'),
(3, 2, 'Your complaint has been resolved successfully.', 'read', '2026-05-12 02:07:07'),
(4, 2, 'Your complaint has been resolved successfully.', 'read', '2026-05-12 02:07:07'),
(5, 22, 'Your visitor request has been approved.', 'unread', '2026-05-12 02:20:03'),
(6, 1, 'Your visitor request has been approved.', 'unread', '2026-05-12 02:31:30'),
(7, 2, 'Your visitor request has been approved.', 'read', '2026-05-12 02:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `transaction_ref` varchar(100) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `receipt_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `student_id`, `amount`, `status`, `transaction_ref`, `paid_at`, `receipt_no`) VALUES
(2, 2, '5000.00', '', NULL, NULL, NULL),
(3, 2, '5000.00', '', NULL, NULL, NULL),
(4, 2, '5000.00', '', NULL, NULL, NULL),
(5, 2, '5000.00', '', NULL, NULL, NULL),
(6, 2, '5000.00', '', NULL, '2026-05-06 08:29:16', NULL),
(7, 2, '5000.00', '', 'TXN1778057017', '2026-05-06 08:43:37', NULL),
(8, 2, '5000.00', '', 'TXN1778057523', '2026-05-06 08:52:03', NULL),
(9, 2, '5000.00', '', 'TXN1778062420', '2026-05-06 10:13:40', 'GWU-2026-9536'),
(10, 2, '5000.00', '', 'TXN1778062569', '2026-05-06 10:16:09', 'GWU-2026-2230'),
(11, 2, '5000.00', '', 'TXN1778062638', '2026-05-06 10:17:18', 'GWU-2026-9026'),
(12, 2, '5000.00', '', 'TXN1778062668', '2026-05-06 10:17:48', 'GWU-2026-7637'),
(13, 2, '5000.00', '', 'TXN1778063410', '2026-05-06 10:30:10', 'GWU-2026-5786'),
(14, 2, '5000.00', '', 'TXN1778064143', '2026-05-06 10:42:23', 'GWU-2026-5833'),
(15, 2, '19.00', '', 'TXN1778068586', '2026-05-06 11:56:26', 'GWU-2026-8207'),
(16, 2, '7.00', '', 'TXN1778068699', '2026-05-06 11:58:19', 'GWU-2026-1949'),
(17, 2, '0.00', '', 'TXN1778070537', '2026-05-06 12:28:57', 'GWU-2026-8855'),
(18, 2, '501.00', '', 'TXN1778071496', '2026-05-06 12:44:56', 'GWU-8985'),
(19, 2, '4000.00', '', 'TXN1778075294', '2026-05-06 13:48:14', 'GWU-2026-7033'),
(20, 2, '4000.00', '', 'TXN1778076955', '2026-05-06 14:15:55', 'GWU-2813'),
(21, 2, '5000.00', '', 'TXN1778117853', '2026-05-07 01:37:33', 'GWU-7380');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'Available',
  `hostel_id` int(11) NOT NULL,
  `occupied` int(11) NOT NULL DEFAULT '0',
  `hostel_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `capacity`, `status`, `hostel_id`, `occupied`, `hostel_name`) VALUES
(2, 'A102', 0, 'Available', 0, 0, NULL),
(3, 'A103', 0, 'Available', 0, 0, NULL),
(4, 'B201', 0, 'occupied', 0, 0, NULL),
(5, 'B202', 0, 'full', 0, 0, NULL),
(6, 'D101', 4, 'Available', 4, 3, NULL),
(8, 'A101', 4, 'Available', 0, 0, 'Male  Hostel '),
(9, 'B103', 4, 'Available', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `hostel_fee` decimal(10,2) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `system_name`, `hostel_fee`, `contact_email`) VALUES
(1, 'Hostel Management System', '50000.00', 'admin@hostel.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `room_number` varchar(20) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `matric_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fullname`, `email`, `password`, `room_number`, `reg_date`, `matric_no`) VALUES
(4, 'Joseph Simon', 'jeosimon4@gmail.com', 'selenane1', 'B201', '2026-02-19 00:01:44', 'GWU/2021/115769');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('super_admin','hostel_admin','porter','student') DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`, `status`, `created_at`, `photo`) VALUES
(1, 'hostel Admin', 'admin@gmail.com', '$2y$10$bnaYxcm0GAyw9yFXSorNJOBvQCrMg2YpnPKc0p8NKL.sZbWAEFyy.', 'hostel_admin', 'active', '0000-00-00 00:00:00', ''),
(2, 'student', 'student@gmail.com', '$2y$10$p.aMXp7cKzqW5Nez8zB3AumqXttNbKIvWpeNW4UUfkk6I.d0PE65G', 'student', 'active', '0000-00-00 00:00:00', ''),
(3, 'super admin\r\n', 'superadmin@gmail.com', '$2y$10$Y2x9ADaM9IlvX.aXALON2unuKuWLkT0nnn7nh8aJyck0OCdGDCakO', 'super_admin', 'active', '2026-05-08 01:45:32', ''),
(4, 'security officer', 'security@gmail.com', '$2y$10$dN/gBKrWKMfzUmVBHpywse9gA.8jMcrnGlmn7o5IgxBaJNdEgaPOS', 'porter', 'active', '2026-05-08 01:45:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `visitor_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `student_id`, `visitor_name`, `phone`, `visit_date`, `time_in`, `time_out`, `status`, `created_at`) VALUES
(3, 2, 'jeo', '123456789', NULL, '19:39:04', NULL, 'Approved', '2026-05-12 02:28:24'),
(4, 1, 'jeo', '123456789', NULL, '19:31:30', NULL, 'Approved', '2026-05-12 02:29:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `allocations`
--
ALTER TABLE `allocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `hostels`
--
ALTER TABLE `hostels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_applications`
--
ALTER TABLE `hostel_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movement_logs`
--
ALTER TABLE `movement_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_payment` (`student_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `allocations`
--
ALTER TABLE `allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hostels`
--
ALTER TABLE `hostels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hostel_applications`
--
ALTER TABLE `hostel_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movement_logs`
--
ALTER TABLE `movement_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_user_payment` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
