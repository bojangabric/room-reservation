-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2018 at 11:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipa_projekat`
--

-- --------------------------------------------------------

--
-- Table structure for table `hoteli`
--

CREATE TABLE `hoteli` (
  `hotel_id` int(5) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  `adresa` varchar(30) NOT NULL,
  `grad` varchar(30) NOT NULL,
  `drzava` varchar(30) NOT NULL,
  `opis` varchar(70) NOT NULL,
  `zvezdice` int(1) NOT NULL,
  `slika` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hoteli`
--

INSERT INTO `hoteli` (`hotel_id`, `naziv`, `adresa`, `grad`, `drzava`, `opis`, `zvezdice`, `slika`) VALUES
(1, 'Hyatt', 'Milentija Popovica 5', 'Beograd', 'Srbija', 'Hotel sa 5 zvezdica.', 5, 'hyatt.jpg'),
(2, 'Putnik', 'Ilije Ognjanovica 24', 'Novi Sad', 'Srbija', 'Hotel sa 3 zvezdice.', 3, 'putnik.jpg'),
(3, 'New City', 'Vozda Karadjordja 12', 'Nis', 'Srbija', 'Hotel sa 4 zvezdice.', 4, 'new_city.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `korisnik_id` int(5) NOT NULL,
  `korisnicko_ime` varchar(20) NOT NULL,
  `lozinka` char(64) NOT NULL,
  `ime_prezime` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `adresa` varchar(30) NOT NULL,
  `grad` varchar(30) NOT NULL,
  `drzava` varchar(30) NOT NULL,
  `postanski_broj` mediumint(5) UNSIGNED ZEROFILL NOT NULL,
  `uloga` enum('korisnik','menadzer','admin') NOT NULL DEFAULT 'korisnik',
  `poeni` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`korisnik_id`, `korisnicko_ime`, `lozinka`, `ime_prezime`, `email`, `telefon`, `adresa`, `grad`, `drzava`, `postanski_broj`, `uloga`, `poeni`) VALUES
(1, 'korisnickoime', 'lozinka', 'imeprezime', 'email@gmail.com', '04302302', 'Adresa', 'Grad', 'Drzava', 11077, 'korisnik', 0),
(4, 'imeee', 'lozinka', 'imeeee', 'tixizako@sandcars.net', '0123212', 'Adresa', 'Grad', 'Drzav', 10101, 'korisnik', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sobe`
--

CREATE TABLE `sobe` (
  `soba_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `tip_id` int(5) NOT NULL,
  `cena` int(5) NOT NULL,
  `slika` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sobe`
--

INSERT INTO `sobe` (`soba_id`, `hotel_id`, `tip_id`, `cena`, `slika`) VALUES
(1, 1, 4, 100, 'apartman.jpg'),
(2, 3, 2, 50, 'standard.jpg'),
(3, 2, 3, 33, 'komfort.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tipovi_soba`
--

CREATE TABLE `tipovi_soba` (
  `tip_id` int(5) NOT NULL,
  `tip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipovi_soba`
--

INSERT INTO `tipovi_soba` (`tip_id`, `tip`) VALUES
(1, 'Ekonomik soba'),
(2, 'Standard soba'),
(3, 'Komfort soba'),
(4, 'Apartman'),
(5, 'Cetvorokrevetna soba');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hoteli`
--
ALTER TABLE `hoteli`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`korisnik_id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- Indexes for table `sobe`
--
ALTER TABLE `sobe`
  ADD PRIMARY KEY (`soba_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `tip_id` (`tip_id`);

--
-- Indexes for table `tipovi_soba`
--
ALTER TABLE `tipovi_soba`
  ADD PRIMARY KEY (`tip_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hoteli`
--
ALTER TABLE `hoteli`
  MODIFY `hotel_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `korisnik_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sobe`
--
ALTER TABLE `sobe`
  MODIFY `soba_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipovi_soba`
--
ALTER TABLE `tipovi_soba`
  MODIFY `tip_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sobe`
--
ALTER TABLE `sobe`
  ADD CONSTRAINT `sobe_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hoteli` (`hotel_id`),
  ADD CONSTRAINT `sobe_ibfk_2` FOREIGN KEY (`tip_id`) REFERENCES `tipovi_soba` (`tip_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
