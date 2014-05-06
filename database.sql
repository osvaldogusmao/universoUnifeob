# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.14)
# Database: universoUnifeob
# Generation Time: 2014-05-06 10:26:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Opcao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Opcao`;

CREATE TABLE `Opcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correta` bit(1) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `pergunta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK48DAA30A53466FC` (`pergunta_id`),
  CONSTRAINT `FK48DAA30A53466FC` FOREIGN KEY (`pergunta_id`) REFERENCES `pergunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Opcao` WRITE;
/*!40000 ALTER TABLE `Opcao` DISABLE KEYS */;

INSERT INTO `Opcao` (`id`, `correta`, `descricao`, `pergunta_id`)
VALUES
	(1,00000001,'2002',1),
	(2,00000000,'1998',1),
	(3,00000000,'2006',1),
	(4,00000001,'H2O',2),
	(5,00000000,'HO2',2),
	(6,00000000,'C2O',2),
	(7,00000001,'Galaxia',3),
	(8,00000000,'Marca de Leite',3),
	(9,00000000,'Civilizaçao Antiga',3),
	(10,00000001,'Don Juan',4),
	(11,00000000,'Don Antonio',4),
	(12,00000000,'Don Marco',4),
	(13,00000001,'100',5),
	(14,00000000,'10',5),
	(15,00000000,'50',5),
	(16,00000001,'Matilha',6),
	(17,00000000,'Bando',6),
	(18,00000000,'Rebanho',6),
	(19,00000001,'Amazonica',7),
	(20,00000000,'Negra',7),
	(21,00000000,'De Sherwood',7),
	(22,00000001,'Adao e Eva',8),
	(23,00000000,'Sansao e Dalila',8),
	(24,00000000,'Joao e Maria',8),
	(25,00000001,'Monteiro Lobato',9),
	(26,00000000,'Mauricio de Souza',9),
	(27,00000000,'Jorge Amado',9),
	(28,00000001,'Vice Presidente',10),
	(29,00000000,'Senador',10),
	(30,00000000,'Deputado Federal',10);

/*!40000 ALTER TABLE `Opcao` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Pergunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pergunta`;

CREATE TABLE `Pergunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Pergunta` WRITE;
/*!40000 ALTER TABLE `Pergunta` DISABLE KEYS */;

INSERT INTO `Pergunta` (`id`, `descricao`)
VALUES
	(1,'Em que ano o Brasil conquistou a ultima copa?'),
	(2,'Como e composta a Molécula da agua?'),
	(3,'O que é a Via Láctea?'),
	(4,'Quem era o homem mais sedutor do mundo?'),
	(5,'De quantos anos é constituido um século?'),
	(6,'Qual o coletivo de cães?'),
	(7,'Qual a maior floresta no planeta?'),
	(8,'Qual casal foi expulso do Paraiso?'),
	(9,'Na literatura, quem foi o criado da boneca Emilia?'),
	(10,'Quem é o primeiro substituto do Presidente?');

/*!40000 ALTER TABLE `Pergunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Pontuacao
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pontuacao`;

CREATE TABLE `Pontuacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificaSessao` varchar(255) DEFAULT NULL,
  `nomeUsuario` varchar(255) DEFAULT NULL,
  `totalPontos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Resposta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Resposta`;

CREATE TABLE `Resposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificacao` varchar(255) DEFAULT NULL,
  `nomeUsuario` varchar(255) DEFAULT NULL,
  `opcao_id` int(11) DEFAULT NULL,
  `pergunta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF918B41ED5C33B8` (`opcao_id`),
  KEY `FKEF918B41A53466FC` (`pergunta_id`),
  CONSTRAINT `FKEF918B41A53466FC` FOREIGN KEY (`pergunta_id`) REFERENCES `Pergunta` (`id`),
  CONSTRAINT `FKEF918B41ED5C33B8` FOREIGN KEY (`opcao_id`) REFERENCES `Opcao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Resposta` WRITE;
/*!40000 ALTER TABLE `Resposta` DISABLE KEYS */;

