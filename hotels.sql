-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2019 at 02:41 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotels`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `description` varchar(70) NOT NULL,
  `stars` int(1) NOT NULL,
  `picture` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `name`, `address`, `city`, `country`, `description`, `stars`, `picture`) VALUES
(5, 'Hyatt', 'Milentija Popovica 5', 'Belgrade', 'Serbia', 'Description', 5, 'hyatt.jpg'),
(6, 'Putnik', 'Ilije Ognjanovica 24', 'Novi Sad', 'Serbia', 'Description', 3, 'putnik.jpg'),
(7, 'New City', 'Vozda Karadjordja 12', 'Nis', 'Serbia', 'Description', 4, 'new_city.jpg');

--
-- Triggers `hotels`
--
DELIMITER $$
CREATE TRIGGER `remove_rooms` BEFORE DELETE ON `hotels` FOR EACH ROW DELETE FROM rooms WHERE rooms.hotel_id = old.hotel_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `user_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`user_id`, `hotel_id`) VALUES
(8, 6),
(9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `room_id` int(5) NOT NULL,
  `arrive_date` date NOT NULL,
  `leave_date` date NOT NULL,
  `price` int(5) NOT NULL,
  `points` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `type_id` int(5) NOT NULL,
  `price` int(5) NOT NULL,
  `points` int(5) NOT NULL,
  `picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `hotel_id`, `type_id`, `price`, `points`, `picture`) VALUES
(2, 5, 4, 150, 180, 'apartment.jpg'),
(3, 6, 2, 100, 130, 'apartment.jpg'),
(4, 6, 5, 80, 110, 'four-bed.jpg'),
(7, 5, 2, 50, 80, 'standard.jpg'),
(8, 5, 1, 120, 150, 'economic.jpg');

--
-- Triggers `rooms`
--
DELIMITER $$
CREATE TRIGGER `delete_reservations` BEFORE DELETE ON `rooms` FOR EACH ROW DELETE FROM reservations WHERE reservations.room_id = old.room_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `type_id` int(5) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`type_id`, `type`) VALUES
(1, 'Economic room'),
(2, 'Standard room'),
(3, 'Comfort room'),
(4, 'Apartment'),
(5, 'Four bed room');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `postcode` mediumint(5) UNSIGNED ZEROFILL NOT NULL,
  `role` enum('client','manager','admin') NOT NULL DEFAULT 'client',
  `points` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`, `email`, `phone`, `address`, `city`, `country`, `postcode`, `role`, `points`) VALUES
(1, 'admin', 'password', 'John Doe', 'admin@gmail.com', '0651234567', 'Aksentija Maksimovica', 'Novi Sad', 'Serbia', 11111, 'admin', 0),
(8, 'manager', 'password', 'John Doe', 'manager@gmail.com', '0647654321', 'Vozda Karadjordja', 'Nis', 'Serbia', 10101, 'manager', 0),
(9, 'client', 'password', 'John Doe', 'client@gmail.com', '0639785437', 'Jurija Gagarina', 'Belgrade', 'Serbia', 20202, 'client', 980);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `delete_reservations_clients` BEFORE DELETE ON `users` FOR EACH ROW DELETE FROM reservations WHERE reservations.user_id = old.user_id
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `managers`
--
ALTER TABLE `managers`
  ADD CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `managers_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `room_types` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
