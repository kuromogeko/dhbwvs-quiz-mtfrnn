-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Apr 2018 um 08:25
-- Server-Version: 10.1.31-MariaDB
-- PHP-Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_quiz_vs`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `text` varchar(100) DEFAULT NULL COMMENT 'Inhalt der Antwort. ',
  `Question_idQuestion` int(11) NOT NULL,
  `isCorrect` tinyint(1) NOT NULL COMMENT 'Prüft ob Antwort korrekt ist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `answer`
--

INSERT INTO `answer` (`id`, `text`, `Question_idQuestion`, `isCorrect`) VALUES
(1, 'Duffel', 1, 0),
(2, 'Tavistock', 2, 0),
(3, 'North Cowichan', 3, 1),
(4, 'Crato', 4, 1),
(5, 'Perpignan', 5, 0),
(6, 'Łódź', 1, 1),
(7, 'Meißen', 2, 0),
(8, 'Carterton', 3, 0),
(9, 'Varsenare', 4, 1),
(10, 'Flawinne', 5, 0),
(11, 'Westmalle', 1, 0),
(12, 'Oostende', 2, 1),
(13, 'Cellara', 3, 0),
(14, 'Chillán', 4, 0),
(15, 'Sète', 5, 1),
(16, 'Bostaniçi', 1, 1),
(17, 'Whitehaven', 2, 0),
(18, 'Massarosa', 3, 0),
(19, 'Termeno sulla strada del vino/Tramin an der Weinstrasse', 4, 1),
(20, 'San Giovanni in Galdo', 5, 0),
(21, 'Tiltil', 1, 1),
(22, 'Pelago', 2, 0),
(23, 'Rivire', 3, 0),
(24, 'Starachowice', 4, 0),
(25, 'Camponogara', 5, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'Name einer Kategorie.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Lorem'),
(2, 'Lorem'),
(3, 'Lorem'),
(4, 'Lorem'),
(5, 'Lorem'),
(6, 'Lorem'),
(7, 'Lorem'),
(8, 'Lorem ipsum'),
(9, 'Lorem'),
(10, 'Lorem'),
(11, 'Lorem'),
(12, 'Lorem ipsum'),
(13, 'Lorem ipsum'),
(14, 'Lorem'),
(15, 'Lorem ipsum'),
(16, 'Lorem'),
(17, 'Lorem ipsum'),
(18, 'Lorem'),
(19, 'Lorem ipsum'),
(20, 'Lorem'),
(21, 'Lorem ipsum'),
(22, 'Lorem ipsum'),
(23, 'Lorem ipsum'),
(24, 'Lorem ipsum'),
(25, 'Lorem'),
(26, 'Lorem'),
(27, 'Lorem'),
(28, 'Lorem ipsum'),
(29, 'Lorem'),
(30, 'Lorem ipsum'),
(31, 'Lorem'),
(32, 'Lorem ipsum'),
(33, 'Lorem'),
(34, 'Lorem'),
(35, 'Lorem'),
(36, 'Lorem'),
(37, 'Lorem ipsum'),
(38, 'Lorem ipsum'),
(39, 'Lorem ipsum'),
(40, 'Lorem'),
(41, 'Lorem ipsum'),
(42, 'Lorem'),
(43, 'Lorem'),
(44, 'Lorem'),
(45, 'Lorem ipsum'),
(46, 'Lorem'),
(47, 'Lorem'),
(48, 'Lorem ipsum'),
(49, 'Lorem'),
(50, 'Lorem'),
(51, 'Lorem'),
(52, 'Lorem'),
(53, 'Lorem'),
(54, 'Lorem'),
(55, 'Lorem ipsum'),
(56, 'Lorem'),
(57, 'Lorem'),
(58, 'Lorem'),
(59, 'Lorem'),
(60, 'Lorem'),
(61, 'Lorem'),
(62, 'Lorem'),
(63, 'Lorem'),
(64, 'Lorem ipsum'),
(65, 'Lorem ipsum'),
(66, 'Lorem'),
(67, 'Lorem'),
(68, 'Lorem'),
(69, 'Lorem'),
(70, 'Lorem'),
(71, 'Lorem'),
(72, 'Lorem'),
(73, 'Lorem ipsum'),
(74, 'Lorem'),
(75, 'Lorem ipsum'),
(76, 'Lorem'),
(77, 'Lorem ipsum'),
(78, 'Lorem ipsum'),
(79, 'Lorem'),
(80, 'Lorem ipsum'),
(81, 'Lorem ipsum'),
(82, 'Lorem'),
(83, 'Lorem'),
(84, 'Lorem ipsum'),
(85, 'Lorem'),
(86, 'Lorem ipsum'),
(87, 'Lorem ipsum'),
(88, 'Lorem'),
(89, 'Lorem ipsum'),
(90, 'Lorem ipsum'),
(91, 'Lorem ipsum'),
(92, 'Lorem'),
(93, 'Lorem'),
(94, 'Lorem ipsum'),
(95, 'Lorem'),
(96, 'Lorem'),
(97, 'Lorem ipsum'),
(98, 'Lorem ipsum'),
(99, 'Lorem'),
(100, 'Lorem ipsum'),
(101, NULL),
(103, NULL),
(104, 'AAAAAAA');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL COMMENT 'Id der Frage',
  `text` varchar(500) DEFAULT NULL COMMENT 'Fragentext.',
  `Quiz_idQuiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `Quiz_idQuiz`) VALUES
