create database StayWell;
use StayWell;
create table SUMMER_SCHOOL_RENTALS(
PROPERTY_ID DECIMAL(2,0) PRIMARY KEY,
OFFICE_NUMBER DECIMAL(2,0),
ADDRESS CHAR(25),
SQR_FT DECIMAL(5,0),
BDRMS DECIMAL(2,0),
FLOORS DECIMAL(2,0),
WEEKLY_RENT DECIMAL(6,2),
OWNER_NUM CHAR(5)
);
describe SUMMER_SCHOOL_RENTALS;
insert into SUMMER_SCHOOL_RENTALS (PROPERTY_ID, OFFICE_NUMBER, ADDRESS, SQR_FT, BDRMS, FLOORS, WEEKLY_RENT, OWNER_NUM)
VALUES (13, 1, '5867 Goodwin Ave', 1650, 2, 1, 400.00, 'CO103');
drop table 
# MySQL STAYWELL SCHEMA
# Create OWNER table
CREATE TABLE OWNER (
    OWNER_NUM CHAR(5) PRIMARY KEY NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);
# Create PROPERTY table  
CREATE TABLE PROPERTY (
    PROPERTY_ID SMALLINT PRIMARY KEY NOT NULL,
    OFFICE_NUM TINYINT NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    SQR_FT SMALLINT NOT NULL,
    BDRMS TINYINT NOT NULL,
    FLOORS TINYINT NOT NULL,
    MONTHLY_RENT SMALLINT,
    OWNER_NUM CHAR(5) NOT NULL,
    FOREIGN KEY (OWNER_NUM) REFERENCES OWNER(OWNER_NUM),
    FOREIGN KEY (OFFICE_NUM) REFERENCES OFFICE(OFFICE_NUM)
);

# Create OFFICE table
CREATE TABLE OFFICE (
    OFFICE_NUM TINYINT PRIMARY KEY NOT NULL,
    OFFICE_NAME VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);
# Create SERVICE_CATEGORY table 
CREATE TABLE SERVICE_CATEGORY (
    CATEGORY_NUM TINYINT PRIMARY KEY NOT NULL,
    CATEGORY_DESCRIPTION VARCHAR(100) NOT NULL
);

# Create SERVICE_REQUEST table  
CREATE TABLE SERVICE_REQUEST (
    SERVICE_ID SMALLINT PRIMARY KEY NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL,
    CATEGORY_NUMBER TINYINT NOT NULL,
    OFFICE_ID TINYINT NOT NULL,
    DESCRIPTION VARCHAR(200) NOT NULL,
    STATUS VARCHAR(200) NOT NULL,
    EST_HOURS TINYINT NOT NULL,
    SPENT_HOURS TINYINT NOT NULL,
    NEXT_SERVICE_DATE DATE,
    FOREIGN KEY (PROPERTY_ID) REFERENCES PROPERTY(PROPERTY_ID),
    FOREIGN KEY (CATEGORY_NUMBER) REFERENCES SERVICE_CATEGORY(CATEGORY_NUM),
	FOREIGN KEY (OFFICE_ID) REFERENCES OFFICE(OFFICE_NUM)
);


# Create RESIDENTS  table
CREATE TABLE RESIDENTS (
    RESIDENT_ID SMALLINT PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    SURNAME VARCHAR(20) NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL,
    FOREIGN KEY (PROPERTY_ID) REFERENCES PROPERTY(PROPERTY_ID)
);
show tables;
# Insert owners
INSERT INTO OWNER VALUES('MO100','Moore','Elle-May','8006 W. Newport Ave.','Reno','NV','89508');
INSERT INTO OWNER VALUES('PA101','Patel','Makesh','7337 Sheffield St.','Seattle','WA','98119');
INSERT INTO OWNER VALUES('AK102','Aksoy','Ceyda','411 Griffin Rd.','Seattle','WA','98131');
INSERT INTO OWNER VALUES('CO103','Cole','Meerab','9486 Circle Ave.','Olympia','WA','98506');
INSERT INTO OWNER VALUES('KO104','Kowalczyk','Jakub','7431 S. Bishop St.','Bellingham','WA','98226');
INSERT INTO OWNER VALUES('SI105','Sims','Haydon','527 Primrose Rd.','Portland','OR','97203');
INSERT INTO OWNER VALUES('BU106','Burke','Ernest','613 Old Pleasant St.','Twin Falls','ID','83303');
INSERT INTO OWNER VALUES('RE107','Redman','Seth','7681 Fordham St.','Seattle','WA','98119');
INSERT INTO OWNER VALUES('LO108','Lopez','Janine','9856 Pumpkin Hill Ln.','Everett','WA','98213');
INSERT INTO OWNER VALUES('BI109','Bianchi','Nicole','7990 Willow Dr.','New York','NY','10005');
INSERT INTO OWNER VALUES('JO110','Jones','Ammarah','730 Military Ave.','Seattle','WA','98126');

