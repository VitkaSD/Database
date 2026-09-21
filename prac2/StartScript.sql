CREATE DATABASE library;

/*1. Сущность "Книги"*/
CREATE TABLE books (
    isbn VARCHAR(13) PRIMARY KEY,
    b_title VARCHAR(1000) NOT NULL,
    b_pub_year INT CHECK (b_pub_year >= 1425)
);

/*2. Сущность "Авторы"*/
CREATE TABLE creators (
    c_id SERIAL PRIMARY KEY,
    c_name VARCHAR(1000) NOT NULL
);
/*3. Таблица, связывающая авторов и книг*/
CREATE TABLE book_creators (
    isbn VARCHAR(13) REFERENCES books(isbn),
    c_id INT REFERENCES creators(c_id),
    PRIMARY KEY (isbn, c_id)
);
/*4. Сущность "Читатели"*/
CREATE TABLE readers (
    readers_id SERIAL PRIMARY KEY,
    r_name VARCHAR(1000) NOT NULL,
    r_number VARCHAR(15) UNIQUE NOT NULL
);

/*5. Cущность/связь Контроля заказов для выдачи*/
CREATE TABLE Control (
    Order_id SERIAL PRIMARY KEY,
    readers_id INT NOT NULL REFERENCES readers(readers_id),
    isbn VARCHAR(13) NOT NULL REFERENCES books(isbn),
    date_of_give DATE NOT NULL,
    date_of_s_back DATE NOT NULL CHECK (return_date >= loan_date),
    date_of_back DATE CHECK (returned_date >= loan_date)
);