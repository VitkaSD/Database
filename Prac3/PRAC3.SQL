
/*Задание 1*/
SELECT * FROM readers;


/*Задание 2*/
SELECT b_title, b_pub_year FROM books;


/*Задание 3*/
SELECT b_title, b_pub_year from books
WHERE b_pub_year BETWEEN 1799 AND 1900;
/*Задание 4*/
SELECT b_title, b_pub_year from books
WHERE b_pub_year >=1917 AND b_pub_year <= 1991;
/*Задание 5*/
SELECT * from readers
WHERE r_number = '+7-946-356-35-38';
/*Задание 6*/
SELECT * from readers
WHERE r_name LIKE '%лав%';
/*Задание 7*/
SELECT * from control
WHERE date_of_back IS NULL;
/*Задание 8*/
SELECT * from books
ORDER BY b_title;

/*Задание 9*/
SELECT * from control
WHERE date_of_back is NULL
ORDER BY date_of_s_back ASC;
/*Задание 10*/
SELECT * from books
ORDER BY b_pub_year ASC
LIMIT 3;

SELECT * from books
ORDER BY b_pub_year DESC
LIMIT 3;

SELECT * from books
ORDER BY b_title ASC
LIMIT 3;