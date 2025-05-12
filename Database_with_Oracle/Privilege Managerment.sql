1. Create a user named Person2, give password 1234, give privilege CREATE SESSION to Person2; Create another user named Person1, give password 5678, give privilege CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SYNONYM to Person1; create a table named NEWSPAPER under user Person1, insert data into NEWSPAPER table as user Person1, give privileges SELECT, insert ON NEWSPAPER table TO Person2 from user Person1; Show NEWSPAPER table and insert data into NEWSPAPER table from user Person2. 					

SQL*Plus: Release 21.0.0.0.0 - Production on Sun Feb 9 12:54:40 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Sun Feb 09 2025 12:53:30 +06:00

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> drop user C##Person1 cascade;

User dropped.

SQL> drop user C##Person2 cascade;

User dropped.

SQL> create user C##Person2 identified by 1234;

User created.

SQL> grant CREATE SESSION to C##Person2;

Grant succeeded.

SQL> create user C##Person1 identified by 5678;

User created.

SQL>  grant CREATE SESSION, CREATE TABLE, CREATE VIEW,
  2   CREATE SYNONYM to C##Person1;

Grant succeeded.

SQL> alter user C##Person1
  2  default tablespace users
  3  quota 5m on users;

User altered.

SQL> connect C##Person1/5678;
Connected.
SQL> create table NEWSPAPER (
  2  Feature      VARCHAR2(15) not null,
  3  Section      CHAR(1),
  4  Page         NUMBER
  5  );

Table created.

SQL>
SQL> insert into NEWSPAPER values ('National News', 'A', 1);

1 row created.

SQL> insert into NEWSPAPER values ('Sports', 'D', 1);

1 row created.

SQL> insert into NEWSPAPER values ('Editorials', 'A', 12);

1 row created.

SQL> insert into NEWSPAPER values ('Business', 'E', 1);

1 row created.

SQL> insert into NEWSPAPER values ('Weather', 'C', 2);

1 row created.

SQL> insert into NEWSPAPER values ('Television', 'B', 7);

1 row created.

SQL> insert into NEWSPAPER values ('Births', 'F', 7);

1 row created.

SQL> insert into NEWSPAPER values ('Classified', 'F', 8);

1 row created.

SQL> insert into NEWSPAPER values ('Modern Life', 'B', 1);

1 row created.

SQL> insert into NEWSPAPER values ('Comics', 'C', 4);

1 row created.

SQL> insert into NEWSPAPER values ('Movies', 'B', 4);

1 row created.

SQL> insert into NEWSPAPER values ('Bridge', 'B', 2);

1 row created.

SQL> insert into NEWSPAPER values ('Obituaries', 'F', 6);

1 row created.

SQL> insert into NEWSPAPER values ('Doctor Is In', 'F', 6);

1 row created.

SQL> select * from newspaper;

FEATURE         S       PAGE
--------------- - ----------
National News   A          1
Sports          D          1
Editorials      A         12
Business        E          1
Weather         C          2
Television      B          7
Births          F          7
Classified      F          8
Modern Life     B          1
Comics          C          4
Movies          B          4

FEATURE         S       PAGE
--------------- - ----------
Bridge          B          2
Obituaries      F          6
Doctor Is In    F          6

14 rows selected.

SQL> GRANT SELECT ON NEWSPAPER TO C##Person2;

Grant succeeded.

SQL> connect C##Person2/1234;
Connected.
SQL> select * from C##Person1.NEWSPAPER;

FEATURE         S       PAGE
--------------- - ----------
National News   A          1
Sports          D          1
Editorials      A         12
Business        E          1
Weather         C          2
Television      B          7
Births          F          7
Classified      F          8
Modern Life     B          1
Comics          C          4
Movies          B          4

FEATURE         S       PAGE
--------------- - ----------
Bridge          B          2
Obituaries      F          6
Doctor Is In    F          6

14 rows selected.

SQL> connect C##Person1/5678;
Connected.
SQL> GRANT INSERT ON NEWSPAPER TO C##Person2;

Grant succeeded.

SQL> connect C##Person2/1234;
Connected.
SQL> insert into C##Person1.NEWSPAPER values ('National News', 'A', 1);

1 row created.

SQL> select * from C##Person1.Newspaper;

FEATURE         S       PAGE
--------------- - ----------
National News   A          1
Sports          D          1
Editorials      A         12
Business        E          1
Weather         C          2
Television      B          7
Births          F          7
Classified      F          8
Modern Life     B          1
Comics          C          4
Movies          B          4

FEATURE         S       PAGE
--------------- - ----------
Bridge          B          2
Obituaries      F          6
Doctor Is In    F          6
National News   A          1

15 rows selected.