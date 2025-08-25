-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.25-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema gestionale_sett2025
--

CREATE DATABASE IF NOT EXISTS gestionale_sett2025;
USE gestionale_sett2025;

--
-- Definition of table `comande`
--

DROP TABLE IF EXISTS `comande`;
CREATE TABLE `comande` (
  `serata` date NOT NULL,
  `tavolo` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `menu` varchar(50) NOT NULL,
  `responsabile` varchar(50) NOT NULL,
  `numero_soci` int(10) unsigned DEFAULT '0',
  `pagata` tinyint(1) NOT NULL DEFAULT '1',
  `attiva` tinyint(1) NOT NULL DEFAULT '1',
  `num_comanda` int(11) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `annotazioni` text,
  `sconto_manuale` decimal(5,2) unsigned DEFAULT '0.00',
  `conto_inviato` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serata`,`tavolo`,`indice`),
  KEY `tavolocom_idx` (`tavolo`),
  KEY `seratacom_idx` (`serata`),
  KEY `indicecom_idx` (`indice`),
  KEY `menfissocom_idx` (`menu`),
  KEY `respcom_idx` (`responsabile`),
  CONSTRAINT `menfissocom` FOREIGN KEY (`menu`) REFERENCES `menu` (`nome_menu`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `respcom` FOREIGN KEY (`responsabile`) REFERENCES `responsabili` (`nome`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seratacom` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tavolocom` FOREIGN KEY (`tavolo`) REFERENCES `tavoli` (`numero_tavolo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comande`
--

/*!40000 ALTER TABLE `comande` DISABLE KEYS */;
/*!40000 ALTER TABLE `comande` ENABLE KEYS */;


--
-- Definition of table `composizionemenu`
--

DROP TABLE IF EXISTS `composizionemenu`;
CREATE TABLE `composizionemenu` (
  `menu` varchar(50) NOT NULL,
  `portata` varchar(100) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu`,`portata`),
  KEY `nome portata_idx` (`portata`),
  CONSTRAINT `nome menu` FOREIGN KEY (`menu`) REFERENCES `menu` (`nome_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nome portata` FOREIGN KEY (`portata`) REFERENCES `portata` (`nome_portata`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composizionemenu`
--


/*!40000 ALTER TABLE `composizionemenu` ENABLE KEYS */;


--
-- Definition of table `composizioneportata`
--

DROP TABLE IF EXISTS `composizioneportata`;
CREATE TABLE `composizioneportata` (
  `portata` varchar(100) NOT NULL,
  `materia_prima` varchar(40) NOT NULL,
  `peso` decimal(6,3) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`portata`,`materia_prima`),
  KEY `nome materia1_idx` (`materia_prima`),
  CONSTRAINT `nome materia1` FOREIGN KEY (`materia_prima`) REFERENCES `materieprime` (`nome_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nome portata1` FOREIGN KEY (`portata`) REFERENCES `portata` (`nome_portata`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composizioneportata`
--

/*!40000 ALTER TABLE `composizioneportata` DISABLE KEYS */;
/*!40000 ALTER TABLE `composizioneportata` ENABLE KEYS */;


--
-- Definition of table `materieprime`
--

DROP TABLE IF EXISTS `materieprime`;
CREATE TABLE `materieprime` (
  `nome_materia` varchar(40) NOT NULL,
  `genere` varchar(45) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materieprime`
--

/*!40000 ALTER TABLE `materieprime` DISABLE KEYS */;
/*!40000 ALTER TABLE `materieprime` ENABLE KEYS */;


--
-- Definition of table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nome_menu` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fisso` tinyint(1) NOT NULL DEFAULT '0',
  `prezzo_fisso` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`nome_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `nome_menu`, `data_creazione`, `data_aggiornamento`, `fisso`, `prezzo_fisso`) VALUES
	(2, 'Cantinetta', '2020-08-25 19:56:30', '2020-08-25 19:56:30', 0, NULL),
	(1, 'Standard', '2019-08-28 22:06:10', '2019-08-28 22:06:10', 0, NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


--
-- Definition of table `menuserata`
--

DROP TABLE IF EXISTS `menuserata`;
CREATE TABLE `menuserata` (
  `menu` varchar(50) NOT NULL,
  `serata` date NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu`,`serata`),
  KEY `data serata_idx` (`serata`),
  CONSTRAINT `data serata` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nome menu1` FOREIGN KEY (`menu`) REFERENCES `menu` (`nome_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menuserata`
--

/*!40000 ALTER TABLE `menuserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuserata` ENABLE KEYS */;


--
-- Definition of table `ordini`
--

DROP TABLE IF EXISTS `ordini`;
CREATE TABLE `ordini` (
  `quantita` int(11) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `serata` date NOT NULL,
  `tavolo` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `portata` varchar(100) NOT NULL,
  PRIMARY KEY (`serata`,`tavolo`,`indice`,`portata`),
  KEY `tavoloord_idx` (`tavolo`),
  KEY `indiceord_idx` (`indice`),
  KEY `portataord_idx` (`portata`),
  KEY `serataord_idx` (`serata`),
  CONSTRAINT `indiceord` FOREIGN KEY (`indice`) REFERENCES `comande` (`indice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `portataord` FOREIGN KEY (`portata`) REFERENCES `portata` (`nome_portata`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `serataord` FOREIGN KEY (`serata`) REFERENCES `comande` (`serata`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tavoloord` FOREIGN KEY (`tavolo`) REFERENCES `comande` (`tavolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordini`
--

/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;


--
-- Definition of table `portata`
--

DROP TABLE IF EXISTS `portata`;
CREATE TABLE `portata` (
  `id` int(11) NOT NULL,
  `nome_portata` varchar(100) NOT NULL,
  `categoria` enum('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce','cantinetta') NOT NULL,
  `prezzo_finale` decimal(5,2) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome_portata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portata`
--

/*!40000 ALTER TABLE `portata` DISABLE KEYS */;
INSERT INTO `portata` (`id`, `nome_portata`, `categoria`, `prezzo_finale`, `data_creazione`, `data_aggiornamento`) VALUES
	(91, 'Acchiappafemmine e Acchiappamaschi', 'dolce', 5.00, '2024-05-25 07:56:11', '2024-09-01 12:33:29'),
	(92, 'Acchiappafemmine e Acchiappamaschi FISSO', 'dolce', 5.00, '2024-05-25 07:56:37', '2025-05-24 13:19:00'),
	(117, 'Acqua frizzante 1 lt.', 'bevanda', 2.00, '2019-08-28 19:52:07', '2024-09-01 12:40:35'),
	(118, 'Acqua frizzante 1 lt. FISSO', 'bevanda', 2.00, '2019-08-28 19:52:07', '2024-09-01 12:40:37'),
	(115, 'Acqua naturale 1 lt.', 'bevanda', 2.00, '2019-08-28 19:51:46', '2024-09-01 12:40:31'),
	(116, 'Acqua naturale 1 lt. FISSO', 'bevanda', 2.00, '2019-08-28 19:51:46', '2024-09-01 12:40:33'),
	(132, 'Adarmando IGT TABARRINI', 'bevanda', 24.00, '2025-05-24 13:42:07', '2025-05-24 13:42:11'),
	(132, 'Adarmando IGT TABARRINI FISSO', 'bevanda', 24.00, '2025-05-24 13:42:40', '2025-05-24 13:42:42'),
	(17, 'Antipasto Sette Selle', 'antipasto', 7.00, '2019-08-28 19:35:04', '2024-09-01 12:02:22'),
	(18, 'Antipasto Sette Selle FISSO', 'antipasto', 7.00, '2019-08-28 19:35:04', '2024-09-01 12:02:24'),
	(101, 'Birra Corona 33cl', 'cantinetta', 3.50, '2019-08-28 19:37:21', '2024-09-01 12:36:00'),
	(105, 'Birra ichnusa non filtrata 50cl', 'cantinetta', 4.50, '2019-08-28 19:37:21', '2024-09-01 12:36:12'),
	(103, 'Birra Moretti rossa 33cl', 'cantinetta', 3.50, '2019-08-28 19:37:21', '2024-09-01 12:36:05'),
	(102, 'Birra Peroni 33cl', 'cantinetta', 3.50, '2019-08-28 19:37:21', '2024-09-01 12:36:02'),
	(104, 'Birra Peroni senza glutine', 'cantinetta', 3.50, '2019-08-28 19:37:21', '2024-09-01 12:36:09'),
	(134, 'Bocca di Rosa rosato Umbria IGT TABARRINI', 'bevanda', 22.00, '2025-05-24 13:44:50', '2025-05-24 13:44:53'),
	(134, 'Bocca di Rosa rosato Umbria IGT TABARRINI FISSO', 'bevanda', 22.00, '2025-05-24 13:45:15', '2025-05-24 13:45:19'),
	(95, 'Bonta ai tre cioccolati', 'dolce', 5.50, '2025-05-24 13:21:07', '2025-05-24 13:21:07'),
	(94, 'Bonta ricotta e pere', 'dolce', 5.50, '2025-05-24 13:20:34', '2025-05-24 13:20:36'),
	(2, 'Bruschetta all olio', 'antipasto', 3.00, '2023-06-13 19:33:00', '2023-06-13 19:33:03'),
	(2, 'Bruschetta all olio FISSO', 'antipasto', 3.00, '2024-06-12 15:58:19', '2024-06-12 15:58:22'),
	(3, 'Bruschetta del Popolano', 'antipasto', 5.50, '2019-08-28 19:34:19', '2025-05-24 12:42:54'),
	(4, 'Bruschetta del Popolano FISSO', 'antipasto', 5.50, '2019-08-28 19:34:19', '2025-05-24 12:43:21'),
	(136, 'Brut Pas dose SCACCIADIAVOLI', 'bevanda', 22.00, '2025-05-24 13:46:09', '2025-05-24 13:46:11'),
	(136, 'Brut Pas dose SCACCIADIAVOLI FISSO', 'bevanda', 22.00, '2025-05-24 13:46:27', '2025-05-24 13:46:29'),
	(160, 'Caffe', 'cantinetta', 1.00, '2019-08-28 20:01:31', '2024-05-26 10:39:37'),
	(161, 'Caffe FISSO', 'cantinetta', 1.00, '2019-08-28 20:01:31', '2024-05-26 10:39:40'),
	(112, 'Calice Bianco Padrone delle Vigne TABARRINI', 'cantinetta', 5.00, '2025-05-24 13:37:50', '2025-05-24 13:37:59'),
	(110, 'Calice Bianco Sperella BELLAFONTE', 'cantinetta', 4.50, '2024-05-25 08:23:49', '2025-05-24 13:34:10'),
	(107, 'Calice Grechetto Scacciadiavoli', 'cantinetta', 3.50, '2019-08-28 19:54:15', '2024-09-01 12:37:06'),
	(111, 'Calice Montefalco Rosso Antano MILZIADE ANTANO', 'cantinetta', 4.50, '2023-05-22 04:52:47', '2024-09-01 12:37:25'),
	(112, 'Calice Montefalco Rosso Pomontino BELLAFONTE', 'cantinetta', 4.50, '2024-09-01 12:38:13', '2025-05-24 13:36:55'),
	(114, 'Calice Montefalco Sagr Passito MILZIADE ANTANO', 'cantinetta', 6.50, '2019-08-28 19:54:15', '2025-05-24 13:38:49'),
	(164, 'Calice prosecco Fisso', 'bevanda', 3.00, '2024-09-04 13:36:19', '2024-09-04 13:36:19'),
	(106, 'Calice Prosecco Santa Orsola DOC', 'cantinetta', 3.50, '2019-08-28 19:54:15', '2024-09-01 12:37:04'),
	(109, 'Calice Rose Levitas Cariani', 'cantinetta', 3.50, '2019-08-28 19:54:15', '2024-09-01 12:37:11'),
	(113, 'Calice Rose Metodo Classico SCACCIADIAVOLI', 'cantinetta', 5.00, '2023-05-22 04:51:49', '2024-09-01 12:38:27'),
	(108, 'Calice Rossi Umbria IGT Scacciadiavoli', 'cantinetta', 3.50, '2019-08-28 19:54:15', '2024-09-01 12:37:08'),
	(54, 'Cappellacci del Priore', 'primo', 11.00, '2019-08-28 19:39:25', '2025-05-24 13:07:40'),
	(55, 'Cappellacci del Priore FISSO', 'primo', 11.00, '2019-08-28 19:39:25', '2025-05-24 13:07:52'),
	(21, 'Coratella di agnello con  crescia', 'antipasto', 9.00, '2019-08-28 19:35:47', '2025-05-24 13:02:26'),
	(22, 'Coratella di agnello con crescia FISSO', 'antipasto', 9.00, '2019-08-28 19:35:47', '2025-05-24 13:02:37'),
	(62, 'Costine sfizionse dello chef con patate', 'secondo', 11.00, '2019-08-28 19:39:46', '2025-05-24 13:10:25'),
	(63, 'Costine sfizionse dello chef con patate FISSO', 'secondo', 11.00, '2023-05-22 04:27:01', '2025-05-24 13:10:34'),
	(76, 'Cotoletta con patate FISSO', 'secondo', 6.00, '2023-06-13 19:26:02', '2024-05-25 07:46:51'),
	(97, 'Crostata della Dama servita con gelato fichi e noci', 'dolce', 8.00, '2024-05-25 08:07:44', '2025-05-24 14:11:42'),
	(98, 'Crostata della Dama servita con gelato fichi e noci FISSO', 'dolce', 8.00, '2024-05-25 08:08:23', '2025-05-24 14:12:13'),
	(81, 'Erba campagnola spadellata', 'contorno', 4.50, '2019-08-28 19:42:59', '2024-09-01 12:28:06'),
	(82, 'Erba campagnola spadellata FISSO', 'contorno', 4.50, '2019-08-28 19:42:59', '2024-09-01 12:28:09'),
	(85, 'Fagiolini alla maggiorana', 'contorno', 4.50, '2019-08-28 19:43:49', '2025-05-24 13:17:56'),
	(86, 'Fagiolini alla maggiorana FISSO', 'contorno', 4.50, '2019-08-28 19:43:49', '2025-05-24 13:18:00'),
	(19, 'GF Antipasto Sette Selle', 'antipasto', 7.00, '2019-08-28 19:35:04', '2024-09-01 12:02:26'),
	(20, 'GF Antipasto Sette Selle FISSO', 'antipasto', 7.00, '2019-08-28 19:35:04', '2024-09-01 12:02:28'),
	(2, 'GF Bruschetta all olio FISSO', 'antipasto', 3.00, '2024-06-12 16:01:10', '2024-06-12 16:01:11'),
	(5, 'GF Bruschetta del Popolano', 'antipasto', 5.50, '2019-08-28 19:34:19', '2025-05-24 12:43:27'),
	(6, 'GF Bruschetta del Popolano FISSO', 'antipasto', 5.50, '2019-08-28 19:34:19', '2025-05-24 12:43:34'),
	(23, 'GF Coratella di agnello con Piadina', 'antipasto', 9.00, '2019-08-28 19:35:47', '2025-05-24 13:02:42'),
	(24, 'GF Coratella di agnello con Piadina FISSO', 'antipasto', 9.00, '2019-08-28 19:35:47', '2025-05-24 13:02:52'),
	(64, 'GF Costine sfizionse dello Chef con patate', 'secondo', 11.00, '2019-08-28 19:39:46', '2025-05-24 14:29:32'),
	(65, 'GF Costine sfizionse dello Chef con patate FISSO', 'secondo', 11.00, '2019-08-28 19:39:46', '2025-05-24 14:29:35'),
	(83, 'GF Erba campagnola spadellata', 'contorno', 4.50, '2019-08-28 19:42:59', '2024-09-01 12:28:11'),
	(84, 'GF Erba campagnola spadellata FISSO', 'contorno', 4.50, '2019-08-28 19:42:59', '2024-09-01 12:28:14'),
	(87, 'GF Fagiolini alla maggiorana', 'contorno', 4.50, '2019-08-28 19:43:49', '2025-05-24 13:18:04'),
	(88, 'GF Fagiolini alla maggiorana  FISSO', 'contorno', 4.50, '2019-08-28 19:43:49', '2025-05-24 13:18:10'),
	(95, 'GF Gelato ai frutti di bosco', 'dolce', 5.50, '2019-08-28 19:45:10', '2024-09-01 12:35:43'),
	(96, 'GF Gelato ai frutti di bosco FISSO', 'dolce', 5.50, '2019-08-28 19:45:10', '2024-09-01 12:35:45'),
	(68, 'GF Lumache al sugo con erba campagnola', 'secondo', 11.50, '2019-08-28 19:41:22', '2025-05-24 13:11:57'),
	(69, 'GF Lumache al sugo con erba campagnola FISSO', 'secondo', 11.50, '2023-06-12 14:17:05', '2025-05-24 13:12:05'),
	(72, 'GF Manzo peposo con riduzione di vino rosseo ed erba campagnola', 'secondo', 12.00, '2019-08-28 19:41:43', '2025-05-24 13:13:30'),
	(73, 'GF Manzo peposo con riduzione di vino rosseo ed erba campagnola FISSO', 'secondo', 12.00, '2019-08-28 19:41:43', '2025-05-24 13:13:37'),
	(93, 'GF Muffin Choco', 'dolce', 4.50, '2024-05-25 07:58:13', '2024-05-25 07:58:57'),
	(94, 'GF Muffin Choco FISSO', 'dolce', 4.50, '2024-05-25 07:58:48', '2024-05-25 07:58:50'),
	(31, 'GF pasta in bianco', 'primo', 5.00, '2022-06-03 14:56:01', '2024-05-25 06:55:37'),
	(32, 'GF Pasta in bianco FISSO', 'primo', 5.00, '2022-06-03 14:56:49', '2024-05-25 06:55:40'),
	(33, 'GF Pasta pomodoro', 'primo', 5.00, '2022-06-03 14:58:17', '2024-05-25 06:56:24'),
	(33, 'GF Pasta pomodoro FISSO', 'primo', 5.00, '2022-06-03 15:03:40', '2024-05-25 06:56:28'),
	(77, 'GF Patate arrosto', 'contorno', 4.50, '2019-08-28 19:42:40', '2024-09-01 12:27:52'),
	(78, 'GF Patate arrosto FISSO', 'contorno', 4.50, '2019-08-28 19:42:40', '2024-09-01 12:27:55'),
	(46, 'GF Ravioli alla Contrastanga', 'primo', 8.50, '2019-08-28 19:39:05', '2024-09-01 12:11:02'),
	(47, 'GF Ravioli alla Contrastanga FISSO', 'primo', 8.50, '2019-08-28 19:39:05', '2024-09-01 12:11:05'),
	(73, 'GF Rolle di agnello con tortino di patate e panna acida', 'secondo', 12.50, '2025-05-24 13:15:25', '2025-05-24 13:15:28'),
	(73, 'GF Rolle di agnello con tortino di patate e panna acida FISSO', 'secondo', 12.50, '2025-05-24 13:15:48', '2025-05-24 13:16:02'),
	(43, 'GF Tagliatelle al ragu di lepre e pecorino', 'primo', 8.50, '2025-05-24 13:05:45', '2025-05-24 13:05:49'),
	(43, 'GF Tagliatelle al ragu di lepre e pecorino FISSO', 'primo', 8.50, '2025-05-24 13:06:16', '2025-05-24 13:06:26'),
	(40, 'GF Tagliatelle alla Furente', 'primo', 7.00, '2024-09-01 12:08:56', '2024-09-01 12:08:56'),
	(41, 'GF Tagliatelle alla Furente FISSO', 'primo', 7.00, '2024-09-01 12:09:34', '2024-09-01 12:09:34'),
	(27, 'GF Tagliere di salumi e formaggi ', 'antipasto', 9.50, '2019-08-28 19:36:35', '2024-09-01 12:03:12'),
	(28, 'GF Tagliere di salumi e formaggi FISSO', 'antipasto', 9.50, '2019-08-28 19:36:35', '2024-09-01 12:03:16'),
	(21, 'GF Terrina di coniglio con cipolla carammelata e nocciole', 'antipasto', 7.50, '2025-05-24 13:01:43', '2025-05-24 13:01:46'),
	(21, 'GF Terrina di coniglio con cipolla carammelata e nocciole FISSO', 'antipasto', 7.50, '2025-05-24 13:02:11', '2025-05-24 13:02:15'),
	(44, 'Gnocchi alla Contrastanga', 'primo', 8.50, '2019-08-28 19:39:05', '2024-09-01 12:10:56'),
	(45, 'Gnocchi alla Contrastanga FISSO', 'primo', 8.50, '2019-08-28 19:39:05', '2024-09-01 12:10:59'),
	(66, 'Lumache al sugo con erba campagnola', 'secondo', 11.50, '2019-08-28 19:39:46', '2025-05-24 13:11:42'),
	(67, 'Lumache al sugo con erba campagnola FISSO', 'secondo', 11.50, '2019-08-28 19:41:22', '2025-05-24 13:11:49'),
	(70, 'Manzo peposo con riduzione di vino rosseo ed erba campagnola', 'secondo', 12.00, '2019-08-28 19:41:43', '2025-05-24 13:13:12'),
	(71, 'Manzo peposo con riduzione di vino rosseo ed erba campagnola FISSO', 'secondo', 12.00, '2019-08-28 19:41:43', '2025-05-24 13:13:20'),
	(42, 'Mezzemaniche fresche all uovo al ragu di lepre e pecorino', 'primo', 8.50, '2019-08-28 19:37:43', '2025-05-24 13:04:37'),
	(43, 'Mezzemaniche fresche all uovo al ragu di lepre e pecorino FISSO', 'primo', 8.50, '2019-08-28 19:37:43', '2025-05-24 13:04:43'),
	(151, 'Montefalco Rosso RISERVA MILZIADE ANTANO', 'bevanda', 27.00, '2019-08-28 20:01:31', '2025-05-24 13:49:55'),
	(152, 'Montefalco Rosso RISERVA MILZIADE ANTANO FISSO', 'bevanda', 27.00, '2019-08-28 20:01:31', '2025-05-24 13:49:59'),
	(157, 'Montefalco Sagr Passito MILZIADE ANTANO 50 cl', 'bevanda', 30.00, '2019-08-28 20:01:31', '2025-05-24 13:51:56'),
	(158, 'Montefalco Sagr Passito MILZIADE ANTANO 50 cl FISSO ', 'bevanda', 30.00, '2025-05-24 13:52:49', '2025-05-24 13:52:52'),
	(153, 'Montefalco Sagrantino Colleallodole MILZIADE ANTANO', 'bevanda', 28.00, '2019-08-28 19:53:07', '2025-05-24 13:51:06'),
	(154, 'Montefalco Sagrantino Colleallodole MILZIADE ANTANO FISSO', 'bevanda', 28.00, '2019-08-28 19:53:07', '2025-05-24 13:51:13'),
	(155, 'Montefalco Sagrantino Collenottolo BELLAFONTE', 'bevanda', 35.00, '2024-05-26 10:38:34', '2024-09-01 12:45:32'),
	(156, 'Montefalco Sagrantino Collenottolo BELLAFONTE FISSO', 'bevanda', 35.00, '2024-05-26 10:39:07', '2024-09-01 12:45:46'),
	(1, 'Pane e Coperto', 'pane e coperto', 1.50, '2019-08-28 19:31:52', '2022-05-23 19:54:35'),
	(11, 'Pappa al Pomodoro con burrata e basilico', 'antipasto', 6.00, '2019-08-28 19:34:44', '2025-05-24 12:51:29'),
	(12, 'Pappa al Pomodoro con burrata e basilico FISSO', 'antipasto', 6.00, '2019-08-28 19:34:44', '2025-05-24 12:51:36'),
	(29, 'Pasta in bianco', 'primo', 5.00, '2022-06-03 14:55:36', '2024-05-25 06:55:25'),
	(30, 'Pasta in bianco FISSO', 'primo', 5.00, '2022-06-03 14:56:32', '2024-05-25 06:55:30'),
	(33, 'Pasta pomodoro', 'primo', 5.00, '2022-06-03 14:57:43', '2024-05-25 06:56:30'),
	(33, 'Pasta pomodoro FISSO', 'primo', 5.00, '2022-06-03 14:57:59', '2024-05-25 06:56:34'),
	(79, 'Patate arrosto', 'contorno', 4.50, '2019-08-28 19:42:40', '2024-09-01 12:27:57'),
	(80, 'Patate arrosto FISSO', 'contorno', 4.50, '2019-08-28 19:42:40', '2024-09-01 12:28:00'),
	(75, 'Piccione della tradizione su crostone di pate e cipolla carammelalta FISSO', 'secondo', 13.50, '2019-08-28 19:41:43', '2025-05-24 13:17:41'),
	(74, 'Piccione della tradizione su crostone di pate e cipolla carammellata', 'secondo', 13.50, '2019-08-28 19:41:43', '2025-05-26 21:47:27'),
	(99, 'Rocciata del Re servita con gelato alla Rocciata', 'dolce', 9.00, '2019-08-28 19:46:18', '2024-09-01 12:35:56'),
	(100, 'Rocciata del Re servita con gelato alla Rocciata FISSO', 'dolce', 9.00, '2019-08-28 19:46:18', '2024-09-01 12:35:58'),
	(73, 'Rolle di agnello con tortino di patate e panna acida', 'secondo', 12.50, '2025-05-24 13:14:35', '2025-05-24 13:14:38'),
	(73, 'Rolle di agnello con tortino di patate e panna acida FISSO', 'secondo', 12.50, '2025-05-24 13:15:04', '2025-05-24 13:15:08'),
	(133, 'Rose Levitas Cariani', 'bevanda', 14.00, '2023-05-22 05:19:04', '2024-09-01 12:41:30'),
	(134, 'Rose Levitas Cariani FISSO', 'bevanda', 14.00, '2024-05-26 10:30:33', '2024-09-01 12:41:33'),
	(135, 'Rose Vino Spumante Brut MC Scacciadiavoli', 'bevanda', 22.00, '2022-08-27 04:23:00', '2024-09-01 12:41:35'),
	(136, 'Rose Vino Spumante Brut MC Scacciadiavoli FISSO', 'bevanda', 22.00, '2024-05-26 10:31:12', '2024-09-01 12:41:38'),
	(33, 'Strangozzi al pomodoro FISSO', 'primo', 5.00, '2022-06-11 07:16:00', '2024-05-25 06:56:17'),
	(38, 'Strongozzi alla Furente', 'primo', 7.00, '2024-09-01 12:07:48', '2024-09-01 12:09:40'),
	(39, 'Strongozzi alla Furente FISSO', 'primo', 7.00, '2024-09-01 12:08:18', '2024-09-01 12:09:44'),
	(25, 'Tagliere di salumi e formaggi ', 'antipasto', 9.50, '2019-08-28 19:36:35', '2024-09-01 12:03:05'),
	(26, 'Tagliere di salumi e formaggi FISSO', 'antipasto', 9.50, '2019-08-28 19:36:35', '2024-09-01 12:03:08'),
	(89, 'Tozzetti alle mandorle e Vin Santo', 'cantinetta', 5.00, '2019-08-28 19:44:38', '2025-05-30 19:47:02'),
	(90, 'Tozzetti alle mandorle e Vin Santo FISSO', 'cantinetta', 5.00, '2019-08-28 19:44:38', '2025-05-30 19:47:06'),
	(131, 'Vino Arneto Trebbiano Spoletino', 'bevanda', 23.00, '2019-08-28 19:59:15', '2024-09-01 12:41:18'),
	(132, 'Vino Arneto Trebbiano Spoletino FISSO', 'bevanda', 23.00, '2023-05-22 05:20:03', '2024-09-01 12:41:21'),
	(121, 'Vino Bianco Aureo LA VENERANDA', 'bevanda', 13.00, '2019-08-28 19:57:55', '2024-09-01 12:40:45'),
	(122, 'Vino Bianco Aureo LA VENERANDA FISSO', 'bevanda', 13.00, '2019-08-28 19:57:55', '2024-09-01 12:40:49'),
	(123, 'Vino Bianco Chardonnay GORETTI', 'bevanda', 13.00, '2024-05-26 10:07:55', '2025-05-24 13:39:43'),
	(124, 'Vino Bianco Chardonnay GORETTI FISSO', 'bevanda', 13.00, '2024-05-26 10:08:15', '2025-05-24 13:39:52'),
	(119, 'Vino Bianco Nabucco GORETTI', 'bevanda', 9.50, '2019-08-28 19:52:31', '2025-05-24 13:39:24'),
	(120, 'Vino Bianco Nabucco GORETTI FISSO', 'bevanda', 9.50, '2019-08-28 19:52:31', '2025-05-24 13:39:28'),
	(128, 'Vino Bianco Padrone delle Vigne TABARRINI', 'bevanda', 15.50, '2025-05-24 14:15:45', '2025-05-24 14:15:45'),
	(128, 'Vino Bianco Padrone delle Vigne TABARRINI FISSO', 'bevanda', 15.50, '2025-05-24 14:15:59', '2025-05-24 14:16:01'),
	(129, 'Vino Bianco Sperella TENUTA BELLAFONTE', 'bevanda', 16.50, '2023-05-22 05:17:50', '2024-09-01 12:41:09'),
	(130, 'Vino Bianco Sperella TENUTA BELLAFONTE FISSO', 'bevanda', 16.50, '2024-05-26 10:26:57', '2024-09-01 12:41:15'),
	(127, 'Vino Bianco Umbria MILZIADE ANTANO', 'bevanda', 15.00, '2024-05-26 10:09:28', '2025-05-24 13:40:13'),
	(128, 'Vino Bianco Umbria MILZIADE ANTANO FISSO', 'bevanda', 15.00, '2024-05-26 10:10:00', '2025-05-24 13:40:17'),
	(126, 'Vino Grechetto  SCACCIADIAVOLI FISSO', 'bevanda', 14.00, '2019-08-28 19:57:32', '2025-05-24 13:39:59'),
	(125, 'Vino Grechetto SCACCIADIAVOLI', 'bevanda', 14.00, '2019-08-28 19:57:32', '2025-05-24 13:39:55'),
	(143, 'Vino Montefalco Rosso MILZIADE ANTANO', 'bevanda', 18.00, '2019-08-28 19:54:15', '2025-05-24 13:48:09'),
	(144, 'Vino Montefalco Rosso MILZIADE ANTANO FISSO', 'bevanda', 18.00, '2019-08-28 19:54:15', '2025-05-24 13:48:13'),
	(145, 'Vino Montefalco Rosso Pomontino BELLAFONTE', 'bevanda', 20.00, '2019-08-28 20:01:31', '2024-09-01 12:44:42'),
	(146, 'Vino Montefalco Rosso Pomontino BELLAFONTE FISSO', 'bevanda', 20.00, '2019-08-28 20:01:31', '2024-09-01 12:44:45'),
	(139, 'Vino Riccardo I LA VENERANDA', 'bevanda', 13.00, '2019-08-28 19:56:50', '2024-09-01 12:42:18'),
	(140, 'Vino Riccardo I LA VENERANDA FISSO', 'bevanda', 13.00, '2019-08-28 19:56:50', '2024-09-01 12:42:22'),
	(149, 'Vino Rosso Arringatore GORETTI', 'bevanda', 23.50, '2024-05-26 10:35:19', '2024-09-01 12:44:56'),
	(150, 'Vino Rosso Arringatore GORETTI FISSO', 'bevanda', 23.50, '2024-05-26 10:35:33', '2024-09-01 12:44:59'),
	(147, 'Vino Rosso Boccatone TABARRINI', 'bevanda', 21.00, '2023-05-22 05:24:35', '2025-05-24 13:49:29'),
	(148, 'Vino Rosso Boccatone TABARRINI FISSO', 'bevanda', 21.00, '2023-05-22 05:25:00', '2025-05-24 13:49:38'),
	(137, 'Vino Rosso Express Dissident GORETTI', 'bevanda', 9.50, '2019-08-28 20:01:04', '2025-05-24 13:47:15'),
	(138, 'Vino Rosso Express Dissident GORETTI FISSO', 'bevanda', 9.50, '2019-08-28 20:01:04', '2025-05-24 13:47:30'),
	(141, 'Vino Rosso Umbria IGT SCACCIADIAVOLI', 'bevanda', 14.00, '2019-08-28 19:53:07', '2025-05-24 13:47:54'),
	(142, 'Vino Rosso Umbria IGT SCACCIADIAVOLI FISSO', 'bevanda', 14.00, '2019-08-28 19:53:07', '2025-05-24 13:47:58');

/*!40000 ALTER TABLE `portata` ENABLE KEYS */;


--
-- Definition of table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
CREATE TABLE `prenotazioni` (
  `serata` date NOT NULL,
  `tavoli` int(11) NOT NULL,
  `coperti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prenotazioni`
--

/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;


--
-- Definition of table `programmazioneordini`
--

DROP TABLE IF EXISTS `programmazioneordini`;
CREATE TABLE `programmazioneordini` (
  `serata` date NOT NULL,
  `portata` varchar(100) NOT NULL,
  `tavolo` int(10) unsigned NOT NULL,
  `indice` int(11) NOT NULL,
  `stato` tinyint(4) NOT NULL,
  `idprogrammazione` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria` varchar(50) NOT NULL,
  `ora_produzione` timestamp,
  `ora_evasione` timestamp,
  PRIMARY KEY (`id`),
  KEY `FK_programmazioneordini_serata` (`serata`),
  KEY `FK_programmazioneordini_portata` (`portata`),
  KEY `FK_programmazioneordini_statoordine` (`stato`),
  KEY `FK_programmazioneordini_tavoli` (`tavolo`),
  CONSTRAINT `FK_programmazioneordini_portata` FOREIGN KEY (`portata`) REFERENCES `portata` (`nome_portata`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programmazioneordini_serata` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programmazioneordini_statoordine` FOREIGN KEY (`stato`) REFERENCES `statoordine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programmazioneordini_tavoli` FOREIGN KEY (`tavolo`) REFERENCES `tavoli` (`numero_tavolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `programmazioneordini`
--

/*!40000 ALTER TABLE `programmazioneordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `programmazioneordini` ENABLE KEYS */;


--
-- Definition of table `quantitapiattiserata`
--

DROP TABLE IF EXISTS `quantitapiattiserata`;
CREATE TABLE `quantitapiattiserata` (
  `serata` date NOT NULL,
  `piatto` varchar(100) NOT NULL,
  `quantita` int(11) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`serata`,`piatto`),
  KEY `piatto_idx` (`piatto`),
  CONSTRAINT `fk1_serata` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `piatto` FOREIGN KEY (`piatto`) REFERENCES `portata` (`nome_portata`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quantitapiattiserata`
--

/*!40000 ALTER TABLE `quantitapiattiserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantitapiattiserata` ENABLE KEYS */;


--
-- Definition of table `responsabili`
--

DROP TABLE IF EXISTS `responsabili`;
CREATE TABLE `responsabili` (
  `nome` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `responsabili`
--

/*!40000 ALTER TABLE `responsabili` DISABLE KEYS */;
INSERT INTO `responsabili` (`nome`, `data_creazione`, `data_aggiornamento`) VALUES
	('Alessandro Del Gatto', '2019-05-30 11:59:21', '2019-05-30 11:59:21'),
	('Alessia Clementi', '2024-09-03 17:39:24', '2024-09-03 17:39:24'),
	('Alice Bovi', '2024-09-02 17:29:14', '2024-09-02 17:29:14'),
	('Andrea Caldarelli', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('angelica pirisi', '2024-09-13 17:42:27', '2024-09-13 17:42:27'),
	('Aurora Gramaccini', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Beatrice Bazzica', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Carlo Mattioli', '2016-06-17 06:36:39', '2016-06-17 06:36:39'),
	('Chiara Laura Bartoli', '2016-06-03 06:59:03', '2016-06-03 06:59:03'),
	('costanza  foglietta', '2024-09-13 17:42:15', '2024-09-13 17:42:15'),
	('Cruciani Edoardo', '2017-06-02 09:49:49', '2017-06-02 09:49:49'),
	('Dorotea Lanzi', '2024-09-07 17:46:45', '2024-09-07 17:46:45'),
	('Elena Sorrentino', '2024-09-05 17:47:41', '2024-09-05 17:47:41'),
	('Elisa Spuntarelli', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Federica Tili', '2018-06-01 13:51:52', '2018-06-01 13:51:52'),
	('Federico Porzi', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Filippo Faccendini', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Francesca Amodeo', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Francesca Faccendini', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Francesca Filippini', '2019-05-30 12:00:51', '2019-05-30 12:00:51'),
	('Giada Marchio', '2024-09-03 17:41:21', '2024-09-03 17:41:21'),
	('Giada Marchionni', '2024-09-10 17:43:22', '2024-09-10 17:43:22'),
	('Gioulia x', '2018-06-01 13:54:05', '2018-06-01 13:54:05'),
	('Ilaria Pico', '2024-09-03 17:42:07', '2024-09-03 17:42:07'),
	('Irene Bartoli', '2024-09-11 17:51:21', '2024-09-11 17:51:21'),
	('Lavinia Pinchi', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Leonardo Belloni', '2018-06-01 13:52:25', '2018-06-01 13:52:25'),
	('Leonardo Cecconi', '2019-05-30 11:58:50', '2019-05-30 11:58:50'),
	('Ludovica Stoppaccioli', '2024-09-02 17:28:58', '2024-09-02 17:28:58'),
	('Lusia Stanila', '2024-09-05 17:48:28', '2024-09-05 17:48:28'),
	('margherita c', '2024-09-12 18:03:30', '2024-09-12 18:03:30'),
	('Mariasole Parziani', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('martina  petrioli', '2024-09-13 17:42:03', '2024-09-13 17:42:03'),
	('Martina Pelliccia', '2024-09-02 17:27:58', '2024-09-02 17:27:58'),
	('Martina Petrioli', '2024-09-04 17:29:57', '2024-09-04 17:29:57'),
	('Matilde Lorenzini', '2019-05-30 12:00:17', '2019-05-30 12:00:17'),
	('Matteo Vinti', '2019-05-31 13:47:43', '2019-05-31 13:47:43'),
	('Mattia Badalo', '2017-09-01 11:18:32', '2017-09-01 11:18:32'),
	('Mattia Ornielli', '2017-09-01 11:20:45', '2017-09-01 11:20:45'),
	('Noemi Rossi', '2024-09-10 17:44:01', '2024-09-10 17:44:01'),
	('Pamela Mastrorilli', '2018-06-15 13:53:40', '2018-06-15 13:53:40'),
	('pier Ferri', '2016-05-31 10:48:16', '2016-05-31 10:48:16'),
	('Samanta Marchegiani', '2016-05-31 11:02:33', '2016-05-31 11:02:33'),
	('Simone Giustozzi', '2024-09-02 17:27:24', '2024-09-02 17:27:24'),
	('Simone Striano', '2017-09-01 11:17:01', '2017-09-01 11:17:01'),
	('Sofia Ferri', '2018-06-01 13:52:45', '2018-06-01 13:52:45'),
	('Tommaso Bellillo', '2024-09-02 17:26:50', '2024-09-02 17:26:50'),
	('Tommaso Carini', '2016-06-01 08:08:52', '2016-06-01 08:08:52'),
	('Tommaso Mariani', '2018-06-01 13:54:54', '2018-06-01 13:54:54'),
	('Virginia Squadroni', '2019-05-31 14:00:00', '2019-05-31 14:00:00'),
	('Virginia Vagaggini', '2018-09-01 15:52:26', '2018-09-01 15:52:26'),
	('Virginia Volpi', '2018-09-05 15:25:38', '2018-09-05 15:25:38');
/*!40000 ALTER TABLE `responsabili` ENABLE KEYS */;


--
-- Definition of table `responsabiliserata`
--

DROP TABLE IF EXISTS `responsabiliserata`;
CREATE TABLE `responsabiliserata` (
  `serata` date NOT NULL,
  `tavolo` int(10) unsigned NOT NULL,
  `responsabile` varchar(50) NOT NULL,
  `numero_progressivo` int(11) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`serata`,`tavolo`,`responsabile`,`numero_progressivo`),
  KEY `fk_ResponsabiliSerata_2_idx` (`responsabile`),
  KEY `fk_tavolo_resp_idx` (`tavolo`),
  CONSTRAINT `fk_ResponsabiliSerata_2` FOREIGN KEY (`responsabile`) REFERENCES `responsabili` (`nome`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_serata` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tavolo_resp` FOREIGN KEY (`tavolo`) REFERENCES `tavoli` (`numero_tavolo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `responsabiliserata`
--

/*!40000 ALTER TABLE `responsabiliserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsabiliserata` ENABLE KEYS */;


--
-- Definition of table `ricevutefiscali`
--

DROP TABLE IF EXISTS `ricevutefiscali`;
CREATE TABLE `ricevutefiscali` (
  `n_ric` int(11) NOT NULL AUTO_INCREMENT,
  `serata` date NOT NULL,
  `tavolo` int(11) NOT NULL,
  `indice` int(11) NOT NULL,
  `totale` double DEFAULT NULL,
  KEY `n_ric` (`n_ric`)
) ENGINE=InnoDB AUTO_INCREMENT=25711 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ricevutefiscali`
--

/*!40000 ALTER TABLE `ricevutefiscali` DISABLE KEYS */;
INSERT INTO `ricevutefiscali` (`n_ric`,`serata`,`tavolo`,`indice`,`totale`) VALUES 
 (25551,'2019-05-30',106,1,NULL),
 (25552,'2019-05-30',107,1,NULL),
 (25553,'2019-05-30',110,1,NULL),
 (25554,'2019-05-30',113,1,NULL),
 (25555,'2019-05-30',202,1,NULL),
 (25556,'2019-05-30',203,1,NULL),
 (25557,'2019-05-30',401,1,NULL),
 (25558,'2019-05-30',402,1,NULL),
 (25559,'2019-05-30',403,1,NULL),
 (25560,'2019-05-30',404,1,NULL),
 (25561,'2019-05-30',999,1,NULL),
 (25562,'2019-05-31',102,1,NULL),
 (25563,'2019-05-31',103,1,NULL),
 (25564,'2019-05-31',103,2,NULL),
 (25565,'2019-05-31',104,1,NULL),
 (25566,'2019-05-31',106,1,NULL),
 (25567,'2019-05-31',105,1,NULL),
 (25568,'2019-05-31',108,1,NULL),
 (25569,'2019-05-31',109,1,NULL),
 (25570,'2019-05-31',110,1,NULL),
 (25571,'2019-05-31',111,1,NULL),
 (25572,'2019-05-31',112,1,NULL),
 (25573,'2019-05-31',113,1,NULL),
 (25574,'2019-05-31',114,1,NULL),
 (25575,'2019-05-31',115,1,NULL),
 (25576,'2019-05-31',113,2,NULL),
 (25577,'2019-05-31',118,1,NULL),
 (25578,'2019-06-01',101,1,NULL),
 (25579,'2019-06-01',206,1,NULL),
 (25581,'2019-06-01',402,1,NULL),
 (25582,'2019-06-01',102,1,NULL),
 (25583,'2019-06-01',901,1,NULL),
 (25584,'2019-06-01',117,2,NULL),
 (25585,'2019-06-01',309,1,NULL),
 (25586,'2019-06-01',105,1,NULL),
 (25587,'2019-06-01',110,1,NULL),
 (25588,'2019-06-01',109,1,NULL),
 (25589,'2019-06-01',303,1,NULL),
 (25590,'2019-06-01',903,1,NULL),
 (25591,'2019-06-01',401,1,NULL),
 (25592,'2019-06-01',204,1,NULL),
 (25594,'2019-06-01',113,1,NULL),
 (25595,'2019-06-01',109,2,NULL),
 (25596,'2019-06-01',103,1,NULL),
 (25598,'2019-06-01',304,1,NULL),
 (25599,'2019-06-01',405,1,NULL),
 (25600,'2019-06-01',305,1,NULL),
 (25601,'2019-06-01',205,1,NULL),
 (25602,'2019-06-01',301,1,NULL),
 (25603,'2019-06-01',202,1,NULL),
 (25604,'2019-06-01',203,1,NULL),
 (25605,'2019-06-01',203,2,NULL),
 (25606,'2019-06-01',106,1,NULL),
 (25607,'2019-06-01',403,1,NULL),
 (25608,'2019-06-01',104,1,NULL),
 (25609,'2019-06-01',404,2,NULL),
 (25610,'2019-06-01',115,2,NULL),
 (25611,'2019-06-01',116,1,NULL),
 (25612,'2019-06-01',105,3,NULL),
 (25613,'2019-06-01',117,1,NULL),
 (25614,'2019-06-01',308,1,NULL),
 (25615,'2019-06-01',112,2,NULL),
 (25593,'2019-06-01',107,1,NULL),
 (25597,'2019-06-01',115,1,NULL),
 (25580,'2019-06-01',204,2,NULL),
 (25616,'2019-06-03',0,0,14),
 (25617,'2019-06-03',0,0,14),
 (25618,'2019-06-03',0,0,14),
 (25619,'2019-06-03',0,0,14),
 (25620,'2019-06-03',0,0,26),
 (25621,'2019-06-03',0,0,26),
 (25622,'2019-06-03',0,0,26),
 (25623,'2019-06-03',0,0,30),
 (25624,'2019-06-03',0,0,30),
 (25625,'2019-06-04',102,2,NULL),
 (25626,'2019-06-04',101,1,NULL),
 (25627,'2019-06-04',102,1,NULL),
 (25628,'2019-06-04',105,1,NULL),
 (25629,'2019-06-04',109,1,NULL),
 (25630,'2019-06-04',110,1,NULL),
 (25631,'2019-06-04',116,1,NULL),
 (25632,'2019-06-04',202,1,NULL),
 (25633,'2019-06-04',205,1,NULL),
 (25634,'2019-06-04',301,1,NULL),
 (25635,'2019-06-04',303,1,NULL),
 (25636,'2019-06-04',108,1,NULL),
 (25637,'2019-06-04',113,1,NULL),
 (25638,'2019-06-04',206,1,NULL),
 (25639,'2019-06-04',104,1,NULL),
 (25640,'2019-06-04',107,1,NULL),
 (25641,'2019-06-04',904,1,NULL),
 (25642,'2019-06-04',999,4,NULL),
 (25643,'2019-06-04',999,1,NULL),
 (25644,'2019-06-05',111,1,NULL),
 (25645,'2019-06-05',106,1,NULL),
 (25646,'2019-06-05',302,1,NULL),
 (25647,'2019-06-05',306,1,NULL),
 (25648,'2019-06-05',109,1,NULL),
 (25649,'2019-06-05',307,1,NULL),
 (25650,'2019-06-05',301,1,NULL),
 (25651,'2019-06-05',402,1,NULL),
 (25652,'2019-06-05',112,1,NULL),
 (25653,'2019-06-05',206,1,NULL),
 (25654,'2019-06-05',120,1,NULL),
 (25655,'2019-06-05',119,1,NULL),
 (25656,'2019-06-05',203,1,NULL),
 (25657,'2019-06-05',201,1,NULL),
 (25658,'2019-06-05',104,1,NULL),
 (25659,'2019-06-05',309,1,NULL),
 (25660,'2019-06-05',113,1,NULL),
 (25661,'2019-06-05',110,1,NULL),
 (25662,'2019-06-05',108,1,NULL),
 (25663,'2019-06-06',0,0,15),
 (25664,'2019-06-06',0,0,15),
 (25665,'2019-06-07',0,0,14),
 (25666,'2019-06-07',0,0,14),
 (25667,'2019-06-07',0,0,14),
 (25668,'2019-06-07',0,0,14),
 (25669,'2019-06-07',0,0,14),
 (25670,'2019-06-07',0,0,30),
 (25671,'2019-06-06',102,1,NULL),
 (25672,'2019-06-06',118,1,NULL),
 (25673,'2019-06-06',401,1,NULL),
 (25674,'2019-06-06',105,1,NULL),
 (25675,'2019-06-06',999,1,NULL),
 (25676,'2019-06-06',301,1,NULL),
 (25677,'2019-06-06',305,1,NULL),
 (25678,'2019-06-06',107,1,NULL),
 (25679,'2019-06-06',402,1,NULL),
 (25680,'2019-06-06',999,2,NULL),
 (25681,'2019-06-06',117,1,NULL),
 (25682,'2019-06-06',110,1,NULL),
 (25683,'2019-06-06',404,1,NULL),
 (25684,'2019-06-06',114,1,NULL),
 (25685,'2019-06-06',204,1,NULL),
 (25686,'2019-06-06',120,1,NULL),
 (25687,'2019-06-06',106,1,NULL),
 (25688,'2019-06-06',308,1,NULL),
 (25689,'2019-06-06',307,1,NULL),
 (25690,'2019-06-06',111,1,NULL),
 (25691,'2019-06-06',404,2,NULL),
 (25692,'2019-06-06',203,1,NULL),
 (25693,'2019-06-07',309,1,NULL),
 (25694,'2019-06-07',905,1,NULL),
 (25695,'2019-06-07',703,1,NULL),
 (25696,'2019-06-07',201,1,NULL),
 (25697,'2019-06-07',102,1,NULL),
 (25698,'2019-06-07',303,1,NULL),
 (25699,'2019-06-07',115,2,NULL),
 (25700,'2019-06-07',304,1,NULL),
 (25701,'2019-06-07',703,2,NULL),
 (25702,'2019-06-07',202,1,NULL),
 (25703,'2019-06-07',203,1,NULL),
 (25704,'2019-06-07',101,1,NULL),
 (25705,'2019-06-07',503,1,NULL),
 (25706,'2019-06-07',902,1,NULL),
 (25707,'2019-06-07',502,1,NULL),
 (25708,'2019-06-07',112,1,NULL),
 (25709,'2019-06-07',603,2,NULL),
 (25710,'2019-06-07',111,1,NULL);
/*!40000 ALTER TABLE `ricevutefiscali` ENABLE KEYS */;


--
-- Definition of table `serata`
--

DROP TABLE IF EXISTS `serata`;
CREATE TABLE `serata` (
  `data` date NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inizializzata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `serata`
--

/*!40000 ALTER TABLE `serata` DISABLE KEYS */;
/*!40000 ALTER TABLE `serata` ENABLE KEYS */;


--
-- Definition of table `statoordine`
--

DROP TABLE IF EXISTS `statoordine`;
CREATE TABLE `statoordine` (
  `id` tinyint(4) NOT NULL,
  `stato` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statoordine`
--

/*!40000 ALTER TABLE `statoordine` DISABLE KEYS */;
INSERT INTO `statoordine` (`id`,`stato`) VALUES 
 (1,'ordinato'),
 (2,'in produzione'),
 (3,'evaso');
/*!40000 ALTER TABLE `statoordine` ENABLE KEYS */;


--
-- Definition of table `tavoli`
--

DROP TABLE IF EXISTS `tavoli`;
CREATE TABLE `tavoli` (
  `numero_tavolo` int(10) unsigned NOT NULL,
  `zona` varchar(50) NOT NULL,
  `posti` int(10) unsigned NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero_tavolo`),
  KEY `zonatavolo_idx` (`zona`),
  CONSTRAINT `zonatavolo` FOREIGN KEY (`zona`) REFERENCES `zone` (`zona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tavoli`
--

/*!40000 ALTER TABLE `tavoli` DISABLE KEYS */;
INSERT INTO `tavoli` (`numero_tavolo`, `zona`, `posti`, `data_creazione`, `data_aggiornamento`) VALUES
	(1, 'Via Umberto I', 9, '2018-09-15 13:17:47', '2018-09-15 13:17:47'),
	(2, 'Via Umberto I', 9, '2018-09-15 13:18:12', '2018-09-15 13:18:12'),
	(3, 'Via Umberto I', 9, '2018-09-15 13:19:33', '2018-09-15 13:19:33'),
	(4, 'Via Umberto I', 9, '2018-09-15 13:20:19', '2018-09-15 13:20:19'),
	(5, 'Via Umberto I', 9, '2018-09-15 13:20:49', '2018-09-15 13:20:49'),
	(6, 'Via Umberto I', 9, '2018-09-15 13:21:21', '2018-09-15 13:21:21'),
	(7, 'Via Umberto I', 9, '2018-09-15 13:21:44', '2018-09-15 13:21:44'),
	(8, 'Via Umberto I', 9, '2018-09-15 13:22:20', '2018-09-15 13:22:20'),
	(9, 'Via Umberto I', 9, '2018-09-15 13:22:45', '2018-09-15 13:22:45'),
	(10, 'Via Umberto I', 9, '2018-09-15 13:23:38', '2018-09-15 13:23:38'),
	(11, 'Via Umberto I', 9, '2018-09-15 13:24:01', '2018-09-15 13:24:01'),
	(12, 'Via Umberto I', 9, '2018-09-15 13:24:29', '2018-09-15 13:24:29'),
	(13, 'Via Umberto I', 9, '2018-09-15 13:25:07', '2018-09-15 13:25:07'),
	(14, 'Via Umberto I', 9, '2018-09-15 13:25:33', '2018-09-15 13:25:33'),
	(15, 'Via Umberto I', 9, '2018-09-15 13:26:07', '2018-09-15 13:26:07'),
	(16, 'Via Umberto I', 9, '2018-09-15 13:26:34', '2018-09-15 13:26:34'),
	(17, 'Via Umberto I', 9, '2018-09-15 13:27:02', '2018-09-15 13:27:02'),
	(18, 'Via Umberto I', 9, '2018-09-15 13:27:36', '2018-09-15 13:27:36'),
	(101, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(102, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(103, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(104, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(105, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(106, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(107, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(108, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(109, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(110, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(111, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(112, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(113, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(114, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(115, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(116, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(117, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(118, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(119, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(120, 'Giardino grande', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(201, 'Giardino piccolo', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(202, 'Giardino piccolo', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(203, 'Giardino piccolo', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(204, 'Giardino piccolo', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(205, 'Giardino piccolo', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(206, 'Giardino piccolo', 10, '2018-09-01 16:54:13', '2018-09-01 16:54:13'),
	(301, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(302, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(303, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(304, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(305, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(306, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(307, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(308, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(309, 'Piazzetta', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(310, 'Piazzetta', 8, '2024-09-07 17:54:31', '2024-09-07 17:54:31'),
	(401, 'Corridoio giardino', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(402, 'Corridoio giardino', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(403, 'Corridoio giardino', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(404, 'Corridoio giardino', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(405, 'Corridoio giardino', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(406, 'Corridoio giardino', 6, '2018-09-14 15:45:50', '2018-09-14 15:45:50'),
	(501, 'Stanza 2 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(502, 'Stanza 2 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(503, 'Stanza 2 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(504, 'Stanza 2 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(505, 'Stanza 2 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(601, 'Stanza 1 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(602, 'Stanza 1 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(603, 'Stanza 1 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(604, 'Stanza 1 dx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(701, 'Stanza 1 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(702, 'Stanza 1 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(703, 'Stanza 1 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(801, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(802, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(803, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(804, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(805, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(806, 'Stanza 2 sx', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(901, 'Androne', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(902, 'Androne', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(903, 'Androne', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(904, 'Androne', 10, '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	(905, 'Androne', 10, '2024-09-04 18:03:21', '2024-09-04 18:03:21'),
	(999, 'Androne', 10, '2018-05-28 17:55:53', '2018-05-28 17:56:30');
/*!40000 ALTER TABLE `tavoli` ENABLE KEYS */;


--
-- Definition of table `utente`
--

DROP TABLE IF EXISTS `utente`;
CREATE TABLE `utente` (
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `gruppo` enum('amm','mag','cam') NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `email` varchar(75) NOT NULL,
  `tel_fisso` varchar(20) DEFAULT NULL,
  `tel_mobile` varchar(20) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utente`
--

/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` (`username`, `password`, `gruppo`, `nome`, `cognome`, `email`, `tel_fisso`, `tel_mobile`, `foto`) VALUES
	('daniele', '47477de04d78d5a360c5fda47a986955', 'amm', 'Daniele', 'Binucci', '', NULL, NULL, NULL),
	('pier_ferri', '201f00b5ca5d65a1c118e5e32431514c', 'amm', 'Pergiorgio', 'Ferri', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;


--
-- Definition of table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `zona` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zone`
--

/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` (`zona`, `data_creazione`, `data_aggiornamento`) VALUES
	('Androne', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Corridoio giardino', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Giardino grande', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Giardino piccolo', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Piazzetta', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Stanza 1 dx', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Stanza 1 sx', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Stanza 2 dx', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Stanza 2 sx', '2018-08-20 18:03:37', '2018-08-20 18:03:37'),
	('Via Umberto I', '2018-06-15 15:47:25', '2018-06-15 15:47:25');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;



-- Dump della struttura di trigger gestionale_sett2025.orders_schedule_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `orders_schedule_trigger` AFTER INSERT ON `ordini` FOR EACH ROW BEGIN
DECLARE iterator INT DEFAULT 0;
DECLARE cat ENUM('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce','cantinetta');


SELECT categoria into cat FROM portata where nome_portata=NEW.portata;

IF cat = 'pane e coperto' OR cat= 'bevanda'  THEN
	WHILE iterator < NEW.quantita DO
		INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		(NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,2, cat);
		SET iterator = iterator + 1;
	END WHILE;
ELSEIF cat = 'bruschette e crostoni'  THEN
	WHILE iterator < NEW.quantita DO
		INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		(NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'antipasto');
		SET iterator = iterator + 1;
	END WHILE;
ELSEIF cat = 'contorno'  THEN
	WHILE iterator < NEW.quantita DO
		INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		(NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
		SET iterator = iterator + 1;
	END WHILE;
ELSE
	WHILE iterator < NEW.quantita DO
		INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		(NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, cat);
		SET iterator = iterator + 1;
	END WHILE;
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dump della struttura di trigger gestionale_sett2025.orders_schedule_trigger_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `orders_schedule_trigger_update` AFTER UPDATE ON `ordini` FOR EACH ROW BEGIN
DECLARE iterator INT DEFAULT 0;
DECLARE cat ENUM('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce','cantinetta');


SELECT categoria into cat FROM portata where nome_portata=NEW.portata;
IF ((NEW.quantita - OLD.quantita) > 0) THEN
	IF cat = 'pane e coperto' OR cat= 'bevanda'  THEN
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,2, cat);
		     SET iterator = iterator + 1;
		END WHILE;
	ELSEIF cat = 'bruschette e crostoni' then 
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'antipasto');
		     SET iterator = iterator + 1;
		END WHILE;
	ELSEIF cat = 'contorno' then 
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
		     SET iterator = iterator + 1;
		END WHILE;
	ELSE 
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO		
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, cat);
		     SET iterator = iterator + 1;
		END WHILE;
	END IF;
ELSE
	WHILE (iterator < (OLD.quantita - NEW.quantita)) DO
		DELETE FROM programmazioneordini WHERE serata = NEW.serata 
		AND portata = NEW.portata
		AND tavolo = NEW.tavolo
		AND indice = NEW.indice
		LIMIT 1;

     	SET iterator = iterator + 1;
	END WHILE;
END IF;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
