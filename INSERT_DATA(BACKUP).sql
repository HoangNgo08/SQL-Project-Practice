
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

