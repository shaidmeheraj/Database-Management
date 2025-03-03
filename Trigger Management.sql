-- Trigger Management

 --   1. Create a table named BOOKSHELF_AUDIT, also create a table named BOOKSHELF 
 --   and Insert data into BOOKSHELF table where Rating will be one attribute. 
 --   Create a row-level BEFORE UPDATE trigger which will be executed only if the Rating value is updated to BOOKSHELF table.

-- Drop tables if it exists
drop table BOOKSHELF_AUDIT;
drop table BOOKSHELF;
drop table bookshelft_stats;

-- Create the audit table to store changes in ratings
create table BOOKSHELF_AUDIT (
    title        varchar2(100),
    publisher    varchar2(20),
    categoryname varchar2(20),
    old_rating   varchar2(2),
    new_rating   varchar2(2),
    audit_date   date
);

-- Select all records from the audit table

Select* from bookshelf audit;

-- Create table bookshelf (
    title       varchar2(100),
    publisher   varchar2(20),
    categoryname varchar2(20),
    rating       varchar2(2)
);

-- Select all records from the bookshelf table
Select * from bookshelf;

-- Create a row-level trigger to audit changes in the rating column
create