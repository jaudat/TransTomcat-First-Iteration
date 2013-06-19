-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ttc
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Routes`
--

DROP TABLE IF EXISTS `Routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Routes` (
  `id` varchar(3) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Routes`
--

LOCK TABLES `Routes` WRITE;
/*!40000 ALTER TABLE `Routes` DISABLE KEYS */;
INSERT INTO `Routes` VALUES ('1S','1S-Yonge Subway Shuttle'),('5','5-Avenue Rd'),('6','6-Bay'),('7','7-Bathurst'),('8','8-Broadview'),('9','9-Bellamy'),('10','10-Van Horne'),('11','11-Bayview'),('12','12-Kingston Rd'),('14','14-Glencairn'),('15','15-Evans'),('16','16-Mccowan'),('17','17-Birchmount'),('20','20-Cliffside'),('21','21-Brimley'),('22','22-Coxwell'),('23','23-Dawes'),('24','24-Victoria Park'),('25','25-Don Mills'),('26','26-Dupont'),('28','28-Davisville'),('29','29-Dufferin'),('30','30-Lambton'),('31','31-Greenwood'),('32','32-Eglinton West'),('33','33-Forest Hill'),('34','34-Eglinton East'),('35','35-Jane'),('36','36-Finch West'),('37','37-Islington'),('38','38-Highland Creek'),('39','39-Finch East'),('40','40-Junction'),('41','41-Keele'),('42','42-Cummer'),('43','43-Kennedy'),('44','44-Kipling South'),('45','45-Kipling'),('46','46-Martin Grove'),('47','47-Lansdowne'),('48','48-Rathburn'),('49','49-Bloor West'),('50','50-Burnhamthorpe'),('51','51-Leslie'),('52','52-Lawrence West'),('53','53-Steeles East'),('54','54-Lawrence East'),('55','55-Warren Park'),('56','56-Leaside'),('57','57-Midland'),('58','58-Malton'),('59','59-Maple Leaf'),('60','60-Steeles West'),('61','61-Avenue Rd North'),('62','62-Mortimer'),('63','63-Ossington'),('64','64-Main'),('65','65-Parliament'),('66','66-Prince Edward'),('67','67-Pharmacy'),('68','68-Warden'),('69','69-Warden South'),('70','70-OConnor'),('71','71-Runnymede'),('72','72-Pape'),('73','73-Royal York'),('74','74-Mt Pleasant'),('75','75-Sherbourne'),('76','76-Royal York South'),('77','77-Swansea'),('78','78-St Andrews'),('79','79-Scarlett Rd'),('80','80-Queensway'),('81','81-Thorncliffe Park'),('82','82-Rosedale'),('83','83-Jones'),('84','84-Sheppard West'),('85','85-Sheppard East'),('86','86-Scarborough'),('87','87-Cosburn'),('88','88-South Leaside'),('89','89-Weston'),('90','90-Vaughan'),('91','91-Woodbine'),('92','92-Woodbine South'),('94','94-Wellesley'),('95','95-York Mills'),('96','96-Wilson'),('97','97-Yonge'),('98','98-Willowdale - Senlac'),('99','99-Arrow Road'),('100','100-Flemingdon Park'),('101','101-Downsview Park'),('102','102-Markham Rd'),('103','103-Mt Pleasant North'),('104','104-Faywood'),('105','105-Dufferin North'),('106','106-York University'),('107','107-Keele North'),('108','108-Downsview'),('109','109-Ranee'),('110','110-Islington South'),('111','111-East Mall'),('112','112-West Mall'),('113','113-Danforth'),('115','115-Silver Hills'),('116','116-Morningside'),('117','117-Alness'),('120','120-Calvington'),('122','122-Graydon Hall'),('123','123-Shorncliffe'),('124','124-Sunnybrook'),('125','125-Drewry'),('126','126-Christie'),('127','127-Davenport'),('129','129-Mccowan North'),('130','130-Middlefield'),('131','131-Nugget'),('132','132-Milner'),('133','133-Neilson'),('134','134-Progress'),('135','135-Gerrard'),('139','139-Finch - Don Mills'),('141','141-Downtown/Mt Pleasant Express'),('142','142-Downtown/Avenue Rd Express'),('143','143-Downtown/Beach Express'),('144','144-Downtown/Don Valley Express'),('145','145-Downtown/Humber Bay Express'),('160','160-Bathurst North'),('161','161-Rogers Rd'),('162','162-Lawrence - Donway'),('165','165-Weston Rd North'),('167','167-Pharmacy North'),('168','168-Symington'),('169','169-Huntingwood'),('171','171-Mount Dennis'),('190','190-Scarborough Centre Rocket'),('191','191-Highway 27 Rocket'),('192','192-Airport Rocket'),('196','196-York University Rocket'),('199','199-Finch Rocket'),('224','224-Victoria Park North'),('300','300-Bloor - Danforth'),('301','301-Queen'),('302','302-Danforth Rd - Mccowan'),('303','303-Don Mills'),('305','305-Eglinton East'),('306','306-Carlton'),('307','307-Eglinton West'),('308','308-Finch East'),('309','309-Finch West'),('310','310-Bathurst'),('311','311-Islington'),('312','312-St Clair'),('313','313-Jane'),('316','316-Ossington'),('319','319-Wilson'),('320','320-Yonge'),('321','321-York Mills'),('322','322-Coxwell'),('324','324-Victoria Park'),('329','329-Dufferin'),('352','352-Lawrence West'),('353','353-Steeles East'),('354','354-Lawrence East'),('385','385-Sheppard East'),('501','501-Queen'),('502','502-Downtowner'),('504','504-King'),('505','505-Dundas'),('506','506-Carlton'),('508','508-Lake Shore Rd'),('509','509-Harbourfront'),('510','510-Spadina'),('511','511-Bathurst'),('512','512-St Clair');
/*!40000 ALTER TABLE `Routes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-27 16:19:37
