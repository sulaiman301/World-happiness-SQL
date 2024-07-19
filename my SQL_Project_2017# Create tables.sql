CREATE DATABASE IF NOT EXISTS World_happiness;
USE  World_happiness;

-- Create the users table
CREATE TABLE  Happiness_indicators (
    country_id INT  PRIMARY KEY, -- Primary key
    family Decimal(15,3)  NOT NULL,
    freedom Decimal(15,3) NOT NULL,
    health Decimal(15,3) NOT NULL,
    economy Decimal(15,3) NOT NULL,
    corruption Decimal (15,3) NOT NULL
);

-- Create the orders table
CREATE TABLE countries (
    id INT PRIMARY KEY, -- Primary key
    name VARCHAR(150) NOT NULL UNIQUE, -- Unique constraint
    FOREIGN KEY (id) REFERENCES happiness_indicators(country_id) -- Foreign key constraint
);