(1, 'Sage P. Cote', 1),
(2, 'Kiona M. Foster', 1),
(3, 'Britanney W. Keith', 1),
(4, 'Ingrid F. Hogan', 1),
(5, 'Noah S. Glass', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL COMMENT 'Id des Quiz',
  `name` varchar(100) NOT NULL COMMENT 'Anzeigename vom Quiz.',
  `description` varchar(500) NOT NULL COMMENT 'Beschreibung vom Quiz.',
  `user_iduser` int(11) NOT NULL,
  `category_idcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `quiz`
--

INSERT INTO `quiz` (`id`, `name`, `description`, `user_iduser`, `category_idcategory`) VALUES
(1, 'Eget Metus Institute', 'ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus', 7, 1),
(2, 'Fusce Mollis Foundation', 'nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.', 7, 1),
(3, 'Metus Vivamus Euismod Foundation', 'aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod', 7, 1),
(4, 'Orci Incorporated', 'metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum', 7, 1),
(5, 'Sapien Industries', 'elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,', 7, 1),
(6, 'Duis Sit Amet Company', 'nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue', 7, 1),
(7, 'Varius Nam PC', 'malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut', 7, 1),
(8, 'Maecenas Iaculis Limited', 'venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia', 7, 1),
(9, 'Aliquet Odio LLP', 'lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla', 7, 1),
(10, 'Ac Company', 'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,', 7, 1),
(11, 'Dis Institute', 'amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a,', 7, 1),
(12, 'Eu Augue Foundation', 'arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor', 7, 1),
(13, 'Magna Et Consulting', 'arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit', 7, 1),
(14, 'Nulla Ltd', 'ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,', 7, 1),
(15, 'Orci Consectetuer Euismod LLP', 'Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non', 7, 1),
(16, 'Non Leo Inc.', 'elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.', 7, 1),
(17, 'Ut Industries', 'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus,', 7, 1),
(18, 'Semper LLP', 'a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque', 7, 1),
(19, 'Quam A Felis Institute', 'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras', 7, 1),
(20, 'Sed Pede Associates', 'eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque', 7, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL COMMENT 'Token for User Identification.',
  `user_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `token`, `user_iduser`) VALUES
