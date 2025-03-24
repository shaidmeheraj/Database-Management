CREATE PROFILE co
  2  LIMIT
  3  FAILED_LOGIN_ATTEMPTS 2
  4  PASSWORD_LIFE_TIME 3
  5  PASSWORD_REUSE_TIME 2
  6  PASSWORD_REUSE_MAX 2
  7  PASSWORD_LOCK_TIME 2
  8  PASSWORD_GRACE_TIME 4
  9  ;

Profile created.

SQL> CREATE user a IDENTIFIED BY a PROFILE co;

User created.

SQL> GRANT CREATE SESSION TO a;

Grant succeeded.

SQL> connect a/a;
Connected.
SQL> connect system/25809073;
Connected.
SQL> connect a/b;
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> connect a/b;
ERROR:
ORA-01017: invalid username/password; logon denied


SQL> connect a/b;
ERROR:
ORA-28000: the account is locked


SQL> connect a/a;
Connected.
SQL> connect system/25809073;
Connected.
SQL> connect a/a;
ERROR:
ORA-28002: the password will expire within 4 days


Connected.
SQL> connect system/25809073;
Connected.
SQL> connect a/a;
ERROR:
ORA-28001: the password has expired


Changing password for a
New password:
Retype new password:
Password changed
Connected.
SQL> connect a/b;
Connected.
SQL> connect system/25809073;
Connected.
SQL> connect a/b;
Connected.
SQL> password
Changing password for A
Old password:
New password:
Retype new password:
ERROR:
ORA-28007: the password cannot be reused


Password unchanged
SQL> password
Changing password for A
Old password:
New password:
Retype new password:
Password changed
SQL> password
Changing password for A
Old password:
New password:
Retype new password:
Password changed
SQL> password
Changing password for A
Old password:
New password:
Retype new password:
Password changed
SQL> password
Changing password for A
Old password:
New password:
Retype new password:
ERROR:
ORA-28007: the password cannot be reused


Password unchanged