SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_quiz_vs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_quiz_vs` ;
CREATE SCHEMA IF NOT EXISTS `db_quiz_vs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_quiz_vs` ;

-- -----------------------------------------------------
-- Table `db_quiz_vs`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`user` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id des User',
  `uname` VARCHAR(70) NOT NULL COMMENT 'Nutzername. Jeder Nutzername darf nur einmal vergeben sein.' /* comment truncated */ /*Ein Nutzername hat max. 70 Zeichen*/,
  `pwd` VARCHAR(128) NOT NULL COMMENT 'Passwort.' /* comment truncated */ /*In verschlüsselter Form 128 Zeichen*/,
  `description` VARCHAR(500) NULL COMMENT 'Beschreibung des Nutzers.' /* comment truncated */ /*Diese soll bei der Quizanzeige zu sehen sein.
Maximal 500 Zeichen*/,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uname_UNIQUE` (`uname` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_quiz_vs`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`category` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL COMMENT 'Name einer Kategorie.' /* comment truncated */ /*Eine Kategorie hat maximal 100 Zeichen.*/,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_quiz_vs`.`Quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`Quiz` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`Quiz` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id des Quiz',
  `name` VARCHAR(100) NOT NULL COMMENT 'Anzeigename vom Quiz.' /* comment truncated */ /*Maximal 100 Zeichen*/,
  `description` VARCHAR(500) NOT NULL COMMENT 'Beschreibung vom Quiz.' /* comment truncated */ /*Maximal 500 Zeichen*/,
  `user_iduser` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Quiz_user_idx` (`user_iduser` ASC),
  INDEX `fk_Quiz_category1_idx` (`category_idcategory` ASC),
  CONSTRAINT `fk_Quiz_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `db_quiz_vs`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quiz_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `db_quiz_vs`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_quiz_vs`.`Question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`Question` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`Question` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Id der Frage',
  `text` VARCHAR(500) NULL COMMENT 'Fragentext.' /* comment truncated */ /*Maximal 500 Zeichen*/,
  `Quiz_idQuiz` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Question_Quiz1_idx` (`Quiz_idQuiz` ASC),
  CONSTRAINT `fk_Question_Quiz1`
    FOREIGN KEY (`Quiz_idQuiz`)
    REFERENCES `db_quiz_vs`.`Quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_quiz_vs`.`Answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`Answer` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`Answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(100) NULL COMMENT 'Inhalt der Antwort. ' /* comment truncated */ /*Maximal 100 Zeichen*/,
  `Question_idQuestion` INT NOT NULL,
  `is_correct` TINYINT(1) NOT NULL COMMENT 'Prüft ob Antwort korrekt ist',
  PRIMARY KEY (`id`),
  INDEX `fk_Answer_Question1_idx` (`Question_idQuestion` ASC),
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`Question_idQuestion`)
    REFERENCES `db_quiz_vs`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_quiz_vs`.`sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_quiz_vs`.`sessions` ;

CREATE TABLE IF NOT EXISTS `db_quiz_vs`.`sessions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(64) NOT NULL COMMENT 'Token for User Identification.' /* comment truncated */ /*Maximal 200 Zeichen*/,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sessions_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_sessions_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `db_quiz_vs`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
