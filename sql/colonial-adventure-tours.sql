create database ColonialAdventureTours;
use ColonialAdventureTours;
CREATE TABLE ADVENTURE_TRIP (
TRIP_ID DECIMAL (3,0),
TRIP_NAME VARCHAR (75),
START_LOCATION CHAR(50),
STATE CHAR(2),
DISTANCE INT(4),
MAX_GRP_SIZE INT(4), 
TYPE CHAR(20),
SEASON CHAR(20),
CONSTRAINT advTrip_tripID_pk PRIMARY KEY (TRIP_ID) );

describe ADVENTURE_TRIP;
insert into ADVENTURE_TRIP (TRIP_ID, TRIP_NAME, START_LOCATION, STATE, DISTANCE, MAX_GRP_SIZE, TYPE, SEASON)
VALUES (45, 'Jay Peak', 'Jay', 'VT', 8, 8, 'Hiking' , 'Summer');
SELECT * FROM ADVENTURE_TRIP;


use colonialadventuretours;
CREATE TABLE GUIDE (
GUIDE_NUM CHAR(4),
LAST_NAME CHAR(15),
FIRST_NAME CHAR(15),
ADDRESS CHAR(25),
CITY CHAR(25),
STATE CHAR(2),
POSTAL_CODE CHAR(5),
PHONE_NUM CHAR(12),
HIRE_DATE DATE,
CONSTRAINT Guide_Guide_num_pk PRIMARY KEY (GUIDE_NUM)
);

Use colonialadventuretours;

CREATE TABLE CUSTOMER (
    CUSTOMER_NUM CHAR(4),
    LAST_NAME CHAR(30),
    FIRST_NAME CHAR(30),
    ADDRESS CHAR(35),
    CITY CHAR(35),
    STATE CHAR(2),
    POSTAL_CODE CHAR(5),
    PHONE CHAR(12),
    CONSTRAINT Table_Table_num_pk PRIMARY KEY (CUSTOMER_NUM)
);

Use colonialadventuretours;

CREATE TABLE RESERVATION
(RESERVATION_ID CHAR(7),
TRIP_ID DECIMAL(3,0),
TRIP_DATE DATE,
NUM_PERSONS DECIMAL(3,0),
TRIP_PRICE DECIMAL(6,2),
OTHER_FEES DECIMAL(6,2),
CUSTOMER_NUM CHAR(4) );

Use colonialadventuretours;

CREATE TABLE TRIP
(TRIP_ID DECIMAL(3,0),
TRIP_NAME CHAR(75),
START_LOCATION CHAR(50),
STATE CHAR(2),
DISTANCE DECIMAL(4,0),
MAX_GRP_SIZE DECIMAL(4,0),
TYPE CHAR(20),
SEASON CHAR(20) );

Use colonialadventuretours;

CREATE TABLE TRIP_GUIDES
(TRIP_ID DECIMAL(3,0),
GUIDE_NUM CHAR(4));

INSERT INTO GUIDE
VALUES
('AM01','Abrams','Miles','54 Quest Ave.','Williamsburg','MA','01096','617-555-6032','2012-6-3');

INSERT INTO GUIDE
VALUES
('BR01','Boyers','Rita','140 Oakton Rd.','Jaffrey','NH','03452','603-555-2134','2012-3-4');

INSERT INTO GUIDE
VALUES
('DH01','Devon','Harley','25 Old Ranch Rd.','Sunderland','MA','01375','781-555-7767','2012-1-8');

INSERT INTO GUIDE
VALUES
('GZ01','Gregory','Zach','7 Moose Head Rd.','Dummer','NH','03588','603-555-8765','2012-11-4');

INSERT INTO GUIDE
VALUES
('KS01','Kiley','Susan','943 Oakton Rd.','Jaffrey','NH','03452','603-555-1230','2013-4-8');

INSERT INTO GUIDE
VALUES
('KS02','Kelly','Sam','9 Congaree Ave.','Fraconia','NH','03580','603-555-0003','2013-6-10');

INSERT INTO GUIDE
VALUES
('MR01','Marston','Ray','24 Shenandoah Rd.','Springfield','MA','01101','781-555-2323','2015-9-14');

