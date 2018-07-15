-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 15. Jul 2018 um 17:17
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
  `is_correct` tinyint(1) NOT NULL COMMENT 'Prüft ob Antwort korrekt ist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `answer`
--

INSERT INTO `answer` (`id`, `text`, `Question_idQuestion`, `is_correct`) VALUES
(26, 'Netzteil', 6, 1),
(27, 'Personal Computer', 7, 1),
(28, 'Mainboard', 6, 0),
(29, 'Private Computer', 7, 0),
(30, 'Computercase', 6, 0),
(31, 'Prozessor', 6, 0),
(32, 'Praktischer Computer', 7, 0),
(33, 'RAM', 8, 1),
(34, 'Mainboard', 8, 1),
(35, 'GPU', 8, 1),
(36, 'Pest und Cholera', 7, 0),
(37, 'Prozessor', 8, 1),
(38, 'Physiker haben mitentwickelt', 9, 0),
(39, 'Nichts', 9, 0),
(40, 'Quantencomputer sind anfälliger gegen Wasserschäden', 9, 0),
(41, 'Dualismus der Bitzustände gilt für den Quantencomputer nicht', 9, 1),
(42, 'Battle-Unit', 12, 1),
(43, 'Beta', 12, 0),
(44, 'Brutal', 12, 0),
(45, 'Es handelt sich um eine laufene Nummer', 12, 0),
(46, 'Eine Waffe', 10, 1),
(47, 'Der fahrende Händler', 10, 1),
(48, 'Der erste Boss', 10, 0),
(49, 'Emil kommt in dem Spiel nicht vor', 10, 0),
(50, 'Nur einen', 11, 0),
(51, 'zwei', 11, 0),
(52, 'drei', 11, 1),
(53, 'Bis zu vier', 11, 0),
(54, '2B', 13, 0),
(55, '9S', 13, 0),
(56, 'A2', 13, 1),
(57, '2E', 13, 0),
(58, 'Gaia', 14, 0),
(59, 'Kronos', 14, 1),
(60, 'Hyperion', 14, 0),
(61, 'Herkules', 14, 0),
(62, 'Überall', 16, 0),
(63, 'Mal hier mal dort', 16, 0),
(64, 'Auf dem Berg Olymp', 16, 1),
(65, 'Gaia', 15, 0),
(66, 'Apollo', 15, 0),
(67, 'Hephaistos', 15, 0),
(68, 'In der Unterwelt von Griechenland', 16, 0),
(69, 'Zeus', 17, 0),
(70, 'Hermes', 15, 1),
(71, 'Prometheus', 17, 1),
(72, 'Janus', 17, 0),
(73, 'Ares', 17, 0);

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
(1, 'Computer'),
(109, 'Nier'),
(110, 'Griechische Mythologie');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL COMMENT 'Id der Frage',
  `text` varchar(500) DEFAULT NULL COMMENT 'Fragentext.',
  `quiz_idquiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `text`, `quiz_idquiz`) VALUES
(6, 'Welche Komponente versogt den Computer mit Strom?', 8),
(7, 'Wofür steht die Abkürzung PC?', 8),
(8, 'Welche der folgenden sind PC Bestandteile?', 8),
(9, 'Was unterscheidet den Quantencomputer vom Binäcomputer?', 8),
(10, 'Wer oder was ist Emil?', 9),
(11, 'Wie viele PODS kann man maximal haben?', 9),
(12, 'Der Buchstabe B steht bei Androidenklassen für.....?', 9),
(13, 'Wer tötet den Forest King?', 9),
(14, 'Wer ist der Vater von Zeus?', 10),
(15, 'Welcher der folgenden Götter ist der Gott der Diebe?', 10),
(16, 'Wo hausen die Götter in Griechenland?', 10),
(17, 'Welcher der folgenden Namen gehört zu einem Titan?', 10);

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
(8, 'Computer Quiz', 'Quiz über Computer', 7, 1),
(9, 'Nier:Automata Quiz', 'Quiz über das Spiel Nier:Automata', 7, 109),
(10, 'Mythologie Quiz', 'Titel sagt alles........', 7, 110);

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
(1, 'asdf', 7),
(2, '4bf0e67d2a736eb7973055d9ec66c5f56a79c89dfccf71513c5d1fc7b0843359', 107),
(3, 'e554160111b39a426e3dc78f5e1eebee4d55ad7c76f1e21b03981ea8e7dbeed1', 108),
(4, 'aafe23c08f4792da6e286fb0125b8c9526882b35c607c5582fcf3848014a2867', 108),
(5, 'ce887413e2119f1bb24c32d9d2badbcae30fead9f8ae07358f4b9fbe3e09b851', 108),
(6, 'acbd56ecac0afd1821f8691d8235b5a6a62ee1e458b36ff84c00ab607dd9f59b', 108),
(7, 'dca7360235a02254a6ef7e83eb38ad353c89afc4a8a6d0835526c4efb2648548', 108),
(8, '89895a18044d343a2d3bb5ae0ce4f93c70f2668ee1f6838dbf05b6730daec9f1', 108),
(9, '0a5d8444de5f3a2a605b9104ff30c4bd2a47a03682fabd2dceeaf085b10bac34', 108),
(10, '33995e231de96209fef330626e894697d3d41ade24cf193a0e7eddf2d0754485', 108),
(11, '6a2e95d404d32440f619918784f8593cffb061faf8a0bf29434e7bbecc7ece1e', 108),
(12, 'ca6513aaee440b7f7736caf3f8ad35a7af06e1c58089edb955981d3552ef0e42', 108),
(13, 'aa2af7edc6d82ed8adb6b0aec883af5d2ec5f30ed8d7d329d31e57dd0acb5438', 108),
(14, 'ef25686474534d37eacc82afd6cc0cadc3503c8141c7e437cf3ca2fb1966ee48', 108),
(15, '71b05a38243a15e0a27dad70d9ffc015e5fccbb9cbb751ec43d75f29aff37c82', 108),
(16, 'a230411b98d1533a837b89d2f6e0df8b956eb8207ddb44bc622de6e5b91a7af3', 108),
(17, '2a5e81279f6c8461cd220d08282f1a715e6b73ff656413d7e11a84add25726c5', 108),
(18, 'b5fd1e75b85ee20b6e8ac9f9475ebf48e3448f590dfc9de0dc7e815ad875e691', 108),
(19, 'e8bcd26d5b7f044fbe9ad1a89eed856cc02b45f7bc370bd433548035859c3974', 108),
(20, 'bb8d0ed6909c2dc4bfb31fe5218103ab3600abd57eba30a928ecd4573e556d95', 108),
(21, '8781157d315bd0bce98f8cc6a22f86fedf40f1ac6c32f8d50d2b697709a4f548', 108),
(22, '6d7a0bc0afe26cd83ca77d780355bf6fa58ed9cdd222efa11c891d70b1e8c52a', 108),
(23, '7a1701fed79472eda90c74a5f43aa4e269131d63c62029029766b3ba820dcc4b', 108),
(24, '531dde8b4d77042a4353adaa9506b4aa27eff67b983f521b16b4e028085dd008', 108),
(25, '1dfc9c66dc75faedb9329ae58c1dbd30658b629dcc9597f413132bac3635440a', 108),
(26, '7f7e8ff414cee7b1809580dcdae0493f897e8b899dff8a7b6e541f15a47a0b85', 108),
(27, '5fa2c3b974df719e8b90761f4baf9a6f3a1a74feb5c677346f28eed668886141', 108),
(28, '666ce18d14e520b3b475e21081a89d958e2b6a14e10591e7984dfc47ef7bf5b5', 108),
(29, '3b6058625f3567620dd8327c595274434cdd13e7c91451857df1c73e085bcb8a', 108),
(30, '592ad35d083c023eb1f9e71212cd51d230473f590961c75d322c5b8a405f8f5b', 108),
(31, '9c2ff71bdd8a5fada2eb6cc52902fc68454c341a18239fb5e6feb10795a23391', 108),
(32, 'a34731b07ab958756d34c71ae5ad229d7794751f121157d49f2f7cfa8a0ec1db', 108),
(33, 'e18e4c1a47c66c2f36a8b635ba5556b3c9c10842cfb6b8e16888b9edeaa14096', 108),
(34, 'ed6e5406abc66b26d79c2cfdfcaf4f9ca11455df6f6082b1d66af9b1f818f5dd', 108),
(35, '7a698ffbc7e528fadf9ec7e3db324a4cfa646235463fcc9444d3bc3a96e16dc5', 108),
(36, 'abaaa64fdc051e91621d679110581c6c2bc9d82a67808c11700cca6f7ee294f6', 108),
(37, '93e4c955ebb4ea570933bab8a2524ed93b75238168f1f8a0716337d76ad5de4a', 108),
(38, '8c9aeb03a97c9a5ae8f98729b872372b3957841927a82421cf20f2be6b3563b3', 108),
(39, 'c0c1e2d4f3bb243ad681fa9dd4fcc943dfc0e077adc074e9245c3015d46ed0e0', 108),
(40, '2db4480d04579feeea14b5d373645bd282ed498a24fbe5f412210372c3edbfe9', 108),
(41, '3b6f1b766d0ebe0e49aec12b159b1f0fb0601df869c18b85c3057e5a425e68b0', 108),
(42, '000a51b12b44282c3725ecb7ce6c43c8a80b0e93237c815326f77ba0d648741f', 108),
(43, '7fe43403b7d749cd6a61f0074a54c0cdf73e61fa8e8ab86bb6910dffede7b28b', 108),
(44, '6e2948067ea66a70547129b51b21b4f563aed625bcb9bffd56c475a90b3f927b', 108),
(45, '2914e721d6bb0e5f50c3ce6ae67818d5d96c99850aad3b5f16ab3778fec78b45', 108),
(46, '007b707e0ff5c6d622991b3e35f57f3f26c4605e05d08ad8c090f3fdae064fd7', 108),
(47, '890afd08432e507e169775b65da48b16331a00277c9798430499d186c01564d5', 108),
(48, '7ed08e98c9fbcb7902a2e43527b2f4e0203fd26fd26a90090da109e4a20db0d5', 108),
(49, '0f289b21edbce3ae6ac355f36e72741efdfd49fde312ef96150aa83eb8869943', 108),
(50, '4729155ba59a4f8509ece904574bb7b3d22805edb9e9451316f36251b622e3d6', 108),
(51, '77cc22c242f9083ffc68fde92d60c7c20dd7bd1518594ba909a68b17495a2ba6', 108),
(52, 'b4ee82dc4384604e5815d5cdaee6b45a2f6d220dce1cf0c17fdf6577ba7d53ce', 108),
(53, 'b166cf6301642844ff0b19edecf78559e92046bef5444ce8b193c193b96f31a7', 108),
(54, 'c5e034f3f4684089944dfcfd4087628f53def653a2f79a02d896877a50943aaf', 108),
(55, '1cc68a07ab5ab59b489b4acadfe8487484696788bfa8d9a5595fa97aacb7be19', 108),
(56, 'e4841d6c0fdd66cf6dc3be0595e1b9d89b9046c06aa775075210deb1b9c08d0c', 108),
(57, '12cb20ed1d7d6bf53438ca6c7bb7e2a5b6ab33f6ea924406236dba7ddb4ecb18', 108),
(58, '984df2ba830f034662c7aa13a4522ef56a165a21abaac4ddf5024ec26a599c5f', 108),
(60, '9059c90f1443be90432f7aaff9c15717e2152a0cf456eda4c0dfdf389b0e8e5d', 108),
(61, 'cd11c628c7757d030aa41c56a33b71fc879b56ce7ec4ab5e077419e31a893de6', 108),
(62, '0f2071310bfd3634b7e14766c50ce8f0aafbd309f82fbe776650508de77a023b', 108),
(63, 'a0f5f435c6bf710b35035c1f93e034389387202a8e7e226f290df89d14c09436', 108),
(64, '9155876fe527e063800bacf6afee8a621a2524e46e13ee82f8f920a6c67631d9', 108),
(65, 'b66cc3316ddaf71a61781626acc96d6022dea4eb293b5e19f5f4a6d956864687', 108),
(66, '3a736764de9278a046746bce3d0ac33c927e00596c4870ad06c763ff23a70add', 108),
(67, '31e9af0123a021a94e136ed730cde07149b091f86ec940db1ef9e8df455ded4c', 108),
(68, '095fa108e139454c7406176b3d08cb7ce8ec850e69ff1c6a4782fb8dae1f1752', 108),
(69, 'a63c9a1c61fab9fa9a4c84b2bff5798318f576dab3da8fdc01e0b5d404fadfbe', 108),
(70, '1c27b3f2d968fe928d92033dad51aa69442b0b07a5a7131c0014ddedcd1e0612', 108),
(71, '0b739fc722e4d086f276d13a3e89a0145d2654cd9388d24860b617ad945205a5', 108),
(75, 'a00d3a7090292747cbebef6e7253892d806eeb123f296dd6839dad24f3881afe', 7),
(76, '12fd2f772c03dc32c68de995e1ecb5e61e0e9f42c73cde84eff8d46eee9294e3', 7),
(77, 'a55a7ae377888eb04c3ea13875afc00cc9126318e160fb7ae41c9d969950a19c', 7);

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
(98, 'Felix', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'neque sed dictum eleifend, nunc'),
(107, 'aaa', '*A02AA727CF2E8C5E6F07A382910C4028D65A053A', 'A new user'),
(108, 'qwe', '', 'A new user');

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
  ADD KEY `fk_Question_Quiz1_idx` (`quiz_idquiz`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT für Tabelle `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id der Frage', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id des Quiz', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id des User', AUTO_INCREMENT=109;

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