select * from owner;

# Insert offices 
INSERT INTO OFFICE VALUES('1','StayWell-Colombia City','1135 N. Wells Avenue','Colombia City','Seattle','WA','98118');
INSERT INTO OFFICE VALUES('2','StayWell-Georgetown','986 S. Madison Rd','Georgetown','Seattle','WA','98108');

select * from office;

# Insert properties 
INSERT INTO PROPERTY VALUES('1','1','30 West Thomas Rd.','1600','3','1',1400,'BU106');
INSERT INTO PROPERTY VALUES('2','1','782 Queen Ln.','2100','4','2',1900,'AK102');
INSERT INTO PROPERTY VALUES('3','1','9800 Sunbeam Ave.','1005','2','1',1200,'BI109');
INSERT INTO PROPERTY VALUES('4','1','105 North Illinois Rd.','1750','3','1',1650,'KO104');
INSERT INTO PROPERTY VALUES('5','1','887 Vine Rd.','1125','2','1',1160,'SI105');
INSERT INTO PROPERTY VALUES('6','1','8 Laurel Dr.','2125','4','2',2050,'MO100');
INSERT INTO PROPERTY VALUES('7','2','447 Goldfield St.','1675','3','2',1700,'CO103');
INSERT INTO PROPERTY VALUES('8','2','594 Leatherwood Dr.','2700','5','2',2750,'KO104');
INSERT INTO PROPERTY VALUES('9','2','504 Windsor Ave.','700','2','1',1050,'PA101');
INSERT INTO PROPERTY VALUES('10','2','891 Alton Dr.','1300','3','1',1600,'LO108');
INSERT INTO PROPERTY VALUES('11','2','9531 Sherwood Rd.','1075','2','1',1100,'JO110');
INSERT INTO PROPERTY VALUES('12','2','2 Bow Ridge Ave.','1400','3','2',1700,'RE107');

select * from property;
# Insert service categories
INSERT INTO SERVICE_CATEGORY VALUES('1','Plumbing');
INSERT INTO SERVICE_CATEGORY VALUES('2','Heating');
INSERT INTO SERVICE_CATEGORY VALUES('3','Painting');
INSERT INTO SERVICE_CATEGORY VALUES('4','Electrical Systems');
INSERT INTO SERVICE_CATEGORY VALUES('5','Carpentry');
INSERT INTO SERVICE_CATEGORY VALUES('6','Furniture replacement');
select * from service_category;
# Insert service requests
INSERT INTO SERVICE_REQUEST VALUES('1','11','2','2','The second bedroom upstairs is not heating up at night.','Problem has been confirmed. central heating engineer has been scheduled. ','2','1','2019-11-01');
INSERT INTO SERVICE_REQUEST VALUES('2','1','4','1','A new strip light is needed for the kitchen.','Scheduled','1','0','2019-10-2');
INSERT INTO SERVICE_REQUEST VALUES('3','6','5','1','The bathroom door does not close properly.','Service rep has confirmed issue. Scheduled to be refitted.','3','1','2019-11-09');
INSERT INTO SERVICE_REQUEST VALUES('4','2','4','1','New outlet has been requested for the first upstairs bedroom. (There is currently no outlet).','Scheduled','1','0','2019-10-02');
INSERT INTO SERVICE_REQUEST VALUES('5','8','3','2','New paint job requested for the common area (lounge). ','Open','10','0',NULL);
INSERT INTO SERVICE_REQUEST VALUES('6','4','1 ','1','Shower is dripping when not in use.','Problem confirmed. Plumber has been scheduled.','4','2','2019-10-07');
INSERT INTO SERVICE_REQUEST VALUES('7','2','2','1','Heating unit in the entrance smells like it’s burning.','Service rep confirmed the issue to be dust in the heating unit. To be cleaned.  ','1','0','2019-10-09');
INSERT INTO SERVICE_REQUEST VALUES('8','9','1','2','Kitchen sink does not drain properly. ','Problem confirmed. Plumber scheduled.','6','2','2019-11-12');
INSERT INTO SERVICE_REQUEST VALUES('9','12','6','2','New sofa requested.','Open','2','0',NULL);
select * from service_request;

