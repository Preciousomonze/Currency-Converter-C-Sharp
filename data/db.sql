-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2018 at 12:34 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `currency_converter`
--
CREATE DATABASE IF NOT EXISTS `currency_converter` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `currency_converter`;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(200) COLLATE utf8_bin NOT NULL,
  `currency_symbol` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `currency_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `rate` decimal(16,7) DEFAULT NULL COMMENT 'The conversion based on the US Dollar',
  `date_time_updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `currency_symbol`, `currency_name`, `rate`, `date_time_updated`) VALUES
(1, 'ALL', 'Lek', 'Albanian Lek', '107.8000030', '2018-07-18 13:24:17'),
(2, 'XCD', '$', 'East Caribbean Dollar', '2.6975640', '2018-07-18 13:21:39'),
(3, 'EUR', '€', 'Euro', '0.8611000', '2018-07-18 13:21:40'),
(4, 'BBD', '$', 'Barbadian Dollar', '2.0000000', '2018-07-18 13:21:40'),
(5, 'BTN', NULL, 'Bhutanese Ngultrum', '68.3749930', '2018-07-18 13:21:40'),
(6, 'BND', '$', 'Brunei Dollar', '1.3507060', '2018-07-18 13:21:41'),
(7, 'XAF', NULL, 'Central African CFA Franc', '564.5100100', '2018-07-18 13:21:41'),
(8, 'CUP', '$', 'Cuban Peso', '26.5000000', '2018-07-18 13:21:41'),
(9, 'USD', '$', 'United States Dollar', '1.0000000', '2018-07-18 13:27:37'),
(10, 'FKP', '£', 'Falkland Islands Pound', '0.7623030', '2018-07-18 13:21:42'),
(11, 'GIP', '£', 'Gibraltar Pound', '0.7625020', '2018-07-18 13:21:42'),
(12, 'HUF', 'Ft', 'Hungarian Forint', '279.0100100', '2018-07-18 13:21:42'),
(13, 'IRR', '﷼', 'Iranian Rial', '43499.9997320', '2018-07-18 13:21:43'),
(14, 'JMD', 'J$', 'Jamaican Dollar', '130.3899990', '2018-07-18 13:21:43'),
(15, 'AUD', '$', 'Australian Dollar', '1.3593990', '2018-07-18 13:21:43'),
(16, 'LAK', '₭', 'Lao Kip', '8404.9998410', '2018-07-18 13:21:43'),
(17, 'LYD', NULL, 'Libyan Dinar', '1.3687020', '2018-07-18 13:21:44'),
(18, 'MKD', 'ден', 'Macedonian Denar', '52.7400020', '2018-07-18 13:21:44'),
(19, 'XOF', NULL, 'West African CFA Franc', '564.5100100', '2018-07-18 13:21:45'),
(20, 'NZD', '$', 'New Zealand Dollar', '1.4786990', '2018-07-18 13:21:45'),
(21, 'OMR', '﷼', 'Omani Rial', '0.3847010', '2018-07-18 13:21:45'),
(22, 'PGK', NULL, 'Papua New Guinean Kina', '3.2977960', '2018-07-18 13:21:46'),
(23, 'RWF', NULL, 'Rwandan Franc', '852.7000120', '2018-07-18 13:21:46'),
(24, 'WST', NULL, 'Samoan Tala', '2.6125990', '2018-07-18 13:21:46'),
(25, 'RSD', 'Дин.', 'Serbian Dinar', '101.0783990', '2018-07-18 13:21:46'),
(26, 'SEK', 'kr', 'Swedish Krona', '8.8774300', '2018-07-18 13:21:47'),
(27, 'TZS', 'TSh', 'Tanzanian Shilling', '2272.0003730', '2018-07-18 13:21:47'),
(28, 'AMD', NULL, 'Armenian Dram', '479.8699950', '2018-07-18 13:21:47'),
(29, 'BSD', '$', 'Bahamian Dollar', '1.0000000', '2018-07-18 13:21:48'),
(30, 'BAM', 'KM', 'Bosnia And Herzegovina Konvertibilna Marka', '1.6870560', '2018-07-18 13:21:48'),
(31, 'CVE', NULL, 'Cape Verdean Escudo', '94.5175910', '2018-07-18 13:21:48'),
(32, 'CNY', '¥', 'Chinese Yuan', '6.7175010', '2018-07-18 13:21:49'),
(33, 'CRC', '₡', 'Costa Rican Colon', '563.9000240', '2018-07-18 13:21:49'),
(34, 'CZK', 'Kč', 'Czech Koruna', '22.2611990', '2018-07-18 13:21:49'),
(35, 'ERN', NULL, 'Eritrean Nakfa', '14.9900040', '2018-07-18 13:21:49'),
(36, 'GEL', NULL, 'Georgian Lari', '2.4388020', '2018-07-18 13:21:50'),
(37, 'HTG', NULL, 'Haitian Gourde', '67.3899990', '2018-07-18 13:21:50'),
(38, 'INR', '₹', 'Indian Rupee', '68.6172030', '2018-07-18 13:21:50'),
(39, 'JOD', NULL, 'Jordanian Dinar', '0.7091990', '2018-07-18 13:21:51'),
(40, 'KRW', '₩', 'South Korean Won', '1132.4699710', '2018-07-18 13:21:51'),
(41, 'LBP', '£', 'Lebanese Lira', '1504.9997910', '2018-07-18 13:21:51'),
(42, 'MWK', NULL, 'Malawian Kwacha', '716.4199830', '2018-07-18 13:21:51'),
(43, 'MRO', NULL, 'Mauritanian Ouguiya', '354.9997670', '2018-07-18 13:21:52'),
(44, 'MZN', NULL, 'Mozambican Metical', '57.9000020', '2018-07-18 13:21:52'),
(45, 'ANG', 'ƒ', 'Netherlands Antillean Gulden', '1.8401830', '2018-07-18 13:21:52'),
(46, 'PEN', 'S/.', 'Peruvian Nuevo Sol', '3.2705020', '2018-07-18 13:21:53'),
(47, 'QAR', '﷼', 'Qatari Riyal', '3.6397970', '2018-07-18 13:21:53'),
(48, 'STD', NULL, 'Sao Tome And Principe Dobra', '21106.0996090', '2018-07-18 13:21:53'),
(49, 'SLL', NULL, 'Sierra Leonean Leone', '8199.9997830', '2018-07-18 13:21:53'),
(50, 'SOS', 'S', 'Somali Shilling', '570.9999720', '2018-07-18 13:21:54'),
(51, 'SDG', NULL, 'Sudanese Pound', '17.9550990', '2018-07-18 13:21:54'),
(52, 'SYP', '£', 'Syrian Pound', '514.9799800', '2018-07-18 13:21:54'),
(53, 'AOA', NULL, 'Angolan Kwanza', '253.6170040', '2018-07-18 13:21:55'),
(54, 'AWG', 'ƒ', 'Aruban Florin', '1.7800000', '2018-07-18 13:21:55'),
(55, 'BHD', NULL, 'Bahraini Dinar', '0.3781000', '2018-07-18 13:21:55'),
(56, 'BZD', 'BZ$', 'Belize Dollar', '1.9977990', '2018-07-18 13:21:56'),
(57, 'BWP', 'P', 'Botswana Pula', '10.2936990', '2018-07-18 13:21:56'),
(58, 'BIF', NULL, 'Burundi Franc', '1750.9799800', '2018-07-18 13:21:56'),
(59, 'KYD', '$', 'Cayman Islands Dollar', '0.8197670', '2018-07-18 13:21:56'),
(60, 'COP', '$', 'Colombian Peso', '2867.5000000', '2018-07-18 13:21:57'),
(61, 'DKK', 'kr', 'Danish Krone', '6.4205600', '2018-07-18 13:21:57'),
(62, 'GTQ', 'Q', 'Guatemalan Quetzal', '7.4904990', '2018-07-18 13:21:57'),
(63, 'HNL', 'L', 'Honduran Lempira', '23.9239820', '2018-07-18 13:21:58'),
(64, 'IDR', 'Rp', 'Indonesian Rupiah', '14400.0000000', '2018-07-18 13:21:58'),
(65, 'ILS', '₪', 'Israeli New Sheqel', '3.6445030', '2018-07-18 13:21:58'),
(66, 'KZT', 'лв', 'Kazakhstani Tenge', '344.8599850', '2018-07-18 13:21:59'),
(67, 'KWD', NULL, 'Kuwaiti Dinar', '0.3029040', '2018-07-18 13:21:59'),
(68, 'LSL', NULL, 'Lesotho Loti', '13.2598440', '2018-07-18 13:21:59'),
(69, 'MYR', 'RM', 'Malaysian Ringgit', '4.0506010', '2018-07-18 13:21:59'),
(70, 'MUR', '₨', 'Mauritian Rupee', '34.2000010', '2018-07-18 13:22:00'),
(71, 'MNT', '₮', 'Mongolian Tugrik', '2456.1999510', '2018-07-18 13:22:00'),
(72, 'MMK', NULL, 'Myanma Kyat', '1432.0002650', '2018-07-18 13:22:01'),
(73, 'NGN', '₦', 'Nigerian Naira', '359.0000970', '2018-07-18 13:27:38'),
(74, 'PAB', 'B/.', 'Panamanian Balboa', '1.0000000', '2018-07-18 13:22:01'),
(75, 'PHP', '₱', 'Philippine Peso', '53.5201850', '2018-07-18 13:22:01'),
(76, 'RON', 'lei', 'Romanian Leu', '4.0080290', '2018-07-18 13:22:01'),
(77, 'SAR', '﷼', 'Saudi Riyal', '3.7501010', '2018-07-18 13:22:02'),
(78, 'SGD', '$', 'Singapore Dollar', '1.3684600', '2018-07-18 13:22:02'),
(79, 'ZAR', 'R', 'South African Rand', '13.3299000', '2018-07-18 13:22:03'),
(80, 'SRD', '$', 'Surinamese Dollar', '7.4198680', '2018-07-18 13:22:03'),
(81, 'TWD', 'NT$', 'New Taiwan Dollar', '30.6240010', '2018-07-18 13:22:03'),
(82, 'TOP', NULL, 'Paanga', '2.3279760', '2018-07-18 13:22:03'),
(83, 'VEF', NULL, 'Venezuelan Bolivar', '119700.0004710', '2018-07-18 13:22:04'),
(84, 'DZD', NULL, 'Algerian Dinar', '117.8840030', '2018-07-18 13:22:04'),
(85, 'ARS', '$', 'Argentine Peso', '27.4920010', '2018-07-18 13:22:04'),
(86, 'AZN', 'ман', 'Azerbaijani Manat', '1.6994950', '2018-07-18 13:22:04'),
(87, 'BYR', 'p.', 'Belarusian Ruble', '19600.0000000', '2018-07-18 13:22:05'),
(88, 'BOB', '$b', 'Bolivian Boliviano', '6.8604790', '2018-07-18 13:22:05'),
(89, 'BGN', 'лв', 'Bulgarian Lev', '1.6706000', '2018-07-18 13:22:05'),
(90, 'CAD', '$', 'Canadian Dollar', '1.3249000', '2018-07-18 13:22:06'),
(91, 'CLP', '$', 'Chilean Peso', '655.7999880', '2018-07-18 13:22:06'),
(92, 'CDF', NULL, 'Congolese Franc', '1565.5023500', '2018-07-18 13:22:06'),
(93, 'DOP', 'RD$', 'Dominican Peso', '49.7999990', '2018-07-18 13:22:07'),
(94, 'FJD', '$', 'Fijian Dollar', '2.0925040', '2018-07-18 13:22:07'),
(95, 'GMD', NULL, 'Gambian Dalasi', '47.4500010', '2018-07-18 13:22:07'),
(96, 'GYD', '$', 'Guyanese Dollar', '207.2700040', '2018-07-18 13:22:07'),
(97, 'ISK', 'kr', 'Icelandic Króna', '106.8000030', '2018-07-18 13:22:08'),
(98, 'IQD', NULL, 'Iraqi Dinar', '1184.0000000', '2018-07-18 13:22:08'),
(99, 'JPY', '¥', 'Japanese Yen', '112.9570010', '2018-07-18 13:22:08'),
(100, 'KPW', '₩', 'North Korean Won', '899.9999200', '2018-07-18 13:22:09'),
(101, 'LVL', 'Ls', 'Latvian Lats', '0.6205500', '2018-07-18 13:22:09'),
(102, 'CHF', 'Fr.', 'Swiss Franc', '1.0003010', '2018-07-18 13:22:09'),
(103, 'MGA', NULL, 'Malagasy Ariary', '3270.0000080', '2018-07-18 13:22:10'),
(104, 'MDL', NULL, 'Moldovan Leu', '16.6149720', '2018-07-18 13:22:10'),
(105, 'MAD', NULL, 'Moroccan Dirham', '9.4905010', '2018-07-18 13:22:10'),
(106, 'NPR', '₨', 'Nepalese Rupee', '109.2149960', '2018-07-18 13:22:11'),
(107, 'NIO', 'C$', 'Nicaraguan Cordoba', '31.6205010', '2018-07-18 13:22:11'),
(108, 'PKR', '₨', 'Pakistani Rupee', '127.8799970', '2018-07-18 13:22:11'),
(109, 'PYG', 'Gs', 'Paraguayan Guarani', '5710.0000470', '2018-07-18 13:22:12'),
(110, 'SHP', '£', 'Saint Helena Pound', '0.7625020', '2018-07-18 13:22:12'),
(111, 'SCR', '₨', 'Seychellois Rupee', '13.4299260', '2018-07-18 13:22:12'),
(112, 'SBD', '$', 'Solomon Islands Dollar', '7.8715010', '2018-07-18 13:22:13'),
(113, 'LKR', '₨', 'Sri Lankan Rupee', '159.8000030', '2018-07-18 13:22:13'),
(114, 'THB', '฿', 'Thai Baht', '33.3499980', '2018-07-18 13:22:13'),
(115, 'TRY', NULL, 'Turkish New Lira', '4.8281990', '2018-07-18 13:22:14'),
(116, 'AED', NULL, 'UAE Dirham', '3.6729020', '2018-07-18 13:22:14'),
(117, 'VUV', NULL, 'Vanuatu Vatu', '110.8399960', '2018-07-18 13:22:14'),
(118, 'YER', '﷼', 'Yemeni Rial', '249.8500060', '2018-07-18 13:22:14'),
(119, 'AFN', '؋', 'Afghan Afghani', '72.5999980', '2018-07-18 13:22:15'),
(120, 'BDT', NULL, 'Bangladeshi Taka', '83.7503450', '2018-07-18 13:22:15'),
(121, 'BRL', 'R$', 'Brazilian Real', '3.8374990', '2018-07-18 13:22:15'),
(122, 'KHR', '៛', 'Cambodian Riel', '4024.1000980', '2018-07-18 13:22:16'),
(123, 'KMF', NULL, 'Comorian Franc', '419.2799990', '2018-07-18 13:22:16'),
(124, 'HRK', 'kn', 'Croatian Kuna', '6.3623990', '2018-07-18 13:22:16'),
(125, 'DJF', NULL, 'Djiboutian Franc', '177.5012610', '2018-07-18 13:22:16'),
(126, 'EGP', '£', 'Egyptian Pound', '17.8400660', '2018-07-18 13:22:17'),
(127, 'ETB', NULL, 'Ethiopian Birr', '27.3210990', '2018-07-18 13:22:17'),
(128, 'XPF', NULL, 'CFP Franc', '102.7889840', '2018-07-18 13:22:17'),
(129, 'GHS', NULL, 'Ghanaian Cedi', '4.7784970', '2018-07-18 13:22:18'),
(130, 'GNF', NULL, 'Guinean Franc', '9017.0000740', '2018-07-18 13:22:18'),
(131, 'HKD', '$', 'Hong Kong Dollar', '7.8494990', '2018-07-18 13:22:18'),
(132, 'XDR', NULL, 'Special Drawing Rights', '0.7107920', '2018-07-18 13:22:18'),
(133, 'KES', 'KSh', 'Kenyan Shilling', '100.3499980', '2018-07-18 13:22:19'),
(134, 'KGS', 'лв', 'Kyrgyzstani Som', '68.1529010', '2018-07-18 13:22:19'),
(135, 'LRD', '$', 'Liberian Dollar', '161.3000030', '2018-07-18 13:22:19'),
(136, 'MOP', NULL, 'Macanese Pataca', '8.0845040', '2018-07-18 13:22:20'),
(137, 'MVR', NULL, 'Maldivian Rufiyaa', '15.5696560', '2018-07-18 13:22:20'),
(138, 'MXN', '$', 'Mexican Peso', '19.0079010', '2018-07-18 13:22:20'),
(139, 'NAD', '$', 'Namibian Dollar', '13.3290310', '2018-07-18 13:22:21'),
(140, 'NOK', 'kr', 'Norwegian Krone', '8.1816200', '2018-07-18 13:22:21'),
(141, 'PLN', 'zł', 'Polish Zloty', '3.7126020', '2018-07-18 13:22:21'),
(142, 'RUB', 'руб', 'Russian Ruble', '63.1025010', '2018-07-18 13:22:21'),
(143, 'SZL', NULL, 'Swazi Lilangeni', '13.3157990', '2018-07-18 13:22:22'),
(144, 'TJS', NULL, 'Tajikistani Somoni', '9.4190960', '2018-07-18 13:22:22'),
(145, 'TTD', 'TT$', 'Trinidad and Tobago Dollar', '6.7075000', '2018-07-18 13:22:22'),
(146, 'UGX', 'USh', 'Ugandan Shilling', '3683.9999330', '2018-07-18 13:22:23'),
(147, 'UYU', '$U', 'Uruguayan Peso', '31.2649990', '2018-07-18 13:22:23'),
(148, 'VND', '₫', 'Vietnamese Dong', '23048.0000000', '2018-07-18 13:22:23'),
(149, 'TND', NULL, 'Tunisian Dinar', '2.6297620', '2018-07-18 13:22:24'),
(150, 'UAH', '₴', 'Ukrainian Hryvnia', '26.2800010', '2018-07-18 13:22:24'),
(151, 'UZS', 'лв', 'Uzbekistani Som', '7764.9998190', '2018-07-18 13:22:24'),
(152, 'TMT', NULL, 'Turkmenistan Manat', '3.4100000', '2018-07-18 13:22:24'),
(153, 'GBP', '£', 'British Pound', '0.7677400', '2018-07-18 13:27:38'),
(154, 'ZMW', NULL, 'Zambian Kwacha', '9.9501120', '2018-07-18 13:22:25'),
(155, 'BTC', 'BTC', 'Bitcoin', '0.0001350', '2018-07-18 13:22:25'),
(156, 'BYN', 'p.', 'New Belarusian Ruble', '1.9697540', '2018-07-18 13:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `_from` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'e.g 2 USD',
  `_to` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'e.g NGN',
  `exchange_rate` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'e.g 1 USD = 360 NGN'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='For storing history of conversions done';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_code` (`currency_code`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
