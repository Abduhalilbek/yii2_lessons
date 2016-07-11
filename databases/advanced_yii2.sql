-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2016 at 06:20 PM
-- Server version: 5.6.24
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advanced_yii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', 1, NULL),
('admin', 2, NULL),
('create-branch', 9, NULL),
('create-company', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'admin can create branches and create companies', NULL, NULL, NULL, NULL),
('create-branch', 2, 'allow a user to add a branch', NULL, NULL, NULL, NULL),
('create-company', 2, 'allows user to create a company', NULL, NULL, NULL, NULL),
('updateOwnPost', 2, 'update your own post ', 'isAuthor', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-branch'),
('admin', 'create-company'),
('admin', 'updateOwnPost');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `companies_company_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_address` varchar(255) NOT NULL,
  `branch_created_date` datetime NOT NULL,
  `branch_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `companies_company_id`, `branch_name`, `branch_address`, `branch_created_date`, `branch_status`) VALUES
(2, 2, 'main hello', 'some branch address', '2014-12-05 06:12:27', 'inactive'),
(3, 2, 'another branch', 'another branch address', '2014-12-05 07:12:16', 'active'),
(4, 3, 'Sri Lanka', 'sdfdfsdf', '2014-12-15 01:12:24', 'active'),
(5, 3, 'sdfsdf', 'sdfsdfsdf', '2015-02-02 06:02:58', 'active'),
(6, 9, 'Colombo', 'some where in colombo ', '2015-03-15 08:03:19', 'active'),
(7, 3, 'Galle', 'address', '2015-05-09 08:05:41', 'inactive'),
(8, 3, 'ampara', 'address', '2015-05-09 08:05:59', 'active'),
(1111, 8, 'new branch 1', 'Ribeye', '2016-05-16 16:12:33', 'inactive'),
(2222, 2, 'new branch 2', 'Chicken Breast', '2016-05-16 16:12:33', 'active'),
(3333, 3, 'new branch 3', 'Noodles', '2016-05-16 16:12:33', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `company_start_date` date NOT NULL,
  `company_created_date` datetime NOT NULL,
  `company_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_email`, `company_address`, `logo`, `company_start_date`, `company_created_date`, `company_status`) VALUES
(2, 'ABC', 'abc@gmail.com', 'some address', '', '0000-00-00', '2014-12-05 06:12:19', 'active'),
(3, 'DoingITeasy', 'do@sdf.com', 'sodfksdfsdf', '', '0000-00-00', '2014-12-15 01:12:47', 'active'),
(8, 'DoingITeasyChannel', 'doi@doing.gi', 'some address', 'uploads/DoingITeasyChannel.png', '0000-00-00', '2015-01-10 08:01:30', 'active'),
(9, 'ABCD', 'abc@gmail.com', 'some address ', '', '0000-00-00', '2015-03-15 08:03:19', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `branches_branch_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `companies_company_id` int(11) NOT NULL,
  `department_created_date` datetime NOT NULL,
  `department_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `branches_branch_id`, `department_name`, `companies_company_id`, `department_created_date`, `department_status`) VALUES
(2, 2, 'IT Department', 2, '2014-12-05 06:12:09', 'active'),
(3, 2, 'IT Department', 2, '2016-03-31 08:03:15', 'active'),
(4, 2, 'IT Department', 2, '2016-03-31 08:03:22', 'active'),
(5, 2, 'IT Department', 2, '2016-03-31 08:03:22', 'active'),
(6, 2, 'IT Department', 2, '2016-03-31 08:03:28', 'active'),
(7, 2, 'IT Department', 2, '2016-03-31 08:03:28', 'active'),
(8, 2, 'IT Department', 2, '2016-03-31 08:03:28', 'active'),
(9, 2, 'IT Department', 2, '2016-03-31 08:03:28', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `receiver_email` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `receiver_name`, `receiver_email`, `subject`, `content`, `attachment`) VALUES
(1, 'Uthpala', 'uiheenatigala@gmail.com', 'Testing the email ', 'Some content ', 'attachments/1421906659.png');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `created_date`) VALUES
(1, 'test event', 'some test description', '2015-06-12'),
(2, 'another task', 'some descriptinons', '2015-06-12'),
(3, 'do this on the 17th', 'here is how to do it ', '2015-06-17'),
(4, '8th event', 'have some fun', '2015-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `zip_code`, `city`, `province`) VALUES
(1, '1111', 'Colombo', 'Western'),
(2, '2222', 'Galle', 'Southern ');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1416813354),
('m130524_201442_init', 1416813368);

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `id` int(11) NOT NULL,
  `po_no` varchar(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `po`
--

INSERT INTO `po` (`id`, `po_no`, `description`) VALUES
(2, 'po-1', 'some description'),
(3, 'po-2', 'purchasing order number 2');

-- --------------------------------------------------------

--
-- Table structure for table `po_item`
--

CREATE TABLE `po_item` (
  `id` int(11) NOT NULL,
  `po_item_no` varchar(10) NOT NULL,
  `quantity` double NOT NULL,
  `po_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `po_item`
--

INSERT INTO `po_item` (`id`, `po_item_no`, `quantity`, `po_id`) VALUES
(1, 'po-item-1', 10, 2),
(3, 'po-item-3', 12, 3),
(4, 'po-item-4', 20, 3),
(7, 'po-item-2', 40, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', 'doingITeasy', 'mXoICMvTR_n21FMJaCyA9ft_b4RsF0Vs', '$2y$13$bucEc1sMCJyePLhjZYnDxOk0u0p7pyotQJQgd95o20G05RJ4UHoDy', NULL, 'uiheenatigala@gmail.com', 10, 10, 1416813431, 1416813431),
(2, 'Uthpala', 'Heenatigala', 'uthpala', 'fqWNg-v9cWNLv6duFyJCBHmuAhtiCuNv', '$2y$13$Ci4zoXaf.skJ3akK/fBM/.bqUgkIqTJ7si6IJq1tybnYCbNd/FH5S', NULL, 'test@gmail.com', 10, 10, 1417756860, 1417756860),
(3, 'somename', 'somename', 'sam', 'tf7kuVqmlpZc9aMZZC1_ob7iloEUQCcV', '$2y$13$eQeVy6mnPYs/xzXVvG2vmOyaRsN284p5X6DMBw5p4bmc6rg9/ntc.', NULL, 'sam@gmail.com', 10, 10, 1423652674, 1423652674),
(4, 'John', 'John', 'john', 'vZnsGI8Xbqsw2V8_JRg7LGyMJBA-4-qd', '$2y$13$uNBa7td3ICKjq0M7BYzrkOAw9YkmyJk1dI0hefLwnN.ejXQ3COGRC', NULL, 'john@gmail.com', 10, 10, 1423652764, 1423652764),
(5, 'Uthpala', 'company', '123', 'ANOsFmFjgoqQbL1SvY2zo-60ZvaAhSlD', '$2y$13$gG5yDLZzap.RBQ/nIVMDauYhcvFPOWjnfoinRso2tfB9CYUjXaE1G', NULL, '11@gmail.com', 10, 10, 1423652807, 1423652807),
(6, 'Uthpala', 'company', '1234', 'A1iUOZ1GD2zveVx8zeCU9m9qmqTdF6Rl', '$2y$13$ZLHSp/2F4Iak5zcgKcSJkuM5jybZWFe1gQzbIqoa0cp8cm/t2lbNq', NULL, '114@gmail.com', 10, 10, 1423652865, 1423652865),
(7, '4444', '4444', '444', 'H_fFlWcjm1BhXmXpJUkFzCVAt4fFDQHr', '$2y$13$fEGU8V2s/ikeOX3VGIwdIuTxB2eIFX9Yb9LQoZykfeatfOFuoYh0i', NULL, 'john4@gmail.com', 10, 10, 1423652892, 1423652892),
(8, '4444', '4444', '4445', 'WQ0u1u-ArxbuhmoVgDiqLPG7HhAZig0I', '$2y$13$dRm8m0GBEbkrZGmxL9Zd8OjNIwWiVFJ.8pgdLDOjnGpQuwdwa36Zu', NULL, 'john54@gmail.com', 10, 10, 1423652959, 1423652959),
(9, 'testin', 'sdfsdf', 'test111', 'JcsG6u8Q1bWbP5n0epSTnlnDs2azNb0U', '$2y$13$UtvvtM89GmR7Qp8zdaQ.Oemf/eVkRprgE/fN7iziPD80yrK.foWaW', NULL, 'john111@gmail.com', 10, 10, 1423653059, 1423653059);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_branches_companies_idx` (`companies_company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `fk_departments_branches1_idx` (`branches_branch_id`),
  ADD KEY `fk_departments_companies1_idx` (`companies_company_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_item`
--
ALTER TABLE `po_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_id` (`po_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3334;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `po_item`
--
ALTER TABLE `po_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fk_branches_companies` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_departments_branches1` FOREIGN KEY (`branches_branch_id`) REFERENCES `branches` (`branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_departments_companies1` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `po_item`
--
ALTER TABLE `po_item`
  ADD CONSTRAINT `po_item_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `po` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