INSERT INTO GUIDE
VALUES
('RH01','Rowan','Hal','12 Heather Rd.','Mount Desert','ME','04660','207-555-9009','2014-6-2');

INSERT INTO GUIDE
VALUES
('SL01','Stevens','Lori','15 Riverton Rd.','Coventry','VT','05825','802-555-3339','2014-9-5-');

INSERT INTO GUIDE
VALUES
('UG01','Unser','Glory','342 Pineview St.','Danbury','CT','06810','203-555-8534','2015-2-2');

INSERT INTO CUSTOMER
VALUES
('101','Northfold','Liam','9 Old Mill Rd.','Londonderry','NH','03053','603-555-7563');

INSERT INTO CUSTOMER
VALUES
('102','Ocean','Arnold','2332 South St. Apt 3','Springfield','MA','01101','413-555-3212');

INSERT INTO CUSTOMER
VALUES
('103','Kasuma','Sujata','132 Main St. #1','East Hartford','CT','06108','860-555-0703');

INSERT INTO CUSTOMER
VALUES
('104','Goff','Ryan','164A South Bend Rd.','Lowell','MA','01854','781-555-8423');

INSERT INTO CUSTOMER
VALUES
('105','McLean','Kyle','345 Lower Ave.','Wolcott','NY','14590','585-555-5321');

INSERT INTO CUSTOMER
VALUES
('106','Morontoia','Joseph','156 Scholar St.','Johnston','RI','02919','401-555-4848');

INSERT INTO CUSTOMER
VALUES
('107','Marchand','Quinn','76 Cross Rd.','Bath','NH','03740','603-555-0456');

INSERT INTO CUSTOMER
VALUES
('108','Rulf','Uschi','32 Sheep Stop St.','Edinboro','PA','16412','814-555-5521');

INSERT INTO CUSTOMER
VALUES
('109','Caron','Jean Luc','10 Greenfield St.','Rome','ME','04963','207-555-9643');

INSERT INTO CUSTOMER
VALUES
('110','Bers','Martha','65 Granite St.','York','NY','14592','585-555-0111');

INSERT INTO CUSTOMER
VALUES
('112','Jones','Laura','373 Highland Ave.','Somerville','MA','02143','857-555-6258');

INSERT INTO CUSTOMER
VALUES
('115','Vaccari','Adam','1282 Ocean Walk','Ocean CITY','NJ','08226','609-555-5231');

INSERT INTO CUSTOMER
VALUES
('116','Murakami','Iris','7 Cherry Blossom St.','Weymouth','MA','02188','617-555-6665');

INSERT INTO CUSTOMER
VALUES
('119','Chau','Clement','18 Ark Ledge Ln.','Londonderry','VT','05148','802-555-3096');

INSERT INTO CUSTOMER
VALUES
('120','Gernowski','Sadie','24 Stump Rd.','Athens','ME','04912','207-555-4507');

INSERT INTO CUSTOMER
VALUES
('121','Bretton-Borak','Siam','10 Old Main St.','Cambridge','VT','05444','802-555-3443');

INSERT INTO CUSTOMER
VALUES
('122','Hefferson','Orlagh','132 South St. Apt 27','Manchester','NH','03101','603-555-3476');

INSERT INTO CUSTOMER
VALUES
('123','Barnett','Larry','25 Stag Rd.','Fairfield','CT','06824','860-555-9876');

INSERT INTO CUSTOMER
VALUES
('124','Busa','Karen','12 Foster St.','South Windsor','CT','06074','857-555-5532');

INSERT INTO CUSTOMER
VALUES
('125','Peterson','Becca','51 Fredrick St.','Albion','NY','14411','585-555-0900');

INSERT INTO CUSTOMER
VALUES
('126','Brown','Brianne','154 Central St.','Vernon','CT','06066','860-555-3234');

INSERT INTO RESERVATION
VALUES
('1600001',40,'2016-3-26',2,55.00,0.00,'101');

INSERT INTO RESERVATION
VALUES
('1600002',21,'2016-6-8',2,95.00,0.00,'101');

