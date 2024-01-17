-- Creates a stored procedure AddBonus that adds a new
-- correction for a student.

-- Drop the stored procedure 'AddBonus' if it already exists.
DROP PROCEDURE IF EXISTS AddBonus;

-- Set the delimiter to $$ for creating the stored procedure body.
DELIMITER $$

-- Create a stored procedure 'AddBonus' with parameters: user_id, project_name, and score.
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
    -- Declare local variables for project_count and project_id.
    DECLARE project_count INT DEFAULT 0;
    DECLARE project_id INT DEFAULT 0;

    -- Check if the project with the specified name exists.
    SELECT COUNT(id)
        INTO project_count
        FROM projects
        WHERE name = project_name;

    -- If the project does not exist, insert a new project with the given name.
    IF project_count = 0 THEN
        INSERT INTO projects(name)
            VALUES(project_name);
    END IF;

    -- Retrieve the project_id for the specified project_name.
    SELECT id
        INTO project_id
        FROM projects
        WHERE name = project_name;

    -- Insert a new correction for the student with the provided user_id, project_id, and score.
    INSERT INTO corrections(user_id, project_id, score)
        VALUES (user_id, project_id, score);
END $$

-- Reset the delimiter to ;
DELIMITER ;
