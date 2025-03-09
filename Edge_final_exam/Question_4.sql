/*4. Create a table named BOOKSHELF_AUDIT, also create a table named BOOKSHELF 
and Insert data into BOOKSHELF table where Rating will be one attribute.
 Create a row-level BEFORE UPDATE trigger which will be executed 
 only if the Rating value is updated to BOOKSHELF table.*/

Enter user-name: system
Enter password:
Last Successful login time: Sun Feb 09 2025 12:27:33 +06:00




SQL> CREATE TABLE BOOKSHELF_AUDIT (
  2      Audit_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  3      Book_ID NUMBER,
  4      Old_Rating NUMBER(2,1),
  5      New_Rating NUMBER(2,1),
  6      Updated_By VARCHAR2(100),
  7      Update_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  8  );

Table created.



SQL> CREATE TABLE BOOKSHELF (
  2      Book_ID NUMBER PRIMARY KEY,
  3      Title VARCHAR2(200),
  4      Author VARCHAR2(100),
  5      Rating NUMBER(2,1) NULL
  6  );

Table created.



SQL> INSERT INTO BOOKSHELF (Book_ID, Title, Author, Rating) VALUES (1, 'The Alchemist', 'Paulo Coelho', 4.5);

1 row created.

SQL> INSERT INTO BOOKSHELF (Book_ID, Title, Author, Rating) VALUES (2, '1984', 'George Orwell', 4.8);

1 row created.

SQL> INSERT INTO BOOKSHELF (Book_ID, Title, Author, Rating) VALUES (3, 'To Kill a Mockingbird', 'Harper Lee', 4.9);

1 row created.

SQL>
SQL> COMMIT;

Commit complete.


SQL> CREATE OR REPLACE TRIGGER trg_bookshelf_rating_audit
  2  BEFORE UPDATE OF Rating ON BOOKSHELF
  3  FOR EACH ROW
  4  BEGIN
  5      IF :OLD.Rating != :NEW.Rating THEN
  6          INSERT INTO BOOKSHELF_AUDIT (Book_ID, Old_Rating, New_Rating, Updated_By, Update_Time)
  7          VALUES (:OLD.Book_ID, :OLD.Rating, :NEW.Rating, USER, SYSTIMESTAMP);
  8      END IF;
  9  END;
 10  /

Trigger created.



SQL> UPDATE BOOKSHELF SET Rating = 4.7 WHERE Book_ID = 1;

1 row updated.

SQL> UPDATE BOOKSHELF SET Rating = 4.6 WHERE Book_ID = 2;

1 row updated.

SQL>
SQL> COMMIT;

Commit complete.


SQL> SELECT * FROM BOOKSHELF_AUDIT;

  AUDIT_ID    BOOK_ID OLD_RATING NEW_RATING
---------- ---------- ---------- ----------
UPDATED_BY
--------------------------------------------------------------------------------
UPDATE_TIME
---------------------------------------------------------------------------
         1          1        4.5        4.7
SYSTEM
09-FEB-25 12.41.15.842000 PM

         2          2        4.8        4.6
SYSTEM
09-FEB-25 12.41.15.844000 PM

  AUDIT_ID    BOOK_ID OLD_RATING NEW_RATING
---------- ---------- ---------- ----------
UPDATED_BY
--------------------------------------------------------------------------------
UPDATE_TIME
---------------------------------------------------------------------------