(1, 'asdf', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'Id des User',
  `uname` varchar(70) NOT NULL COMMENT 'Nutzername. Jeder Nutzername darf nur einmal vergeben sein.',
  `pwd` varchar(128) NOT NULL COMMENT 'Passwort.',
  `description` varchar(500) DEFAULT NULL COMMENT 'Beschreibung des Nutzers.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `uname`, `pwd`, `description`) VALUES
(1, 'Derek', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam'),
(2, 'Bert', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'montes, nascetur ridiculus mus. Proin'),
(3, 'Anthony', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Praesent luctus. Curabitur egestas nunc sed libero. Proin sed'),
(4, 'Keith', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'hendrerit a, arcu.'),
(5, 'Denton', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ut mi. Duis risus odio, auctor vitae,'),
(6, 'Jonah', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'et risus. Quisque libero lacus, varius et, euismod'),
(7, 'Gary', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'aliquet libero. Integer'),
(8, 'Patrick', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam'),
(9, 'Herrod', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'eros nec tellus. Nunc lectus pede, ultrices a, auctor'),
(10, 'Ferris', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque'),
(11, 'Isaiah', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'molestie sodales. Mauris blandit enim consequat purus. Maecenas libero'),
(12, 'Roth', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nonummy. Fusce'),
(13, 'Yoshio', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'sagittis. Nullam vitae diam. Proin'),
(14, 'Nash', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Sed'),
(15, 'Jeremy', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'mauris'),
(16, 'Elvis', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'erat, eget tincidunt'),
(17, 'Alan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'dictum cursus. Nunc mauris elit, dictum eu,'),
(18, 'Aquila', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'eu dolor egestas'),
(19, 'Norman', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'libero'),
(20, 'Fletcher', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.'),
(21, 'Elijah', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'rutrum non, hendrerit id,'),
(22, 'Zane', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nunc'),
(23, 'Carter', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Donec tincidunt. Donec vitae erat vel pede'),
(24, 'Clarke', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ornare'),
(25, 'Byron', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nisi magna sed dui. Fusce aliquam, enim nec'),
(26, 'Reuben', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'sit amet ultricies sem'),
(27, 'Malachi', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ultricies'),
(28, 'Shad', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'elit sed consequat auctor, nunc nulla vulputate'),
(29, 'Nathaniel', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'non sapien molestie orci tincidunt adipiscing.'),
(31, 'Quentin', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'lorem, luctus ut, pellentesque eget, dictum placerat, augue.'),
(32, 'Tanek', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'turpis. Aliquam adipiscing lobortis risus. In mi'),
(33, 'Jacob', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nulla.'),
(34, 'Alec', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'convallis in, cursus et, eros. Proin ultrices.'),
(35, 'Kermit', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'eu erat semper'),
(36, 'Damian', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ut, pharetra sed, hendrerit a, arcu. Sed'),
(37, 'Zachery', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'purus gravida sagittis. Duis gravida. Praesent'),
(38, 'Brennan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'lorem vitae odio sagittis semper. Nam tempor diam'),
(39, 'Gregory', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'dis parturient'),
(41, 'Fuller', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis'),
(42, 'Berk', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nonummy ultricies ornare, elit elit fermentum risus, at'),
(43, 'Perry', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'euismod ac, fermentum vel, mauris. Integer sem elit,'),
(44, 'Isaac', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'magna. Ut tincidunt orci quis lectus. Nullam suscipit, est'),
(45, 'Solomon', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'iaculis, lacus pede sagittis augue, eu tempor erat neque non'),
(46, 'Addison', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Cras vehicula aliquet libero. Integer in'),
(47, 'Tobias', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'morbi'),
(51, 'Wyatt', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'fringilla euismod enim. Etiam gravida molestie arcu. Sed eu'),
(52, 'Cooper', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.'),
(53, 'Brody', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'arcu.'),
(54, 'Tucker', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'tincidunt dui augue eu'),
(55, 'Hyatt', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae'),
(56, 'Peter', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'metus. Aenean sed pede nec ante blandit'),
(57, 'Hop', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'odio.'),
(58, 'Troy', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'vehicula risus. Nulla eget metus eu'),
(59, 'Colt', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'enim, gravida sit amet,'),
(60, 'Nolan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nibh. Aliquam ornare, libero at'),
(61, 'Gavin', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ultricies sem magna nec quam. Curabitur vel lectus. Cum'),
(62, 'Hall', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'est. Mauris eu turpis.'),
(63, 'Kadeem', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Cras vulputate velit'),
(64, 'Brock', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'quam dignissim pharetra. Nam ac nulla. In tincidunt'),
(65, 'Robert', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'diam. Duis'),
(66, 'Magee', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'vitae diam. Proin dolor. Nulla semper tellus id nunc interdum'),
(67, 'Xenos', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'molestie'),
(71, 'Tiger', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'semper et, lacinia'),
(72, 'Howard', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'et malesuada fames ac turpis egestas. Fusce'),
(73, 'Nathan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'et'),
(74, 'Colton', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'lectus pede et'),
(75, 'Moses', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'sociis natoque penatibus et'),
(76, 'Grady', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'aliquet vel, vulputate eu, odio. Phasellus at augue id ante'),
(77, 'Xander', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Mauris magna. Duis dignissim tempor arcu. Vestibulum'),
(78, 'Eagan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'nec orci. Donec nibh. Quisque'),
(79, 'Leo', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ac mi eleifend egestas.'),
(81, 'Daquan', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'imperdiet nec,'),
(82, 'Merritt', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie'),
(83, 'Ulysses', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'cursus. Nunc'),
(84, 'Lance', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Donec nibh'),
(85, 'Palmer', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'eros nec tellus.'),
(86, 'George', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac'),
(87, 'Wang', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'vel arcu eu'),
(88, 'Alden', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'non,'),
(89, 'Garth', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'elementum purus, accumsan interdum libero dui'),
(91, 'Lyle', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'Suspendisse eleifend. Cras sed leo. Cras'),
(92, 'Gage', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'purus mauris a nunc.'),
(93, 'Mohammad', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'netus et malesuada fames ac turpis egestas. Fusce'),
(94, 'Tyler', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'ornare. In faucibus.'),
(95, 'Wayne', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'eros nec tellus. Nunc lectus pede, ultrices a, auctor non,'),
(96, 'Stephen', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'posuere, enim nisl elementum purus, accumsan interdum libero dui nec'),
(97, 'Drew', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem'),
(98, 'Felix', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'neque sed dictum eleifend, nunc');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Answer_Question1_idx` (`Question_idQuestion`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Question_Quiz1_idx` (`Quiz_idQuiz`);

--
-- Indizes für die Tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Quiz_user_idx` (`user_iduser`),
  ADD KEY `fk_Quiz_category1_idx` (`category_idcategory`);

--
-- Indizes für die Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sessions_user1_idx` (`user_iduser`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname_UNIQUE` (`uname`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id der Frage', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id des Quiz', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id des User', AUTO_INCREMENT=99;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk_Answer_Question1` FOREIGN KEY (`Question_idQuestion`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_Question_Quiz1` FOREIGN KEY (`Quiz_idQuiz`) REFERENCES `quiz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `fk_Quiz_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Quiz_user` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_sessions_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
