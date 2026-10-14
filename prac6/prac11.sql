CREATE DATABASE task_11;



/* номер 1 */
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_city VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_name VARCHAR(255),
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);
/*транзитивные связи: 'publisher_name' и 'publisher_city' зависели от 'publisher_id'*/



/* номер 2 */
CREATE TABLE CarModels (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100) NOT NULL
);

CREATE TABLE RaceResults (
    race_id INT NOT NULL,
    driver_id INT NOT NULL,
    car_model VARCHAR(100) NOT NULL,
    finish_time TIME NOT NULL,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);
/*атрибут 'car_manufacturer' зависел от 'car_model', а не от первичного ключа*/



/* номер 3 */
CREATE TABLE EventTypeRooms (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);

CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (event_type) REFERENCES EventTypeRooms(event_type)
);

CREATE TABLE RoomBookings (
    booking_time TIMESTAMP NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name) REFERENCES Events(event_name)
);
/*'event_type' не является суперключом, но при этом определяет 'room_name'*/