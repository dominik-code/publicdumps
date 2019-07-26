-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 10.35.47.37:3306
-- Erstellungszeit: 26. Jul 2019 um 21:57
-- Server-Version: 5.7.26
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `k42174_bahnapi`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `errorlog2`
--

CREATE TABLE `errorlog2` (
  `id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loglevel` int(11) NOT NULL DEFAULT '1',
  `evanr` int(11) NOT NULL DEFAULT '404',
  `log` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `haltestellen2`
--

CREATE TABLE `haltestellen2` (
  `EVA_NR` int(7) NOT NULL,
  `DS100` varchar(16) DEFAULT NULL,
  `IFOPT` varchar(20) DEFAULT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `VERKEHR` varchar(7) DEFAULT NULL,
  `LAENGE` varchar(10) DEFAULT NULL,
  `BREITE` varchar(10) DEFAULT NULL,
  `STATUS` varchar(13) DEFAULT NULL,
  `fetchtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fetchactive` int(11) NOT NULL DEFAULT '0',
  `fetchactive2` int(11) NOT NULL DEFAULT '1',
  `successcount` int(11) NOT NULL DEFAULT '0',
  `errorcount` int(11) NOT NULL DEFAULT '0',
  `notraincount` int(11) NOT NULL DEFAULT '0',
  `fetchstatus` int(11) NOT NULL DEFAULT '1',
  `manualadded` int(11) NOT NULL DEFAULT '0',
  `country_code` varchar(2) NOT NULL DEFAULT 'DE',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `strecken2`
--

CREATE TABLE `strecken2` (
  `id` int(11) NOT NULL,
  `haltestellen` text,
  `hashwert` varchar(128) NOT NULL,
  `hashwertneu` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zuege`
--

CREATE TABLE `zuege` (
  `id` int(11) NOT NULL,
  `zugid` varchar(40) NOT NULL,
  `dailytripid` bigint(20) DEFAULT NULL,
  `yymmddhhmm` int(10) UNSIGNED DEFAULT NULL,
  `stopid` int(11) DEFAULT NULL,
  `zugverkehrstyp` varchar(1) DEFAULT NULL,
  `zugtyp` varchar(1) DEFAULT NULL,
  `zugowner` varchar(10) NOT NULL,
  `zugklasse` varchar(10) NOT NULL,
  `zugnummer` varchar(10) NOT NULL,
  `zugnummerfull` varchar(20) NOT NULL,
  `linie` varchar(8) DEFAULT NULL,
  `evanr` int(11) NOT NULL,
  `arzeitsoll` time DEFAULT NULL,
  `arzeitist` time DEFAULT NULL,
  `dpzeitsoll` time DEFAULT NULL,
  `dpzeitist` time DEFAULT NULL,
  `gleissoll` varchar(11) NOT NULL DEFAULT '0',
  `gleisist` varchar(11) NOT NULL DEFAULT '0',
  `datum` date NOT NULL,
  `streckengeplanthash` varchar(8) NOT NULL,
  `streckenchangedhash` varchar(8) NOT NULL,
  `zugstatus` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zugsuche`
--

CREATE TABLE `zugsuche` (
  `zugnummerfull` varchar(20) NOT NULL,
  `zugnummer` varchar(10) NOT NULL,
  `zugklasse` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `errorlog2`
--
ALTER TABLE `errorlog2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `evanr` (`evanr`),
  ADD KEY `loglevel` (`loglevel`);

--
-- Indizes für die Tabelle `haltestellen2`
--
ALTER TABLE `haltestellen2`
  ADD PRIMARY KEY (`EVA_NR`),
  ADD KEY `NAME` (`NAME`),
  ADD KEY `fetchactive` (`fetchactive`),
  ADD KEY `fetchtime` (`fetchtime`),
  ADD KEY `fetchactive2` (`fetchactive2`),
  ADD KEY `fetchstatus` (`fetchstatus`),
  ADD KEY `manualadded` (`manualadded`),
  ADD KEY `country_code` (`country_code`);

--
-- Indizes für die Tabelle `strecken2`
--
ALTER TABLE `strecken2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashwert` (`hashwert`),
  ADD UNIQUE KEY `hashwertneu` (`hashwertneu`),
  ADD KEY `hashwert_2` (`hashwert`);

--
-- Indizes für die Tabelle `zuege`
--
ALTER TABLE `zuege`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `zugid` (`zugid`),
  ADD KEY `datum` (`datum`),
  ADD KEY `evanr` (`evanr`),
  ADD KEY `streckenid` (`streckengeplanthash`),
  ADD KEY `dailytripid` (`dailytripid`),
  ADD KEY `yymmddhhmm` (`yymmddhhmm`),
  ADD KEY `stopid` (`stopid`),
  ADD KEY `arzeitsoll` (`arzeitsoll`),
  ADD KEY `dpzeitsoll` (`dpzeitsoll`),
  ADD KEY `gleissoll` (`gleissoll`),
  ADD KEY `zugstatus` (`zugstatus`),
  ADD KEY `zugklasse` (`zugklasse`),
  ADD KEY `zugnummer` (`zugnummer`);

--
-- Indizes für die Tabelle `zugsuche`
--
ALTER TABLE `zugsuche`
  ADD PRIMARY KEY (`zugnummerfull`),
  ADD UNIQUE KEY `zugnummerfull_UNIQUE` (`zugnummerfull`),
  ADD KEY `zugnummer` (`zugnummer`),
  ADD KEY `zugklasse` (`zugklasse`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `errorlog2`
--
ALTER TABLE `errorlog2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `strecken2`
--
ALTER TABLE `strecken2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `zuege`
--
ALTER TABLE `zuege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
