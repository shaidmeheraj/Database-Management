-- Project Privilege Management
-- Project privilege Management

-- 1. Create a user named judy, 
--    give password sarah, give privilege CREATE SESSION to judy; 
--    Create another user named bob, give password carolyn, give privilege CREATE SESSION, 
--    CREATE TABLE, CREATE VIEW, CREATE SYNONYM to bob; create a table named NEWSPAPER under user bob, 
--    insert data into NEWSPAPER table as user bob, give privileges SELECT, insert ON NEWSPAPER table TO judy from user bob; 
--    Show NEWSPAPER table and insert data into NEWSPAPER table from user judy. 	

-- 1. Create a user named judy, give password sarah, give privilege CREATE SESSION to judy
CREATE USER judy IDENTIFIED BY sarah ;
GRANT CREATE SESSION TO judy;

-- 2. Create another user named bob, give password carolyn, give privilege CREATE SESSION,CREATE TABLE, CREATE VIEW, CREATE SYNONYM to bob;
CREATE USER bob IDENTIFIED BY carolyn ;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SYNONYM TO bob;
ALTER USER bob QUOTA 100M ON SYSTEM;

GRANT UNLIMITED TABLESPACE TO bob;
-- 3. Create a table named NEWSPAPER under user bob
CONNECT bob/carolyn;
CREATE TABLE NEWSPAPER (
    ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100),
    PUBLISHER VARCHAR2(100)
);


-- 4. Insert data into NEWSPAPER table as user bob
INSERT INTO NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (1, 'The Times', 'Times Group');
INSERT INTO NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (2, 'The Guardian', 'Guardian Media Group');

-- 5. Give privileges SELECT, INSERT ON NEWSPAPER table TO judy from user bob
GRANT SELECT, INSERT ON NEWSPAPER TO judy;

-- 6. Show NEWSPAPER table and insert data into NEWSPAPER table from user judy
CONNECT judy/sarah;
SELECT * FROM bob.NEWSPAPER;

INSERT INTO bob.NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (3, 'The Daily News', 'Daily News Corp');