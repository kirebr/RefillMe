-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para refillme
CREATE DATABASE IF NOT EXISTS `refillme` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `refillme`;

-- Copiando estrutura para tabela refillme.gas_station
CREATE TABLE IF NOT EXISTS `gas_station` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price_gas` float DEFAULT NULL,
  `price_gas_a` float DEFAULT NULL,
  `price_ethanol` float DEFAULT NULL,
  `price_diesel` float DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `rating` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`UID`),
  KEY `FK__users` (`owner`),
  CONSTRAINT `FK__users` FOREIGN KEY (`owner`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela refillme.users
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `adm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela refillme.votes
CREATE TABLE IF NOT EXISTS `votes` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `gas_station` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `stars` int(11) NOT NULL,
  PRIMARY KEY (`UID`),
  KEY `FK__gas_station` (`gas_station`),
  KEY `FK__user_vote` (`user`),
  CONSTRAINT `FK__gas_station` FOREIGN KEY (`gas_station`) REFERENCES `gas_station` (`UID`),
  CONSTRAINT `FK__user_vote` FOREIGN KEY (`user`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
