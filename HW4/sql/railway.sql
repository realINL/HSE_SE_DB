CREATE TABLE Station
(
    id INT UNIQUE,
    cityId INT,
    name VARCHAR,
    tracks INT
);

CREATE TABLE City
(
    cityDd INT,
    region VARCHAR,
    name VARCHAR
);

CREATE TABLE Trains
(
    trainId INT,
    departureStationId VARCHAR,
    arrivalStationId VARCHAR,
    startStation VARCHAR,
    endStation VARCHAR,
    trainNr INT,
    length INT
);

INSERT INTO Station VALUES (1, 1, 'Krasnodar-Centalniy', 12);
INSERT INTO City VALUES (1, 'Krasonadskiy Kray', 'Krasnodar');
INSERT INTO Trains VALUES (1, 'Moscow', 'Krasnodar', 'Krasnodar', 1, 8);