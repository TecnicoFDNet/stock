-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18/08/2018 às 11:06
-- Versão do servidor: 10.1.32-MariaDB
-- Versão do PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `stock`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgrid`
--

CREATE TABLE `airgrid` (
  `ID_airgrid` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(10) NOT NULL,
  `Grid` int(10) NOT NULL,
  `Rear` int(10) NOT NULL,
  `LBracket` int(10) NOT NULL,
  `PBracket` int(10) NOT NULL,
  `Poe` int(10) NOT NULL,
  `Pwrcord` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `airgrid`
--

INSERT INTO `airgrid` (`ID_airgrid`, `Name`, `Type`, `Antenna`, `Grid`, `Rear`, `LBracket`, `PBracket`, `Poe`, `Pwrcord`) VALUES
(1, 'Airgrid M5 HP 23', 'XM', 0, 0, 0, 0, 0, 0, 0),
(2, 'Airgrid M5 HP 27', 'XM', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgridxw`
--

CREATE TABLE `airgridxw` (
  `ID_airgridxw` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `Grid` int(20) NOT NULL,
  `Rear` int(20) NOT NULL,
  `LBracket` int(20) NOT NULL,
  `PBracket` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `airgridxw`
--

INSERT INTO `airgridxw` (`ID_airgridxw`, `Name`, `Type`, `Antenna`, `Grid`, `Rear`, `LBracket`, `PBracket`, `Poe`, `Pwrcord`) VALUES
(1, 'Airgrid M5 HP 23', 'XW', 0, 0, 0, 0, 0, 0, 0),
(2, 'Airgrid M5 HP 27', 'XW', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgridxw_in`
--

CREATE TABLE `airgridxw_in` (
  `ID` int(11) NOT NULL,
  `ID_airgridxw` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `Grid` int(20) NOT NULL,
  `Rear` int(20) NOT NULL,
  `LBracket` int(20) NOT NULL,
  `PBracket` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `airgridxw_in`
--
DELIMITER $$
CREATE TRIGGER `in_airgridxw` BEFORE INSERT ON `airgridxw_in` FOR EACH ROW update airgridxw
	set Antenna = Antenna + new.Antenna,
    	Grid = Grid + new.Grid,
        Rear = Rear + new.Rear,
        LBracket = LBracket + new.LBracket,
        PBracket = PBracket + new.PBracket,
        Poe = Poe + new.Poe,
        Pwrcord = Pwrcord + new.Pwrcord
	where ID_airgridxw = new.ID_airgridxw
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgridxw_out`
--

CREATE TABLE `airgridxw_out` (
  `ID` int(11) NOT NULL,
  `ID_airgridxw` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `Grid` int(20) NOT NULL,
  `Rear` int(20) NOT NULL,
  `LBracket` int(20) NOT NULL,
  `PBracket` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `airgridxw_out`
--
DELIMITER $$
CREATE TRIGGER `out_airgridxw` AFTER INSERT ON `airgridxw_out` FOR EACH ROW update airgridxw
	set Antenna = Antenna - new.Antenna,
    	Grid = Grid - new.Grid,
        Rear = Rear - new.Rear,
        LBracket = LBracket - new.LBracket,
        PBracket = PBracket - new.PBracket,
        Poe = Poe - new.Poe,
        Pwrcord = Pwrcord - new.Pwrcord
	where ID_airgridxw = new.ID_airgridxw
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgrid_in`
--

CREATE TABLE `airgrid_in` (
  `ID` int(11) NOT NULL,
  `ID_airgrid` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(10) NOT NULL,
  `Grid` int(10) NOT NULL,
  `Rear` int(10) NOT NULL,
  `LBracket` int(10) NOT NULL,
  `PBracket` int(10) NOT NULL,
  `Poe` int(10) NOT NULL,
  `Pwrcord` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `airgrid_in`
--
DELIMITER $$
CREATE TRIGGER `in_airgid` BEFORE INSERT ON `airgrid_in` FOR EACH ROW update airgrid
	set Antenna = Antenna + new.Antenna,
    	Grid = Grid + new.Grid,
        Rear = Rear + new.Rear,
        LBracket = LBracket + new.LBracket,
        PBracket = PBracket + new.PBracket,
        Poe = Poe + new.Poe,
        Pwrcord = Pwrcord + new.Pwrcord
	where ID_airgrid = new.ID_airgrid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `airgrid_out`
--

CREATE TABLE `airgrid_out` (
  `ID` int(11) NOT NULL,
  `ID_airgrid` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Antenna` int(10) NOT NULL,
  `Grid` int(10) NOT NULL,
  `Rear` int(10) NOT NULL,
  `LBracket` int(10) NOT NULL,
  `PBracket` int(10) NOT NULL,
  `Poe` int(10) NOT NULL,
  `Pwrcord` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `airgrid_out`
--
DELIMITER $$
CREATE TRIGGER `out_airgrid` AFTER INSERT ON `airgrid_out` FOR EACH ROW update airgrid
	set Antenna = Antenna - new.Antenna,
    	Grid = Grid - new.Grid,
        Rear = Rear - new.Rear,
        LBracket = LBracket - new.LBracket,
        PBracket = PBracket - new.PBracket,
        Poe = Poe - new.Poe,
        Pwrcord = Pwrcord - new.Pwrcord
	where ID_airgrid = new.ID_airgrid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `litebeamac23`
--

CREATE TABLE `litebeamac23` (
  `ID_litebeamac23` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `CReflector` int(20) NOT NULL,
  `SReflector` int(20) NOT NULL,
  `FReceiver` int(20) NOT NULL,
  `BJMount` int(20) NOT NULL,
  `MStrap` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL,
  `Min` int(20) NOT NULL,
  `Max` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `litebeamac23`
--

INSERT INTO `litebeamac23` (`ID_litebeamac23`, `Name`, `Antenna`, `CReflector`, `SReflector`, `FReceiver`, `BJMount`, `MStrap`, `Poe`, `Pwrcord`, `Min`, `Max`) VALUES
(1, 'LiteBeam 5AC 23', 20, 20, 20, 20, 20, 20, 20, 20, 20, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `litebeamacgen2`
--

CREATE TABLE `litebeamacgen2` (
  `ID_litebeamacgen2` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `CReflector` int(20) NOT NULL,
  `SReflector` int(20) NOT NULL,
  `FReceiver` int(20) NOT NULL,
  `AMount` int(20) NOT NULL,
  `EMount` int(20) NOT NULL,
  `MStrap` int(20) NOT NULL,
  `WKit` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(11) NOT NULL,
  `MIn` int(20) NOT NULL,
  `Max` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `litebeamm5`
--

CREATE TABLE `litebeamm5` (
  `ID_litebeamm5` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `CReflector` int(20) NOT NULL,
  `SReflector` int(20) NOT NULL,
  `FReceiver` int(20) NOT NULL,
  `BJMount` int(20) NOT NULL,
  `MStrap` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL,
  `Min` int(20) NOT NULL,
  `Max` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `litebeamm5`
--

INSERT INTO `litebeamm5` (`ID_litebeamm5`, `Name`, `Antenna`, `CReflector`, `SReflector`, `FReceiver`, `BJMount`, `MStrap`, `Poe`, `Pwrcord`, `Min`, `Max`) VALUES
(1, 'LiteBeam M5', 100, 100, 100, 100, 100, 100, 100, 100, 5, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `litebeamm5_in`
--

CREATE TABLE `litebeamm5_in` (
  `ID` int(11) NOT NULL,
  `ID_litebeamm5` int(11) DEFAULT NULL,
  `user` varchar(10) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Antenna` int(10) DEFAULT NULL,
  `CReflector` int(10) DEFAULT NULL,
  `SReflector` int(10) DEFAULT NULL,
  `FReceiver` int(10) DEFAULT NULL,
  `BJMount` int(10) DEFAULT NULL,
  `MStrap` int(10) DEFAULT NULL,
  `Poe` int(10) DEFAULT NULL,
  `Pwrcord` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `litebeamm5_in`
--

INSERT INTO `litebeamm5_in` (`ID`, `ID_litebeamm5`, `user`, `Data`, `Name`, `Antenna`, `CReflector`, `SReflector`, `FReceiver`, `BJMount`, `MStrap`, `Poe`, `Pwrcord`) VALUES
(1, 1, 'Douglas', '2018-06-12', NULL, 100, 100, 100, 100, 0, 100, 100, 100),
(2, 1, 'Douglas', '2018-06-12', NULL, 100, 100, 100, 100, 0, 100, 100, 100),
(3, 1, 'Douglas', '2018-06-12', NULL, 100, 100, 100, 100, 100, 100, 100, 100),
(4, 1, 'Douglas', '2018-06-12', NULL, 1, 1, 1, 1, 1, 1, 1, 1),
(5, 1, 'Douglas', '2018-07-27', NULL, 10, 10, 10, 10, 10, 10, 10, 10),
(6, 1, 'Douglas', '2018-07-27', NULL, 500, 500, 500, 500, 500, 500, 500, 500),
(7, 1, 'Valmir', '2018-08-03', NULL, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Gatilhos `litebeamm5_in`
--
DELIMITER $$
CREATE TRIGGER `in_litebeamm5` BEFORE INSERT ON `litebeamm5_in` FOR EACH ROW update litebeamm5
	set Antenna = Antenna + new.Antenna,
    	CReflector = CReflector + new.CReflector,
        SReflector = SReflector + new.SReflector,
        FReceiver = FReceiver + new.FReceiver,
        BJMount = BJMount + new.BJMount,
        MStrap = MStrap + new.MStrap,
        Poe = Poe + new.Poe,
        Pwrcord = Pwrcord + new.Pwrcord
	where ID_litebeamm5 = new.ID_litebeamm5
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `litebeamm5_out`
--

CREATE TABLE `litebeamm5_out` (
  `ID` int(11) NOT NULL,
  `ID_litebeamm5` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Data` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Antenna` int(20) NOT NULL,
  `CReflector` int(20) NOT NULL,
  `SReflector` int(20) NOT NULL,
  `FReceiver` int(20) NOT NULL,
  `BJMount` int(20) NOT NULL,
  `MStrap` int(20) NOT NULL,
  `Poe` int(20) NOT NULL,
  `Pwrcord` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `litebeamm5_out`
--

INSERT INTO `litebeamm5_out` (`ID`, `ID_litebeamm5`, `user`, `Data`, `Name`, `Antenna`, `CReflector`, `SReflector`, `FReceiver`, `BJMount`, `MStrap`, `Poe`, `Pwrcord`) VALUES
(1, 1, 'Douglas', '2018-06-12', '', 100, 100, 100, 100, 0, 100, 100, 100),
(2, 1, 'Douglas', '2018-06-13', '', 100, 100, 100, 100, 0, 100, 100, 100),
(3, 1, 'Douglas', '2018-06-12', '', 200, 200, 200, 200, 200, 200, 200, 200),
(4, 1, 'Douglas', '2018-07-03', '', 4, 4, 4, 4, 4, 4, 4, 4),
(5, 1, 'Douglas', '2018-07-03', '', 7, 7, 7, 7, 7, 7, 7, 7),
(6, 1, 'Douglas', '2018-07-27', '', 600, 600, 600, 600, 600, 600, 600, 600);

--
-- Gatilhos `litebeamm5_out`
--
DELIMITER $$
CREATE TRIGGER `out_litebeamm5` AFTER INSERT ON `litebeamm5_out` FOR EACH ROW update litebeamm5
	set Antenna = Antenna - new.Antenna,
    	CReflector = CReflector - new.CReflector,
        SReflector = SReflector - new.SReflector,
        FReceiver = FReceiver - new.FReceiver,
        BJMount = BJMount - new.BJMount,
        MStrap = MStrap - new.MStrap,
        Poe = Poe - new.Poe,
        Pwrcord = Pwrcord - new.Pwrcord
	where ID_litebeamm5 = new.ID_litebeamm5
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suporte`
--

CREATE TABLE `suporte` (
  `ID_sup` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Qtd` int(20) NOT NULL,
  `Min` int(20) NOT NULL,
  `Max` int(20) NOT NULL,
  `Resultado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `suporte`
--

INSERT INTO `suporte` (`ID_sup`, `Nome`, `Qtd`, `Min`, `Max`, `Resultado`) VALUES
(1, 'Colonial', 50, 2, 10, ''),
(2, 'Francesa', 45, 2, 10, ''),
(3, 'Parede', 3, 2, 10, ''),
(4, 'Cumieira', 2, 2, 10, ''),
(5, 'Eternit', 2, 2, 10, ''),
(6, 'Fix_suporte', 10, 2, 10, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `suporte_in`
--

CREATE TABLE `suporte_in` (
  `ID` int(11) NOT NULL,
  `ID_sup` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `Data` date NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Qtd` int(20) DEFAULT NULL,
  `Min` int(20) DEFAULT NULL,
  `Max` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `suporte_in`
--

INSERT INTO `suporte_in` (`ID`, `ID_sup`, `user`, `Data`, `Nome`, `Qtd`, `Min`, `Max`) VALUES
(1, 1, '', '2018-06-13', 'Colonial', 30, NULL, NULL);

--
-- Gatilhos `suporte_in`
--
DELIMITER $$
CREATE TRIGGER `in_suporte` BEFORE INSERT ON `suporte_in` FOR EACH ROW UPDATE suporte
	SET Qtd = Qtd + new.Qtd
    WHERE ID_sup = new.ID_sup
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `IDusers` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`IDusers`, `user`, `pwd`) VALUES
(1, 'Douglas', '123456'),
(2, 'Valmir', '654321');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `airgrid`
--
ALTER TABLE `airgrid`
  ADD PRIMARY KEY (`ID_airgrid`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Índices de tabela `airgridxw`
--
ALTER TABLE `airgridxw`
  ADD PRIMARY KEY (`ID_airgridxw`);

--
-- Índices de tabela `airgridxw_in`
--
ALTER TABLE `airgridxw_in`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_argridxw` (`ID_airgridxw`);

--
-- Índices de tabela `airgridxw_out`
--
ALTER TABLE `airgridxw_out`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_airgridxw` (`ID_airgridxw`);

--
-- Índices de tabela `airgrid_in`
--
ALTER TABLE `airgrid_in`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_airgrid` (`ID_airgrid`);

--
-- Índices de tabela `airgrid_out`
--
ALTER TABLE `airgrid_out`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_airgrid` (`ID_airgrid`);

--
-- Índices de tabela `litebeamac23`
--
ALTER TABLE `litebeamac23`
  ADD PRIMARY KEY (`ID_litebeamac23`);

--
-- Índices de tabela `litebeamacgen2`
--
ALTER TABLE `litebeamacgen2`
  ADD PRIMARY KEY (`ID_litebeamacgen2`);

--
-- Índices de tabela `litebeamm5`
--
ALTER TABLE `litebeamm5`
  ADD PRIMARY KEY (`ID_litebeamm5`);

--
-- Índices de tabela `litebeamm5_in`
--
ALTER TABLE `litebeamm5_in`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_litebeamm5` (`ID_litebeamm5`);

--
-- Índices de tabela `litebeamm5_out`
--
ALTER TABLE `litebeamm5_out`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_litebeamm5` (`ID_litebeamm5`);

--
-- Índices de tabela `suporte`
--
ALTER TABLE `suporte`
  ADD PRIMARY KEY (`ID_sup`);

--
-- Índices de tabela `suporte_in`
--
ALTER TABLE `suporte_in`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_sup` (`ID_sup`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDusers`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `airgrid`
--
ALTER TABLE `airgrid`
  MODIFY `ID_airgrid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `airgridxw`
--
ALTER TABLE `airgridxw`
  MODIFY `ID_airgridxw` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `airgridxw_in`
--
ALTER TABLE `airgridxw_in`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `airgridxw_out`
--
ALTER TABLE `airgridxw_out`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `airgrid_in`
--
ALTER TABLE `airgrid_in`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `airgrid_out`
--
ALTER TABLE `airgrid_out`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `litebeamac23`
--
ALTER TABLE `litebeamac23`
  MODIFY `ID_litebeamac23` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `litebeamacgen2`
--
ALTER TABLE `litebeamacgen2`
  MODIFY `ID_litebeamacgen2` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `litebeamm5`
--
ALTER TABLE `litebeamm5`
  MODIFY `ID_litebeamm5` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `litebeamm5_in`
--
ALTER TABLE `litebeamm5_in`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `litebeamm5_out`
--
ALTER TABLE `litebeamm5_out`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `suporte`
--
ALTER TABLE `suporte`
  MODIFY `ID_sup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `suporte_in`
--
ALTER TABLE `suporte_in`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `IDusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `airgridxw_in`
--
ALTER TABLE `airgridxw_in`
  ADD CONSTRAINT `airgridxw_in_ibfk_1` FOREIGN KEY (`ID_airgridxw`) REFERENCES `airgridxw` (`ID_airgridxw`);

--
-- Restrições para tabelas `airgridxw_out`
--
ALTER TABLE `airgridxw_out`
  ADD CONSTRAINT `airgridxw_out_ibfk_1` FOREIGN KEY (`ID_airgridxw`) REFERENCES `airgridxw` (`ID_airgridxw`);

--
-- Restrições para tabelas `airgrid_in`
--
ALTER TABLE `airgrid_in`
  ADD CONSTRAINT `airgrid_in_ibfk_1` FOREIGN KEY (`ID_airgrid`) REFERENCES `airgrid` (`ID_airgrid`);

--
-- Restrições para tabelas `airgrid_out`
--
ALTER TABLE `airgrid_out`
  ADD CONSTRAINT `airgrid_out_ibfk_1` FOREIGN KEY (`ID_airgrid`) REFERENCES `airgrid` (`ID_airgrid`);

--
-- Restrições para tabelas `litebeamm5_in`
--
ALTER TABLE `litebeamm5_in`
  ADD CONSTRAINT `litebeamm5_in_ibfk_1` FOREIGN KEY (`ID_litebeamm5`) REFERENCES `litebeamm5` (`ID_litebeamm5`);

--
-- Restrições para tabelas `litebeamm5_out`
--
ALTER TABLE `litebeamm5_out`
  ADD CONSTRAINT `litebeamm5_out_ibfk_1` FOREIGN KEY (`ID_litebeamm5`) REFERENCES `litebeamm5` (`ID_litebeamm5`);

--
-- Restrições para tabelas `suporte_in`
--
ALTER TABLE `suporte_in`
  ADD CONSTRAINT `suporte_in_ibfk_1` FOREIGN KEY (`ID_sup`) REFERENCES `suporte` (`ID_sup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
