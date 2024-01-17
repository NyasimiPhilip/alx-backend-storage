-- Creates a view 'need_meeting' that lists all students that have a score
-- under 80 (strict) and no last_meeting or more than 1 month.

-- Drop the view 'need_meeting' if it already exists.
DROP VIEW IF EXISTS need_meeting;

-- Create a view 'need_meeting'.
CREATE VIEW need_meeting AS
    -- Select the 'name' column from the 'students' table where conditions are met.
    SELECT name
        FROM students
        WHERE score < 80 AND
            (
                -- Include students with no 'last_meeting'.
                last_meeting IS NULL
                -- Include students with 'last_meeting' more than 1 month ago.
                OR last_meeting < SUBDATE(CURRENT_DATE(), INTERVAL 1 MONTH)
            );
