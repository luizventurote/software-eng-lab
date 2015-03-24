CREATE SCHEMA IF NOT EXISTS `db-sales-system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db-sales-system` ;

-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_Customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone` VARCHAR(15) NULL,
  `address` VARCHAR(150) NULL,
  `cnpj` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(300) NULL,
  `stock_qty` INT NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `permission` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_StockEntries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_StockEntries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `User_resp_id` INT NOT NULL,
  `Product_id` INT NOT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sys_StockEntries_sys_user1_idx` (`User_resp_id` ASC),
  INDEX `fk_sys_StockEntries_sys_Product1_idx` (`Product_id` ASC),
  CONSTRAINT `fk_sys_StockEntries_sys_user1`
    FOREIGN KEY (`User_resp_id`)
    REFERENCES `db-sales-system`.`sys_User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_StockEntries_sys_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `db-sales-system`.`sys_Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_Order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` VARCHAR(45) NULL,
  `payment_period` INT NULL,
  `total_value` FLOAT NULL,
  `total_qty` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`Product_Order_Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`Product_Order_Item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qty` VARCHAR(45) NULL,
  `sys_Product_id` INT NOT NULL,
  `sys_Order_id` INT NOT NULL,
  PRIMARY KEY (`id`, `sys_Product_id`, `sys_Order_id`),
  INDEX `fk_sys_Product_has_sys_Order_sys_Order1_idx` (`sys_Order_id` ASC),
  INDEX `fk_sys_Product_has_sys_Order_sys_Product1_idx` (`sys_Product_id` ASC),
  CONSTRAINT `fk_sys_Product_has_sys_Order_sys_Product1`
    FOREIGN KEY (`sys_Product_id`)
    REFERENCES `db-sales-system`.`sys_Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_Product_has_sys_Order_sys_Order1`
    FOREIGN KEY (`sys_Order_id`)
    REFERENCES `db-sales-system`.`sys_Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_Invoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `invoice_code` INT NULL,
  `invoice_date` VARCHAR(45) NULL,
  `Order_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Order_id`),
  INDEX `fk_sys_Invoice_sys_Order1_idx` (`Order_id` ASC),
  CONSTRAINT `fk_sys_Invoice_sys_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `db-sales-system`.`sys_Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-sales-system`.`sys_Receivable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-sales-system`.`sys_Receivable` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Customer_id` INT NOT NULL,
  `Invoice_id` INT NOT NULL,
  `expiration` INT NULL,
  `value` FLOAT NULL,
  `terminate_code` INT NULL,
  `terminate_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `Customer_id`, `Invoice_id`),
  INDEX `fk_sys_Receivable_sys_Customer1_idx` (`Customer_id` ASC),
  INDEX `fk_sys_Receivable_sys_Invoice1_idx` (`Invoice_id` ASC),
  CONSTRAINT `fk_sys_Receivable_sys_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `db-sales-system`.`sys_Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_Receivable_sys_Invoice1`
    FOREIGN KEY (`Invoice_id`)
    REFERENCES `db-sales-system`.`sys_Invoice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;