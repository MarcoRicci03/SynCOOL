-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2022 alle 10:53
-- Versione del server: 8.0.26
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
-- Struttura della tabella `appunto`
--

CREATE TABLE IF NOT EXISTS `appunto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Testo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Classe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `GradoScuola` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Allegati` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UsernameU` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IDArgomento` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AppuntoArgomento` (`IDArgomento`),
  KEY `AppuntoUtente` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `argomento`
--

CREATE TABLE IF NOT EXISTS `argomento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IDMateria` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArgomentoMateria` (`IDMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Link` varchar(300) NOT NULL,
  `UsernameU1` varchar(200) NOT NULL,
  `UsernameU2` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Chat1` (`UsernameU1`),
  KEY `Chat2` (`UsernameU2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `commento`
--

CREATE TABLE IF NOT EXISTS `commento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Testo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Voto` int NOT NULL,
  `IDAppunto` int NOT NULL,
  `UsernameU` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CommentoAppunto` (`IDAppunto`),
  KEY `CommentoUser` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Voto` int NOT NULL,
  `Testo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DataCaricamento` date NOT NULL,
  `UsernameU` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UsernameT` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FeedbackTutor` (`UsernameT`),
  KEY `FeedbackUtente` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `impegno`
--

CREATE TABLE IF NOT EXISTS `impegno` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Durata` int NOT NULL,
  `OraInizio` int NOT NULL,
  `Data` date NOT NULL,
  `Descrizione` varchar(200) NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ImpegnoUtente` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `insegna`
--

CREATE TABLE IF NOT EXISTS `insegna` (
  `UsernameTutor` varchar(11) NOT NULL,
  `IDMateria` int NOT NULL,
  PRIMARY KEY (`UsernameTutor`,`IDMateria`),
  KEY `MateriaInsegnata` (`IDMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `lezione`
--

CREATE TABLE IF NOT EXISTS `lezione` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Modalità` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Data` date NOT NULL,
  `Ora` int NOT NULL,
  `Durata` int NOT NULL,
  `Ritrovo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PostiMax` int NOT NULL,
  `UsernameTutor` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IDArgomento` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArgomentoLezione` (`IDArgomento`),
  KEY `TutorLezione` (`UsernameTutor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipanti`
--

CREATE TABLE IF NOT EXISTS `partecipanti` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UsernameU` varchar(200) NOT NULL,
  `IDLezione` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PartecipantiLezione` (`IDLezione`),
  KEY `PartecipantiUtente` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `richiestalezione`
--

CREATE TABLE IF NOT EXISTS `richiestalezione` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DataInizio` date NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `IdArgomento` int NOT NULL,
  `UsernameT` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArgomentoRichiestaLezione` (`IdArgomento`),
  KEY `TutorRichiestaLezione` (`UsernameT`),
  KEY `UtenteRichiestaLezione` (`UsernameU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `scuola`
--

CREATE TABLE IF NOT EXISTS `scuola` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Descrizione` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE IF NOT EXISTS `utente` (
  `Username` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nome` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Cognome` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Password` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DataNascita` date NOT NULL,
  `Pic` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Descrizione` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Citta` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `isTutor` tinyint(1) NOT NULL,
  `Indirizzo` varchar(322) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `IDScuola` int NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `ScuolaStudente` (`IDScuola`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `appunto`
--
ALTER TABLE `appunto`
  ADD CONSTRAINT `AppuntoArgomento` FOREIGN KEY (`IDArgomento`) REFERENCES `argomento` (`ID`),
  ADD CONSTRAINT `AppuntoUtente` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `argomento`
--
ALTER TABLE `argomento`
  ADD CONSTRAINT `ArgomentoMateria` FOREIGN KEY (`IDMateria`) REFERENCES `materia` (`ID`);

--
-- Limiti per la tabella `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `Chat1` FOREIGN KEY (`UsernameU1`) REFERENCES `utente` (`Username`),
  ADD CONSTRAINT `Chat2` FOREIGN KEY (`UsernameU2`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `commento`
--
ALTER TABLE `commento`
  ADD CONSTRAINT `CommentoAppunto` FOREIGN KEY (`IDAppunto`) REFERENCES `appunto` (`ID`),
  ADD CONSTRAINT `CommentoUser` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FeedbackTutor` FOREIGN KEY (`UsernameT`) REFERENCES `utente` (`Username`),
  ADD CONSTRAINT `FeedbackUtente` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `impegno`
--
ALTER TABLE `impegno`
  ADD CONSTRAINT `ImpegnoUtente` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `insegna`
--
ALTER TABLE `insegna`
  ADD CONSTRAINT `MateriaInsegnata` FOREIGN KEY (`IDMateria`) REFERENCES `materia` (`ID`),
  ADD CONSTRAINT `MateriaTutor` FOREIGN KEY (`UsernameTutor`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `lezione`
--
ALTER TABLE `lezione`
  ADD CONSTRAINT `ArgomentoLezione` FOREIGN KEY (`IDArgomento`) REFERENCES `argomento` (`ID`),
  ADD CONSTRAINT `TutorLezione` FOREIGN KEY (`UsernameTutor`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD CONSTRAINT `PartecipantiLezione` FOREIGN KEY (`IDLezione`) REFERENCES `lezione` (`ID`),
  ADD CONSTRAINT `PartecipantiUtente` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `richiestalezione`
--
ALTER TABLE `richiestalezione`
  ADD CONSTRAINT `ArgomentoRichiestaLezione` FOREIGN KEY (`IdArgomento`) REFERENCES `argomento` (`ID`),
  ADD CONSTRAINT `TutorRichiestaLezione` FOREIGN KEY (`UsernameT`) REFERENCES `utente` (`Username`),
  ADD CONSTRAINT `UtenteRichiestaLezione` FOREIGN KEY (`UsernameU`) REFERENCES `utente` (`Username`);

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `ScuolaStudente` FOREIGN KEY (`IDScuola`) REFERENCES `scuola` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
