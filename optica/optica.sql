-- MySQL Script generated by MySQL Workbench
-- Tue Feb 25 11:10:48 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cul_ampolla` ;

-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul_ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cul_ampolla` ;

-- -----------------------------------------------------
-- Table `cul_ampolla`.` proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.` proveedor` (
  `id proveedor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `direccion_calle` VARCHAR(25) NOT NULL,
  `direccion_Numl` VARCHAR(8) NOT NULL,
  `direccion_piso` VARCHAR(8) NOT NULL,
  `direccion_puerta` VARCHAR(8) NULL DEFAULT NULL,
  `direccion_cp` VARCHAR(8) NOT NULL,
  `direccion_ciudad` VARCHAR(15) NOT NULL,
  `direccion_pais` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `NIF` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `apellidos` VARCHAR(30) NOT NULL,
  `direccion_postal` VARCHAR(45) NULL,
  `telefono` VARCHAR(10) NULL DEFAULT 'null',
  `email` VARCHAR(25) NULL DEFAULT 'null',
  `fecha_registro` DATE NOT NULL,
  `cliente_id_cliente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_cliente_cliente`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `cul_ampolla`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_cliente_UNIQUE` ON `cul_ampolla`.`cliente` (`id_cliente` ASC) VISIBLE;

CREATE INDEX `fk_cliente_cliente_idx` ON `cul_ampolla`.`cliente` (`cliente_id_cliente` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`empleado` (
  `id_emp` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `apellidos` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_emp`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_emp_UNIQUE` ON `cul_ampolla`.`empleado` (`id_emp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`gafas` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(15) NULL,
  `montura` ENUM('flotante', 'plastico', 'metal') NULL DEFAULT NULL,
  `color_montura` VARCHAR(10) NULL DEFAULT NULL,
  `graduacion_dere` VARCHAR(10) NULL DEFAULT NULL,
  `graduacion_izq` VARCHAR(10) NULL DEFAULT NULL,
  `color_dere` VARCHAR(10) NULL DEFAULT NULL,
  `color_izq` VARCHAR(10) NULL DEFAULT NULL,
  `precio` VARCHAR(45) NULL DEFAULT NULL,
  ` proveedor_id proveedor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_gafas`),
  CONSTRAINT `fk_gafas_ proveedor1`
    FOREIGN KEY (` proveedor_id proveedor`)
    REFERENCES `cul_ampolla`.` proveedor` (`id proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_gafas_UNIQUE` ON `cul_ampolla`.`gafas` (`id_gafas` ASC) VISIBLE;

CREATE INDEX `fk_gafas_ proveedor1_idx` ON `cul_ampolla`.`gafas` (` proveedor_id proveedor` ASC) INVISIBLE;

CREATE UNIQUE INDEX ` proveedor_id proveedor_UNIQUE` ON `cul_ampolla`.`gafas` (` proveedor_id proveedor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cul_ampolla`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `id_emp` INT NOT NULL,
  `id_client` INT NOT NULL,
  `id_gafs` INT NOT NULL,
  `fecha_vta` DATE NULL,
  PRIMARY KEY (`id_venta`),
  CONSTRAINT `fk_venta_empleado1`
    FOREIGN KEY (`id_emp`)
    REFERENCES `cul_ampolla`.`empleado` (`id_emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_cliente1`
    FOREIGN KEY (`id_client`)
    REFERENCES `cul_ampolla`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_gafas1`
    FOREIGN KEY (`id_gafs`)
    REFERENCES `cul_ampolla`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_venta_UNIQUE` ON `cul_ampolla`.`venta` (`id_venta` ASC) VISIBLE;

CREATE INDEX `fk_venta_empleado1_idx` ON `cul_ampolla`.`venta` (`id_emp` ASC) VISIBLE;

CREATE INDEX `fk_venta_cliente1_idx` ON `cul_ampolla`.`venta` (`id_client` ASC) VISIBLE;

CREATE INDEX `fk_venta_gafas1_idx` ON `cul_ampolla`.`venta` (`id_gafs` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
