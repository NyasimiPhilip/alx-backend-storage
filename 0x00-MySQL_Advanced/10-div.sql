-- Creates a function SafeDiv that divides (and returns) the first
-- by the second number or returns 0 if the second number is equal to 0.

-- Drop the function 'SafeDiv' if it already exists.
DROP FUNCTION IF EXISTS SafeDiv;

-- Set the delimiter to $$ for creating the function body.
DELIMITER $$

-- Create a function 'SafeDiv' with two parameters (a and b) and a return type of FLOAT.
CREATE FUNCTION SafeDiv (a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    -- Declare a local variable 'result' with a default value of 0.
    DECLARE result FLOAT DEFAULT 0;

    -- Check if the second number (b) is not equal to 0 to avoid division by zero.
    IF b != 0 THEN
        -- If b is not 0, calculate the division and set the result.
        SET result = a / b;
    END IF;

    -- Return the calculated result.
    RETURN result;
END $$

-- Reset the delimiter to ;
DELIMITER ;
