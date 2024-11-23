SELECT title, publisher_name FROM book;
SELECT book.title, book.number_of_pages FROM book ORDER BY number_of_pages DESC LIMIT 1;
SELECT COUNT(isbn), book.author FROM book GROUP BY author HAVING COUNT(isbn) > 5;
SELECT title FROM book WHERE number_of_pages / 2 > (SELECT AVG(number_of_pages) FROM book);
SELECT categoryname FROM category WHERE parentcat IS NOT NULL;
SELECT author, COUNT(isbn) AS booksNumber FROM book GROUP BY author LIMIT 1;
SELECT reader.firstname, reader.lastname FROM borrowing JOIN book ON borrowing.isbn = book.isbn JOIN reader ON borrowing.id = reader.id WHERE book.author = 'Марк Твен';
SELECT book.title, COUNT(book.isbn) AS bookCount FROM copy JOIN book ON copy.isbn = book.isbn  GROUP BY book.title HAVING COUNT(book.isbn) > 1;
SELECT title, year FROM book ORDER BY year LIMIT 10;
WITH RECURSIVE categoryTree AS (
    SELECT categoryname FROM category WHERE parentcat = 'Спорт'
    UNION ALL
    SELECT c.categoryname FROM category c
    JOIN categoryTree ct ON c.parentcat = ct.categoryname
)
SELECT *
FROM categoryTree;

INSERT INTO reader
VALUES (10006, 'Петров', 'Василий', 'address', '1999-05-05');
INSERT INTO borrowing
VALUES (10006, '123456', 4, NULL);
DELETE FROM book WHERE year > 2000;
UPDATE borrowing SET returndate = returndate + 30 WHERE isbn IN (SELECT bookcategory.isbn FROM bookcategory WHERE categoryname = 'Горы') AND returndate > '2016-01-01';