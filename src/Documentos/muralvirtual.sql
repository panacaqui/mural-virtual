-- MySQL Script generated by MySQL Workbench
-- Sáb 29 Set 2018 06:29:08 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MuralVirtual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MuralVirtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MuralVirtual` DEFAULT CHARACTER SET utf8 ;
USE `MuralVirtual` ;

-- -----------------------------------------------------
-- Table `MuralVirtual`.`Conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MuralVirtual`.`Conteudo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `data` DATE NOT NULL,
  `data_validade` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MuralVirtual`.`Arquivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MuralVirtual`.`Arquivos` (
  `Conteudo_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `nome_arquivo` VARCHAR(18) NOT NULL,
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  INDEX `fk_Conteudos_Conteudo_idx` (`Conteudo_id` ASC),
  PRIMARY KEY (`Conteudo_id`),
  CONSTRAINT `fk_Conteudos_Conteudo`
    FOREIGN KEY (`Conteudo_id`)
    REFERENCES `MuralVirtual`.`Conteudo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MuralVirtual`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MuralVirtual`.`Usuarios` (
  `nome` VARCHAR(45) NOT NULL,
  `suap` VARCHAR(9) NOT NULL,
  `senha` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`suap`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MuralVirtual`.`Editais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MuralVirtual`.`Editais` (
  `Conteudo_id` INT NOT NULL,
  `subtitulo` VARCHAR(45) NULL,
  `conteudo` VARCHAR(45) NOT NULL,
  INDEX `fk_Editais_Conteudo1_idx` (`Conteudo_id` ASC),
  PRIMARY KEY (`Conteudo_id`),
  CONSTRAINT `fk_Editais_Conteudo1`
    FOREIGN KEY (`Conteudo_id`)
    REFERENCES `MuralVirtual`.`Conteudo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
