SQL> drop user a cascade;

User dropped.

SQL> drop user b cascade;

User dropped.

SQL> create user a identified by a;

User created.

SQL> grant create session to a;

Grant succeeded.

SQL> create user b identified by b;

User created.

SQL> grant create session, create table, create view,create synonym to a;

Grant succeeded.

SQL> drop user a cascade;

User dropped.

SQL> drop user b cascade;

User dropped.

SQL> create user a identified by a;

User created.

SQL> grant create session to a;

Grant succeeded.

SQL> create user b identified by b;

User created.

SQL> grant create session, create table, create view, create synonym to b;

Grant succeeded.

SQL> connect b/b;
Connected.
SQL> connect system/25809073;
Connected.
SQL> alter user b
  2  default tablespace users
  3  quota 5m on users;

User altered.

SQL> connect b/b;
Connected.
SQL> create table c(
  2  name varchar2(20),
  3  age number);

Table created.

SQL> insert into c values('Meheraj', 20);

1 row created.

SQL> insert into c values('Fahim', 22);

1 row created.

SQL> insert into c values('Masum', 25);

1 row created.

SQL> select * from c;

NAME                        AGE
-------------------- ----------
Meheraj                      20
Fahim                        22
Masum                        25

SQL> show user
USER is "B"
SQL> grant select on c to a;

Grant succeeded.

SQL> grant insert on c to a;

Grant succeeded.

SQL> connect a/a;
Connected.
SQL> show user
USER is "A"
SQL> select * from b.c;

NAME                        AGE
-------------------- ----------
Meheraj                      20
Fahim                        22
Masum                        25

SQL> insert into b.c values ('Sakib',22);

1 row created.

SQL> insert into b.c values ('Jihad',21);

1 row created.

SQL> select * from b.c;

NAME                        AGE
-------------------- ----------
Meheraj                      20
Fahim                        22
Masum                        25
Sakib                        22
Jihad                        21