# Insert residents 
INSERT INTO RESIDENTS VALUES('1','Albie ','O’Ryan','1');
INSERT INTO RESIDENTS VALUES('2','Tariq ','Khan','1');
INSERT INTO RESIDENTS VALUES('3','Ismail ','Salib','1');
INSERT INTO RESIDENTS VALUES('4','Callen ','Beck','2');
INSERT INTO RESIDENTS VALUES('5','Milosz ','Polansky','2');
INSERT INTO RESIDENTS VALUES('6','Ashanti ','Lucas','2');
INSERT INTO RESIDENTS VALUES('7','Randy ','Woodrue','2');
INSERT INTO RESIDENTS VALUES('8','Aislinn ','Lawrence','3');
INSERT INTO RESIDENTS VALUES('9','Monique ','French','3');
INSERT INTO RESIDENTS VALUES('10','Amara ','Dejsuwan','4');
INSERT INTO RESIDENTS VALUES('12','Rosalie ','Blackmore','4');
INSERT INTO RESIDENTS VALUES('13','Carina ','Britton','4');
INSERT INTO RESIDENTS VALUES('14','Valentino ','Ortega','5');
INSERT INTO RESIDENTS VALUES('15','Kaylem ','Kent','5');
INSERT INTO RESIDENTS VALUES('16','Alessia ','Wagner','6');
INSERT INTO RESIDENTS VALUES('17','Tyrone ','Galvan','6');
INSERT INTO RESIDENTS VALUES('18','Constance ','Fleming','6');
INSERT INTO RESIDENTS VALUES('19','Eamonn ','Bain','6');
INSERT INTO RESIDENTS VALUES('20','Misbah ','Yacob','7');
INSERT INTO RESIDENTS VALUES('21','Gianluca ','Esposito','7');
INSERT INTO RESIDENTS VALUES('22','Elinor ','Lake','7');
INSERT INTO RESIDENTS VALUES('23','Ray ','Rosas','8');
INSERT INTO RESIDENTS VALUES('24','Damon ','Caldwell','8');
INSERT INTO RESIDENTS VALUES('25','Dawood ','Busby','8');
INSERT INTO RESIDENTS VALUES('26','Dora ','Harris','8');
INSERT INTO RESIDENTS VALUES('27','Leroy ','Stokes','8');
INSERT INTO RESIDENTS VALUES('28','Tamia ','Hess','9');
INSERT INTO RESIDENTS VALUES('29','Amelia ','Sanders','9');
INSERT INTO RESIDENTS VALUES('30','Zarah ','Byers','10');
INSERT INTO RESIDENTS VALUES('31','Sara ','Farrow','10');
INSERT INTO RESIDENTS VALUES('32','Delilah ','Roy','10');
INSERT INTO RESIDENTS VALUES('33','Dougie ','McDaniel','11');
INSERT INTO RESIDENTS VALUES('34','Tahir ','Halabi','11');
INSERT INTO RESIDENTS VALUES('35','Mila ','Zhikin','12');
INSERT INTO RESIDENTS VALUES('36','Glenn ','Donovan','12');
INSERT INTO RESIDENTS VALUES('37','Zayn ','Fowler','12');
select * from residents;

SHOW TABLES;

SELECT CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'StayWell';

DESCRIBE OWNER;

DESCRIBE PROPERTY;

DESCRIBE OFFICE;

DESCRIBE SERVICE_CATEGORY;

DESCRIBE SERVICE_REQUEST;

DESCRIBE RESIDENTS;

SELECT * FROM OWNER;

SELECT * FROM PROPERTY;

SELECT * FROM OFFICE;

SELECT * FROM SERVICE_CATEGORY;

SELECT * FROM SERVICE_REQUEST;

SELECT * FROM RESIDENTS;

