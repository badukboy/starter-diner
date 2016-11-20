-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- 생성 시간: 16-11-04 23:28
-- 서버 버전: 10.1.16-MariaDB
-- PHP 버전: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `lab5`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `categories`
--

CREATE TABLE `categories` (
  `id` varchar(1) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`) VALUES
('d', 'Drinks', 'Purees made from the finest of Venusian insects, government-inspected.', 'catd.png'),
('m', 'Mains', 'Made from only the finest ingredients found deep in the Martian jungle, and harvested or slaughtered by academy-trained druids, we bring you 45 day aged premium "meat".', 'catm.png'),
('s', 'Sides', 'Perfect accompaniments to our mains, these side dish pairings have been exclsisvely formulated by Ben & Jerry.', 'cats.png');

-- --------------------------------------------------------

--
-- 테이블 구조 `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('67fd9371808f60dcd8911992a52f249891ea7f59', '127.0.0.1', 1478287284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383238363939353b),
('fb026cecc0b085d26d63bfb1117a5b4c02455923', '127.0.0.1', 1478287810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383238373632373b),
('cca9d88cd4fe764d2bf74054b7940286bdec1223', '127.0.0.1', 1478288095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383238383038303b),
('6b9b11d006c29fcdc507c9c8766791af76a94042', '127.0.0.1', 1478288720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383238383732303b),
('ef348996c7f01798af14569899c0c7ef0a8f1f33', '127.0.0.1', 1478292302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239323132313b),
('8cf5549ae03f986acf20f2a2cd07a83e60155087', '127.0.0.1', 1478292673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239323538323b),
('64cb978e4290a2723d9ec0338e6103297071fc30', '127.0.0.1', 1478293037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239323932393b),
('a6318111158504e411384f80d24ae359d2aa94eb', '127.0.0.1', 1478293420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239333432303b),
('7588a361f16f546d3bcf8ff75a4547c11b213890', '127.0.0.1', 1478294118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239333833363b),
('8382906ab17d2b1952f6ab157208e8f4f7e2c287', '127.0.0.1', 1478294166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313437383239343134383b);

-- --------------------------------------------------------

--
-- 테이블 구조 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `category` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `orderitems`
--

CREATE TABLE `orderitems` (
  `order` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `special` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `orders`
--

CREATE TABLE `orders` (
  `num` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `customer` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- 테이블의 인덱스 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order`,`item`);

--
-- 테이블의 인덱스 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`num`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