INSERT INTO RESERVATION
VALUES
('1600003',28,'2016-9-12',1,35.00,0.00,'103');

INSERT INTO RESERVATION
VALUES
('1600004',26,'2016-10-16',4,45.00,15.00,'104');

INSERT INTO RESERVATION
VALUES
('1600005',39,'2016-6-25',5,55.00,0.00,'105');

INSERT INTO RESERVATION
VALUES
('1600006',32,'2016-6-18',1,80.00,20.00,'106');

INSERT INTO RESERVATION
VALUES
('1600007',22,'2016-7-9',8,75.00,10.00,'107');

INSERT INTO RESERVATION
VALUES
('1600008',28,'2016-9-12',2,35.00,0.00,'108');

INSERT INTO RESERVATION
VALUES
('1600009',38,'2016-9-11',2,90.00,40.00,'109');

INSERT INTO RESERVATION
VALUES
('1600010',2,'2016-5-14',3,25.00,0.00,'102');

INSERT INTO RESERVATION
VALUES
('1600011',3,'2016-9-15',3,25.00,0.00,'102');
INSERT INTO RESERVATION
VALUES
('1600012',1,'2016-6-12',4,15.00,0.00,'115');
INSERT INTO RESERVATION
VALUES
('1600013',8,'2016-7-9',1,20.00,5.00,'116');
INSERT INTO RESERVATION
VALUES
('1600014',12,'2016-10-1',2,40.00,5.00,'119');
INSERT INTO RESERVATION
VALUES
('1600015',10,'2016-7-23',1,20.00,0.00,'120');
INSERT INTO RESERVATION
VALUES
('1600016',11,'2016-7-23',6,75.00,15.00,'121');
INSERT INTO RESERVATION
VALUES
('1600017',39,'2016-6-18',3,20.00,5.00,'122');
INSERT INTO RESERVATION
VALUES
('1600018',38,'2016-9-18',4,85.00,15.00,'126');
INSERT INTO RESERVATION
VALUES
('1600019',25,'2016-8-29',2,110.00,25.00,'124');
INSERT INTO RESERVATION
VALUES
('1600020',28,'2016-8-27',2,35.00,10.00,'124');
INSERT INTO RESERVATION
VALUES
('1600021',32,'2016-6-11',3,90.00,20.00,'112');
INSERT INTO RESERVATION
VALUES
('1600022',21,'2016-6-8',1,95.00,25.00,'119');
INSERT INTO RESERVATION
VALUES
('1600024',38,'2016-9-11',1,70.00,30.00,'121');
INSERT INTO RESERVATION
VALUES
('1600025',38,'2016-9-11',2,70.00,45.00,'125');
INSERT INTO RESERVATION
VALUES
('1600026',12,'2016-10-1',2,40.00,0.00,'126');
INSERT INTO RESERVATION
VALUES
('1600029',4,'2016-9-19',4,105.00,25.00,'120');
INSERT INTO RESERVATION
VALUES
('1600030',15,'2016-7-25',6,60.00,15.00,'104');