use staywell;
#mySQL Homework 2
SHOW TABLES;
#query 1
SELECT Owner_Num, Last_Name, First_Name
FROM Owner;
#query 2
select * from property;
#query 3
select last_name, first_name from owner where city ='Seattle';
#query 4
select last_name, first_name from owner where city !='Seattle';
#query 5
select property_id, office_num from property where sqr_ft <=1400;
#query 6
select office_num, address from property where BDRMS = 3;
#query 7
select property_id from property where BDRMS = 2 and office_num= 2;
#query 8 
select property_id from property where monthly_rent between 1350 and 1750;
#query 9
select property_id from property where office_num= 1 and monthly_rent <1500;
#query 10
select property_id, category_number, est_hours, (est_hours * 35) as ESTIMATED_COST from service_request;
#query 11
select owner_num, last_name from owner where state in ('NV', 'OR', 'ID'); 
#query 12
select office_num, property_id, sqr_ft, monthly_rent from property order by sqr_ft, monthly_rent;
#query 13
select office_num, count(*) as three_BDRMS_properties from property where BDRMS = 3 group by office_num;
#query 14
select sum(monthly_rent) as total_monthly_rent from property;
#MySQL Homework 3
use staywell;
#query 1
create table large_property (
lg_property_id int primary key,
office_num decimal (25) not null,
address varchar(25) not null,
bdrms decimal(2,0),
floors decimal (2,0),
monthly_rent decimal(6, 2),
owner_num varchar(5)
);
#query 2
insert into large_property (lg_property_id, office_num, address, bdrms, floors, monthly_rent, owner_num)
select property_id, office_num, address, bdrms, floors, monthly_rent, owner_num
from property
where sqr_ft > 1500;
select * from large_property;
describe large_property;
#query 3
update large_property
set monthly_rent = monthly_rent + 150;
select * from large_property;
#query 4
update large_property
set monthly_rent = monthly_rent * 0.99
where monthly_rent > 1750;
select * from large_property;
#query 5
insert into large_property (lg_property_id, office_num, address, bdrms, floors, monthly_rent, owner_num)
values (9, 1, '2643 lugsi dr', 3, 2, 775, 'ma111');
select * from large_property;
#query 6
delete from large_property
where owner_num = 'bi109';
#query 7
update large_property
set bdrms = null
where address = '105 north illinois rd';
#query 8
alter table large_property
add occupied char(1) default 'y';
update large_property
set occupied = 'y';
select * from large_property;
#query 9
update large_property
set occupied = 'n'
where owner_num = 'ko104';
select * from large_property;
#query 10
alter table large_property
modify monthly_rent decimal(6, 2) not null;
#query 11
drop table large_property;

use StayWell;
#query 1
SELECT 
    PROPERTY.OFFICE_NUM,
    PROPERTY.ADDRESS,
    PROPERTY.MONTHLY_RENT,
    PROPERTY.OWNER_NUM,
    OWNER.FIRST_NAME,
    OWNER.LAST_NAME
FROM 
    PROPERTY
JOIN 
    OWNER ON PROPERTY.OWNER_NUM = OWNER.OWNER_NUM;
#query 2
SELECT 
    PROPERTY_ID,
    DESCRIPTION,
    STATUS
FROM 
    SERVICE_REQUEST
WHERE 
    STATUS IN ('completed', 'open');
#query 3
SELECT 
    SERVICE_REQUEST.PROPERTY_ID,
    SERVICE_REQUEST.OFFICE_ID AS MANAGEMENT_OFFICE_NUMBER,
    PROPERTY.ADDRESS,
    SERVICE_REQUEST.EST_HOURS AS ESTIMATED_HOURS,
    SERVICE_REQUEST.SPENT_HOURS AS SPENT_HOURS,
    OWNER.OWNER_NUM,
    OWNER.LAST_NAME
FROM 
    SERVICE_REQUEST
JOIN 
    SERVICE_CATEGORY ON SERVICE_REQUEST.CATEGORY_NUMBER = SERVICE_CATEGORY.CATEGORY_NUM
JOIN 
    PROPERTY ON SERVICE_REQUEST.PROPERTY_ID = PROPERTY.PROPERTY_ID
JOIN 
    OWNER ON PROPERTY.OWNER_NUM = OWNER.OWNER_NUM
WHERE 
    SERVICE_CATEGORY.CATEGORY_DESCRIPTION = 'Furniture replacement';
#query 4
SELECT 
    OWNER.FIRST_NAME,
    OWNER.LAST_NAME
