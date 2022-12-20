CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    adress TEXT NOT NULL
)

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INTEGER NOT NULL,
    photos TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL REFERENCES "categories"("id"),
    "sizeId" INTEGER NOT NULL REFERENCES "sizes"("id")
)

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
    "statusId" INTEGER NOT NULL REFERENCES "status"("id"),
    "orderDate" DATE DEFAULT NOW()
)

CREATE TABLE sizes(
    id SERIAL PRIMARY KEY,
    size TEXT NOT NULL UNIQUE

)

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE status(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
)