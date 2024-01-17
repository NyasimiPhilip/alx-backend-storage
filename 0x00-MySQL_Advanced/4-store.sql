-- Creates a trigger that decreases the quantity
-- of an item after adding a new order.

-- Drop the trigger 'reduce_quantity' if it already exists.
DROP TRIGGER IF EXISTS reduce_quantity;

-- Set the delimiter to $$ for creating the trigger body.
DELIMITER $$

-- Create a trigger 'reduce_quantity' that fires after inserting a new row into the 'orders' table.
CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the 'items' table, decreasing the quantity based on the newly inserted order.
    UPDATE items
        SET quantity = quantity - NEW.number
        WHERE name = NEW.item_name;
END $$

-- Reset the delimiter to ;
DELIMITER ;
