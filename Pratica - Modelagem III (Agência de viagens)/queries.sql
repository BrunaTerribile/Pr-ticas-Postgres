CREATE DATABASE travel_agency;

/c travel_agency

CREATE TABLE companies(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    "companyCode" VARCHAR(3) NOT NULL
)

CREATE TABLE airports(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    "airportCode" VARCHAR(3) NOT NULL
)

CREATE TABLE flights(
    id SERIAL NOT NULL PRIMARY KEY,
    "flightCode" TEXT NOT NULL,
    company INTEGER NOT NULL REFERENCES companies(id),
    "originAirport" INTEGER NOT NULL REFERENCES airports(id),
    "destinationAirport" INTEGER NOT NULL REFERENCES airports(id),
    "departureTime" TIMESTAMP NOT NULL DEFAULT NOW(),
    "arrivalTime" TIMESTAMP NOT NULL DEFAULT NOW()
)