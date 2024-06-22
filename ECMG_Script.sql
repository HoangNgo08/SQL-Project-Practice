
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ECMG
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ECMG` ;

-- -----------------------------------------------------
-- Schema ECMG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ECMG` DEFAULT CHARACTER SET utf8 ;
USE `ECMG` ;

-- -----------------------------------------------------
-- Table `ECMG`.`GUEST`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`GUEST` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`GUEST` (
  `GuestID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(25) NOT NULL,
  `LastName` VARCHAR(25) NOT NULL,
  `Address_Customer` VARCHAR(45) NULL,
  `MobilePhone` VARCHAR(10) NOT NULL,
  `DateOfBirth` DATE NULL,
  `DriverLicenseNo` INT NULL,
  PRIMARY KEY (`GuestID`),
  INDEX `MobilePhone` (`MobilePhone` ASC) VISIBLE,
  INDEX `LastName` (`LastName` ASC) VISIBLE,
  UNIQUE INDEX `DriverLicenseNo_UNIQUE` (`DriverLicenseNo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`MOTEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`MOTEL` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`MOTEL` (
  `MotelID` INT NOT NULL AUTO_INCREMENT,
  `MotelName` VARCHAR(45) NOT NULL,
  `Address_Motel` VARCHAR(45) NOT NULL,
  `Telephone` INT NOT NULL,
  PRIMARY KEY (`MotelID`),
  INDEX `MotelName` (`MotelName` ASC) VISIBLE,
  UNIQUE INDEX `Telephone_UNIQUE` (`Telephone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`ROOMTYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`ROOMTYPE` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`ROOMTYPE` (
  `TypeID` INT NOT NULL AUTO_INCREMENT,
  `TypeDescription` VARCHAR(25) NOT NULL,
  `PricePerNight` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`TypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`ROOM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`ROOM` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`ROOM` (
  `RoomID` INT NOT NULL AUTO_INCREMENT,
  `MaxNumofAccom` INT NOT NULL,
  `NumOfBed` INT NOT NULL,
  `MotelID` INT NOT NULL,
  `TypeID` INT NOT NULL,
  PRIMARY KEY (`RoomID`),
  INDEX `MotelID_idx` (`MotelID` ASC) VISIBLE,
  INDEX `TypeID_idx` (`TypeID` ASC) VISIBLE,
  CONSTRAINT `MotelID1`
    FOREIGN KEY (`MotelID`)
    REFERENCES `ECMG`.`MOTEL` (`MotelID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TypeID1`
    FOREIGN KEY (`TypeID`)
    REFERENCES `ECMG`.`ROOMTYPE` (`TypeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`BOOKING`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`BOOKING` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`BOOKING` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL, 
  CHECK (EndDate>StartDate),
  `NumOfPeople` INT NOT NULL,
  `TotalCharge` DECIMAL(10,2) NULL,
  `Status` VARCHAR(45) NULL,
  `RoomID` INT NOT NULL,
  `GuestID` INT NOT NULL,
  PRIMARY KEY (`BookingID`), 
  INDEX `RoomID_Booking_idx` (`RoomID` ASC) VISIBLE,
  INDEX `GuestID_Booking_idx` (`GuestID` ASC) VISIBLE,
  CONSTRAINT `RoomID1`
    FOREIGN KEY (`RoomID`)
    REFERENCES `ECMG`.`ROOM` (`RoomID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GuestID1`
    FOREIGN KEY (`GuestID`)
    REFERENCES `ECMG`.`GUEST` (`GuestID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`EMPLOYEE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`EMPLOYEE` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`EMPLOYEE` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName_Emp` VARCHAR(25) NOT NULL,
  `LastName_Emp` VARCHAR(25) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `Gender` VARCHAR(25) NULL,
  `StaffType` VARCHAR(25) NOT NULL,
  `MotelID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `MotelID_idx` (`MotelID` ASC) VISIBLE,
  INDEX `LastName_Emp` (`LastName_Emp` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  CONSTRAINT `MotelID2`
    FOREIGN KEY (`MotelID`)
    REFERENCES `ECMG`.`MOTEL` (`MotelID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`DIGITALMEDIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`DIGITALMEDIA` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`DIGITALMEDIA` (
  `MediaID` INT NOT NULL AUTO_INCREMENT,
  `MediaName` VARCHAR(45) NOT NULL,
  `WebAddress` VARCHAR(255) NULL,
  `Phone_Media` VARCHAR(13) NOT NULL,
  `ContactPerson` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MediaID`),
  INDEX `MediaName` (`MediaName` ASC) VISIBLE,
  UNIQUE INDEX `Phone_Media_UNIQUE` (`Phone_Media` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`ADVERTISEMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`ADVERTISEMENT` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`ADVERTISEMENT` (
  `AdvertisementID` INT NOT NULL AUTO_INCREMENT,
  `AdvertisedDate` DATE NOT NULL,
  `Cost` DECIMAL(10,2) NULL,
  `MediaID` INT NOT NULL,
  `MotelID` INT NOT NULL,
  PRIMARY KEY (`AdvertisementID`),
  INDEX `MediaID_idx` (`MediaID` ASC) VISIBLE,
  CONSTRAINT `MediaID1`
    FOREIGN KEY (`MediaID`)
    REFERENCES `ECMG`.`DIGITALMEDIA` (`MediaID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MotelID3`
    FOREIGN KEY (`MotelID`)
    REFERENCES `ECMG`.`MOTEL` (`MotelID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`MANAGER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`MANAGER` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`MANAGER` (
  `StaffID` INT NOT NULL,
  `Qualification` VARCHAR(100) NOT NULL,
  `YearOfExperience` FLOAT NOT NULL,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `StaffID1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ECMG`.`EMPLOYEE` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`CONTRACTOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`CONTRACTOR` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`CONTRACTOR` (
  `StaffID` INT NOT NULL,
  `TradeLicenseNo` INT NOT NULL,
  `SkillDescription` VARCHAR(100) NULL,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `StaffID2`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ECMG`.`EMPLOYEE` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`ADMIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`ADMIN` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`ADMIN` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `AnualSalary` INT NULL,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `StaffID3`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ECMG`.`EMPLOYEE` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECMG`.`REPAIRJOB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECMG`.`REPAIRJOB` ;

CREATE TABLE IF NOT EXISTS `ECMG`.`REPAIRJOB` (
  `JobID` INT NOT NULL AUTO_INCREMENT,
  `CompletionDate` DATE NULL,
  `LabourCost` DECIMAL(10,2) NULL,
  `MaterialCost` DECIMAL(10,2) NULL,
  `JobDesctiption` VARCHAR(255) NOT NULL,
  `RoomID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`JobID`),
  INDEX `RoomID_idx` (`RoomID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `RoomID2`
    FOREIGN KEY (`RoomID`)
    REFERENCES `ECMG`.`ROOM` (`RoomID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StaffID4`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ECMG`.`EMPLOYEE` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT DATA INTO TABLEs

-- INSERT GUEST
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (1,'Micky ','Mouse','1 Disneyland','0412229282','1998-05-24',1234567);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (2,'Minnie','Mouse','2 Disneyland','0412928123','1998-12-01',1234566);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (4,'Tinker ','Bell','52 Neverland','0492212322','1981-03-19',1112332);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (5,'Peter ','Pan','75 Neverland','0427232713','1973-09-02',1232123);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (6,'Homer','Simpson','12 Arekia  WA 3099','0493423123',NULL,1823123);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (7,'Bart','Simpson','72 Kingston ACT 2054','0427231723','2000-10-15',1232118);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (8,'Captain ','Hook','195 Sussex Street NSW 1037','0412328122','1994-02-02',1231232);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (9,'Wendy','Darling','100 Lamington Avenue VIC 3075','0421312212','1988-07-09',1857232);
INSERT INTO `GUEST` (`GuestID`,`FirstName`,`LastName`,`Address_Customer`,`MobilePhone`,`DateOfBirth`,`DriverLicenseNo`) VALUES (10,'John','Darling','05 Hamchester Street VIC 3022','0423125234','1985-10-21',1898323);

-- INSERT MOTEL
INSERT INTO `MOTEL` (`MotelID`,`MotelName`,`Address_Motel`,`Telephone`) VALUES (101,'ECMG Melbourne','1 Address VIC ',311292321);
INSERT INTO `MOTEL` (`MotelID`,`MotelName`,`Address_Motel`,`Telephone`) VALUES (102,'ECMG Sydney','10 Darwin Street NSW',323123221);
INSERT INTO `MOTEL` (`MotelID`,`MotelName`,`Address_Motel`,`Telephone`) VALUES (103,'ECMG Perth','25 Carrington Street WA',312312897);
INSERT INTO `MOTEL` (`MotelID`,`MotelName`,`Address_Motel`,`Telephone`) VALUES (104,'ECMG Canberra','105 Nungara Street ACT',372712322);
INSERT INTO `MOTEL` (`MotelID`,`MotelName`,`Address_Motel`,`Telephone`) VALUES (105,'ECMG Brisbane','59 Carl Street QLC',382212322);

-- INSERT ROOMTYPE
INSERT INTO `ROOMTYPE` (`TypeID`,`TypeDescription`,`PricePerNight`) VALUES (1,'Standard Room',50.00);
INSERT INTO `ROOMTYPE` (`TypeID`,`TypeDescription`,`PricePerNight`) VALUES (2,'Superior Room',75.00);
INSERT INTO `ROOMTYPE` (`TypeID`,`TypeDescription`,`PricePerNight`) VALUES (3,'Deluxe Room',100.00);
INSERT INTO `ROOMTYPE` (`TypeID`,`TypeDescription`,`PricePerNight`) VALUES (4,'Deluxe Executive Room',225.00);


-- INSERT ROOM
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (101,2,1,101,1);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (102,4,2,101,2);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (103,6,3,101,3);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (104,8,4,101,4);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (105,2,1,102,1);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (106,4,2,102,2);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (107,6,3,102,3);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (108,8,4,102,4);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (109,2,1,103,1);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (110,4,2,103,2);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (111,6,3,103,3);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (112,8,4,103,4);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (113,2,1,104,1);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (114,4,2,104,2);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (115,6,3,104,3);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (116,8,4,104,4);
INSERT INTO `ROOM` (`RoomID`,`MaxNumofAccom`,`NumOfBed`,`MotelID`,`TypeID`) VALUES (117,8,4,104,4);

-- INSERT BOOKING
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1001,'2022-01-03','2022-01-05',1,115.00,NULL,101,1);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1002,'2022-01-04','2022-01-05',2,50.00,NULL,105,5);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1003,'2022-01-06','2022-01-10',2,225.00,NULL,102,6);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1004,'2022-01-12','2022-01-15',4,365.75,NULL,103,9);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1005,'2022-01-21','2022-01-24',2,300.00,NULL,110,2);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1006,'2022-01-29','2022-02-02',4,943.32,NULL,104,2);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1007,'2022-02-12','2022-02-19',1,312.87,NULL,105,5);
INSERT INTO `BOOKING` (`BookingID`,`StartDate`,`EndDate`,`NumOfPeople`,`TotalCharge`,`Status`,`RoomID`,`GuestID`) VALUES (1008,'2022-02-15','2022-02-19',2,200.00,NULL,101,2);


-- INSERT EMPLOYEE
INSERT INTO `EMPLOYEE` (`StaffID`,`FirstName_Emp`,`LastName_Emp`,`Address`,`Phone`,`Gender`,`StaffType`,`MotelID`) VALUES (101,'Peter','Parker','10 Oxford Streeet VIC 2025','0412392132','F','M',101);
INSERT INTO `EMPLOYEE` (`StaffID`,`FirstName_Emp`,`LastName_Emp`,`Address`,`Phone`,`Gender`,`StaffType`,`MotelID`) VALUES (102,'Flash','Thompson','25 Lamfield Avenue NSW 1075','0483412323','M','M',102);
INSERT INTO `EMPLOYEE` (`StaffID`,`FirstName_Emp`,`LastName_Emp`,`Address`,`Phone`,`Gender`,`StaffType`,`MotelID`) VALUES (103,'Mary','Janes','30 Flingwood Street WA 2285','0487489754','M','M',103);
INSERT INTO `EMPLOYEE` (`StaffID`,`FirstName_Emp`,`LastName_Emp`,`Address`,`Phone`,`Gender`,`StaffType`,`MotelID`) VALUES (104,'Harry','Osborn','41 Sunnycoast Street ACT 1305','0484787213',NULL,'M',104);



-- -------------------------------------------------------------------------------------------
-- Store Procedure

USE `ECMG`;
DROP procedure IF EXISTS `GetBookingInfo`;

DELIMITER $$
USE `ECMG`$$
CREATE PROCEDURE `GetBookingInfo` ()
BEGIN
SELECT FirstName, LastName, Booking.BookingID, StartDate, EndDate, Booking.RoomID, MotelName
FROM BOOKING
INNER JOIN GUEST ON Booking.GuestID = Guest.GuestID
INNER JOIN ROOM ON Booking.RoomID = Room.RoomID
INNER JOIN MOTEL ON Room.MotelID = Motel.MotelID;
END$$

DELIMITER ;





