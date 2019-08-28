-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.1.9-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win32
-- HeidiSQL Versione:            10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database gestionale_sett2019
CREATE DATABASE IF NOT EXISTS `gestionale_sett2019` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestionale_sett2019`;

-- Dump della struttura di tabella gestionale_sett2019.comande
CREATE TABLE IF NOT EXISTS `comande` (
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

-- Dump dei dati della tabella gestionale_sett2019.comande: ~0 rows (circa)
/*!40000 ALTER TABLE `comande` DISABLE KEYS */;
/*!40000 ALTER TABLE `comande` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.composizionemenu
CREATE TABLE IF NOT EXISTS `composizionemenu` (
  `menu` varchar(50) NOT NULL,
  `portata` varchar(100) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu`,`portata`),
  KEY `nome portata_idx` (`portata`),
  CONSTRAINT `nome menu` FOREIGN KEY (`menu`) REFERENCES `menu` (`nome_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nome portata` FOREIGN KEY (`portata`) REFERENCES `portata` (`nome_portata`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.composizionemenu: ~405 rows (circa)
/*!40000 ALTER TABLE `composizionemenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `composizionemenu` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.composizioneportata
CREATE TABLE IF NOT EXISTS `composizioneportata` (
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

-- Dump dei dati della tabella gestionale_sett2019.composizioneportata: ~0 rows (circa)
/*!40000 ALTER TABLE `composizioneportata` DISABLE KEYS */;
/*!40000 ALTER TABLE `composizioneportata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.materieprime
CREATE TABLE IF NOT EXISTS `materieprime` (
  `nome_materia` varchar(40) NOT NULL,
  `genere` varchar(45) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.materieprime: ~0 rows (circa)
/*!40000 ALTER TABLE `materieprime` DISABLE KEYS */;
/*!40000 ALTER TABLE `materieprime` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `nome_menu` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fisso` tinyint(1) NOT NULL DEFAULT '0',
  `prezzo_fisso` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`nome_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.menu: ~18 rows (circa)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.menuserata
CREATE TABLE IF NOT EXISTS `menuserata` (
  `menu` varchar(50) NOT NULL,
  `serata` date NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu`,`serata`),
  KEY `data serata_idx` (`serata`),
  CONSTRAINT `data serata` FOREIGN KEY (`serata`) REFERENCES `serata` (`data`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nome menu1` FOREIGN KEY (`menu`) REFERENCES `menu` (`nome_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.menuserata: ~24 rows (circa)
/*!40000 ALTER TABLE `menuserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuserata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.ordini
CREATE TABLE IF NOT EXISTS `ordini` (
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

-- Dump dei dati della tabella gestionale_sett2019.ordini: ~0 rows (circa)
/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.portata
CREATE TABLE IF NOT EXISTS `portata` (
  `id` int(11) NOT NULL,
  `nome_portata` varchar(100) NOT NULL,
  `categoria` enum('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce') NOT NULL,
  `prezzo_finale` decimal(5,2) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome_portata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.portata: ~145 rows (circa)
/*!40000 ALTER TABLE `portata` DISABLE KEYS */;
/*!40000 ALTER TABLE `portata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.prenotazioni
CREATE TABLE IF NOT EXISTS `prenotazioni` (
  `serata` date NOT NULL,
  `tavoli` int(11) NOT NULL,
  `coperti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.prenotazioni: ~3 rows (circa)
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.programmazioneordini
CREATE TABLE IF NOT EXISTS `programmazioneordini` (
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

-- Dump dei dati della tabella gestionale_sett2019.programmazioneordini: ~50 rows (circa)
/*!40000 ALTER TABLE `programmazioneordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `programmazioneordini` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.quantitapiattiserata
CREATE TABLE IF NOT EXISTS `quantitapiattiserata` (
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

-- Dump dei dati della tabella gestionale_sett2019.quantitapiattiserata: ~353 rows (circa)
/*!40000 ALTER TABLE `quantitapiattiserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantitapiattiserata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.responsabili
CREATE TABLE IF NOT EXISTS `responsabili` (
  `nome` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.responsabili: ~33 rows (circa)
/*!40000 ALTER TABLE `responsabili` DISABLE KEYS */;
INSERT INTO `responsabili` (`nome`, `data_creazione`, `data_aggiornamento`) VALUES
	('Alessandro Del Gatto', '2019-05-30 13:59:21', '2019-05-30 13:59:21'),
	('Andrea Caldarelli', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Aurora Gramaccini', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Beatrice Bazzica', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Carlo Mattioli', '2016-06-17 08:36:39', '2016-06-17 08:36:39'),
	('Chiara Laura Bartoli', '2016-06-03 08:59:03', '2016-06-03 08:59:03'),
	('Cruciani Edoardo', '2017-06-02 11:49:49', '2017-06-02 11:49:49'),
	('Elisa Spuntarelli', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Federica Tili', '2018-06-01 15:51:52', '2018-06-01 15:51:52'),
	('Federico Porzi', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Filippo Faccendini', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Francesca Amodeo', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Francesca Faccendini', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Francesca Filippini', '2019-05-30 14:00:51', '2019-05-30 14:00:51'),
	('Gioulia x', '2018-06-01 15:54:05', '2018-06-01 15:54:05'),
	('Lavinia Pinchi', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Leonardo Belloni', '2018-06-01 15:52:25', '2018-06-01 15:52:25'),
	('Leonardo Cecconi', '2019-05-30 13:58:50', '2019-05-30 13:58:50'),
	('Mariasole Parziani', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Matilde Lorenzini', '2019-05-30 14:00:17', '2019-05-30 14:00:17'),
	('Matteo Vinti', '2019-05-31 15:47:43', '2019-05-31 15:47:43'),
	('Mattia Badalo', '2017-09-01 13:18:32', '2017-09-01 13:18:32'),
	('Mattia Ornielli', '2017-09-01 13:20:45', '2017-09-01 13:20:45'),
	('Pamela Mastrorilli', '2018-06-15 15:53:40', '2018-06-15 15:53:40'),
	('pier Ferri', '2016-05-31 12:48:16', '2016-05-31 12:48:16'),
	('Samanta Marchegiani', '2016-05-31 13:02:33', '2016-05-31 13:02:33'),
	('Simone Striano', '2017-09-01 13:17:01', '2017-09-01 13:17:01'),
	('Sofia Ferri', '2018-06-01 15:52:45', '2018-06-01 15:52:45'),
	('Tommaso Carini', '2016-06-01 10:08:52', '2016-06-01 10:08:52'),
	('Tommaso Mariani', '2018-06-01 15:54:54', '2018-06-01 15:54:54'),
	('Virginia Squadroni', '2019-05-31 16:00:00', '2019-05-31 16:00:00'),
	('Virginia Vagaggini', '2018-09-01 17:52:26', '2018-09-01 17:52:26'),
	('Virginia Volpi', '2018-09-05 17:25:38', '2018-09-05 17:25:38');
/*!40000 ALTER TABLE `responsabili` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.responsabiliserata
CREATE TABLE IF NOT EXISTS `responsabiliserata` (
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

-- Dump dei dati della tabella gestionale_sett2019.responsabiliserata: ~338 rows (circa)
/*!40000 ALTER TABLE `responsabiliserata` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsabiliserata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.ricevutefiscali
CREATE TABLE IF NOT EXISTS `ricevutefiscali` (
  `n_ric` int(11) NOT NULL AUTO_INCREMENT,
  `serata` date NOT NULL,
  `tavolo` int(11) NOT NULL,
  `indice` int(11) NOT NULL,
  `totale` double DEFAULT NULL,
  KEY `n_ric` (`n_ric`)
) ENGINE=InnoDB AUTO_INCREMENT=25616 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.ricevutefiscali: ~195 rows (circa)
/*!40000 ALTER TABLE `ricevutefiscali` DISABLE KEYS */;
INSERT INTO `ricevutefiscali` (`n_ric`, `serata`, `tavolo`, `indice`, `totale`) VALUES
	(25551, '2019-05-30', 106, 1, NULL),
	(25552, '2019-05-30', 107, 1, NULL),
	(25553, '2019-05-30', 110, 1, NULL),
	(25554, '2019-05-30', 113, 1, NULL),
	(25555, '2019-05-30', 202, 1, NULL),
	(25556, '2019-05-30', 203, 1, NULL),
	(25557, '2019-05-30', 401, 1, NULL),
	(25558, '2019-05-30', 402, 1, NULL),
	(25559, '2019-05-30', 403, 1, NULL),
	(25560, '2019-05-30', 404, 1, NULL),
	(25561, '2019-05-30', 999, 1, NULL),
	(25562, '2019-05-31', 102, 1, NULL),
	(25563, '2019-05-31', 103, 1, NULL),
	(25564, '2019-05-31', 103, 2, NULL),
	(25565, '2019-05-31', 104, 1, NULL),
	(25566, '2019-05-31', 106, 1, NULL),
	(25567, '2019-05-31', 105, 1, NULL),
	(25568, '2019-05-31', 108, 1, NULL),
	(25569, '2019-05-31', 109, 1, NULL),
	(25570, '2019-05-31', 110, 1, NULL),
	(25571, '2019-05-31', 111, 1, NULL),
	(25572, '2019-05-31', 112, 1, NULL),
	(25573, '2019-05-31', 113, 1, NULL),
	(25574, '2019-05-31', 114, 1, NULL),
	(25575, '2019-05-31', 115, 1, NULL),
	(25576, '2019-05-31', 113, 2, NULL),
	(25577, '2019-05-31', 118, 1, NULL),
	(25578, '2019-06-01', 101, 1, NULL),
	(25579, '2019-06-01', 206, 1, NULL),
	(25581, '2019-06-01', 402, 1, NULL),
	(25582, '2019-06-01', 102, 1, NULL),
	(25583, '2019-06-01', 901, 1, NULL),
	(25584, '2019-06-01', 117, 2, NULL),
	(25585, '2019-06-01', 309, 1, NULL),
	(25586, '2019-06-01', 105, 1, NULL),
	(25587, '2019-06-01', 110, 1, NULL),
	(25588, '2019-06-01', 109, 1, NULL),
	(25589, '2019-06-01', 303, 1, NULL),
	(25590, '2019-06-01', 903, 1, NULL),
	(25591, '2019-06-01', 401, 1, NULL),
	(25592, '2019-06-01', 204, 1, NULL),
	(25594, '2019-06-01', 113, 1, NULL),
	(25595, '2019-06-01', 109, 2, NULL),
	(25596, '2019-06-01', 103, 1, NULL),
	(25598, '2019-06-01', 304, 1, NULL),
	(25599, '2019-06-01', 405, 1, NULL),
	(25600, '2019-06-01', 305, 1, NULL),
	(25601, '2019-06-01', 205, 1, NULL),
	(25602, '2019-06-01', 301, 1, NULL),
	(25603, '2019-06-01', 202, 1, NULL),
	(25604, '2019-06-01', 203, 1, NULL),
	(25605, '2019-06-01', 203, 2, NULL),
	(25606, '2019-06-01', 106, 1, NULL),
	(25607, '2019-06-01', 403, 1, NULL),
	(25608, '2019-06-01', 104, 1, NULL),
	(25609, '2019-06-01', 404, 2, NULL),
	(25610, '2019-06-01', 115, 2, NULL),
	(25611, '2019-06-01', 116, 1, NULL),
	(25612, '2019-06-01', 105, 3, NULL),
	(25613, '2019-06-01', 117, 1, NULL),
	(25614, '2019-06-01', 308, 1, NULL),
	(25615, '2019-06-01', 112, 2, NULL),
	(25593, '2019-06-01', 107, 1, NULL),
	(25597, '2019-06-01', 115, 1, NULL),
	(25580, '2019-06-01', 204, 2, NULL),
	(25551, '2019-05-30', 106, 1, 0),
	(25552, '2019-05-30', 107, 1, 0),
	(25553, '2019-05-30', 110, 1, 0),
	(25554, '2019-05-30', 113, 1, 0),
	(25555, '2019-05-30', 202, 1, 0),
	(25556, '2019-05-30', 203, 1, 0),
	(25557, '2019-05-30', 401, 1, 0),
	(25558, '2019-05-30', 402, 1, 0),
	(25559, '2019-05-30', 403, 1, 0),
	(25560, '2019-05-30', 404, 1, 0),
	(25561, '2019-05-30', 999, 1, 0),
	(25562, '2019-05-31', 102, 1, 0),
	(25563, '2019-05-31', 103, 1, 0),
	(25564, '2019-05-31', 103, 2, 0),
	(25565, '2019-05-31', 104, 1, 0),
	(25566, '2019-05-31', 106, 1, 0),
	(25567, '2019-05-31', 105, 1, 0),
	(25568, '2019-05-31', 108, 1, 0),
	(25569, '2019-05-31', 109, 1, 0),
	(25570, '2019-05-31', 110, 1, 0),
	(25571, '2019-05-31', 111, 1, 0),
	(25572, '2019-05-31', 112, 1, 0),
	(25573, '2019-05-31', 113, 1, 0),
	(25574, '2019-05-31', 114, 1, 0),
	(25575, '2019-05-31', 115, 1, 0),
	(25576, '2019-05-31', 113, 2, 0),
	(25577, '2019-05-31', 118, 1, 0),
	(25578, '2019-06-01', 101, 1, 0),
	(25579, '2019-06-01', 206, 1, 0),
	(25581, '2019-06-01', 402, 1, 0),
	(25582, '2019-06-01', 102, 1, 0),
	(25583, '2019-06-01', 901, 1, 0),
	(25584, '2019-06-01', 117, 2, 0),
	(25585, '2019-06-01', 309, 1, 0),
	(25586, '2019-06-01', 105, 1, 0),
	(25587, '2019-06-01', 110, 1, 0),
	(25588, '2019-06-01', 109, 1, 0),
	(25589, '2019-06-01', 303, 1, 0),
	(25590, '2019-06-01', 903, 1, 0),
	(25591, '2019-06-01', 401, 1, 0),
	(25592, '2019-06-01', 204, 1, 0),
	(25594, '2019-06-01', 113, 1, 0),
	(25595, '2019-06-01', 109, 2, 0),
	(25596, '2019-06-01', 103, 1, 0),
	(25598, '2019-06-01', 304, 1, 0),
	(25599, '2019-06-01', 405, 1, 0),
	(25600, '2019-06-01', 305, 1, 0),
	(25601, '2019-06-01', 205, 1, 0),
	(25602, '2019-06-01', 301, 1, 0),
	(25603, '2019-06-01', 202, 1, 0),
	(25604, '2019-06-01', 203, 1, 0),
	(25605, '2019-06-01', 203, 2, 0),
	(25606, '2019-06-01', 106, 1, 0),
	(25607, '2019-06-01', 403, 1, 0),
	(25608, '2019-06-01', 104, 1, 0),
	(25609, '2019-06-01', 404, 2, 0),
	(25610, '2019-06-01', 115, 2, 0),
	(25611, '2019-06-01', 116, 1, 0),
	(25612, '2019-06-01', 105, 3, 0),
	(25613, '2019-06-01', 117, 1, 0),
	(25614, '2019-06-01', 308, 1, 0),
	(25615, '2019-06-01', 112, 2, 0),
	(25593, '2019-06-01', 107, 1, 0),
	(25597, '2019-06-01', 115, 1, 0),
	(25580, '2019-06-01', 204, 2, 0),
	(25551, '2019-05-30', 106, 1, 0),
	(25552, '2019-05-30', 107, 1, 0),
	(25553, '2019-05-30', 110, 1, 0),
	(25554, '2019-05-30', 113, 1, 0),
	(25555, '2019-05-30', 202, 1, 0),
	(25556, '2019-05-30', 203, 1, 0),
	(25557, '2019-05-30', 401, 1, 0),
	(25558, '2019-05-30', 402, 1, 0),
	(25559, '2019-05-30', 403, 1, 0),
	(25560, '2019-05-30', 404, 1, 0),
	(25561, '2019-05-30', 999, 1, 0),
	(25562, '2019-05-31', 102, 1, 0),
	(25563, '2019-05-31', 103, 1, 0),
	(25564, '2019-05-31', 103, 2, 0),
	(25565, '2019-05-31', 104, 1, 0),
	(25566, '2019-05-31', 106, 1, 0),
	(25567, '2019-05-31', 105, 1, 0),
	(25568, '2019-05-31', 108, 1, 0),
	(25569, '2019-05-31', 109, 1, 0),
	(25570, '2019-05-31', 110, 1, 0),
	(25571, '2019-05-31', 111, 1, 0),
	(25572, '2019-05-31', 112, 1, 0),
	(25573, '2019-05-31', 113, 1, 0),
	(25574, '2019-05-31', 114, 1, 0),
	(25575, '2019-05-31', 115, 1, 0),
	(25576, '2019-05-31', 113, 2, 0),
	(25577, '2019-05-31', 118, 1, 0),
	(25578, '2019-06-01', 101, 1, 0),
	(25579, '2019-06-01', 206, 1, 0),
	(25581, '2019-06-01', 402, 1, 0),
	(25582, '2019-06-01', 102, 1, 0),
	(25583, '2019-06-01', 901, 1, 0),
	(25584, '2019-06-01', 117, 2, 0),
	(25585, '2019-06-01', 309, 1, 0),
	(25586, '2019-06-01', 105, 1, 0),
	(25587, '2019-06-01', 110, 1, 0),
	(25588, '2019-06-01', 109, 1, 0),
	(25589, '2019-06-01', 303, 1, 0),
	(25590, '2019-06-01', 903, 1, 0),
	(25591, '2019-06-01', 401, 1, 0),
	(25592, '2019-06-01', 204, 1, 0),
	(25594, '2019-06-01', 113, 1, 0),
	(25595, '2019-06-01', 109, 2, 0),
	(25596, '2019-06-01', 103, 1, 0),
	(25598, '2019-06-01', 304, 1, 0),
	(25599, '2019-06-01', 405, 1, 0),
	(25600, '2019-06-01', 305, 1, 0),
	(25601, '2019-06-01', 205, 1, 0),
	(25602, '2019-06-01', 301, 1, 0),
	(25603, '2019-06-01', 202, 1, 0),
	(25604, '2019-06-01', 203, 1, 0),
	(25605, '2019-06-01', 203, 2, 0),
	(25606, '2019-06-01', 106, 1, 0),
	(25607, '2019-06-01', 403, 1, 0),
	(25608, '2019-06-01', 104, 1, 0),
	(25609, '2019-06-01', 404, 2, 0),
	(25610, '2019-06-01', 115, 2, 0),
	(25611, '2019-06-01', 116, 1, 0),
	(25612, '2019-06-01', 105, 3, 0),
	(25613, '2019-06-01', 117, 1, 0),
	(25614, '2019-06-01', 308, 1, 0),
	(25615, '2019-06-01', 112, 2, 0),
	(25593, '2019-06-01', 107, 1, 0),
	(25597, '2019-06-01', 115, 1, 0),
	(25580, '2019-06-01', 204, 2, 0);
/*!40000 ALTER TABLE `ricevutefiscali` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.serata
CREATE TABLE IF NOT EXISTS `serata` (
  `data` date NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inizializzata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.serata: ~5 rows (circa)
/*!40000 ALTER TABLE `serata` DISABLE KEYS */;
/*!40000 ALTER TABLE `serata` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.statoordine
CREATE TABLE IF NOT EXISTS `statoordine` (
  `id` tinyint(4) NOT NULL,
  `stato` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.statoordine: ~0 rows (circa)
/*!40000 ALTER TABLE `statoordine` DISABLE KEYS */;
INSERT INTO `statoordine` (`id`, `stato`) VALUES
	(1, 'ordinato'),
	(2, 'in produzione'),
	(3, 'evaso');
/*!40000 ALTER TABLE `statoordine` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.tavoli
CREATE TABLE IF NOT EXISTS `tavoli` (
  `numero_tavolo` int(10) unsigned NOT NULL,
  `zona` varchar(50) NOT NULL,
  `posti` int(10) unsigned NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero_tavolo`),
  KEY `zonatavolo_idx` (`zona`),
  CONSTRAINT `zonatavolo` FOREIGN KEY (`zona`) REFERENCES `zone` (`zona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.tavoli: ~0 rows (circa)
/*!40000 ALTER TABLE `tavoli` DISABLE KEYS */;
INSERT INTO `tavoli` (`numero_tavolo`, `zona`, `posti`, `data_creazione`, `data_aggiornamento`) VALUES
	(1, 'Via Umberto I', 9, '2018-09-15 15:17:47', '2018-09-15 15:17:47'),
	(2, 'Via Umberto I', 9, '2018-09-15 15:18:12', '2018-09-15 15:18:12'),
	(3, 'Via Umberto I', 9, '2018-09-15 15:19:33', '2018-09-15 15:19:33'),
	(4, 'Via Umberto I', 9, '2018-09-15 15:20:19', '2018-09-15 15:20:19'),
	(5, 'Via Umberto I', 9, '2018-09-15 15:20:49', '2018-09-15 15:20:49'),
	(6, 'Via Umberto I', 9, '2018-09-15 15:21:21', '2018-09-15 15:21:21'),
	(7, 'Via Umberto I', 9, '2018-09-15 15:21:44', '2018-09-15 15:21:44'),
	(8, 'Via Umberto I', 9, '2018-09-15 15:22:20', '2018-09-15 15:22:20'),
	(9, 'Via Umberto I', 9, '2018-09-15 15:22:45', '2018-09-15 15:22:45'),
	(10, 'Via Umberto I', 9, '2018-09-15 15:23:38', '2018-09-15 15:23:38'),
	(11, 'Via Umberto I', 9, '2018-09-15 15:24:01', '2018-09-15 15:24:01'),
	(12, 'Via Umberto I', 9, '2018-09-15 15:24:29', '2018-09-15 15:24:29'),
	(13, 'Via Umberto I', 9, '2018-09-15 15:25:07', '2018-09-15 15:25:07'),
	(14, 'Via Umberto I', 9, '2018-09-15 15:25:33', '2018-09-15 15:25:33'),
	(15, 'Via Umberto I', 9, '2018-09-15 15:26:07', '2018-09-15 15:26:07'),
	(16, 'Via Umberto I', 9, '2018-09-15 15:26:34', '2018-09-15 15:26:34'),
	(17, 'Via Umberto I', 9, '2018-09-15 15:27:02', '2018-09-15 15:27:02'),
	(18, 'Via Umberto I', 9, '2018-09-15 15:27:36', '2018-09-15 15:27:36'),
	(101, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(102, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(103, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(104, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(105, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(106, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(107, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(108, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(109, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(110, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(111, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(112, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(113, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(114, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(115, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(116, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(117, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(118, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(119, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(120, 'Giardino grande', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(201, 'Giardino piccolo', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(202, 'Giardino piccolo', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(203, 'Giardino piccolo', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(204, 'Giardino piccolo', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(205, 'Giardino piccolo', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(206, 'Giardino piccolo', 10, '2018-09-01 18:54:13', '2018-09-01 18:54:13'),
	(301, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(302, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(303, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(304, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(305, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(306, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(307, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(308, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(309, 'Piazzetta', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(401, 'Corridoio giardino', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(402, 'Corridoio giardino', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(403, 'Corridoio giardino', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(404, 'Corridoio giardino', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(405, 'Corridoio giardino', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(406, 'Corridoio giardino', 6, '2018-09-14 17:45:50', '2018-09-14 17:45:50'),
	(501, 'Stanza 2 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(502, 'Stanza 2 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(503, 'Stanza 2 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(504, 'Stanza 2 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(505, 'Stanza 2 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(601, 'Stanza 1 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(602, 'Stanza 1 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(603, 'Stanza 1 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(604, 'Stanza 1 dx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(701, 'Stanza 1 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(702, 'Stanza 1 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(703, 'Stanza 1 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(801, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(802, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(803, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(804, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(805, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(806, 'Stanza 2 sx', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(901, 'Androne', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(902, 'Androne', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(903, 'Androne', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(904, 'Androne', 10, '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	(999, 'Androne', 10, '2018-05-28 19:55:53', '2018-05-28 19:56:30');
/*!40000 ALTER TABLE `tavoli` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.utente
CREATE TABLE IF NOT EXISTS `utente` (
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

-- Dump dei dati della tabella gestionale_sett2019.utente: ~0 rows (circa)
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` (`username`, `password`, `gruppo`, `nome`, `cognome`, `email`, `tel_fisso`, `tel_mobile`, `foto`) VALUES
	('daniele', '47477de04d78d5a360c5fda47a986955', 'amm', 'Daniele', 'Binucci', '', NULL, NULL, NULL),
	('pier_ferri', '201f00b5ca5d65a1c118e5e32431514c', 'amm', 'Pergiorgio', 'Ferri', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;

-- Dump della struttura di tabella gestionale_sett2019.zone
CREATE TABLE IF NOT EXISTS `zone` (
  `zona` varchar(50) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aggiornamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella gestionale_sett2019.zone: ~0 rows (circa)
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` (`zona`, `data_creazione`, `data_aggiornamento`) VALUES
	('Androne', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Corridoio giardino', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Giardino grande', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Giardino piccolo', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Piazzetta', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Stanza 1 dx', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Stanza 1 sx', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Stanza 2 dx', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Stanza 2 sx', '2018-08-20 20:03:37', '2018-08-20 20:03:37'),
	('Via Umberto I', '2018-06-15 17:47:25', '2018-06-15 17:47:25');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;

-- Dump della struttura di trigger gestionale_sett2019.orders_schedule_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `orders_schedule_trigger` AFTER INSERT ON `ordini` FOR EACH ROW BEGIN
DECLARE iterator INT DEFAULT 0;
DECLARE cat ENUM('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce');


SELECT categoria into cat FROM portata where nome_portata=NEW.portata;

IF cat = 'primo' OR cat= 'secondo'  THEN
	WHILE iterator < NEW.quantita DO
	     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, cat);
	     SET iterator = iterator + 1;
	END WHILE;
END IF;
IF cat = 'contorno' THEN
	WHILE iterator < NEW.quantita DO
	     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
	     SET iterator = iterator + 1;
	END WHILE;
END IF;
IF cat = 'antipasto' AND INSTR(NEW.portata, 'coratella') > 0 THEN
	WHILE iterator < NEW.quantita DO
	     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
		  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
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
DECLARE cat ENUM('bevanda','piadina','bruschette e crostoni','pane e coperto','antipasto','primo','secondo','contorno','dolce');


SELECT categoria into cat FROM portata where nome_portata=NEW.portata;
IF ((NEW.quantita - OLD.quantita) > 0) THEN
	IF cat = 'primo' OR cat= 'secondo'  THEN
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, cat);
		     SET iterator = iterator + 1;
		END WHILE;
	END IF;
	IF cat = 'contorno' THEN
		WHILE (iterator < (NEW.quantita - OLD.quantita)) DO
		     INSERT INTO programmazioneordini (serata, portata, tavolo, indice, stato, categoria) VALUES 
			  (NEW.serata, NEW.portata, NEW.tavolo, NEW.indice,1, 'secondo');
		     SET iterator = iterator + 1;
		END WHILE;
	END IF;
	IF cat = 'antipasto' AND INSTR(NEW.portata, 'coratella') > 0 THEN
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
