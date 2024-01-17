-- Creates a stored procedure 'ComputeAverageWeightedScoreForUsers' that
-- computes and stores the average weighted score for all students.

-- Drop the stored procedure 'ComputeAverageWeightedScoreForUsers' if it already exists.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

-- Change the delimiter to handle the procedure body correctly.
DELIMITER $$

-- Create the stored procedure 'ComputeAverageWeightedScoreForUsers'.
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    -- Add temporary columns to 'users' table for storing total weighted score and total weight.
    ALTER TABLE users ADD total_weighted_score INT NOT NULL;
    ALTER TABLE users ADD total_weight INT NOT NULL;

    -- Update 'total_weighted_score' in 'users' for each user using a subquery.
    UPDATE users
        SET total_weighted_score = (
            SELECT SUM(corrections.score * projects.weight)
            FROM corrections
                INNER JOIN projects
                    ON corrections.project_id = projects.id
            WHERE corrections.user_id = users.id
        );

    -- Update 'total_weight' in 'users' for each user using a subquery.
    UPDATE users
        SET total_weight = (
            SELECT SUM(projects.weight)
            FROM corrections
                INNER JOIN projects
                    ON corrections.project_id = projects.id
            WHERE corrections.user_id = users.id
        );

    -- Update 'average_score' in 'users' based on the computed average.
    UPDATE users
        SET users.average_score = IF(users.total_weight = 0, 0, users.total_weighted_score / users.total_weight);

    -- Remove the temporary columns from 'users'.
    ALTER TABLE users
        DROP COLUMN total_weighted_score;
    ALTER TABLE users
        DROP COLUMN total_weight;
END $$

-- Reset the delimiter back to semicolon.
DELIMITER ;
