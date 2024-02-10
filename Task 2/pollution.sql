-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 29, 2023 at 08:21 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pollution`
--

-- --------------------------------------------------------

--
-- Table structure for table `Constituencies`
--

CREATE TABLE `Constituencies` (
  `Constituency_id` int(11) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `MP_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Reading`
--

CREATE TABLE `Reading` (
  `Reading_id` int(11) NOT NULL,
  `Date_Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Site_id` int(11) NOT NULL,
  `NOx` float NOT NULL,
  `NO2` float NOT NULL,
  `NO` float NOT NULL,
  `PM10` float NOT NULL,
  `O3` float NOT NULL,
  `Temperature` double DEFAULT NULL,
  `ObjectId` float NOT NULL,
  `ObjectId2` int(64) NOT NULL,
  `NVPM10` float NOT NULL,
  `VPM10` float NOT NULL,
  `NVPM2_5` float NOT NULL,
  `PM2_5` float NOT NULL,
  `VPM2_5` float NOT NULL,
  `CO` float NOT NULL,
  `RH` float NOT NULL,
  `Pressure` float NOT NULL,
  `SO2` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Schema`
--

CREATE TABLE `Schema` (
  `Schema_ID` int(11) NOT NULL,
  `Measure` varchar(50) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Station`
--

CREATE TABLE `Station` (
  `Site_id` int(11) NOT NULL,
  `Station_name` varchar(50) NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `Constituency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Constituencies`
--
ALTER TABLE `Constituencies`
  ADD PRIMARY KEY (`Constituency_id`);

--
-- Indexes for table `Reading`
--
ALTER TABLE `Reading`
  ADD PRIMARY KEY (`Reading_id`),
  ADD KEY `Reading_FK` (`Site_id`);

--
-- Indexes for table `Schema`
--
ALTER TABLE `Schema`
  ADD PRIMARY KEY (`Schema_ID`);

--
-- Indexes for table `Station`
--
ALTER TABLE `Station`
  ADD PRIMARY KEY (`Site_id`),
  ADD KEY `Station_FK` (`Constituency_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Reading`
--
ALTER TABLE `Reading`
  ADD CONSTRAINT `Reading_FK` FOREIGN KEY (`Site_id`) REFERENCES `station` (`Site_id`);

--
-- Constraints for table `Station`
--
ALTER TABLE `Station`
  ADD CONSTRAINT `Station_FK` FOREIGN KEY (`Constituency_id`) REFERENCES `constituencies` (`Constituency_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
