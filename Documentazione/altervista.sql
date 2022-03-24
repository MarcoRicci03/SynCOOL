-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 23, 2022 alle 10:35
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `altervista`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `appunto`
--

CREATE TABLE `appunto` (
  `ID` int(11) NOT NULL,
  `Titolo` varchar(200) NOT NULL,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Classe` varchar(200) NOT NULL,
  `GradoScuola` varchar(200) NOT NULL,
  `Allegati` varchar(300) NOT NULL,
  `UsernameU` varchar(300) NOT NULL,
  `IDArgomento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `argomento`
--

CREATE TABLE `argomento` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `IDMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `chat`
--

CREATE TABLE `chat` (
  `ID` int(11) NOT NULL,
  `Link` varchar(300) NOT NULL,
  `UsernameU1` varchar(200) NOT NULL,
  `UsernameU2` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `commento`
--

CREATE TABLE `commento` (
  `ID` int(11) NOT NULL,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `Voto` int(11) NOT NULL,
  `IDAppunto` int(11) NOT NULL,
  `UsernameU` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `Voto` int(11) NOT NULL,
  `Testo` varchar(200) NOT NULL,
  `DataCaricamento` date NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `UsernameT` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `impegno`
--

CREATE TABLE `impegno` (
  `ID` int(11) NOT NULL,
  `Durata` int(11) NOT NULL,
  `OraInizio` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Descrizione` varchar(200) NOT NULL,
  `UsernameU` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `insegna`
--

CREATE TABLE `insegna` (
  `UsernameTutor` varchar(11) NOT NULL,
  `IDMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `lezione`
--

CREATE TABLE `lezione` (
  `ID` int(11) NOT NULL,
  `Modalità` varchar(200) NOT NULL,
  `Data` date NOT NULL,
  `Ora` int(11) NOT NULL,
  `Durata` int(11) NOT NULL,
  `Ritrovo` varchar(200) NOT NULL,
  `PostiMax` int(11) NOT NULL,
  `UsernameTutor` varchar(200) NOT NULL,
  `IDArgomento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `materia`
--

CREATE TABLE `materia` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipanti`
--

CREATE TABLE `partecipanti` (
  `ID` int(11) NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `IDLezione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `richiestalezione`
--

CREATE TABLE `richiestalezione` (
  `ID` int(11) NOT NULL,
  `DataInizio` date NOT NULL,
  `UsernameU` varchar(200) NOT NULL,
  `IdArgomento` int(11) NOT NULL,
  `UsernameT` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `scuola`
--

CREATE TABLE `scuola` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Descrizione` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
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
  `IDScuola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `appunto`
--
ALTER TABLE `appunto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AppuntoArgomento` (`IDArgomento`),
  ADD KEY `AppuntoUtente` (`UsernameU`);

--
-- Indici per le tabelle `argomento`
--
ALTER TABLE `argomento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ArgomentoMateria` (`IDMateria`);

--
-- Indici per le tabelle `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Chat1` (`UsernameU1`),
  ADD KEY `Chat2` (`UsernameU2`);

--
-- Indici per le tabelle `commento`
--
ALTER TABLE `commento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CommentoAppunto` (`IDAppunto`),
  ADD KEY `CommentoUser` (`UsernameU`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FeedbackTutor` (`UsernameT`),
  ADD KEY `FeedbackUtente` (`UsernameU`);

--
-- Indici per le tabelle `impegno`
--
ALTER TABLE `impegno`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ImpegnoUtente` (`UsernameU`);

--
-- Indici per le tabelle `insegna`
--
ALTER TABLE `insegna`
  ADD PRIMARY KEY (`UsernameTutor`,`IDMateria`),
  ADD KEY `MateriaInsegnata` (`IDMateria`);

--
-- Indici per le tabelle `lezione`
--
ALTER TABLE `lezione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ArgomentoLezione` (`IDArgomento`),
  ADD KEY `TutorLezione` (`UsernameTutor`);

--
-- Indici per le tabelle `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `partecipanti`
--
ALTER TABLE `partecipanti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PartecipantiLezione` (`IDLezione`),
  ADD KEY `PartecipantiUtente` (`UsernameU`);

--
-- Indici per le tabelle `richiestalezione`
--
ALTER TABLE `richiestalezione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ArgomentoRichiestaLezione` (`IdArgomento`),
  ADD KEY `TutorRichiestaLezione` (`UsernameT`),
  ADD KEY `UtenteRichiestaLezione` (`UsernameU`);

--
-- Indici per le tabelle `scuola`
--
ALTER TABLE `scuola`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `ScuolaStudente` (`IDScuola`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `appunto`
--
ALTER TABLE `appunto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `argomento`
--
ALTER TABLE `argomento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `chat`
--
ALTER TABLE `chat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `commento`
--
ALTER TABLE `commento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `impegno`
--
ALTER TABLE `impegno`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `lezione`
--
ALTER TABLE `lezione`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `materia`
--
ALTER TABLE `materia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `partecipanti`
--
ALTER TABLE `partecipanti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `richiestalezione`
--
ALTER TABLE `richiestalezione`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `scuola`
--
ALTER TABLE `scuola`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
