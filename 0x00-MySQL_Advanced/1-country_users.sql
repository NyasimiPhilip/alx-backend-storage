-- Creates a table with unique users.

-- Drop the table 'users' if it already exists.
DROP TABLE IF EXISTS users;

-- Create a new table 'users' with columns 'id', 'email', 'name', and 'country'.
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user
    email VARCHAR(255) NOT NULL UNIQUE, -- Email of the user, cannot be null, and must be unique
    name VARCHAR(255), -- Name of the user, can be null
    country CHAR(2) NOT NULL DEFAULT 'US' CHECK (country IN ('US', 'CO', 'TN')) -- Country code of the user, cannot be null, defaults to 'US', and must be one of ('US', 'CO', 'TN')
);
