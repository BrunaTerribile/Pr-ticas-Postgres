CREATE DATABASE bootcamp_db;

/c bootcamp_db;

CREATE TABLE students(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
)

CREATE TABLE classes(
    id SERIAL NOT NULL PRIMARY KEY,
    code TEXT NOT NULL
)

CREATE TABLE modules(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE projects(
    id SERIAL NOT NULL PRIMARY KEY,
    projectName TEXT NOT NULL,
    module INTEGER NOT NULL REFERENCES modules(id)
)

CREATE TABLE rating(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE registration(
    id SERIAL NOT NULL PRIMARY KEY,
    studentId INTEGER NOT NULL REFERENCES students(id),
    classId INTEGER NOT NULL REFERENCES classes(id),
	ingress DATE NOT NULL,
    egress DATE NOT NULL
)

CREATE TABLE activities(
    id SERIAL NOT NULL PRIMARY KEY,
    studentId INTEGER NOT NULL REFERENCES students(id),
    projectId INTEGER NOT NULL REFERENCES projects(id),
	date DATE NOT NULL DEFAULT NOW(),
    evaluation INTEGER NOT NULL REFERENCES rating(id)
)
