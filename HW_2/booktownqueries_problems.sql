-- Homework #2: EECS 484.
-- Your uniquname:
-- include your teamate's uniqname if you are working in a team of two
-- We use the 'PROMPT' command to print out the problem number. DO NOT DELETE THAT, otherwise this may cause you failing the testcases.

-- Your answer should work for any instance of the database, not just the one given.

-- EXAMPLE
-- Q0: "list titles of all books". Answer given below.

SELECT title FROM books;

-- Q1
PROMPT Question 5.1;
-- List the ISBN of all books written by "Tom Christiansen"


-- Q2
PROMPT Question 5.2;
-- List last name and first name of authors who have written both
-- Short Story and Horror books. In general, there could be two different authors
-- with the same name, one who has written a horror book and another
-- who has written short stories. 


-- Q3
PROMPT Question 5.3;
-- List titles, publication, author's id, author's last name, and author's first name of all books 
-- by authors who have published at least one book after 1999-10-01 but before 2001-10-01. 
-- Note: this may require a nested query. The answer can include books that are not published in between 
-- the publication requirements. You can also use views. But DROP any views at the end of your query.
-- Using a single query is likely to be more 
-- efficient in practice. Moreover, there shouldn't be any duplication for the returned records.


-- Q4
PROMPT Question 5.4;
-- Find id, first name, and last name of authors who wrote books for all the 
-- subjects of books written by Edgar Allen Poe.


-- Q5
PROMPT Question 5.5;
-- Find the book_id and its corresponding total stock available for all book editions ordered
-- in descending order by the total stock. Name the column for total stock as TOTAL_STOCK. 
-- NOTE: You do not need to consider editions of books that are not in the Stock Table.


-- Q6
PROMPT Question 5.6;
-- Find the name and id of all publishers who have published books for authors
-- who have written exactly 2 books. Result should be ordered by publisher id in descending order;


-- Q7
PROMPT Question 5.7;
-- Find the last name and first name of authors who haven't written any book.
-- Name the last name column as l_name, the first name column as f_name.


-- Q8
PROMPT Question 5.8;
-- Find author_id of authors who have written exactly 1 book. Name the author_id column as aid. 
-- Order the id in ascending order. 



