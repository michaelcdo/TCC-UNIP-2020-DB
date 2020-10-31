-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `eia` ;

-- -----------------------------------------------------
-- Table `eia`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eia`.`hibernate_sequence` (
  `next_val` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eia`.`tb_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eia`.`tb_user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(14) NULL DEFAULT NULL,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `idade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eia`.`tb_humor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eia`.`tb_humor` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cod_humor` INT NOT NULL,
  `dt_gravacao` DATETIME NOT NULL,
  `id_user` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_user` (`id_user` ASC) VISIBLE,
  CONSTRAINT `tb_humor_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `eia`.`tb_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eia`.`tb_watson_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eia`.`tb_watson_session` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `dt_session` DATETIME(6) NOT NULL,
  `id_user` BIGINT NOT NULL,
  `session_hash` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_user` (`id_user` ASC) VISIBLE,
  CONSTRAINT `tb_watson_session_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `eia`.`tb_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
