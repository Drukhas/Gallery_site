-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 08:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `ArtistID` int(11) NOT NULL,
  `ArtistName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`ArtistID`, `ArtistName`) VALUES
(1, 'Vincent van Gogh'),
(2, 'Leonardo da Vinci'),
(3, 'Pablo Picasso');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `ImageID` int(11) NOT NULL,
  `ImageName` varchar(255) NOT NULL,
  `ImageDescription` text DEFAULT NULL,
  `ArtistID` int(11) DEFAULT NULL,
  `ImageLink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`ImageID`, `ImageName`, `ImageDescription`, `ArtistID`, `ImageLink`) VALUES
(1, 'Starry Night', 'A painting of a night sky with swirling clouds.', 1, 'https://images.squarespace-cdn.com/content/v1/64094e12e9d0280deb754df1/1678333063489-ZYF8SL4Y2IEX7G8H18GB/unnamed.jpg'),
(2, 'Mona Lisa', 'A portrait painting of a woman with a mysterious smile.', 2, 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU'),
(3, 'Guernica', 'A mural-sized oil painting depicting the horrors of war.', 3, 'https://upload.wikimedia.org/wikipedia/en/7/74/PicassoGuernica.jpg'),
(4, 'The Starry Night', 'Another painting of a night sky with swirling clouds.', 1, 'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0xOTdiYXRjaDItdGVjaGktMDdfMS5qcGc.jpg'),
(5, 'The Last Supper', 'A mural painting of Jesus and his disciples at the Last Supper.', 2, 'https://upload.wikimedia.org/wikipedia/commons/4/4b/%C3%9Altima_Cena_-_Da_Vinci_5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Email`, `Password`) VALUES
('john_doe', 'john.doe@example.com', 'johns_password'),
('jane_smith', 'jane.smith@example.com', 'janes_password'),
('bob_jones', 'bob.jones@example.com', 'bobs_password'),
('alice_williams', 'alice.williams@example.com', 'alices_password'),
(NULL, NULL, NULL),
('atom', 'ok@hotmail.com', '123456789'),
('atom', 'ok@hotmail.com', '123456789'),
('atom', 'ok@hotmail.com', '123456789'),
('atom', 'yeaboi@hotmail.com', '123456789'),
('Henry', 'madtruck@hotmail.com', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`ArtistID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `ArtistID` (`ArtistID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `ArtistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artists` (`ArtistID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
