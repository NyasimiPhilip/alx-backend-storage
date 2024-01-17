-- Creates a table with unique users.

-- Drop the table 'users' if it already exists.
DROP TABLE IF EXISTS users;

-- Create a new table 'users' with columns 'id', 'email', and 'name'.
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user
    email VARCHAR(255) NOT NULL UNIQUE, -- Email of the user, cannot be null, and must be unique
    name VARCHAR(255) -- Name of the user, can be null
);
