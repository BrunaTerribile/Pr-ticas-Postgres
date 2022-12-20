CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL,
    password TEXT NOT NULL
)

CREATE TABLE customerPhones(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number NUMBER NOT NULL,
    type TEXT NOT NULL,
)

CREATE TABLE customerAdresses(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    street TEXT NOT NULL,
    number VARCHAR(5) NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" NUMBER NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id"),
)

CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE bankAccount(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    agency VARCHAR(4) NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE NOT NULL
)

CREATE TABLE transactions(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount INTEGER NOT NULL,
    type TEXT NOT NULL,
    time TIMESTAMP DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN DEFAULT FALSE
)

CREATE TABLE creditCards(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name TEXT NOT NULL,
    number VARCHAR(16) NOT NULL UNIQUE,
    "securityCode" VARCHAR(3) NOT NULL,
    "expirationMonth" TEXT NOT NULL,
    "expirationYear" NUMBER NOT NULL,
    password TEXT NOT NULL,
    limit INTEGER NOT NULL
)