FROM 
    OWNER
WHERE 
    OWNER.OWNER_NUM IN (
        SELECT 
            PROPERTY.OWNER_NUM
        FROM 
            PROPERTY
        WHERE 
            PROPERTY.BDRMS = 2
    );
#query 5
SELECT 
    OWNER.FIRST_NAME,
    OWNER.LAST_NAME
FROM 
    OWNER
WHERE 
    EXISTS (
        SELECT 
            1
        FROM 
            PROPERTY
        WHERE 
            PROPERTY.OWNER_NUM = OWNER.OWNER_NUM
            AND PROPERTY.BDRMS = 2
    );
#query 6
SELECT 
    P1.PROPERTY_ID AS Property1_ID,
    P2.PROPERTY_ID AS Property2_ID
FROM 
    PROPERTY P1
JOIN 
    PROPERTY P2 ON P1.BDRMS = P2.BDRMS
               AND P1.PROPERTY_ID < P2.PROPERTY_ID
ORDER BY 
    P1.PROPERTY_ID, P2.PROPERTY_ID;
#query 7
select p.SQR_FT, p.OWNER_NUM, o.LAST_NAME, o.FIRST_NAME
FROM PROPERTY p
JOIN OWNER o ON p.OWNER_NUM = o.OWNER_NUM
WHERE p.OFFICE_NUM = (SELECT OFFICE_NUM FROM OFFICE WHERE OFFICE_NAME = 'StayWell-Colombia City');
#query 8
select p.SQR_FT, p.OWNER_NUM, o.LAST_NAME, o.FIRST_NAME
FROM PROPERTY p
JOIN OWNER o ON p.OWNER_NUM = o.OWNER_NUM
WHERE p.OFFICE_NUM = (SELECT OFFICE_NUM FROM OFFICE WHERE OFFICE_NAME = 'StayWell-Colombia City') and p.BDRMS= 3;
#query 9
SELECT 
    P.OFFICE_NUM, 
    P.ADDRESS, 
    P.MONTHLY_RENT
FROM 
    PROPERTY P
JOIN 
    OWNER O ON P.OWNER_NUM = O.OWNER_NUM
WHERE 
    O.STATE = 'WA' OR P.BDRMS = 2;
#query 10
SELECT 
    P.OFFICE_NUM, 
    P.ADDRESS, 
    P.MONTHLY_RENT
FROM 
    PROPERTY P
JOIN 
    OWNER O ON P.OWNER_NUM = O.OWNER_NUM
WHERE 
    O.STATE = 'WA' AND P.BDRMS = 2;
#query 11
SELECT 
    P.OFFICE_NUM, 
    P.ADDRESS, 
    P.MONTHLY_RENT
FROM 
    PROPERTY P
JOIN 
    OWNER O ON P.OWNER_NUM = O.OWNER_NUM
WHERE 
    O.STATE = 'WA' 
    AND P.BDRMS != 2;
#query 12
SELECT 
    SR.SERVICE_ID, 
    SR.PROPERTY_ID
FROM 
    SERVICE_REQUEST SR
WHERE 
    SR.EST_HOURS > (
        SELECT MAX(EST_HOURS)
        FROM SERVICE_REQUEST
        WHERE CATEGORY_NUMBER = 5
    );
#query 13
SELECT 
    SR.SERVICE_ID, 
    SR.PROPERTY_ID
FROM 
    SERVICE_REQUEST SR
WHERE 
    SR.EST_HOURS > ALL (
        SELECT EST_HOURS
        FROM SERVICE_REQUEST
        WHERE CATEGORY_NUMBER = 5
    );
#query 14
SELECT 
    P.ADDRESS, 
    P.SQR_FT, 
    P.OWNER_NUM, 
    SR.SERVICE_ID, 
    SR.EST_HOURS, 
    SR.SPENT_HOURS
FROM 
    SERVICE_REQUEST SR
JOIN 
    PROPERTY P ON SR.PROPERTY_ID = P.PROPERTY_ID
WHERE 
    SR.CATEGORY_NUMBER = 4;
#query 15
SELECT 
    P.ADDRESS, 
    P.SQR_FT, 
    P.OWNER_NUM, 
    SR.SERVICE_ID, 
    SR.EST_HOURS, 
    SR.SPENT_HOURS
FROM 
    PROPERTY P
