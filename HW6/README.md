# HW6
В этом домашнем задании были написаны и разобраны SQL запросы.
## № 1
* Reader( <ins>number</ins>, LastName, FirstName, Address, BirthDate) <br>
* Book ( <ins>isbn</ins>, Title, Author, PagesNum, PubYear, PubName) <br>
* Publisher ( <ins>PubName</ins>, PubAdress) <br>
* Category ( <ins>CategoryName</ins>, ParentCat) <br>
* Copy ( <ins>ISBN, CopyNumber</ins>,, ShelfPosition) <br>
* Borrowing ( <ins>ReaderNr, ISBN, CopyNumber</ins>, ReturnDate) <br>
* BookCat ( <ins>ISBN, CategoryName</ins> ) 

Написаны SQL запросы для следующих действий:
1.  Показать все названия книг вместе с именами издателей.
```SQL
SELECT title, publisher_name FROM book;
```
2. В какой книге наибольшее количество страниц?
```SQL
SELECT book.title, book.number_of_pages FROM book ORDER BY number_of_pages DESC LIMIT 1;
```
3. Какие авторы написали более 5 книг?
```SQL
SELECT COUNT(isbn), book.author FROM book GROUP BY author HAVING COUNT(isbn) > 5;
```
4. В каких книгах более чем в два раза больше страниц, чем среднее количество страниц для всех книг?
```SQL
SELECT title FROM book WHERE number_of_pages / 2 > (SELECT AVG(number_of_pages) FROM book);
```
5. Какие категории содержат подкатегории?
```SQL
SELECT categoryname FROM category WHERE parentcat IS NOT NULL;
```
6. У какого автора (предположим, что имена авторов уникальны) написано максимальное количество книг?
```SQL
SELECT author, COUNT(isbn) AS booksNumber FROM book GROUP BY author LIMIT 1;
```
7. Какие читатели забронировали все книги (не копии), написанные "Марком Твеном"?
```SQL
SELECT reader.firstname, reader.lastname FROM borrowing JOIN book ON borrowing.isbn = book.isbn JOIN reader ON borrowing.id = reader.id WHERE book.author = 'Марк Твен';
```
8. Какие книги имеют более одной копии? 
```SQL
SELECT book.title, COUNT(book.isbn) AS bookCount FROM copy JOIN book ON copy.isbn = book.isbn  GROUP BY book.title HAVING COUNT(book.isbn) > 1;
```
9. ТОП 10 самых старых книг
```SQL
SELECT title, year FROM book ORDER BY year LIMIT 10;
```
10. Перечислите все категории в категории “Спорт” (с любым уровнем вложености).
```SQL
WITH RECURSIVE categoryTree AS (
    SELECT categoryname FROM category WHERE parentcat = 'Спорт'
    UNION ALL
    SELECT c.categoryname FROM category c
    JOIN categoryTree ct ON c.parentcat = ct.categoryname
)
SELECT *
FROM categoryTree;
```
## № 2
Написаны SQL запросы для следующих действий:

1. Добавьте запись о бронировании читателем ‘Василеем Петровым’ книги с ISBN 123456 и номером копии 4.
```SQL
INSERT INTO reader
VALUES (10006, 'Петров', 'Василий', 'address', '1999-05-05');
INSERT INTO borrowing
VALUES (10006, '123456', 4, NULL);
```
2. Удалить все книги, год публикации которых превышает 2000 год.
```SQL
DELETE FROM book WHERE year > 2000;
```
3. Измените дату возврата для всех книг категории "Базы данных", начиная с 01.01.2016, чтобы они были в заимствовании на 30 дней дольше.
```SQL
UPDATE borrowing SET returndate = returndate + 30 WHERE isbn IN (SELECT bookcategory.isbn FROM bookcategory WHERE categoryname = 'Горы') AND returndate > '2016-01-01';
```
## № 3
Рассмотрим следующую реляционную схему:

* Student( MatrNr, Name, Semester ) 
* Check( MatrNr, LectNr, ProfNr, Note ) 
* Lecture( LectNr, Title, Credit, ProfNr ) 
* Professor( ProfNr, Name, Room )

Ниже описаны результаты заданных SQL запросов:

1. Этот запрос возвращает всех студентов у которых нет оценок выше тройки.
```sql
SELECT s.Name, s.MatrNr FROM Student s 
WHERE NOT EXISTS ( 
SELECT * FROM Check c WHERE c.MatrNr = s.MatrNr AND c.Note >= 4.0 ) ; 
```

2.  Этот запрос возвращает профессоров (номера, имя) и кол-ва кредитов их лекций, если профессор не ситает лекции - 0 кредитов.
```sql
( SELECT p.ProfNr, p.Name, sum(lec.Credit) 
FROM Professor p, Lecture lec 
WHERE p.ProfNr = lec.ProfNr
GROUP BY p.ProfNr, p.Name)
UNION
( SELECT p.ProfNr, p.Name, 0 
FROM Professor p
WHERE NOT EXISTS ( 
SELECT * FROM Lecture lec WHERE lec.ProfNr = p.ProfNr )); 
```

3. Этот запрос возвращает имена студентов и их самую высокую оценку, если эта оценка не ниже 4.
```sql
SELECT s.Name, p.Note
FROM Student s, Lecture lec, Check c
WHERE s.MatrNr = c.MatrNr AND lec.LectNr = c.LectNr AND c.Note >= 4 
AND c.Note >= ALL ( 
SELECT c1.Note FROM Check c1 WHERE c1.MatrNr = c.MatrNr ) 
```