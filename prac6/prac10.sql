CREATE DATABASE task_10;



/* номер  1 */
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL
);

CREATE TABLE Wrokers (
    worker_id INT PRIMARY KEY,
    worker_name VARCHAR(255) NOT NULL
);

CREATE TABLE Project_Members (
    project_id INT NOT NULL,
    worker_id INT NOT NULL,
    PRIMARY KEY (project_id, worker_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id)
);
/* Изначальная структура нарушала 1НФ, потому что в каждой ячейке столбце `team_members` могло хранится больше одного значения */


/* номер  2 */

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    client_email VARCHAR(255) NOT NULL
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255) NOT NULL
);
CREATE TABLE EquipmentRentals (
    client_id INT NOT NULL,
    equipment_id INT NOT NULL,
    rental_date DATE NOT NULL,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
/* Изначальная структура нарушала 1НФ, потому что в каждой ячейке столбцах `equipment_name` и `rental_date` могло хранится больше одного значения
Изначальная структура нарушала 2НФ, так как 'client_name' 'client_email' 'equipment_name' и 'rental_date' не полностью зависят от первичного ключа
*/



/* номер  3 */
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
);

CREATE TABLE Grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    assignment_name VARCHAR(100) NOT NULL,
    grade float NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
/* Изначальная структура нарушала 1НФ, потому что в каждой ячейке столбце `assignments_and_grades` могло хранится больше одного значения*/