INSERT INTO TRIP
VALUES
(1,'Arethusa Falls ','Harts Location','NH',5,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(2,'Mt Ascutney - North Peak','Weathersfield','VT',5,6,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(3,'Mt Ascutney - West Peak','Weathersfield','VT',6,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(4,'Bradbury Mountain Ride','Lewiston-Auburn','ME',25,8,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(5,'Baldpate Mountain ','North Newry','ME',6,10,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(6,'Blueberry Mountain','Batchelders Grant','ME',8,8,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(7,'Bloomfield - Maidstone','Bloomfield','CT',10,6,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(8,'Black Pond','Lincoln','NH',8,12,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(9,'Big Rock Cave','Tamworth','NH',6,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(10,'Mt. Cardigan - Firescrew','Orange','NH',7,8,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(11,'Chocorua Lake Tour','Tamworth','NH',12,15,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(12,'Cadillac Mountain Ride','Bar Harbor','ME',8,16,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(13,'Cadillac Mountain','Bar Harbor','ME',7,8,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(14,'Cannon Mtn','Franconia','NH',6,6,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(15,'Crawford Path Presidentials Hike','Crawford Notch','NH',16,4,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(16,'Cherry Pond','Whitefield','NH',6,16,'Hiking','Spring');
INSERT INTO TRIP
VALUES
(17,'Huguenot Head Hike','Bar Harbor','ME',5,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(18,'Low Bald Spot Hike','Pinkam Notch','NH',8,6,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(19,'Mason''s Farm ','North Stratford','CT',12,7,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(20,'Lake Mephremagog Tour','Newport','VT',8,15,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(21,'Long Pond','Rutland','MA',8,12,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(22,'Long Pond Tour','Greenville','ME',12,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(23,'Lower Pond Tour','Poland','ME',8,15,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(24,'Mt Adams ','Randolph','NH',9,6,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(25,'Mount Battie Ride','Camden','ME',20,8,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(26,'Mount Cardigan Hike','Cardigan','NH',4,16,'Hiking','Late Fall');
INSERT INTO TRIP
VALUES
(27,'Mt. Chocorua','Albany','NH',6,10,'Hiking','Spring');
INSERT INTO TRIP
VALUES
(28,'Mount Garfield Hike','Woodstock','NH',5,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(29,'Metacomet-Monadnock Trail Hike','Pelham','MA',10,12,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(30,'McLennan Reservation Hike','Tyringham','MA',6,16,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(31,'Missisquoi River - VT','Lowell','VT',12,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(32,'Northern Forest Canoe Trail','Stark','NH',15,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(33,'Park Loop Ride','Mount Desert Island','ME',27,8,'Biking','Late Spring');
INSERT INTO TRIP
VALUES
(34,'Pontook Reservoir Tour','Dummer','NH',15,14,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(35,'Pisgah STATE Park Ride','Northborough','NH',12,10,'Biking','Summer');
INSERT INTO TRIP
VALUES
(36,'Pondicherry Trail Ride','White Mountains','NH',15,16,'Biking','Late Spring');
INSERT INTO TRIP
VALUES
(37,'Seal Beach Harbor','Bar Harbor','ME',5,16,'Hiking','Early Spring');
INSERT INTO TRIP
VALUES
(38,'Sawyer River Ride','Mount Carrigain','NH',10,18,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(39,'Welch and Dickey Mountains Hike','Thorton','NH',5,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(40,'Wachusett Mountain','Princeton','MA',8,8,'Hiking','Early Spring');
INSERT INTO TRIP
VALUES
(41,'Westfield River Loop','Fort Fairfield','ME',20,10,'Biking','Late Spring');

show tables;

INSERT INTO TRIP
VALUES
(1,'Arethusa Falls ','Harts Location','NH',5,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(2,'Mt Ascutney - North Peak','Weathersfield','VT',5,6,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(3,'Mt Ascutney - West Peak','Weathersfield','VT',6,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(4,'Bradbury Mountain Ride','Lewiston-Auburn','ME',25,8,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(5,'Baldpate Mountain ','North Newry','ME',6,10,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(6,'Blueberry Mountain','Batchelders Grant','ME',8,8,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(7,'Bloomfield - Maidstone','Bloomfield','CT',10,6,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(8,'Black Pond','Lincoln','NH',8,12,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(9,'Big Rock Cave','Tamworth','NH',6,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(10,'Mt. Cardigan - Firescrew','Orange','NH',7,8,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(11,'Chocorua Lake Tour','Tamworth','NH',12,15,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(12,'Cadillac Mountain Ride','Bar Harbor','ME',8,16,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(13,'Cadillac Mountain','Bar Harbor','ME',7,8,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(14,'Cannon Mtn','Franconia','NH',6,6,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(15,'Crawford Path Presidentials Hike','Crawford Notch','NH',16,4,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(16,'Cherry Pond','Whitefield','NH',6,16,'Hiking','Spring');
INSERT INTO TRIP
VALUES
(17,'Huguenot Head Hike','Bar Harbor','ME',5,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(18,'Low Bald Spot Hike','Pinkam Notch','NH',8,6,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(19,'Mason''s Farm ','North Stratford','CT',12,7,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(20,'Lake Mephremagog Tour','Newport','VT',8,15,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(21,'Long Pond','Rutland','MA',8,12,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(22,'Long Pond Tour','Greenville','ME',12,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(23,'Lower Pond Tour','Poland','ME',8,15,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(24,'Mt Adams ','Randolph','NH',9,6,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(25,'Mount Battie Ride','Camden','ME',20,8,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(26,'Mount Cardigan Hike','Cardigan','NH',4,16,'Hiking','Late Fall');
INSERT INTO TRIP
VALUES
(27,'Mt. Chocorua','Albany','NH',6,10,'Hiking','Spring');
INSERT INTO TRIP
VALUES
(28,'Mount Garfield Hike','Woodstock','NH',5,10,'Hiking','Early Fall');
INSERT INTO TRIP
VALUES
(29,'Metacomet-Monadnock Trail Hike','Pelham','MA',10,12,'Hiking','Late Spring');
INSERT INTO TRIP
VALUES
(30,'McLennan Reservation Hike','Tyringham','MA',6,16,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(31,'Missisquoi River - VT','Lowell','VT',12,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(32,'Northern Forest Canoe Trail','Stark','NH',15,10,'Paddling','Summer');
INSERT INTO TRIP
VALUES
(33,'Park Loop Ride','Mount Desert Island','ME',27,8,'Biking','Late Spring');
INSERT INTO TRIP
VALUES
(34,'Pontook Reservoir Tour','Dummer','NH',15,14,'Paddling','Late Spring');
INSERT INTO TRIP
VALUES
(35,'Pisgah STATE Park Ride','Northborough','NH',12,10,'Biking','Summer');
INSERT INTO TRIP
VALUES
(36,'Pondicherry Trail Ride','White Mountains','NH',15,16,'Biking','Late Spring');
INSERT INTO TRIP
VALUES
(37,'Seal Beach Harbor','Bar Harbor','ME',5,16,'Hiking','Early Spring');
INSERT INTO TRIP
VALUES
(38,'Sawyer River Ride','Mount Carrigain','NH',10,18,'Biking','Early Fall');
INSERT INTO TRIP
VALUES
(39,'Welch and Dickey Mountains Hike','Thorton','NH',5,10,'Hiking','Summer');
INSERT INTO TRIP
VALUES
(40,'Wachusett Mountain','Princeton','MA',8,8,'Hiking','Early Spring');
INSERT INTO TRIP
VALUES
(41,'Westfield River Loop','Fort Fairfield','ME',20,10,'Biking','Late Spring');

INSERT INTO TRIP_GUIDES
VALUES
(1,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(1,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(2,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(2,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(3,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(4,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(4,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(5,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(5,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(6,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(7,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(8,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(9,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(10,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(12,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(13,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(14,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(15,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(16,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(17,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(18,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(19,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(20,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(21,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(22,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(23,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(23,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(24,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(25,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(26,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(27,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(28,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(29,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(30,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(31,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(32,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(33,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(34,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(35,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(36,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(37,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(38,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(39,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(40,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(41,'BR01');

show tables;

INSERT INTO TRIP_GUIDES
VALUES
(1,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(1,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(2,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(2,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(3,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(4,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(4,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(5,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(5,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(6,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(7,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(8,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(9,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(10,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(11,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(12,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(13,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(14,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(15,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(16,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(17,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(18,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(19,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(20,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(21,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(22,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(23,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(23,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(24,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(25,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(26,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(27,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(28,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(29,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(30,'AM01');
INSERT INTO TRIP_GUIDES
VALUES
(31,'SL01');
INSERT INTO TRIP_GUIDES
VALUES
(32,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(33,'UG01');
INSERT INTO TRIP_GUIDES
VALUES
(34,'KS01');
INSERT INTO TRIP_GUIDES
VALUES
(35,'GZ01');
INSERT INTO TRIP_GUIDES
VALUES
(36,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(37,'RH01');
INSERT INTO TRIP_GUIDES
VALUES
(38,'KS02');
INSERT INTO TRIP_GUIDES
VALUES
(39,'BR01');
INSERT INTO TRIP_GUIDES
VALUES
(40,'DH01');
INSERT INTO TRIP_GUIDES
VALUES
(41,'BR01');


select * from trip_guides;
show tables;

SELECT CONSTRAINT_NAME, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'colonialadventuretours';

DESCRIBE customer:
DESCRIBE guide;
DESCRIBE trip;
DESCRIBE reservation;
DESCRIBE trip_guides;
#mySQL Activity 3
use colonialAdventuretours;
#query 1
CREATE TABLE PADDLING (
    Trip_ID DECIMAL(3, 0) NOT NULL,
    Trip_Name CHAR(75),
    State CHAR(2),
    Distance DECIMAL(4, 0),
    Max_GRP_Size DECIMAL(4, 0),
    Season CHAR(20),
    PRIMARY KEY (Trip_ID)
);
describe paddling;

INSERT INTO PADDLING (Trip_ID, Trip_Name, State, Distance, Max_GRP_Size, Season)
SELECT Trip_ID, Trip_Name, State, Distance, Max_GRP_Size, Season
FROM TRIP
WHERE Type = 'PADDLING';

UPDATE PADDLING
SET Max_GRP_Size = Max_GRP_Size + 2
WHERE State = 'CT';

use colonialAdventuretours;
show tables;
#query 2
UPDATE PADDLING
SET Max_GRP_Size = Max_GRP_Size + 2
WHERE State = 'CT';
#QUERY 3
INSERT INTO PADDLING (Trip_ID, Trip_Name, State, Distance, Max_GRP_Size, Season)
VALUES (43, 'Lake Champlain Tour', 'VT', 16, 12, 'Summer');

describe paddling;
#query 4
SELECT Trip_ID FROM PADDLING
Select Trip_Name from paddling
select state from paddling
select distance from paddling
select Max_GRP_Size from paddling
select season from paddling
#query 5
DELETE FROM PADDLING
WHERE Trip_ID = 23;

#query 6
UPDATE PADDLING
SET Distance = null
WHERE Trip_Name = 'Pontook Reservoir Tour';
#query 7
ALTER TABLE PADDLING
ADD COLUMN DIFFICULTY_LEVEL CHAR(3);
ALTER TABLE PADDLING
ALTER COLUMN DIFFICULTY_LEVEL SET DEFAULT 'MOD';
UPDATE PADDLING
SET DIFFICULTY_LEVEL = 'MOD';
#query 8
UPDATE PADDLING
SET DIFFICULTY_LEVEL = 'HRD'
WHERE Trip_Name = 'Lake Champlain Tour';
#query 9
ALTER TABLE PADDLING
MODIFY COLUMN SEASON VARCHAR(25);
#query 10
ALTER TABLE PADDLING
MODIFY COLUMN DIFFICULTY_LEVEL CHAR(3) NOT NULL;


select * from customer;
use colonialadventuretours;
show tables;
SELECT reservation_id, trip_id, customer_num, last_name
FROM customer, reservation 
where customer.customer_num = reservation.customer_num
order by last_name;

select reservation_id, trip_id, trip_date from reservation where trip_id in (select trip_id from trip where state = 'ME');

SELECT g.LAST_NAME, g.FIRST_NAME
FROM guide g
JOIN trip_guides tg ON g.GUIDE_NUM = tg.GUIDE_NUM
JOIN paddling p ON tg.TRIP_ID = p.TRIP_ID;

SELECT c.LAST_NAME, t.TRIP_NAME, t.START_LOCATION
FROM reservation r
JOIN customer c ON r.CUSTOMER_NUM = c.CUSTOMER_NUM
JOIN trip t ON r.TRIP_ID = t.TRIP_ID
WHERE r.TRIP_DATE = '2016-07-23';

SELECT t.TRIP_NAME
FROM trip t
JOIN trip_guides tg ON t.TRIP_ID = tg.TRIP_ID
JOIN guide g ON tg.GUIDE_NUM = g.GUIDE_NUM
WHERE t.TYPE = 'Biking'
AND g.FIRST_NAME = 'Rita'
AND g.LAST_NAME = 'Boyers';

SELECT t.TRIP_NAME
FROM trip t
JOIN trip_guides tg ON t.TRIP_ID = tg.TRIP_ID
JOIN guide g ON tg.GUIDE_NUM = g.GUIDE_NUM
WHERE g.FIRST_NAME = 'Miles'
AND g.LAST_NAME = 'Abrams';

SELECT r.RESERVATION_ID, r.TRIP_ID, r.NUM_PERSONS
FROM reservation r
JOIN customer c ON r.CUSTOMER_NUM = c.CUSTOMER_NUM
WHERE c.FIRST_NAME = 'Ryan'
AND c.LAST_NAME = 'Goff';

SELECT r.RESERVATION_ID, r.TRIP_ID, r.CUSTOMER_NUM, c.LAST_NAME
FROM reservation r
JOIN customer c ON r.CUSTOMER_NUM = c.CUSTOMER_NUM
ORDER BY c.LAST_NAME;

SELECT r.RESERVATION_ID, r.TRIP_ID, r.TRIP_DATE
FROM reservation r
WHERE EXISTS (
    SELECT 1
    FROM trip t
    WHERE t.TRIP_ID = r.TRIP_ID
    AND t.STATE = 'ME'
);

SELECT g.LAST_NAME, g.FIRST_NAME
FROM guide g
JOIN trip_guides tg ON g.GUIDE_NUM = tg.GUIDE_NUM
JOIN trip t ON tg.TRIP_ID = t.TRIP_ID
WHERE t.TYPE = 'Paddling';

SELECT g.LAST_NAME, g.FIRST_NAME
FROM guide AS g
JOIN trip_guides AS tg ON g.GUIDE_NUM = tg.GUIDE_NUM
JOIN trip AS t ON tg.TRIP_ID = t.TRIP_ID
WHERE t.TYPE = 'Paddling';

SELECT t1.TRIP_ID AS Trip_ID_1, t1.TRIP_NAME AS Trip_Name_1, 
       t2.TRIP_ID AS Trip_ID_2, t2.TRIP_NAME AS Trip_Name_2
FROM trip t1
JOIN trip t2 ON t1.START_LOCATION = t2.START_LOCATION
WHERE t1.TRIP_ID < t2.TRIP_ID;

SELECT t.TRIP_NAME
FROM reservation r
JOIN trip t ON r.TRIP_ID = t.TRIP_ID
WHERE t.TYPE = 'Hiking'
ORDER BY t.TRIP_NAME ASC;

SELECT c.CUSTOMER_NUM, c.FIRST_NAME, c.LAST_NAME
FROM customer c
LEFT JOIN reservation r ON c.CUSTOMER_NUM = r.CUSTOMER_NUM
WHERE c.STATE = 'NJ' OR r.RESERVATION_ID IS NOT NULL;

SELECT c.CUSTOMER_NUM, c.FIRST_NAME, c.LAST_NAME
FROM customer c
JOIN reservation r ON c.CUSTOMER_NUM = r.CUSTOMER_NUM
WHERE c.STATE = 'NJ';

SELECT t.TRIP_ID, t.TRIP_NAME
FROM trip t
WHERE t.MAX_GRP_SIZE > (
    SELECT MAX(t2.MAX_GRP_SIZE)
    FROM trip t2
    WHERE t2.TYPE = 'Hiking'
);

SELECT t.TRIP_ID, t.TRIP_NAME
FROM trip t
WHERE t.MAX_GRP_SIZE > (
    SELECT MAX(t2.MAX_GRP_SIZE)
    FROM trip t2
    WHERE t2.TYPE = 'Biking'
);

SELECT t.TRIP_ID, t.TRIP_NAME, r.RESERVATION_ID
FROM trip t
LEFT JOIN reservation r ON t.TRIP_ID = r.TRIP_ID
ORDER BY t.TRIP_ID;

use colonialadventuretours;
show tables;
select * from trip;

create view maine_trips as
select trip_id, trip_name, start_location, distance, max_grp_size, type, season from trip where state = 'ME';
#part b 
select trip_id, trip_name, distance from maine_trips where type = 'biking';
#part c
select trip_id, trip_name, distance from trip where type = 'biking' and state = 'ME';
#part d
#it will not create any problem because blah blah






















