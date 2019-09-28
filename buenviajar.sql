-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema buenviajar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema buenviajar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `buenviajar` DEFAULT CHARACTER SET utf8 ;
USE `buenviajar` ;

-- -----------------------------------------------------
-- Table `buenviajar`.`agencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`agencia` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `nombre_turista` VARCHAR(45) NOT NULL,
  `nombre_agente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idventas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`hotel` (
  `idhotel` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `destino` VARCHAR(45) NULL,
  `imagen_hotel` VARCHAR(45) NULL,
  `imagen_destino` VARCHAR(45) NULL,
  PRIMARY KEY (`idhotel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`Turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`Turista` (
  `idTurista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT UNSIGNED NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `hotel_idhotel` INT UNSIGNED NOT NULL,
  `agencia_idventas` INT NOT NULL,
  PRIMARY KEY (`idTurista`, `agencia_idventas`),
  INDEX `fk_Turista_hotel_idx` (`hotel_idhotel` ASC) VISIBLE,
  INDEX `fk_Turista_agencia1_idx` (`agencia_idventas` ASC) VISIBLE,
  CONSTRAINT `fk_Turista_hotel`
    FOREIGN KEY (`hotel_idhotel`)
    REFERENCES `buenviajar`.`hotel` (`idhotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turista_agencia1`
    FOREIGN KEY (`agencia_idventas`)
    REFERENCES `buenviajar`.`agencia` (`idventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`promociones` (
  `idpromociones` INT NOT NULL AUTO_INCREMENT,
  `precio` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_inicio` DATETIME NULL,
  `fecha_final` DATETIME NULL,
  `nombre_hotel` VARCHAR(45) NULL,
  PRIMARY KEY (`idpromociones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`destino` (
  `iddestino` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `destino` VARCHAR(45) NULL,
  `Imagen_destino` VARCHAR(45) NULL,
  `popularidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddestino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`promocion_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`promocion_hotel` (
  `promociones_idpromociones` INT NOT NULL,
  `hotel_idhotel` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`promociones_idpromociones`, `hotel_idhotel`),
  INDEX `fk_promociones_has_hotel_hotel1_idx` (`hotel_idhotel` ASC) VISIBLE,
  INDEX `fk_promociones_has_hotel_promociones1_idx` (`promociones_idpromociones` ASC) VISIBLE,
  CONSTRAINT `fk_promociones_has_hotel_promociones1`
    FOREIGN KEY (`promociones_idpromociones`)
    REFERENCES `buenviajar`.`promociones` (`idpromociones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promociones_has_hotel_hotel1`
    FOREIGN KEY (`hotel_idhotel`)
    REFERENCES `buenviajar`.`hotel` (`idhotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buenviajar`.`hotel_destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buenviajar`.`hotel_destino` (
  `hotel_idhotel` INT UNSIGNED NOT NULL,
  `destino_iddestino` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`hotel_idhotel`, `destino_iddestino`),
  INDEX `fk_hotel_has_destino_destino1_idx` (`destino_iddestino` ASC) VISIBLE,
  INDEX `fk_hotel_has_destino_hotel1_idx` (`hotel_idhotel` ASC) VISIBLE,
  CONSTRAINT `fk_hotel_has_destino_hotel1`
    FOREIGN KEY (`hotel_idhotel`)
    REFERENCES `buenviajar`.`hotel` (`idhotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_destino_destino1`
    FOREIGN KEY (`destino_iddestino`)
    REFERENCES `buenviajar`.`destino` (`iddestino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
