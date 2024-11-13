CREATE TABLE Doctors (
    persNr INT UNIQUE,
    name varchar,
    rank varchar,
    area varchar
);
CREATE TABLE Caregivers (
    persNr INT UNIQUE,
    name varchar,
    qualification varchar
);
CREATE TABLE Stations(
    statNr INT UNIQUE,
    name varchar
);

CREATE TABLE Roooms (
    roomNr INT,
    stationNr INT,
    beds INT
);
CREATE TABLE  Patients (
    patientNr INT,
  persNr INT,
  name VARCHAR,
  disease VARCHAR,
  from DATE,
  to DATE,
  roomNr INT
);

CREATE TABLE StationPersonell (
    persNr INT,
    statNr INT,
    name varchar
);