--  Project privilege Management
-- A table that create under a user and show that table and insert data from another user

create user Person2 identified by 1234;

SQL> grant create session to Person2;

Grant succeeded.

connect Person2/1234;
Connected.

SQL> create user Person1 identified by pp;

User created.

SQL> grant create session to Person1;

Grant succeeded.

connect Person1/5678; 
Connected.

 grant create user, grant any privilege to Person2;

Grant succeeded.

 connect Person2/1234;
Connected.
SQL> grant create session, create table, create view, create synonym to Person1;

Grant succeeded.

 alter user Person1
  2    default tablespace users
  3    quota 5m on users;

User altered.


SQL> show user
USER is "SYSTEM"
SQL> connect Person1/5678;
Connected.
SQL> show user
USER is "PERSON1"
SQL> create table newspaper(
  2   Feature varchar(25) not null,
  3  Section char(1),
  4  page number
  5  );

Table created.

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

SQL> select * from newspaper
  2  ;

FEATURE                   S       PAGE
------------------------- - ----------
National News             A          1
Sports                    D          1
Editorials                A         12
Business                  E          1
Weather                   C          2
Television                B          7
Births                    F          7
Classified                F          8
Modern Life               B          1
Comics                    C          4
Movies                    B          4

FEATURE                   S       PAGE
------------------------- - ----------
Bridge                    B          2
Obituaries                F          6
Doctor Is In              F          6

14 rows selected.

SQL> grant select on newspaper to Person2;

Grant succeeded.

SQL> connect Person2/1234;
Connected.
SQL> select * from Person1.newspaper;

FEATURE                   S       PAGE
------------------------- - ----------
National News             A          1
Sports                    D          1
Editorials                A         12
Business                  E          1
Weather                   C          2
Television                B          7
Births                    F          7
Classified                F          8
Modern Life               B          1
Comics                    C          4
Movies                    B          4

FEATURE                   S       PAGE
------------------------- - ----------
Bridge                    B          2
Obituaries                F          6
Doctor Is In              F          6

14 rows selected.

SQL> connect Person1/5678;
Connected.
SQL> grant insert on newspaper to Person2;

Grant succeeded.

SQL> connect Person2/1234;

Connected.

SQL> insert into Person1.newspaper values ('Nation News','A',3);

1 row created.


SQL> select * from Person1.newspaper;