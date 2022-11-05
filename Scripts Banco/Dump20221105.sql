CREATE DATABASE  IF NOT EXISTS `wasabi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wasabi`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: wasabi
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `idCarrinho` int NOT NULL,
  `idProduto` int NOT NULL,
  `idPedido` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`idCarrinho`),
  KEY `WDIDX_ListaProdutos_IdProduto` (`idProduto`),
  KEY `WDIDX_ListaProdutos_IdPedido` (`idPedido`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `ListaProdutos_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ListaProdutos_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `cpf` varchar(22) NOT NULL,
  `cartaoDeCredito` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Gustavo','gustavo@gmail.com','Senador Lemos, 357','014.784.987-10','01452369874521');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idCarrinho` int DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (2,1,0,194.8);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `preco` float NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Combo Promo 01 (15 peças)','10 Hol de salmão grelhado com batata palha doce.\n3 Niguiris de skin.',40.9,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\promocao.png'),(2,'Combo Promo 02 (15 peças)','4 Sashimi de salmão.\n2 Gunkas maçaricado com molho de manga.',53.9,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\barcasushi.png'),(3,'Combo Promo 03 (15 peças)','5 Makimono skin com pesto de jambu.\n5 Hot de kani com patê.',49.9,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\promocao3.png'),(4,'Combo Promo 04 (15 peças)','3 Gunkan com patê de polvo apimentado.\n2 Niguiris de kani.',48.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\promocao4.png'),(5,'Salmão Em Consumer','Salmão em consumer com base\nde purê de batata doce.',39,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\entrada.png'),(6,'Lula Em Anéis Grelhada','Anéis de lula grelhada em fogo brando\ncom farofa de polvo.',41,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\lulafrita.png'),(7,'Bolinhas de salmão fritas','10 unidades de salmão temperado\ncom limão e cebolinha.',28,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\tempura.png'),(8,'Camarão empanado (5 unidades)','Camarão empanado e frito.',43.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\camaraofrito.png'),(9,'Temaki exotic','Salmão, kani, shimeji fritos na manteiga\ne cream cheese.',41.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\temaki.png'),(10,'Temaki poró','Salmão misturado com alho poró na \ncasquinha de massa harumaki.',42.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\temakiespecial.png'),(11,'Temaki salmão especial','Salmão grelhado na casquinha de massa harumaki.',43.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\temakisalmao.png'),(12,'Temaki super wasabi','Salmão, camarão e kani na massa harumaki\ncom cream cheese, arroz e cebolinha.',45.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\temakigrelhado.png'),(13,'Wasabi holl met','5 peças do holl de salmão grelhado, cream cheese,\nalga nori, arroz, gergelim e biscoitinho tempurá.',23.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\hotholl.png'),(14,'Holl tartar de salmão met','5 peças de holl de salmão, arroz, gergelim, \nalga nori, cream cheese e patê de salmão em cima.',24.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\hollcreamcheese.png'),(15,'Holl tartar de salmão','10 peças de holl de salmão e cream cheese, arroz,\nalga nori, gergelim.',46.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\hollsalmao.png'),(16,'Kasai met','5 peças de holl de camarão, cream cheese, \nenvolvido por finas camadas de salmão\nmaçaricados.',23.5,'C:\\Users\\Hayla\\IdeaProjects\\Wasabi\\src\\main\\java\\img\\hollkani.png');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-05 12:38:24
