-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2019 at 01:11 PM
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
(5, 'Hyatt', 'Milentija Popovica 5', 'Beograd', 'Srbija', 'Jedan od najpopularnijih hotela.', 5, 'hyatt.jpg'),
(6, 'Putnik', 'Ilije Ognjanovica 24', 'Novi Sad', 'Srbija', 'Hotel sa jeftinim sobama.', 3, 'putnik.jpg'),
(7, 'New City', 'Vozda Karadjordja 12', 'Nis', 'Srbija', 'Hotel sa 4 zvezdice.', 4, 'new_city.jpg');

--
-- Triggers `hoteli`
--
DELIMITER $$
CREATE TRIGGER `izbrisi_sobe` BEFORE DELETE ON `hoteli` FOR EACH ROW DELETE FROM sobe WHERE sobe.hotel_id = old.hotel_id
$$
DELIMITER ;

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
(1, 'admin', 'lozinka', 'Pavle Pavlovic', 'admin@gmail.com', '0651234567', 'Aksentija Maksimovica', 'Novi Sad', 'Srbija', 11111, 'admin', 0),
(8, 'menadzer', 'lozinka', 'Marko Markovic', 'menadzer@gmail.com', '0647654321', 'Vozda Karadjordja', 'Nis', 'Srbija', 10101, 'menadzer', 0),
(9, 'korisnik', 'lozinka', 'Petar Petrovic', 'korisnik@gmail.com', '0639785437', 'Jurija Gagarina', 'Beograd', 'Srbija', 20202, 'korisnik', 1140);

--
-- Triggers `korisnici`
--
DELIMITER $$
CREATE TRIGGER `izbrisi_rezervacije_korisnici` BEFORE DELETE ON `korisnici` FOR EACH ROW DELETE FROM rezervacije WHERE rezervacije.korisnik_id = old.korisnik_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menadzeri`
--

CREATE TABLE `menadzeri` (
  `korisnik_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menadzeri`
--

INSERT INTO `menadzeri` (`korisnik_id`, `hotel_id`) VALUES
(8, 6),
(9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacije`
--

CREATE TABLE `rezervacije` (
  `rezervacija_id` int(5) NOT NULL,
  `korisnik_id` int(5) NOT NULL,
  `soba_id` int(5) NOT NULL,
  `datum_dolaska` date NOT NULL,
  `datum_odlaska` date NOT NULL,
  `novac` int(5) NOT NULL,
  `poeni` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sobe`
--

CREATE TABLE `sobe` (
  `soba_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `tip_id` int(5) NOT NULL,
  `cena` int(5) NOT NULL,
  `poeni` int(5) NOT NULL,
  `slika` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sobe`
--

INSERT INTO `sobe` (`soba_id`, `hotel_id`, `tip_id`, `cena`, `poeni`, `slika`) VALUES
(2, 5, 4, 150, 180, 'apartman.jpg'),
(3, 6, 2, 100, 130, 'apartman.jpg'),
(4, 6, 5, 80, 110, 'cetvorokrevetna.jpg'),
(7, 5, 2, 50, 80, 'standard.jpg'),
(8, 5, 1, 120, 150, 'ekonomik.jpg');

--
-- Triggers `sobe`
--
DELIMITER $$
CREATE TRIGGER `izbrisi_rezervacije` BEFORE DELETE ON `sobe` FOR EACH ROW DELETE FROM rezervacije WHERE rezervacije.soba_id = old.soba_id
$$
DELIMITER ;

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
-- Indexes for table `menadzeri`
--
ALTER TABLE `menadzeri`
  ADD UNIQUE KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD PRIMARY KEY (`rezervacija_id`),
  ADD KEY `korisnik_id` (`korisnik_id`),
  ADD KEY `soba_id` (`soba_id`);

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
  MODIFY `hotel_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `korisnik_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rezervacije`
--
ALTER TABLE `rezervacije`
  MODIFY `rezervacija_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sobe`
--
ALTER TABLE `sobe`
  MODIFY `soba_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tipovi_soba`
--
ALTER TABLE `tipovi_soba`
  MODIFY `tip_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menadzeri`
--
ALTER TABLE `menadzeri`
  ADD CONSTRAINT `menadzeri_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  ADD CONSTRAINT `menadzeri_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hoteli` (`hotel_id`);

--
-- Constraints for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  ADD CONSTRAINT `rezervacije_ibfk_2` FOREIGN KEY (`soba_id`) REFERENCES `sobe` (`soba_id`);

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
