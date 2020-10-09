-- MySQL Script generated by MySQL Workbench
-- Fri Oct  9 21:01:41 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OpticalShop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OpticalShop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OpticalShop` DEFAULT CHARACTER SET utf8 ;
USE `OpticalShop` ;

-- -----------------------------------------------------
-- Table `OpticalShop`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticalShop`.`Suppliers` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(20) NULL,
  `PostalCode` VARCHAR(5) NULL,
  `Telephone` VARCHAR(9) NULL,
  `Fax` VARCHAR(9) NULL,
  `NIF` VARCHAR(9) NULL,
  PRIMARY KEY (`idSupplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OpticalShop`.`TradeMarks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticalShop`.`TradeMarks` (
  `idTradeMark` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Suppliers_idSupplier` INT NOT NULL,
  PRIMARY KEY (`idTradeMark`, `Suppliers_idSupplier`),
  INDEX `fk_TradeMarks_Suppliers_idx` (`Suppliers_idSupplier` ASC) VISIBLE,
  CONSTRAINT `fk_TradeMarks_Suppliers`
    FOREIGN KEY (`Suppliers_idSupplier`)
    REFERENCES `OpticalShop`.`Suppliers` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OpticalShop`.`Sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticalShop`.`Sellers` (
  `idSeller` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idSeller`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OpticalShop`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticalShop`.`Customers` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `idCustomerRef` INT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `CustomerReference_idx` (`idCustomerRef` ASC) VISIBLE,
  CONSTRAINT `CustomerReference`
    FOREIGN KEY (`idCustomerRef`)
    REFERENCES `OpticalShop`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OpticalShop`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OpticalShop`.`Glasses` (
  `idGlass` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `PrescriptionGlassR` FLOAT NULL,
  `PrescriptionGlassL` FLOAT NULL,
  `TypeFrame` SMALLINT NULL,
  `ColorFrame` VARCHAR(15) NULL,
  `ColorGlassR` VARCHAR(15) NULL,
  `ColorGlassL` VARCHAR(15) NULL,
  `Price` FLOAT NULL,
  `TradeMarks_idTradeMark` INT NOT NULL,
  `Sellers_idSeller` INT NOT NULL,
  `Customers_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idGlass`, `TradeMarks_idTradeMark`, `Sellers_idSeller`, `Customers_idCustomer`),
  INDEX `fk_Glasses_TradeMarks1_idx` (`TradeMarks_idTradeMark` ASC) VISIBLE,
  INDEX `fk_Glasses_Sellers1_idx` (`Sellers_idSeller` ASC) VISIBLE,
  INDEX `fk_Glasses_Customers1_idx` (`Customers_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_TradeMarks1`
    FOREIGN KEY (`TradeMarks_idTradeMark`)
    REFERENCES `OpticalShop`.`TradeMarks` (`idTradeMark`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Sellers1`
    FOREIGN KEY (`Sellers_idSeller`)
    REFERENCES `OpticalShop`.`Sellers` (`idSeller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Customers1`
    FOREIGN KEY (`Customers_idCustomer`)
    REFERENCES `OpticalShop`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;