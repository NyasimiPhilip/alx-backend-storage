-- Creates a trigger that resets the attribute valid_email
-- only when the email has been changed.

-- Drop the trigger 'validate_email' if it already exists.
DROP TRIGGER IF EXISTS validate_email;

-- Set the delimiter to $$ for creating the trigger body.
DELIMITER $$

-- Create a trigger 'validate_email' that fires before updating a row in the 'users' table.
CREATE TRIGGER validate_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has been changed.
    IF OLD.email != NEW.email THEN
        -- If email has been changed, set valid_email to 0.
        SET NEW.valid_email = 0;
    ELSE
        -- If email remains the same, retain the current value of valid_email.
        SET NEW.valid_email = NEW.valid_email;
    END IF;
END $$

-- Reset the delimiter to ;
DELIMITER ;