INSERT INTO `Resposta` (`id`, `identificacao`, `nomeUsuario`, `opcao_id`, `pergunta_id`)
VALUES
	(1,'1','Osvaldo',1,1),
	(2,'1','Osvaldo',4,2),
	(3,'1','Osvaldo',7,3),
	(4,'1','Osvaldo',10,4),
	(5,'1','Rafael',16,6),
	(6,'1','Osvaldo',13,5),
	(7,'1','Rafael',19,7),
	(8,'1','Osvaldo',22,8),
	(9,'1','Osvaldo',25,9),
	(10,'1','Osvaldo',29,10),
	(11,'2','thiago antonio luiz',3,1),
	(12,'2','thiago antonio luiz',4,2),
	(13,'2','thiago antonio luiz',7,3),
	(14,'2','thiago antonio luiz',10,4),
	(15,'2','thiago antonio luiz',13,5),
	(16,'2','thiago antonio luiz',16,6),
	(17,'2','thiago antonio luiz',19,7),
	(18,'2','thiago antonio luiz',22,8),
	(19,'2','thiago antonio luiz',25,9),
	(20,'2','thiago antonio luiz',28,10),
	(21,'3','diogo',1,1),
	(22,'3','aristides',4,2),
	(23,'3','aristides',7,3),
	(24,'3','aristides',10,4),
	(25,'3','aristides',13,5),
	(26,'3','aristides',16,6),
	(27,'3','aristides',19,7),
	(28,'3','aristides',22,8),
	(29,'3','aristides',25,9),
	(30,'3','aristides',28,10),
	(31,'4','guilherme',1,1),
	(32,'4','guilherme',4,2),
	(33,'4','guilherme',8,3),
	(34,'4','guilherme',10,4),
	(35,'4','guilherme',13,5),
	(36,'4','guilherme',16,6),
	(37,'4','guilherme',19,7),
	(38,'4','guilherme',22,8),
	(39,'4','guilherme',25,9),
	(40,'4','guilherme',28,10),
	(41,'5','alessandra',3,1),
	(42,'5','Maluce',4,2),
	(43,'5','Maluce',7,3),
	(44,'5','Maluce',10,4),
	(45,'5','Maluce',13,5),
	(46,'5','Maluce',17,6),
	(47,'5','Maluce',19,7),
	(48,'5','Maluce',22,8),
	(49,'5','Maluce',25,9),
	(50,'5','Maluce',28,10),
	(51,'6','marry',1,1),
	(52,'6','Adriana',4,2),
	(53,'6','marry',7,3),
	(54,'6','marry',10,4),
	(55,'6','marry',13,5),
	(56,'6','marry',16,6),
	(57,'6','marry',19,7),
	(58,'6','marry',22,8),
	(59,'6','marry',25,9),
	(60,'6','marry',28,10),
	(61,'9','joyce',2,1),
	(62,'9','joyce',4,2),
	(63,'9','joao',7,3),
	(64,'9','joyce',10,4),
	(65,'9','joao',13,5),
	(66,'9','joyce',17,6),
	(67,'9','joyce',19,7),
	(68,'9','joao',22,8),
	(69,'9','joao',25,9),
	(70,'9','joao',28,10),
	(71,'10','raphael',1,1),
	(72,'10','raphael',4,2),
	(73,'10','raphael',7,3),
	(74,'10','raphael',10,4),
	(75,'10','raphael',13,5),
	(76,'10','raphael',16,6),
	(77,'10','raphael',19,7),
	(78,'10','raphael',22,8),
	(79,'10','raphael',25,9),
	(80,'10','raphael',28,10),
	(81,'12','bruno',2,1),
	(82,'12','tayna',4,2),
	(83,'12','tayna',7,3),
	(84,'12','tayna',10,4),
	(85,'12','bruno',19,7),
	(86,'12','tayna',14,5),
	(87,'12','bruno',22,8),
	(88,'12','tayna',16,6),
	(89,'12','bruno',25,9),
	(90,'12','bruno',28,10),
	(91,'13','Yuri Becaleti',1,1),
	(92,'13','stella',4,2),
	(93,'13','stella',7,3),
	(94,'13','stella',10,4),
	(95,'13','rodrigo',13,5),
	(96,'13','rodrigo',16,6),
	(97,'13','rodrigo',19,7),
	(98,'13','rodrigo',22,8),
	(99,'13','rodrigo',25,9),
	(100,'13','rodrigo',28,10),
	(101,'14','Caio Salles',1,1),
	(102,'14','Caio Salles',4,2),
	(103,'14','Caio Salles',7,3),
	(104,'14','Caio Salles',10,4),
	(105,'14','Luis Fernando Todero',28,10),
	(106,'14','Caio Salles',13,5),
	(107,'14','Luis Fernando Todero',25,9),
	(108,'14','Caio Salles',16,6),
	(109,'14','matheus chuqui zago',22,8),
	(110,'14','Caio Salles',19,7),
	(111,'16','ana paula',1,1),
	(112,'16','ana paula',4,2),
	(113,'16','ana paula',7,3),
	(114,'16','ana paula',10,4),
	(115,'16','ana paula',13,5),
	(116,'16','ana paula',16,6),
	(117,'16','ana paula',19,7),
	(118,'16','ana paula',22,8),
	(119,'16','ana paula',25,9),
	(120,'16','ana paula',28,10),
	(121,'19','Talitha',3,1),
	(122,'19','camila',4,2),
	(123,'19','camila',7,3),
	(124,'19','camila',10,4),
	(125,'19','camila',13,5),
	(126,'19','camila',16,6),
	(127,'19','Talitha',22,8),
	(128,'19','camila',19,7),
	(129,'19','Talitha',25,9),
	(130,'19','Talitha',28,10),
	(131,'20','gil',3,1),
	(132,'20','gil',4,2),
	(133,'20','gil',7,3),
	(134,'20','gil',10,4),
	(135,'20','gil',13,5),
	(136,'20','gil',17,6),
	(137,'20','gil',19,7),
	(138,'20','gil',22,8),
	(139,'20','gil',25,9),
	(140,'20','gil',28,10),
	(141,'22','marcelo',1,1),
	(142,'22','marcelo',4,2),
	(143,'21','gabriel',1,1),
	(144,'21','gabriel',4,2),
	(145,'21','gabriel',7,3),
	(146,'22','marcelo',7,3),
	(147,'21','gabriel',10,4),
	(148,'21','gabriel',13,5),
	(149,'22','marcelo',10,4),
	(150,'21','gabriel',16,6),
	(151,'22','marcelo',13,5),
	(152,'21','gabriel',19,7),
	(153,'21','kaique',28,10),
	(154,'21','gabriel',22,8),
	(155,'21','kaique',25,9),
	(156,'22','marcelo',17,6),
	(157,'22','marcelo',19,7),
	(158,'22','marcelo',22,8),
	(159,'22','marcelo',25,9),
	(160,'22','marcelo',28,10),
	(161,'24','ANDRE',1,1),
	(162,'24','ANDRE',4,2),
	(163,'24','ANDRE',7,3),
	(164,'24','ANDRE',10,4),
	(165,'24','ANDRE',13,5),
	(166,'24','ANDRE',17,6),
	(167,'24','ANDRE',19,7),
	(168,'24','ANDRE',22,8),
	(169,'24','ANDRE',25,9),
	(170,'24','ANDRE',28,10),
	(171,'erer','werr',1,1),
	(172,'erer','werr',4,2),
	(173,'sd','sd',1,1),
	(174,'30','maria emilia',1,1),
	(175,'30','Romulo',4,2),
	(176,'30','Romulo',8,3),
	(177,'30','Romulo',10,4),
	(178,'30','Romulo',13,5),
	(179,'30','Romulo',16,6),
	(180,'30','Romulo',19,7),
	(181,'30','Romulo',22,8),
	(182,'30','Romulo',25,9),
	(183,'30','Romulo',28,10),
	(184,'31','José Victor',1,1),
	(185,'31','José Victor',4,2),
	(186,'31','José Victor',7,3),
	(187,'31','José Victor',11,4),
	(188,'31','José Victor',13,5),
	(189,'31','José Victor',16,6),
	(190,'31','José Victor',19,7),
	(191,'31','José Victor',22,8),
	(192,'31','José Victor',25,9),
	(193,'31','José Victor',28,10),
	(194,'33','stella',1,1),
	(195,'33','stella',4,2),
	(196,'33','stella',7,3),
	(197,'33','Yuri Becaleti',28,10),
	(198,'33','stella',10,4),
	(199,'33','stella',13,5),
	(200,'33','stella',16,6),
	(201,'33','stella',19,7),
	(202,'33','stella',22,8),
	(203,'33','stella',25,9),
	(204,'34','yuri',2,1),
	(205,'34','yuri',4,2),
	(206,'34','yuri',7,3),
	(207,'34','yuri',11,4),
	(208,'34','yuri',13,5),
	(209,'34','yuri',16,6),
	(210,'34','yuri',19,7),
	(211,'34','yuri',22,8),
	(212,'34','yuri',25,9),
	(213,'34','yuri',28,10),
	(214,'38','liliane',3,1),
	(215,'38','liliane',4,2),
	(216,'38','liliane',7,3),
	(217,'38','liliane',10,4),
	(218,'38','liliane',13,5),
	(219,'38','liliane',17,6),
	(220,'38','liliane',19,7),
	(221,'38','liliane',22,8),
	(222,'38','liliane',25,9),
	(223,'38','liliane',28,10),
	(224,'40','vanessa',3,1),
	(225,'40','vanessa',4,2),
	(226,'40','vanessa',7,3),
	(227,'40','vanessa',10,4),
	(228,'40','Maria Laura',13,5),
	(229,'40','Maria Laura',19,7),
	(230,'40','vanessa',16,6),
	(231,'40','Maria Laura',23,8),
	(232,'40','vanessa',25,9),
	(233,'40','vanessa',28,10),
	(234,'sdf','sdf',1,1),
	(235,'42','david',1,1),
	(236,'42','david',4,2),
	(237,'42','david',7,3),
	(238,'42','david',11,4),
	(239,'42','david',13,5),
	(240,'42','david',17,6),
	(241,'42','david',19,7),
	(242,'42','david',22,8),
	(243,'42','david',25,9),
	(244,'42','david',28,10),
	(245,'50','wendy',1,1),
	(246,'50','wendy',4,2),
	(247,'50','wendy',7,3),
	(248,'50','wendy',10,4),
	(249,'50','Whellington',13,5),
	(250,'50','Whellington',16,6),
	(251,'50','Whellington',19,7),
	(252,'50','wendy',22,8),
	(253,'50','wendy',25,9),
	(254,'50','wendy',28,10),
	(255,'ert','e5ty',1,1);

/*!40000 ALTER TABLE `Resposta` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
