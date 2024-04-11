// CREATE DB
CREATE DATABASE GYM;
USE GYM;

// CREATE Tables
CREATE TABLE customers (
    id INT(11) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    password VARCHAR(255),
    username VARCHAR(255),
    gender VARCHAR(10),
    weight VARCHAR(20),
    dob DATE,
    monthly_plan INT(11),
    nic VARCHAR(20),
    is_active TINYINT(1),
    salt VARCHAR(255),
    address VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE transactions (
    id INT(11) NOT NULL,
    created_date DATE,
    amount INT,
    transaction_number VARCHAR(255),
    bank_name VARCHAR(255),
    account_owner_name VARCHAR(255),
    fk_customer_id INT,
    status BOOLEAN,
    PRIMARY KEY (id)
);
CREATE TABLE employees (
    id INT(11) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    designation VARCHAR(255),
    nic_number VARCHAR(255),
    salary INT,
    gender VARCHAR(255),
    phone_number VARCHAR(255),
    joining_date DATE,
    username VARCHAR(255),
    password VARCHAR(255),
    salt VARCHAR(255),
    access INT,
    email VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE expenses (
    id INT(11) NOT NULL,
    description VARCHAR(255),
    created_date DATE,
    amount INT,
    month VARCHAR(255),
    year VARCHAR(255),
    fk_employee_id INT,
    selected_date DATE,
    PRIMARY KEY (id)
);
CREATE TABLE queries (
    id INT(11) NOT NULL,
    heading VARCHAR(255),
    email VARCHAR(255),
    description TEXT,
    created_date DATE,
    username VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE bmi (
    id INT(11) NOT NULL,
    weight DOUBLE,
    recorded_date DATE,
    fk_customer_id INT,
    recorded_month VARCHAR(255),
    height DOUBLE,
    bmi_value DOUBLE,
    PRIMARY KEY (id)
);
CREATE TABLE revenues (
    id INT(11) NOT NULL,
    for_month VARCHAR(255),
    for_year VARCHAR(255),
    updated_date DATE,
    amount INT,
    PRIMARY KEY (id)
);
// ALTER TABLES WITH STATUS
ALTER TABLE customers
ADD COLUMN current_status BOOLEAN DEFAULT true;

ALTER TABLE employees
ADD COLUMN current_status BOOLEAN DEFAULT true;

ALTER TABLE expenses
ADD COLUMN current_status BOOLEAN DEFAULT true;

// CREATE STORED PROCEDURED
DELIMITER //

CREATE PROCEDURE delete_data (
    IN tableName VARCHAR(255),
    IN rowId INT
)
BEGIN
    SET @sql = CONCAT('DELETE FROM ', tableName, ' WHERE id = ', rowId);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