LEFT JOIN 
    SERVICE_REQUEST SR ON P.PROPERTY_ID = SR.PROPERTY_ID AND SR.CATEGORY_NUMBER = 4;
#query 16
SELECT 
    P.ADDRESS, 
    P.SQR_FT, 
    P.OWNER_NUM, 
    SR.SERVICE_ID, 
    SR.EST_HOURS, 
    SR.SPENT_HOURS
FROM 
    PROPERTY P
JOIN 
    SERVICE_REQUEST SR ON P.PROPERTY_ID = SR.PROPERTY_ID AND SR.CATEGORY_NUMBER = 4

UNION
SELECT 
    P.ADDRESS, 
    P.SQR_FT, 
    P.OWNER_NUM, 
    NULL AS SERVICE_ID, 
    NULL AS EST_HOURS, 
    NULL AS SPENT_HOURS
FROM 
    PROPERTY P
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM SERVICE_REQUEST SR
        WHERE SR.PROPERTY_ID = P.PROPERTY_ID AND SR.CATEGORY_NUMBER = 4
    );

use staywell;
#query 1 and part a
create view small_property as select property_id, office_num, bdrms, floors, monthly_rent, owner_num
from property where sqr_ft < 1250;
select * from small_property;
#part b
select office_num, property_id, monthly_rent from small_property where monthly_rent >= 1150;
#part c
select office_num, property_id, monthly_rent
from property where sqr_ft < 1250 and monthly_rent >= 1150;
#part d
#While some simple updates might be possible (e.g., changing office_num or bedrooms), 
#updating through this view is generally problematic due to the complexity of the view 
#and the potential for referential integrity violations. You should update the 
#underlying PROPERTY table directly instead of through the view.
#query 2 and part a
create view property_owners as 
select 
    p.property_id, 
    p.office_num, 
    p.sqr_ft, 
    p.bdrms, 
    p.floors, 
    p.monthly_rent, 
    o.last_name
from 
    property p
join 
    owner o 
on 
    p.owner_num = o.owner_num
where 
    p.bdrms = 3;
#part b 
select property_id, office_num, monthly_rent, sqr_ft, last_name
from property_owners
where monthly_rent < 1675;
#part c
select 
    p.property_id, 
    p.office_num, 
    p.monthly_rent, 
    p.sqr_ft, 
    o.last_name
from 
    property p
join 
    owner o 
on 
    p.owner_num = o.owner_num
where 
    p.bdrms = 3;
#part d
#Updating the database through the `PROPERTY_OWNERS`
#view could create problems because it involves a join between two tables, 
#making it unclear which table to update.
#Additionally, updating fields like `OWNER_NUM` or `last_name` 
#could violate referential integrity or cause unintended errors.
#query 3 and part a
create view monthly_rents as
select bdrms, avg(monthly_rent) as average_rent from property group by bdrms
order by bdrms;
#part b
select sqr_ft, avg(monthly_rent) as average_fee
from property
group by sqr_ft
having avg(monthly_rent) > 1100;
#part c
select bdrms, avg(monthly_rent) as average_rent
from property
group by bdrms
order by bdrms;
#part d
#Updating the database through the MONTHLY_RENTS view would create problems
#because it involves an aggregation (avg(monthly_rent)). 
#Aggregated views, like MONTHLY_RENTS, cannot be updated directly since the data is 
#summarized and does not correspond to a specific row in the underlying table.
#fixes
#query 4 and part a
grant select on property to 'Oliver';
#part b
grant insert on owner to 'Crandall', 'Perez';
grant insert on property to 'Crandall', 'Perez';
#part c
grant update(monthly_rent) on property to 'Johnson', 'Klein';
#part d
grant select(office_num, monthly_rent, owner_num) on property to public;
#part e
grant insert, delete on service_category to 'Klein';
#part f
grant create index on service_request to 'Adams';
#part g
grant alter on property to 'Adams', 'Klein';
#part h
grant all privileges on office, owner, property to 'Klein';
#query 5
REVOKE ALL PRIVILEGES, GRANT OPTION FROM Adams;
#query 6
#part a
create index owner_index1 on owner(state);
#part b
create index owner_index2 on owner(last_name);
#part c
CREATE INDEX OWNER_INDEX3 ON OWNER(STATE DESC, CITY);
#query 7
DROP INDEX OWNER_INDEX3 ON OWNER;


































