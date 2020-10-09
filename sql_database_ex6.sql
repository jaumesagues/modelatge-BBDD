-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: opticalshop
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idCustomer` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `idCustomerRef` int DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `CustomerReference_idx` (`idCustomerRef`),
  CONSTRAINT `CustomerReference` FOREIGN KEY (`idCustomerRef`) REFERENCES `customers` (`idCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Customer1',NULL),(2,'Customer2',1),(3,'Customer3',2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idGlass` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `PrescriptionGlassR` float DEFAULT NULL,
  `PrescriptionGlassL` float DEFAULT NULL,
  `TypeFrame` smallint DEFAULT NULL,
  `ColorFrame` varchar(15) DEFAULT NULL,
  `ColorGlassR` varchar(15) DEFAULT NULL,
  `ColorGlassL` varchar(15) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `TradeMarks_idTradeMark` int NOT NULL,
  `Sellers_idSeller` int NOT NULL,
  `Customers_idCustomer` int NOT NULL,
  PRIMARY KEY (`idGlass`,`TradeMarks_idTradeMark`,`Sellers_idSeller`,`Customers_idCustomer`),
  KEY `fk_Glasses_TradeMarks1_idx` (`TradeMarks_idTradeMark`),
  KEY `fk_Glasses_Sellers1_idx` (`Sellers_idSeller`),
  KEY `fk_Glasses_Customers1_idx` (`Customers_idCustomer`),
  CONSTRAINT `fk_Glasses_Customers1` FOREIGN KEY (`Customers_idCustomer`) REFERENCES `customers` (`idCustomer`),
  CONSTRAINT `fk_Glasses_Sellers1` FOREIGN KEY (`Sellers_idSeller`) REFERENCES `sellers` (`idSeller`),
  CONSTRAINT `fk_Glasses_TradeMarks1` FOREIGN KEY (`TradeMarks_idTradeMark`) REFERENCES `trademarks` (`idTradeMark`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,'Glass1',1.5,0,NULL,'Black','Transparent','Transparent',NULL,1,1,1),(2,'Glass2',0,1.5,NULL,'Blue',NULL,NULL,NULL,2,2,2),(3,'Glass3',1.5,1.5,NULL,NULL,NULL,NULL,NULL,3,1,3),(4,'Glass4',1.25,1.25,NULL,NULL,NULL,NULL,NULL,2,3,1);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSeller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Seller1'),(2,'Seller2'),(3,'Seller3');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `PostalCode` varchar(5) DEFAULT NULL,
  `Telephone` varchar(9) DEFAULT NULL,
  `Fax` varchar(9) DEFAULT NULL,
  `NIF` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Supplier1',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Supplier2',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Supplier3',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trademarks`
--

DROP TABLE IF EXISTS `trademarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trademarks` (
  `idTradeMark` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Suppliers_idSupplier` int NOT NULL,
  PRIMARY KEY (`idTradeMark`,`Suppliers_idSupplier`),
  KEY `fk_TradeMarks_Suppliers_idx` (`Suppliers_idSupplier`),
  CONSTRAINT `fk_TradeMarks_Suppliers` FOREIGN KEY (`Suppliers_idSupplier`) REFERENCES `suppliers` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trademarks`
--

LOCK TABLES `trademarks` WRITE;
/*!40000 ALTER TABLE `trademarks` DISABLE KEYS */;
INSERT INTO `trademarks` VALUES (1,'Mark1',1),(2,'Mark2',2),(3,'Mark3',3),(4,'Mark4',1);
/*!40000 ALTER TABLE `trademarks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 20:58:32
