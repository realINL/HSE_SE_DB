CREATE TABLE Readers (
    readerId int UNIQUE,
    name varchar,
    address varchar,
    birthdayDate date
);

CREATE TABLE BookCopies (
    copyNumber int,
    shelfAddress varchar UNIQUE
);

CREATE TABLE Book (
    ISBN varchar,
    Title varchar,
    PublicationYear int,
    Author varchar,
    QuantityOfPages int
);

CREATE TABLE PublishingHouses (
    name varchar,
    address varchar
);

CREATE TABLE BookCategory (
    CategoryName varchar
);

INSERT INTO Readers VALUES (1, 'Ilia', 'Moscow', '2004-10-25');
INSERT INTO BookCopies VALUES (1,'1A');
INSERT INTO Book VALUES ('97850019595950', 'Мастер и Маргарита', '2023', 'Булгаков Михаил Афанасьевич', 512);
INSERT INTO PublishingHouses VALUES ('Манн, Иванов и Фербер', 'Россия, Москва,  Большой Козихинский пер., д. 7, стр. 2');
INSERT INTO BookCategory VALUES ('Классическая отечественная проза');
