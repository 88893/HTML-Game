-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2023 at 12:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verzameling`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestellingen`
--

CREATE TABLE `bestellingen` (
  `bestelling_id` int(11) NOT NULL,
  `product_naam` varchar(255) DEFAULT NULL,
  `naam` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `nummer` int(11) DEFAULT NULL,
  `besteld_op` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellingen`
--

INSERT INTO `bestellingen` (`bestelling_id`, `product_naam`, `naam`, `email`, `adres`, `nummer`, `besteld_op`) VALUES
(13, 'The Lion King (CD)', 'gerda12@rr', 'gerda12@rr', 'gerda12@rr', 23, '2023-10-13 04:48:38'),
(14, 'The Lion King (CD)', 'dwd', 'fwefew@ae', 'nozem', 3213444, '2023-10-13 04:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nummer` varchar(20) DEFAULT NULL,
  `bericht` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `naam`, `email`, `nummer`, `bericht`) VALUES
(3, 'Precious ', 'fwefew@ae', 'efwewffwe', 'ewfewfewf');

-- --------------------------------------------------------

--
-- Table structure for table `gebruikers`
--

CREATE TABLE `gebruikers` (
  `id` int(11) NOT NULL,
  `gebruikersnaam` varchar(255) NOT NULL,
  `wachtwoord` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gebruikers`
--

INSERT INTO `gebruikers` (`id`, `gebruikersnaam`, `wachtwoord`) VALUES
(1, 'JoshuaAdmin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) DEFAULT 1,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `available`, `image_url`) VALUES
(1, 'The Lion King (CD)', '\"The Lion King\" is een episch verhaal over Simba, een jonge leeuw die zijn rechtmatige plek als koning van de savanne opeist na het onrechtmatige vertrek van zijn vader Mufasa. Met een ontroerende mix van humor, drama en muziek onderzoekt de film het pad van volwassen worden, verantwoordelijkheid nemen en het vinden van je ware roeping.', 15.00, 23, 'https://cdn.discordapp.com/attachments/1076950186699526214/1160148688409219092/scale.png?ex=65339ba9&is=652126a9&hm=bfe6f5655790d8232edc47219c4437933ada8ee3053ea1387aad1a0399bdf025&'),
(2, 'Lilo And Stitch (CD)', '\"Lilo & Stitch\" is een hartverwarmende Disney-animatiefilm over een Hawaiiaans meisje, Lilo, en haar buitenaardse vriend, Stitch. Samen leren ze over familie, vriendschap en acceptatie op het prachtige eiland Hawaï. Een ontroerend verhaal dat humor en liefde combineert voor alle leeftijden.', 18.00, 22, 'https://www.wdw-magazine.com/wp-content/uploads/2023/03/Lilo-and-Stitch-Easter-Eggs.jpeg'),
(3, 'Lady And The Tramp (CD)', '\"Lady and the Tramp\" is een Disney-meesterwerk over Lady, een chique Cocker Spaniel, en Tramp, een zwerfhond. Hun onwaarschijnlijke romance ontvouwt zich terwijl ze samen avonturen beleven en leren dat liefde de barrières van klasse en achtergrond overstijgt. Een tijdloos verhaal over liefde en vriendschap, verpakt in animatiepracht.', 15.00, 45, 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/49431037639D1AAD54CB221472A227C905C71F72CD1035E3968663248BE7DD10/scale?width=1200&aspectRatio=1.78&format=jpeg'),
(4, 'Avengers Endgame (DVD)', '\"Avengers: Endgame\" is het epische slotstuk van het Marvel Cinematic Universe. De overgebleven helden bundelen hun krachten om Thanos te verslaan en de vernietigde wereld te herstellen. De film barst van actie, emotie en verrassingen, en biedt een bevredigend einde aan het verhaal dat meer dan een decennium heeft opgebouwd.', 20.00, 45, 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/DB176BD1488D7E4822256EF1778C124FC17388FC1E7F0F6D89B38AFF5FB001F6/scale?width=1200&aspectRatio=1.78&format=jpeg'),
(5, 'Avengers Infinity War (DVD)', '\"Avengers: Infinity War\" is een episch superheldenavontuur waarin de Avengers en hun bondgenoten proberen de kwaadaardige Thanos te stoppen. Thanos wil met de Infinity Stones het universum vernietigen. Het leidt tot een spectaculaire strijd vol actie, opoffering en verrassende wendingen, waardoor het Marvel Cinematic Universe wordt getransformeerd.', 12.00, 45, 'https://i.ytimg.com/vi/QwievZ1Tx-8/maxresdefault.jpg'),
(6, 'Spider man Homecoming (DVD)', '\"Spider-Man: Homecoming\" brengt de iconische webslingeraar, Spider-Man, terug naar zijn roots als tiener. Peter Parker worstelt met de balans tussen school en superheldendom. Onder begeleiding van zijn mentor Tony Stark, moet hij de schurk Vulture stoppen en ontdekt hij de ware betekenis van verantwoordelijkheid. Een spannend en humorvol avontuur.', 16.00, 45, 'https://cdn.wallpapersafari.com/41/90/xENrYV.png'),
(7, 'The Little Mermaid           \r\n(BLU RAY DISC)', 'Herschrijft het geliefde verhaal van Ariel, een nieuwsgierige zeemeermin die verlangt naar het leven op het land en, tegen de wens van haar vader in, het oppervlak bezoekt. Ariel bevindt zich op een onverwachte reis van zelfontdekking als ze een prins, een zeeheks en een ongelooflijke nieuwe wereld tegenkomt', 14.00, 45, 'https://media.discordapp.net/attachments/1076950186699526214/1160755673013944360/en_the-little-mermaid_thumbnail_83f41729.png?ex=6535d0f6&is=65235bf6&hm=60f8787f6ea10137e3d1fade53aef35e9c38f719e7833bcd8d9cc9d62e55a3ff&=&width=1440&height=812'),
(8, 'Maleficent (BLU RAY DISC)', 'Angelina Jolie speelt de hoofdrol in het onvertelde verhaal van de meest iconische schurk van Disney uit de klassieker Doornroosje. Gedreven door wraak legt Maleficent een vloek op de pasgeboren baby Aurora van de koning, alleen om te ontdekken dat zij wellicht de sleutel tot vrede in het land in handen heeft.', 20.00, 45, 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/91BB19136BA931EA9CAAA787CD2D434CD0B3BEB71D65A5EAB95A97727F6F4A04/scale?width=1200&aspectRatio=1.78&format=jpeg'),
(9, 'The Jungle Book (BLU RAY DISC) ', '\"Het Jungleboek\" is een Disney-klassieker die het avontuur van Mowgli in de jungle volgt. Met Baloe de beer en Bagheera de panter als vrienden, ontdekt Mowgli zijn ware identiteit en confronteert hij Shere Khan. Een tijdloos verhaal over vriendschap en avontuur.', 20.00, 40, 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/7F65017703A0D3FC095BDD21A5D518FDC6AEA56D0D5280786A15F0AF1E83FE27/scale?width=1200&aspectRatio=1.78&format=jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`bestelling_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `bestelling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
