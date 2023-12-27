-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema potato
-- -----------------------------------------------------
-- Жестокая расправа на картошкой

-- -----------------------------------------------------
-- Schema potato
--
-- Жестокая расправа на картошкой
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `potato` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `potato` ;

-- -----------------------------------------------------
-- Table `potato`.`potatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `potato`.`potatos` (
  `potato_id` INT NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`potato_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `potato`.`waves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `potato`.`waves` (
  `wave_id` INT NOT NULL AUTO_INCREMENT,
  `lyambda` FLOAT NOT NULL,
  PRIMARY KEY (`wave_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `potato`.`experiments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `potato`.`experiments` (
  `experiment_id` INT NOT NULL,
  `potato_id` INT NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`experiment_id`, `potato_id`),
  INDEX `fk_experiments_potatos_idx` (`potato_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiments_potatos`
    FOREIGN KEY (`potato_id`)
    REFERENCES `potato`.`potatos` (`potato_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `potato`.`exp_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `potato`.`exp_data` (
  `id` INT NOT NULL,
  `experiment_id` INT NOT NULL,
  `wave_id` INT NOT NULL,
  `measurement` FLOAT NOT NULL,
  PRIMARY KEY (`id`, `experiment_id`, `wave_id`),
  INDEX `fk_exp_data_experiments1_idx` (`experiment_id` ASC) VISIBLE,
  INDEX `fk_exp_data_waves1_idx` (`wave_id` ASC) VISIBLE,
  CONSTRAINT `fk_exp_data_experiments1`
    FOREIGN KEY (`experiment_id`)
    REFERENCES `potato`.`experiments` (`experiment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exp_data_waves1`
    FOREIGN KEY (`wave_id`)
    REFERENCES `potato`.`waves` (`wave_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `potato` ;

-- -----------------------------------------------------
-- Placeholder table for view `potato`.`v_experiment_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `potato`.`v_experiment_data` (`id` INT, `experiment_id` INT, `wave_id` INT, `potato_id` INT, `exp_description` INT, `description` INT, `color` INT, `lyambda` INT);

-- -----------------------------------------------------
-- View `potato`.`v_experiment_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `potato`.`v_experiment_data`;
USE `potato`;
CREATE  OR REPLACE VIEW `v_experiment_data` AS
  SELECT ed.id, ed.experiment_id, ed.wave_id, e.potato_id, 
         e.description as exp_description,
         p.description, p.color, w.lyambda
    FROM exp_data ed, potatos p, experiments e, waves w
    WHERE ed.wave_id = w.wave_id
      AND ed.experiment_id = e.experiment_id
      AND e.potato_id = p.potato_id;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
