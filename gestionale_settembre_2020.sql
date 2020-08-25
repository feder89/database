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
-- Create schema gestionale_sett2020
--

CREATE DATABASE IF NOT EXISTS gestionale_sett2020;
USE gestionale_sett2020;

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

/*!40000 ALTER TABLE `composizionemenu` DISABLE KEYS */;
INSERT INTO `composizionemenu` (`menu`,`portata`,`data_creazione`,`data_aggiornamento`) VALUES 
 ('Cantinetta','Bianco Pietramala 2017','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Bianco Pietramala 2017 calice','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra Corona','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra Franziskaner','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra ichnusa non filtrata','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra Moretti','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra Moretti rossa','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Birra Paulaner','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con erba e salsiccia','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con formaggio','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con prosciutto','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con prosciutto e rucola','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con prosciutto e scamorza','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con prosciutto, stracchino e rucola','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con salame piccante, stracchino','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia con salame piccante, stracchino e rucola','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia la Donati prosciutto, scamorza, erba e salsiccia','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia piccante','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia salame piccante e scamorsa','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia stracchino e prosciutto','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Crescia stracchino e rucola','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Montefalco Rosso 2016 Milziade Antano','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Montefalco Rosso 2016 Milziade Antano calice','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Pane e Coperto','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Prosecco','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Prosecco calice','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Rosso Roccascossa 2017','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Cantinetta','Rosso Roccascossa 2017 calice','2020-08-25 21:57:19','2020-08-25 21:57:19'),
 ('Standard','Acqua frizzante 1 lt.','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Acqua naturale 1 lt.','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Antipasto Sette Selle','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Bocconcini di Vitello ai funghi misti del bosco','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Bruschetta ai fichi con Prosciutto di Norcia IGP','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Bruschetta con Ciauscolo e Pecorino','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Cheesecake','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Coratella di agnello con crescia','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Erba spadellata','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Galletto glassato al Miele e Senape con macedonia di verdure','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','GF Antipasto Sette Selle','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Bocconcini di Vitello ai funghi misti del bosco','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Bruschetta ai fichi con Prosciutto di Norcia IGP','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Bruschetta con Ciauscolo e Pecorino','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','GF Cheesecake','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Coratella di agnello con crescia','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Erba spadellata','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Galletto glassato al Miele e Senape con macedonia di verdure','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Gnocchi alla Contrastanga','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Gnocchi con fonduta di pecorino, zafferano e tartufo','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Guanciola di maiale al vino rosso con erba spadellata','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Le Costine sfiziose dello Chef con patate al forno','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Lumache al sugo con erba spadellata','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Macedonia di Verdure','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Mezzemaniche all ortolana','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Misticanza di bruschette','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Oca porchettata con patate al forno','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Pappa al Pomodoro con Burrata e Pesto di Basilico','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Pappardelle impastate al Cacao con ragu bianco di Cinghiale','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','GF Patate arrosto','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Rocciata del Re','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Semifreddo Fichi e Noci','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Strangozzi alla Furente con Timo Serpullo','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Tagliatelle al ragu bianco di chianina','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Tagliere di salumi e formaggi Salumeria Pizzoni','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','GF Tozzetti','2019-08-29 00:18:45','2019-08-29 00:18:45'),
 ('Standard','Gnocchi alla Contrastanga','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Gnocchi con fonduta di pecorino, zafferano e tartufo','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Guanciola di maiale al vino rosso con erba spadellata','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Le Costine sfiziose dello Chef con patate al forno','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Lumache al sugo con erba spadellata','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Macedonia di Verdure','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Mezzemaniche all ortolana','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Misticanza di bruschette','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Oca porchettata con patate al forno','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Pane e Coperto','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Pappa al Pomodoro con Burrata e Pesto di Basilico','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Pappardelle impastate al Cacao con ragu bianco di Cinghiale','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Patate arrosto','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Rocciata del Re servita con gelato alla Rocciata','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Semifreddo Fichi e Noci','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Strangozzi alla Furente con Timo Serpullo','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Tagliatelle al ragu bianco di chianina','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Tagliere di salumi e formaggi Salumeria Pizzoni','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Tozzetti e Acchiappafemmine','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Arneto Trebbiano Spoletino','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Bianco Umbria MILZIADE ANTANO','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Grechetto di Montefalco','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Greco di Renabianca Grechetto','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Malot','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Montefalco Rosso MILZIADE ANTANO','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Montefalco Rosso Riserva MILZIADE ANTANO','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Montefalco Sagrantino BIO PLANI ARCHE','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Pietramala','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Roccascossa','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Rosso Umbria IGT SCACCIADIAVOLI','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Vino Sagrantino passito DOCG 2011','2019-08-29 00:06:57','2019-08-29 00:06:57'),
 ('Standard','Zuppa di Ceci e Lagane','2019-08-29 00:06:57','2019-08-29 00:06:57');
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
INSERT INTO `menu` (`id`,`nome_menu`,`data_creazione`,`data_aggiornamento`,`fisso`,`prezzo_fisso`) VALUES 
 (2,'Cantinetta','2020-08-25 21:56:30','2020-08-25 21:56:30',0,NULL),
 (1,'Standard','2019-08-29 00:06:10','2019-08-29 00:06:10',0,NULL);
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
INSERT INTO `portata` (`id`,`nome_portata`,`categoria`,`prezzo_finale`,`data_creazione`,`data_aggiornamento`) VALUES 
 (34,'Acqua frizzante 1 lt.','bevanda','1.50','2019-08-28 23:52:07','2019-08-28 23:52:07'),
 (34,'Acqua frizzante 1 lt. FISSO','bevanda','1.50','2019-08-28 23:52:07','2019-08-28 23:52:07'),
 (33,'Acqua naturale 1 lt.','bevanda','1.50','2019-08-28 23:51:46','2019-08-28 23:51:46'),
 (33,'Acqua naturale 1 lt. FISSO','bevanda','1.50','2019-08-28 23:51:46','2019-08-28 23:51:46'),
 (6,'Antipasto Sette Selle','antipasto','5.50','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (6,'Antipasto Sette Selle FISSO','antipasto','5.50','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (67,'Bianco Pietramala 2017','cantinetta','8.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (63,'Bianco Pietramala 2017 calice','cantinetta','3.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (58,'Birra Corona','cantinetta','3.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (56,'Birra Franziskaner','cantinetta','4.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (59,'Birra ichnusa non filtrata','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (61,'Birra Moretti','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (60,'Birra Moretti rossa','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (57,'Birra Paulaner','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (17,'Bocconcini di Vitello ai funghi misti del bosco','secondo','8.50','2019-08-28 23:40:33','2019-08-28 23:40:33'),
 (17,'Bocconcini di Vitello ai funghi misti del bosco FISSO','secondo','8.50','2019-08-28 23:40:33','2019-08-28 23:40:33'),
 (3,'Bruschetta ai fichi con Prosciutto di Norcia IGP','bruschette e crostoni','5.00','2019-08-28 23:32:27','2019-08-28 23:33:25'),
 (3,'Bruschetta ai fichi con Prosciutto di Norcia IGP FISSO','bruschette e crostoni','5.00','2019-08-28 23:32:27','2019-08-28 23:33:25'),
 (2,'Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP','bruschette e crostoni','4.50','2019-08-28 23:34:19','2019-08-28 23:37:00'),
 (2,'Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP FISSO','bruschette e crostoni','4.50','2019-08-28 23:34:19','2019-08-28 23:37:00'),
 (4,'Bruschetta con Ciauscolo e Pecorino','antipasto','5.00','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (4,'Bruschetta con Ciauscolo e Pecorino FISSO','antipasto','5.00','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (25,'Cheesecake','dolce','5.00','2019-08-28 23:45:10','2019-08-28 23:45:10'),
 (25,'Cheesecake FISSO','dolce','5.00','2019-08-28 23:45:10','2019-08-28 23:45:10'),
 (7,'Coratella di agnello con crescia','antipasto','7.50','2019-08-28 23:35:47','2019-08-28 23:35:47'),
 (7,'Coratella di agnello con crescia FISSO','antipasto','7.50','2019-08-28 23:35:47','2019-08-28 23:35:47'),
 (47,'Crescia con erba e salsiccia','cantinetta','4.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (45,'Crescia con formaggio','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (43,'Crescia con prosciutto','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (46,'Crescia con prosciutto e rucola','cantinetta','4.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (44,'Crescia con prosciutto e scamorza','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (48,'Crescia con prosciutto, stracchino e rucola','cantinetta','4.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (55,'Crescia con salame piccante, stracchino','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (54,'Crescia con salame piccante, stracchino e rucola','cantinetta','4.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (49,'Crescia la Donati prosciutto, scamorza, erba e salsiccia','cantinetta','5.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (52,'Crescia piccante','cantinetta','3.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (53,'Crescia salame piccante e scamorsa','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (51,'Crescia stracchino e prosciutto','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (50,'Crescia stracchino e rucola','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (22,'Erba spadellata','contorno','3.50','2019-08-28 23:42:59','2019-08-28 23:44:03'),
 (22,'Erba spadellata FISSO','contorno','3.50','2019-08-28 23:42:59','2019-08-28 23:44:03'),
 (19,'Galletto glassato al Miele e Senape con macedonia di verdure','secondo','7.50','2019-08-28 23:41:22','2019-08-28 23:41:22'),
 (19,'Galletto glassato al Miele e Senape con macedonia di verdure FISSO','secondo','7.50','2019-08-28 23:41:22','2019-08-28 23:41:22'),
 (6,'GF Antipasto Sette Selle','antipasto','5.50','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (6,'GF Antipasto Sette Selle FISSO','antipasto','5.50','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (17,'GF Bocconcini di Vitello ai funghi misti del bosco','secondo','8.50','2019-08-28 23:40:33','2019-08-28 23:40:33'),
 (17,'GF Bocconcini di Vitello ai funghi misti del bosco FISSO','secondo','8.50','2019-08-28 23:40:33','2019-08-28 23:40:33'),
 (3,'GF Bruschetta ai fichi con Prosciutto di Norcia IGP','bruschette e crostoni','5.00','2019-08-28 23:32:27','2019-08-28 23:33:25'),
 (3,'GF Bruschetta ai fichi con Prosciutto di Norcia IGP FISSO','bruschette e crostoni','5.00','2019-08-28 23:32:27','2019-08-28 23:33:25'),
 (2,'GF Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP','bruschette e crostoni','4.50','2019-08-28 23:34:19','2019-08-28 23:37:00'),
 (2,'GF Bruschetta all olio EVO Bio Clarici con prosciutto di Norcia IGP FISSO','bruschette e crostoni','4.50','2019-08-28 23:34:19','2019-08-28 23:37:00'),
 (4,'GF Bruschetta con Ciauscolo e Pecorino','antipasto','5.00','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (4,'GF Bruschetta con Ciauscolo e Pecorino FISSO','antipasto','5.00','2019-08-28 23:35:04','2019-08-28 23:35:04'),
 (25,'GF Cheesecake','dolce','5.00','2019-08-28 23:45:10','2019-08-28 23:45:10'),
 (25,'GF Cheesecake FISSO','dolce','5.00','2019-08-28 23:45:10','2019-08-28 23:45:10'),
 (7,'GF Coratella di agnello con crescia','antipasto','7.50','2019-08-28 23:35:47','2019-08-28 23:35:47'),
 (7,'GF Coratella di agnello con crescia FISSO','antipasto','7.50','2019-08-28 23:35:47','2019-08-28 23:35:47'),
 (22,'GF Erba spadellata','contorno','3.50','2019-08-28 23:42:59','2019-08-28 23:44:03'),
 (22,'GF Erba spadellata FISSO','contorno','3.50','2019-08-28 23:42:59','2019-08-28 23:44:03'),
 (19,'GF Galletto glassato al Miele e Senape con macedonia di verdure','secondo','7.50','2019-08-28 23:41:22','2019-08-28 23:41:22'),
 (19,'GF Galletto glassato al Miele e Senape con macedonia di verdure FISSO','secondo','7.50','2019-08-28 23:41:22','2019-08-28 23:41:22'),
 (13,'GF Gnocchi alla Contrastanga','primo','7.50','2019-08-28 23:39:05','2019-08-28 23:39:05'),
 (13,'GF Gnocchi alla Contrastanga FISSO','primo','7.50','2019-08-28 23:39:05','2019-08-28 23:39:05'),
 (14,'GF Gnocchi con fonduta di pecorino, zafferano e tartufo','primo','9.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (14,'GF Gnocchi con fonduta di pecorino, zafferano e tartufo FISSO','primo','9.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (16,'GF Guanciola di maiale al vino rosso con erba spadellata','secondo','8.50','2019-08-28 23:40:12','2019-08-28 23:40:12'),
 (16,'GF Guanciola di maiale al vino rosso con erba spadellata FISSO','secondo','8.50','2019-08-28 23:40:12','2019-08-28 23:40:12'),
 (15,'GF Le Costine sfiziose dello Chef con patate al forno','secondo','9.00','2019-08-28 23:39:46','2019-08-28 23:39:46'),
 (15,'GF Le Costine sfiziose dello Chef con patate al forno FISSO','secondo','9.00','2019-08-28 23:39:46','2019-08-28 23:39:46'),
 (20,'GF Lumache al sugo con erba spadellata','secondo','10.00','2019-08-28 23:41:43','2019-08-28 23:41:43'),
 (20,'GF Lumache al sugo con erba spadellata FISSO','secondo','10.00','2019-08-28 23:41:43','2019-08-28 23:41:43'),
 (23,'GF Macedonia di Verdure','contorno','3.50','2019-08-28 23:43:49','2019-08-28 23:43:49'),
 (23,'GF Macedonia di Verdure FISSO','contorno','3.50','2019-08-28 23:43:49','2019-08-28 23:43:49'),
 (11,'GF Mezzemaniche all ortolana','primo','6.50','2019-08-28 23:38:09','2019-08-28 23:38:09'),
 (11,'GF Mezzemaniche all ortolana FISSO','primo','6.50','2019-08-28 23:38:09','2019-08-28 23:38:09'),
 (3,'GF Misticanza di bruschette','bruschette e crostoni','4.50','2019-08-28 23:33:40','2019-08-28 23:33:40'),
 (3,'GF Misticanza di bruschette FISSO','bruschette e crostoni','4.50','2019-08-28 23:33:40','2019-08-28 23:33:40'),
 (18,'GF Oca porchettata con patate al forno','secondo','8.50','2019-08-28 23:40:50','2019-08-28 23:40:50'),
 (18,'GF Oca porchettata con patate al forno FISSO','secondo','8.50','2019-08-28 23:40:50','2019-08-28 23:40:50'),
 (5,'GF Pappa al Pomodoro con Burrata e Pesto di Basilico','antipasto','5.00','2019-08-28 23:34:44','2019-08-28 23:34:44'),
 (5,'GF Pappa al Pomodoro con Burrata e Pesto di Basilico FISSO','antipasto','5.00','2019-08-28 23:34:44','2019-08-28 23:34:44'),
 (14,'GF Pappardelle impastate al Cacao con ragu bianco di Cinghiale','primo','8.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (14,'GF Pappardelle impastate al Cacao con ragu bianco di Cinghiale FISSO','primo','8.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (21,'GF Patate arrosto','contorno','3.50','2019-08-28 23:42:40','2019-08-28 23:42:40'),
 (21,'GF Patate arrosto FISSO','contorno','3.50','2019-08-28 23:42:40','2019-08-28 23:42:40'),
 (27,'GF Rocciata del Re','dolce','7.00','2019-08-28 23:46:18','2019-08-28 23:46:18'),
 (27,'GF Rocciata del Re FISSO','dolce','7.00','2019-08-28 23:46:18','2019-08-28 23:46:18'),
 (26,'GF Semifreddo Fichi e Noci','dolce','5.00','2019-08-28 23:45:33','2019-08-28 23:45:48'),
 (26,'GF Semifreddo Fichi e Noci FISSO','dolce','5.00','2019-08-28 23:45:33','2019-08-28 23:45:48'),
 (10,'GF Strangozzi alla Furente con Timo Serpullo','primo','6.50','2019-08-28 23:37:43','2019-08-28 23:37:43'),
 (10,'GF Strangozzi alla Furente con Timo Serpullo FISSO','primo','6.50','2019-08-28 23:37:43','2019-08-28 23:37:43'),
 (12,'GF Tagliatelle al ragu bianco di chianina','primo','7.50','2019-08-28 23:38:45','2019-08-28 23:38:45'),
 (12,'GF Tagliatelle al ragu bianco di chianina FISSO','primo','7.50','2019-08-28 23:38:45','2019-08-28 23:38:45'),
 (8,'GF Tagliere di salumi e formaggi Salumeria Pizzoni','antipasto','8.00','2019-08-28 23:36:35','2019-08-28 23:36:35'),
 (8,'GF Tagliere di salumi e formaggi Salumeria Pizzoni FISSO','antipasto','8.00','2019-08-28 23:36:35','2019-08-28 23:36:35'),
 (24,'GF Tozzetti','dolce','4.50','2019-08-28 23:44:38','2019-08-28 23:44:38'),
 (24,'GF Tozzetti FISSO','dolce','4.50','2019-08-28 23:44:38','2019-08-28 23:44:38'),
 (13,'Gnocchi alla Contrastanga','primo','7.50','2019-08-28 23:39:05','2019-08-28 23:39:05'),
 (13,'Gnocchi alla Contrastanga FISSO','primo','7.50','2019-08-28 23:39:05','2019-08-28 23:39:05'),
 (14,'Gnocchi con fonduta di pecorino, zafferano e tartufo','primo','9.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (14,'Gnocchi con fonduta di pecorino, zafferano e tartufo FISSO','primo','9.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (16,'Guanciola di maiale al vino rosso con erba spadellata','secondo','8.50','2019-08-28 23:40:12','2019-08-28 23:40:12'),
 (16,'Guanciola di maiale al vino rosso con erba spadellata FISSO','secondo','8.50','2019-08-28 23:40:12','2019-08-28 23:40:12'),
 (15,'Le Costine sfiziose dello Chef con patate al forno','secondo','9.00','2019-08-28 23:39:46','2019-08-28 23:39:46'),
 (15,'Le Costine sfiziose dello Chef con patate al forno FISSO','secondo','9.00','2019-08-28 23:39:46','2019-08-28 23:39:46'),
 (20,'Lumache al sugo con erba spadellata','secondo','10.00','2019-08-28 23:41:43','2019-08-28 23:41:43'),
 (20,'Lumache al sugo con erba spadellata FISSO','secondo','10.00','2019-08-28 23:41:43','2019-08-28 23:41:43'),
 (23,'Macedonia di Verdure','contorno','3.50','2019-08-28 23:43:49','2019-08-28 23:43:49'),
 (23,'Macedonia di Verdure FISSO','contorno','3.50','2019-08-28 23:43:49','2019-08-28 23:43:49'),
 (11,'Mezzemaniche all ortolana','primo','6.50','2019-08-28 23:38:09','2019-08-28 23:38:09'),
 (11,'Mezzemaniche all ortolana FISSO','primo','6.50','2019-08-28 23:38:09','2019-08-28 23:38:09'),
 (3,'Misticanza di bruschette','bruschette e crostoni','4.50','2019-08-28 23:33:40','2019-08-28 23:33:40'),
 (3,'Misticanza di bruschette FISSO','bruschette e crostoni','4.50','2019-08-28 23:33:40','2019-08-28 23:33:40'),
 (69,'Montefalco Rosso 2016 Milziade Antano','cantinetta','16.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (65,'Montefalco Rosso 2016 Milziade Antano calice','cantinetta','4.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (18,'Oca porchettata con patate al forno','secondo','8.50','2019-08-28 23:40:50','2019-08-28 23:40:50'),
 (18,'Oca porchettata con patate al forno FISSO','secondo','8.50','2019-08-28 23:40:50','2019-08-28 23:40:50'),
 (1,'Pane e Coperto','pane e coperto','1.00','2019-08-28 23:31:52','2019-08-28 23:31:52'),
 (5,'Pappa al Pomodoro con Burrata e Pesto di Basilico','antipasto','5.00','2019-08-28 23:34:44','2019-08-28 23:34:44'),
 (5,'Pappa al Pomodoro con Burrata e Pesto di Basilico FISSO','antipasto','5.00','2019-08-28 23:34:44','2019-08-28 23:34:44'),
 (14,'Pappardelle impastate al Cacao con ragu bianco di Cinghiale','primo','8.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (14,'Pappardelle impastate al Cacao con ragu bianco di Cinghiale FISSO','primo','8.00','2019-08-28 23:39:25','2019-08-28 23:39:25'),
 (21,'Patate arrosto','contorno','3.50','2019-08-28 23:42:40','2019-08-28 23:42:40'),
 (21,'Patate arrosto FISSO','contorno','3.50','2019-08-28 23:42:40','2019-08-28 23:42:40'),
 (66,'Prosecco','cantinetta','12.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (62,'Prosecco calice','cantinetta','3.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (27,'Rocciata del Re servita con gelato alla Rocciata','dolce','7.00','2019-08-28 23:46:18','2019-08-28 23:46:18'),
 (27,'Rocciata del Re servita con gelato alla Rocciata FISSO','dolce','7.00','2019-08-28 23:46:18','2019-08-28 23:46:18'),
 (68,'Rosso Roccascossa 2017','cantinetta','8.50','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (64,'Rosso Roccascossa 2017 calice','cantinetta','3.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (26,'Semifreddo Fichi e Noci','dolce','5.00','2019-08-28 23:45:33','2019-08-28 23:45:48'),
 (26,'Semifreddo Fichi e Noci FISSO','dolce','5.00','2019-08-28 23:45:33','2019-08-28 23:45:48'),
 (10,'Strangozzi alla Furente con Timo Serpullo','primo','6.50','2019-08-28 23:37:43','2019-08-28 23:37:43'),
 (10,'Strangozzi alla Furente con Timo Serpullo FISSO','primo','6.50','2019-08-28 23:37:43','2019-08-28 23:37:43'),
 (12,'Tagliatelle al ragu bianco di chianina','primo','7.50','2019-08-28 23:38:45','2019-08-28 23:38:45'),
 (12,'Tagliatelle al ragu bianco di chianina FISSO','primo','7.50','2019-08-28 23:38:45','2019-08-28 23:38:45'),
 (8,'Tagliere di salumi e formaggi Salumeria Pizzoni','antipasto','8.00','2019-08-28 23:36:35','2019-08-28 23:36:35'),
 (8,'Tagliere di salumi e formaggi Salumeria Pizzoni FISSO','antipasto','8.00','2019-08-28 23:36:35','2019-08-28 23:36:35'),
 (24,'Tozzetti e Acchiappafemmine','dolce','4.50','2019-08-28 23:44:38','2019-08-28 23:44:38'),
 (24,'Tozzetti e Acchiappafemmine FISSO','dolce','4.50','2019-08-28 23:44:38','2019-08-28 23:44:38'),
 (39,'Vino Arneto Trebbiano Spoletino','bevanda','19.50','2019-08-28 23:59:15','2019-08-28 23:59:15'),
 (39,'Vino Arneto Trebbiano Spoletino FISSO','bevanda','19.50','2019-08-28 23:59:15','2019-08-28 23:59:15'),
 (37,'Vino Bianco Umbria MILZIADE ANTANO','bevanda','11.00','2019-08-28 23:57:55','2019-08-28 23:58:13'),
 (37,'Vino Bianco Umbria MILZIADE ANTANO FISSO','bevanda','11.00','2019-08-28 23:57:55','2019-08-28 23:58:13'),
 (36,'Vino Grechetto di Montefalco','bevanda','10.50','2019-08-28 23:57:32','2019-08-28 23:57:32'),
 (36,'Vino Grechetto di Montefalco FISSO','bevanda','10.50','2019-08-28 23:57:32','2019-08-28 23:57:32'),
 (38,'Vino Greco di Renabianca Grechetto','bevanda','15.00','2019-08-28 23:58:45','2019-08-28 23:58:45'),
 (38,'Vino Greco di Renabianca Grechetto FISSO','bevanda','15.00','2019-08-28 23:58:45','2019-08-28 23:58:45'),
 (42,'Vino Malot','bevanda','15.00','2019-08-28 23:53:29','2019-08-28 23:59:43'),
 (42,'Vino Malot FISSO','bevanda','15.00','2019-08-28 23:53:29','2019-08-28 23:59:43'),
 (43,'Vino Montefalco Rosso MILZIADE ANTANO','bevanda','16.00','2019-08-28 23:54:15','2019-08-28 23:59:47'),
 (43,'Vino Montefalco Rosso MILZIADE ANTANO FISSO','bevanda','16.00','2019-08-28 23:54:15','2019-08-28 23:59:47'),
 (45,'Vino Montefalco Rosso Riserva MILZIADE ANTANO','bevanda','25.00','2019-08-29 00:01:31','2019-08-29 00:01:31'),
 (45,'Vino Montefalco Rosso Riserva MILZIADE ANTANO FISSO','bevanda','25.00','2019-08-29 00:01:31','2019-08-29 00:01:31'),
 (44,'Vino Montefalco Sagrantino BIO PLANI ARCHE','bevanda','20.50','2019-08-28 23:56:50','2019-08-28 23:59:51'),
 (44,'Vino Montefalco Sagrantino BIO PLANI ARCHE FISSO','bevanda','20.50','2019-08-28 23:56:50','2019-08-28 23:59:51'),
 (35,'Vino Pietramala','bevanda','8.00','2019-08-28 23:52:31','2019-08-28 23:52:31'),
 (35,'Vino Pietramala FISSO','bevanda','8.00','2019-08-28 23:52:31','2019-08-28 23:52:31'),
 (40,'Vino Roccascossa','bevanda','8.00','2019-08-29 00:01:04','2019-08-29 00:01:04'),
 (40,'Vino Roccascossa FISSO','bevanda','8.00','2019-08-29 00:01:04','2019-08-29 00:01:04'),
 (41,'Vino Rosso Umbria IGT SCACCIADIAVOLI','bevanda','10.50','2019-08-28 23:53:07','2019-08-28 23:59:39'),
 (41,'Vino Rosso Umbria IGT SCACCIADIAVOLI FISSO','bevanda','10.50','2019-08-28 23:53:07','2019-08-28 23:59:39'),
 (42,'Vino Sagrantino passito DOCG 2011','bevanda','20.00','2019-08-28 23:53:07','2019-08-28 23:59:39'),
 (9,'Zuppa di Ceci e Lagane','primo','5.00','2019-08-28 23:37:21','2019-08-28 23:37:21'),
 (9,'Zuppa di Ceci e Lagane FISSO','primo','5.00','2019-08-28 23:37:21','2019-08-28 23:37:21');
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
INSERT INTO `responsabili` (`nome`,`data_creazione`,`data_aggiornamento`) VALUES 
 ('Alessandro Del Gatto','2019-05-30 13:59:21','2019-05-30 13:59:21'),
 ('Andrea Caldarelli','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Aurora Gramaccini','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Beatrice Bazzica','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Carlo Mattioli','2016-06-17 08:36:39','2016-06-17 08:36:39'),
 ('Chiara Laura Bartoli','2016-06-03 08:59:03','2016-06-03 08:59:03'),
 ('Cruciani Edoardo','2017-06-02 11:49:49','2017-06-02 11:49:49'),
 ('Elisa Spuntarelli','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Federica Tili','2018-06-01 15:51:52','2018-06-01 15:51:52'),
 ('Federico Porzi','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Filippo Faccendini','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Francesca Amodeo','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Francesca Faccendini','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Francesca Filippini','2019-05-30 14:00:51','2019-05-30 14:00:51'),
 ('Gioulia x','2018-06-01 15:54:05','2018-06-01 15:54:05'),
 ('Lavinia Pinchi','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Leonardo Belloni','2018-06-01 15:52:25','2018-06-01 15:52:25'),
 ('Leonardo Cecconi','2019-05-30 13:58:50','2019-05-30 13:58:50'),
 ('Mariasole Parziani','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Matilde Lorenzini','2019-05-30 14:00:17','2019-05-30 14:00:17'),
 ('Matteo Vinti','2019-05-31 15:47:43','2019-05-31 15:47:43'),
 ('Mattia Badalo','2017-09-01 13:18:32','2017-09-01 13:18:32'),
 ('Mattia Ornielli','2017-09-01 13:20:45','2017-09-01 13:20:45'),
 ('Pamela Mastrorilli','2018-06-15 15:53:40','2018-06-15 15:53:40'),
 ('pier Ferri','2016-05-31 12:48:16','2016-05-31 12:48:16'),
 ('Samanta Marchegiani','2016-05-31 13:02:33','2016-05-31 13:02:33'),
 ('Simone Striano','2017-09-01 13:17:01','2017-09-01 13:17:01'),
 ('Sofia Ferri','2018-06-01 15:52:45','2018-06-01 15:52:45'),
 ('Tommaso Carini','2016-06-01 10:08:52','2016-06-01 10:08:52'),
 ('Tommaso Mariani','2018-06-01 15:54:54','2018-06-01 15:54:54'),
 ('Virginia Squadroni','2019-05-31 16:00:00','2019-05-31 16:00:00'),
 ('Virginia Vagaggini','2018-09-01 17:52:26','2018-09-01 17:52:26'),
 ('Virginia Volpi','2018-09-05 17:25:38','2018-09-05 17:25:38');
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
INSERT INTO `tavoli` (`numero_tavolo`,`zona`,`posti`,`data_creazione`,`data_aggiornamento`) VALUES 
 (1,'Via Umberto I',9,'2018-09-15 15:17:47','2018-09-15 15:17:47'),
 (2,'Via Umberto I',9,'2018-09-15 15:18:12','2018-09-15 15:18:12'),
 (3,'Via Umberto I',9,'2018-09-15 15:19:33','2018-09-15 15:19:33'),
 (4,'Via Umberto I',9,'2018-09-15 15:20:19','2018-09-15 15:20:19'),
 (5,'Via Umberto I',9,'2018-09-15 15:20:49','2018-09-15 15:20:49'),
 (6,'Via Umberto I',9,'2018-09-15 15:21:21','2018-09-15 15:21:21'),
 (7,'Via Umberto I',9,'2018-09-15 15:21:44','2018-09-15 15:21:44'),
 (8,'Via Umberto I',9,'2018-09-15 15:22:20','2018-09-15 15:22:20'),
 (9,'Via Umberto I',9,'2018-09-15 15:22:45','2018-09-15 15:22:45'),
 (10,'Via Umberto I',9,'2018-09-15 15:23:38','2018-09-15 15:23:38'),
 (11,'Via Umberto I',9,'2018-09-15 15:24:01','2018-09-15 15:24:01'),
 (12,'Via Umberto I',9,'2018-09-15 15:24:29','2018-09-15 15:24:29'),
 (13,'Via Umberto I',9,'2018-09-15 15:25:07','2018-09-15 15:25:07'),
 (14,'Via Umberto I',9,'2018-09-15 15:25:33','2018-09-15 15:25:33'),
 (15,'Via Umberto I',9,'2018-09-15 15:26:07','2018-09-15 15:26:07'),
 (16,'Via Umberto I',9,'2018-09-15 15:26:34','2018-09-15 15:26:34'),
 (17,'Via Umberto I',9,'2018-09-15 15:27:02','2018-09-15 15:27:02'),
 (18,'Via Umberto I',9,'2018-09-15 15:27:36','2018-09-15 15:27:36'),
 (101,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (102,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (103,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (104,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (105,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (106,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (107,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (108,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (109,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (110,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (111,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (112,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (113,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (114,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (115,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (116,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (117,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (118,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (119,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (120,'Giardino grande',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (201,'Giardino piccolo',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (202,'Giardino piccolo',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (203,'Giardino piccolo',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (204,'Giardino piccolo',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (205,'Giardino piccolo',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (206,'Giardino piccolo',10,'2018-09-01 18:54:13','2018-09-01 18:54:13'),
 (301,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (302,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (303,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (304,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (305,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (306,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (307,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (308,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (309,'Piazzetta',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (401,'Corridoio giardino',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (402,'Corridoio giardino',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (403,'Corridoio giardino',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (404,'Corridoio giardino',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (405,'Corridoio giardino',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (406,'Corridoio giardino',6,'2018-09-14 17:45:50','2018-09-14 17:45:50'),
 (501,'Stanza 2 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (502,'Stanza 2 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (503,'Stanza 2 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (504,'Stanza 2 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (505,'Stanza 2 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (601,'Stanza 1 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (602,'Stanza 1 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (603,'Stanza 1 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (604,'Stanza 1 dx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (701,'Stanza 1 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (702,'Stanza 1 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (703,'Stanza 1 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (801,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (802,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (803,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (804,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (805,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (806,'Stanza 2 sx',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (901,'Androne',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (902,'Androne',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (903,'Androne',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (904,'Androne',10,'2018-08-20 20:03:37','2018-08-20 20:03:37'),
 (999,'Androne',10,'2018-05-28 19:55:53','2018-05-28 19:56:30');
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
INSERT INTO `utente` (`username`,`password`,`gruppo`,`nome`,`cognome`,`email`,`tel_fisso`,`tel_mobile`,`foto`) VALUES 
 ('daniele','47477de04d78d5a360c5fda47a986955','amm','Daniele','Binucci','',NULL,NULL,NULL),
 ('pier_ferri','201f00b5ca5d65a1c118e5e32431514c','amm','Pergiorgio','Ferri','',NULL,NULL,NULL);
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
INSERT INTO `zone` (`zona`,`data_creazione`,`data_aggiornamento`) VALUES 
 ('Androne','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Corridoio giardino','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Giardino grande','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Giardino piccolo','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Piazzetta','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Stanza 1 dx','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Stanza 1 sx','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Stanza 2 dx','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Stanza 2 sx','2018-08-20 20:03:37','2018-08-20 20:03:37'),
 ('Via Umberto I','2018-06-15 17:47:25','2018-06-15 17:47:25');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;



-- Dump della struttura di trigger gestionale_sett2019.orders_schedule_trigger
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
END IF;
IF cat != 'cantinetta' THEN
	WHILE iterator < NEW.quantita DO
		INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		(NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, cat);
		SET iterator = iterator + 1;
	END WHILE;
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dump della struttura di trigger gestionale_sett2019.orders_schedule_trigger_update
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
	END IF;
	IF cat != 'cantinetta' THEN
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
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
