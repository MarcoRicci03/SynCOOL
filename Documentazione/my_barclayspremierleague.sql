-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2022 alle 20:08
-- Versione del server: 5.6.33-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_barclayspremierleague`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Appunto`
--

CREATE TABLE IF NOT EXISTS `Appunto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(200) NOT NULL,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Classe` varchar(200) NOT NULL,
  `GradoScuola` varchar(200) NOT NULL,
  `Allegati` varchar(300) NOT NULL,
  `UsernameU` varchar(300) NOT NULL,
  `IDArgomento` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Argomento`
--

CREATE TABLE IF NOT EXISTS `Argomento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `IDMateria` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Chat`
--

CREATE TABLE IF NOT EXISTS `Chat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Link` varchar(300) NOT NULL,
  `UsernameU1` varchar(200) NOT NULL,
  `UsernameU2` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Commento`
--

CREATE TABLE IF NOT EXISTS `Commento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Voto` int(11) NOT NULL,
  `IDAppunto` int(11) NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Feedback`
--

CREATE TABLE IF NOT EXISTS `Feedback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Voto` int(11) NOT NULL,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `UsernameT` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Impegno`
--

CREATE TABLE IF NOT EXISTS `Impegno` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Durata` int(11) NOT NULL,
  `OraInizio` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Descrizione` varchar(200) NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Insegna`
--

CREATE TABLE IF NOT EXISTS `Insegna` (
  `UsernameTutor` int(11) NOT NULL,
  `IDMateria` int(11) NOT NULL,
  PRIMARY KEY (`UsernameTutor`,`IDMateria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `Lezione`
--

CREATE TABLE IF NOT EXISTS `Lezione` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Modalità` varchar(200) NOT NULL,
  `Data` date NOT NULL,
  `Ora` int(11) NOT NULL,
  `Durata` int(11) NOT NULL,
  `Ritrovo` varchar(200) NOT NULL,
  `PostiMax` int(11) NOT NULL,
  `UsernameTutor` varchar(200) NOT NULL,
  `IDArgomento` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Materia`
--

CREATE TABLE IF NOT EXISTS `Materia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Partecipanti`
--

CREATE TABLE IF NOT EXISTS `Partecipanti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UsernameU` varchar(200) NOT NULL,
  `IDLezione` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `RichiestaLezione`
--

CREATE TABLE IF NOT EXISTS `RichiestaLezione` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DataInizio` date NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `IdArgomento` int(11) NOT NULL,
  `UsernameT` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Scuola`
--

CREATE TABLE IF NOT EXISTS `Scuola` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Descrizione` varchar(400) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE IF NOT EXISTS `Utente` (
  `Username` varchar(20) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `DataNascita` date NOT NULL,
  `Pic` varchar(300) NOT NULL,
  `Descrizione` varchar(300) NOT NULL,
  `Citta` varchar(20) NOT NULL,
  `isTutor` tinyint(4) NOT NULL,
  `Indirizzo` varchar(322) DEFAULT NULL,
  `IDScuola` int(11) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
