-- creates a stored procedure 'ComputeAverageWeightedScoreForUser' that
-- computes and stores the average weighted score for a student.

-- Drop the stored procedure 'ComputeAverageWeightedScoreForUser' if it already exists.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Change the delimiter to handle the procedure body correctly.
DELIMITER $$

-- Create the stored procedure 'ComputeAverageWeightedScoreForUser'.
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
    -- Declare variables to store the total weighted score and total weight.
    DECLARE total_weighted_score INT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;

    -- Calculate the total weighted score by joining 'corrections' and 'projects' tables.
    SELECT SUM(corrections.score * projects.weight)
        INTO total_weighted_score
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    -- Calculate the total weight by joining 'corrections' and 'projects' tables.
    SELECT SUM(projects.weight)
        INTO total_weight
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    -- Check if the total weight is zero to avoid division by zero.
    IF total_weight = 0 THEN
        -- Update the 'average_score' in the 'users' table to 0.
        UPDATE users
            SET users.average_score = 0
            WHERE users.id = user_id;
    ELSE
        -- Update the 'average_score' in the 'users' table with the computed average.
        UPDATE users
            SET users.average_score = total_weighted_score / total_weight
            WHERE users.id = user_id;
    END IF;
END $$

-- Reset the delimiter back to semicolon.
DELIMITER ;
