-- Creates a stored procedure ComputeAverageScoreForUser that
-- computes and stores the average score for a student.

-- Drop the stored procedure 'ComputeAverageScoreForUser' if it already exists.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

-- Set the delimiter to $$ for creating the stored procedure body.
DELIMITER $$

-- Create a stored procedure 'ComputeAverageScoreForUser' with a parameter: user_id.
CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
    -- Declare local variables for total_score and projects_count.
    DECLARE total_score INT DEFAULT 0;
    DECLARE projects_count INT DEFAULT 0;

    -- Calculate the total score for the specified user_id.
    SELECT SUM(score)
        INTO total_score
        FROM corrections
        WHERE corrections.user_id = user_id;

    -- Count the number of projects for the specified user_id.
    SELECT COUNT(*)
        INTO projects_count
        FROM corrections
        WHERE corrections.user_id = user_id;

    -- Update the average_score for the specified user_id in the 'users' table.
    UPDATE users
        SET users.average_score = IF(projects_count = 0, 0, total_score / projects_count)
        WHERE users.id = user_id;
END $$

-- Reset the delimiter to ;
DELIMITER ;
