CREATE DATABASE anti_cafe;

CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL UNIQUE,
    b_address VARCHAR(255) NOT NULL,
    phone_n VARCHAR(13) NOT NULL,
    opening_time TIME NOT NULL,
    closing_time TIME NOT NULL
);

CREATE TABLE room_types (
    room_type_id SERIAL PRIMARY KEY,
    room_type_name VARCHAR(255) NOT NULL UNIQUE,
    capacity INTEGER NOT NULL CHECK (capacity > 0)
);

CREATE TABLE tariffs (
    tariff_id SERIAL PRIMARY KEY,
    room_type_id SERIAL NOT NULL,
    tariff_name VARCHAR(255) NOT NULL,
    duration_min INTEGER NOT NULL CHECK (duration_min > 0),
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (room_type_id) REFERENCES room_types(room_type_id)
);

CREATE TABLE menu_items (
    menu_item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL UNIQUE,
    category VARCHAR(255) NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    is_available BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    birth_date DATE,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    loyalty_points INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    branch_id SERIAL NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    speciality VARCHAR(255) NOT NULL,
    phone_n VARCHAR(13) NOT NULL,
    email VARCHAR(255) UNIQUE,
    hire_date DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    branch_id SERIAL NOT NULL,
    room_type_id SERIAL NOT NULL,
    tariff_id SERIAL NOT NULL,
    employee_id SERIAL NOT NULL,
    opened_at TIMESTAMP NOT NULL,
    closed_at TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    total_amount NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (total_amount >= 0),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
    FOREIGN KEY (room_type_id) REFERENCES room_types(room_type_id),
    FOREIGN KEY (tariff_id) REFERENCES tariffs(tariff_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
);

CREATE TABLE order_clients (
    order_id SERIAL NOT NULL,
    client_id SERIAL NOT NULL,
    is_responsible BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (order_id, client_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE order_menu_items (
    order_id SERIAL NOT NULL,
    menu_item_id SERIAL NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(menu_item_id)
);