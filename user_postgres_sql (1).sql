-- Connect to the `hplus` database before running this
-- (In pgAdmin, right-click Databases → Create → hplus)

-- Drop the table if it already exists
DROP TABLE IF EXISTS "user";

-- Create the table
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    activity VARCHAR(100),
    gender VARCHAR(50)
);

-- Insert data into the table
INSERT INTO "user" (id, username, password, first_name, last_name, date_of_birth, activity, gender) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '2000-01-03', 'gym', 'MALE'),
(2, 'admin1', 'admin1', 'admin1', 'admin1', '1985-08-23', 'sport', 'FEMALE');

SELECT * FROM "user";
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
