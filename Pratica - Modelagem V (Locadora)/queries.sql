CREATE DATABASE video_store

/c video_store

CREATE TABLE phones(
    id SERIAL NOT NULL PRIMARY KEY,
    number NUMERIC NOT NULL
)

CREATE TABLE adresses(
    id SERIAL NOT NULL PRIMARY KEY,
    street TEXT NOT NULL,
    number NUMERIC NOT NULL,
    district TEXT NOT NULL,
    zipcode TEXT NOT NULL,
    complement TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL
)

CREATE TABLE satisfaction(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE serviceSurvey(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE categories(
    id SERIAL NOT NULL PRIMARY KEY,
    "categoryName" TEXT NOT NULL UNIQUE
)

CREATE TABLE cast(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    nationality TEXT NOT NULL,
    birthdate DATE NOT NULL
)

CREATE TABLE customers(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    "phoneId" INTEGER NOT NULL REFERENCES phones(id),
    "adressId" INTEGER NOT NULL REFERENCES adresses(id),
    cpf VARCHAR(11) NOT NULL UNIQUE
)

CREATE TABLE movies(
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    "categoryId" INTEGER NOT NULL REFERENCES categories(id),
    "actorId" INTEGER NOT NULL REFERENCES cast(id)
)

CREATE TABLE dvds(
    id SERIAL NOT NULL PRIMARY KEY,
    num TEXT NOT NULL UNIQUE,
    "movieId" INTEGER NOT NULL REFERENCES movies(id),
    barcode NUMERIC NOT NULL UNIQUE
)

CREATE TABLE rentals(
    id SERIAL NOT NULL PRIMARY KEY,
    "dvdId" INTEGER NOT NULL REFERENCES dvds(id),
    "customerId" INTEGER NOT NULL REFERENCES customers(id),
    "rentalAt" DATE NOT NULL
)

CREATE TABLE returns(
    id SERIAL NOT NULL PRIMARY KEY,
    "rentalId" INTEGER NOT NULL REFERENCES rentals(id),
    "returnDate" TEXT NOT NULL,
    "satisfactionScore" INTEGER NOT NULL REFERENCES satisfaction(id),
    "serviceScore" INTEGER NOT NULL REFERENCES serviceSurvey(id)
)