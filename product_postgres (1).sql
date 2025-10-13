-- Create database (PostgreSQL does not support IF NOT EXISTS here inside a SQL script)
-- You must create the database first using pgAdmin or CLI

-- Assuming you're already connected to `hplus` or `postgres` database:

-- Drop table if exists
DROP TABLE IF EXISTS product;

-- Create table
CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    image_path VARCHAR(100)
);

-- Insert data
INSERT INTO product (id, name, image_path) VALUES 
(1, 'mineralwater-blueberry', 'images/mineralwater-blueberry.jpg'),
(2, 'mineralwater-lemonlime', 'images/mineralwater-lemonlime.jpg'),
(3, 'mineralwater-orange', 'images/mineralwater-orange.jpg'),
(4, 'mineralwater-peach', 'images/mineralwater-peach.jpg'),
(5, 'mineralwater-raspberry', 'images/mineralwater-raspberry.jpg'),
(6, 'mineralwater-strawberry', 'images/mineralwater-strawberry.jpg'),
(7, 'proteinbar-chocolate', 'images/proteinbar-chocolate.jpg'),
(8, 'proteinbar-lemon', 'images/proteinbar-lemon.jpg'),
(9, 'proteinbar-peanutbutter', 'images/proteinbar-peanutbutter.jpg'),
(10, 'vitamin-a', 'images/vitamin-a.jpg'),
(11, 'vitamin-bcomplex', 'images/vitamin-bcomplex.jpg'),
(12, 'vitamin-calcium', 'images/vitamin-c.jpg');

SELECT * FROM product;

