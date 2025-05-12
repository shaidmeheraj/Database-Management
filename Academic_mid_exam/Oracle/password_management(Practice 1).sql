 -- all code are run in command prompt
create profile me limit
  2  failed_login_attempts 2
  3  password_lock_time 1
  4  password_life_time 2
  5  password_grace_time 2
  6  password_reuse_time 3
  7  password_reuse_max 2
  8  ;

Profile created.

SQL> create user ma identified by ma
  2  profile me;

User created.

SQL> grant create session to me;
grant create session to me
                        *
ERROR at line 1:
ORA-01917: user or role 'ME' does not exist


SQL> grant create session to ma;

Grant succeeded.

SQL> connect ma/ma;
Connected.
SQL> connect ma/a;
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> connect ma/b;
ERROR:
ORA-01017: invalid username/password; logon denied


SQL> connect ma/c;
ERROR:
ORA-28000: the account is locked


SQL> connect ma/ma;
ERROR:
ORA-28000: the account is locked


SQL> connect ma/ma;
Connected.
SQL> connect ma/ma;
ERROR:
ORA-28002: the password will expire within 2 days


Connected.
SQL> connect ma/ma;
ERROR:
ORA-28001: the password has expired


Changing password for ma
New password:
Retype new password:
Password changed
Connected.
SQL> ma/a;
SP2-0042: unknown command "ma/a" - rest of line ignored.
SQL> connect ma/a;
Connected.
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
Password changed
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
Password changed
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
ERROR:
ORA-28007: the password cannot be reused


Password unchanged
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
ERROR:
ORA-28008: invalid old password


Password unchanged
SQL> d
SP2-0042: unknown command "d" - rest of line ignored.
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
ERROR:
ORA-28007: the password cannot be reused


Password unchanged
SQL> password
Changing password for MA
Old password:
New password:
Retype new password:
Password changed