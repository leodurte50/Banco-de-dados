-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: faculdade
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `matricula` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1001,'João Almeida','2000-05-20','Rua A, 123'),(1002,'Ana Costa','1999-11-12','Av B, 456');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int NOT NULL,
  `data_hora` datetime NOT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  `comentario` text,
  `cpf_professor` char(11) DEFAULT NULL,
  `matricula_aluno` int DEFAULT NULL,
  `id_disciplina` int DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `cpf_professor` (`cpf_professor`),
  KEY `matricula_aluno` (`matricula_aluno`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `avaliacao_ibfk_3` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,'2025-07-01 10:30:00',8.50,'Bom desempenho','11111111111',1001,501),(2,'2025-07-02 11:00:00',7.00,'Pode melhorar','22222222222',1002,502);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chefe_departamento`
--

DROP TABLE IF EXISTS `chefe_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chefe_departamento` (
  `id_departamento` int NOT NULL,
  `cpf_professor` char(11) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  KEY `cpf_professor` (`cpf_professor`),
  CONSTRAINT `chefe_departamento_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`),
  CONSTRAINT `chefe_departamento_ibfk_2` FOREIGN KEY (`cpf_professor`) REFERENCES `professor` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefe_departamento`
--

LOCK TABLES `chefe_departamento` WRITE;
/*!40000 ALTER TABLE `chefe_departamento` DISABLE KEYS */;
INSERT INTO `chefe_departamento` VALUES (1,'11111111111'),(2,'22222222222');
/*!40000 ALTER TABLE `chefe_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_aluno_disciplina`
--

DROP TABLE IF EXISTS `curso_aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_aluno_disciplina` (
  `matricula_aluno` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `semestre` int DEFAULT '1',
  `ano` int DEFAULT '2025',
  PRIMARY KEY (`matricula_aluno`,`id_disciplina`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `curso_aluno_disciplina_ibfk_1` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula`),
  CONSTRAINT `curso_aluno_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_aluno_disciplina`
--

LOCK TABLES `curso_aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_aluno_disciplina` DISABLE KEYS */;
INSERT INTO `curso_aluno_disciplina` VALUES (1001,501,1,2025),(1002,502,1,2025);
/*!40000 ALTER TABLE `curso_aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `local` varchar(100) DEFAULT 'Campus Central',
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ciência da Computação','Prédio A'),(2,'Engenharia Civil','Prédio B');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id_disciplina` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int DEFAULT '60',
  `ementa` text,
  PRIMARY KEY (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (501,'Banco de Dados',60,'Modelo ER, modelo relacional, SQL'),(502,'Estrutura de Dados',60,'Listas, Pilhas, Filas');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisito`
--

DROP TABLE IF EXISTS `pre_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_requisito` (
  `id_disciplina_requerida` int NOT NULL,
  `id_disciplina_prerequisito` int NOT NULL,
  PRIMARY KEY (`id_disciplina_requerida`,`id_disciplina_prerequisito`),
  KEY `id_disciplina_prerequisito` (`id_disciplina_prerequisito`),
  CONSTRAINT `pre_requisito_ibfk_1` FOREIGN KEY (`id_disciplina_requerida`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `pre_requisito_ibfk_2` FOREIGN KEY (`id_disciplina_prerequisito`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisito`
--

LOCK TABLES `pre_requisito` WRITE;
/*!40000 ALTER TABLE `pre_requisito` DISABLE KEYS */;
INSERT INTO `pre_requisito` VALUES (501,502);
/*!40000 ALTER TABLE `pre_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `inicio_contrato` date NOT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `id_departamento` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('11111111111','Carlos Silva','2015-03-01','carlos@faculdade.edu',1),('22222222222','Maria Santos','2018-08-15','maria@faculdade.edu',2);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'faculdade'
--

--
-- Dumping routines for database 'faculdade'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-15 18:56:32
