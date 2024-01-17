  <h2>Task 0: We are all unique!</h2>
    <p>Write a SQL script that creates a table users following these requirements:</p>
    <ul>
        <li>id, integer, never null, auto increment and primary key</li>
        <li>email, string (255 characters), never null and unique</li>
        <li>name, string (255 characters)</li>
    </ul>
    <p>If the table already exists, your script should not fail.</p>
    <p>Your script can be executed on any database.</p>
    <p>Context: Making an attribute unique directly in the table schema will enforce your business rules and avoid bugs in your application.</p>
    <pre>
        bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
        Enter password: 
        ERROR 1146 (42S02) at line 1: Table 'holberton.users' doesn't exist
        bob@dylan:~$ 
        bob@dylan:~$ cat 0-uniq_users.sql | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");' | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("sylvie@dylan.com", "Sylvie");' | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Jean");' | mysql -uroot -p holberton
        Enter password: 
        ERROR 1062 (23000) at line 1: Duplicate entry 'bob@dylan.com' for key 'email'
        bob@dylan:~$ 
        bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
        Enter password: 
        id  email   name
        1   bob@dylan.com   Bob
        2   sylvie@dylan.com    Sylvie
    </pre>
    <p>Solution: <code>0-uniq_users.sql</code></p>
     <h2>Task 1: In and not out</h2>
    <p>Write a SQL script that creates a table users following these requirements:</p>
    <ul>
        <li>id, integer, never null, auto increment and primary key</li>
        <li>email, string (255 characters), never null and unique</li>
        <li>name, string (255 characters)</li>
        <li>country, enumeration of countries: US, CO, and TN, never null (= default will be the first element of the enumeration, here US)</li>
    </ul>
    <p>If the table already exists, your script should not fail.</p>
    <p>Your script can be executed on any database.</p>
    <pre>
        bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
        Enter password: 
        ERROR 1146 (42S02) at line 1: Table 'holberton.users' doesn't exist
        bob@dylan:~$ 
        bob@dylan:~$ cat 1-country_users.sql | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("bob@dylan.com", "Bob", "US");' | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("sylvie@dylan.com", "Sylvie", "CO");' | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ echo 'INSERT INTO users (email, name, country) VALUES ("jean@dylan.com", "Jean", "FR");' | mysql -uroot -p holberton
        Enter password: 
        ERROR 1265 (01000) at line 1: Data truncated for column 'country' at row 1
        bob@dylan:~$ 
        bob@dylan:~$ echo 'INSERT INTO users (email, name) VALUES ("john@dylan.com", "John");' | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ echo "SELECT * FROM users;" | mysql -uroot -p holberton
        Enter password: 
        id  email   name    country
        1   bob@dylan.com   Bob US
        2   sylvie@dylan.com    Sylvie  CO
        3   john@dylan.com  John    US
    </pre>
    <p>Solution: <code>1-country_users.sql</code></p>
    <h2>Task 2: Best band ever</h2>
    <p>Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans</p>
    <ul>
        <li>Requirements:</li>
        <li>Import this table dump: <code>metal_bands.sql.zip</code></li>
        <li>Column names must be: <code>origin</code> and <code>nb_fans</code></li>
        <li>Your script can be executed on any database</li>
        <li>Context: Calculate/compute something is always power intensive… better to distribute the load!</li>
    </ul>
    <pre>
        bob@dylan:~$ cat metal_bands.sql | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 2-fans.sql | mysql -uroot -p holberton > tmp_res ; head tmp_res
        Enter password: 
        origin  nb_fans
        USA 99349
        Sweden  47169
        Finland 32878
        United Kingdom  32518
        Germany 29486
        Norway  22405
        Canada  8874
        The Netherlands 8819
        Italy   7178
    </pre>
    <p>Solution: <code>2-fans.sql</code></p>
    <h2>Task 3: Old school band</h2>
    <p>Write a SQL script that lists all bands with Glam rock as their main style, ranked by their longevity</p>
    <ul>
        <li>Requirements:</li>
        <li>Import this table dump: <code>metal_bands.sql.zip</code></li>
        <li>Column names must be: <code>band_name</code> and <code>lifespan</code> (in years)</li>
        <li>You should use attributes formed and split for computing the lifespan</li>
        <li>Your script can be executed on any database</li>
    </ul>
    <pre>
        bob@dylan:~$ cat metal_bands.sql | mysql -uroot -p holberton
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 3-glam_rock.sql | mysql -uroot -p holberton 
        Enter password: 
        band_name   lifespan
        Alice Cooper    56
        Mötley Crüe   34
        Marilyn Manson  31
        The 69 Eyes 30
        Hardcore Superstar  23
        Nasty Idols 0
        Hanoi Rocks 0
    </pre>
    <p>Solution: <code>3-glam_rock.sql</code></p>
    <h2>4. Buy buy buy</h2>
    <p>Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order.</p>
    <p>Quantity in the table items can be negative.</p>
    <p>Context: Updating multiple tables for one action from your application can generate issues: network disconnection, crash, etc… to keep your data in good shape, let MySQL do it for you!</p>
    <pre>
        bob@dylan:~$ cat 4-init.sql
        -- Initial
        DROP TABLE IF EXISTS items;
        DROP TABLE IF EXISTS orders;
        CREATE TABLE IF NOT EXISTS items (
            name VARCHAR(255) NOT NULL,
            quantity int NOT NULL DEFAULT 10
        );
        CREATE TABLE IF NOT EXISTS orders (
            item_name VARCHAR(255) NOT NULL,
            number int NOT NULL
        );
        INSERT INTO items (name) VALUES ("apple"), ("pineapple"), ("pear");
        bob@dylan:~$ 
        bob@dylan:~$ cat 4-init.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 4-store.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 4-main.sql
        Enter password: 
        -- Show and add orders
        SELECT * FROM items;
        SELECT * FROM orders;
        INSERT INTO orders (item_name, number) VALUES ('apple', 1);
        INSERT INTO orders (item_name, number) VALUES ('apple', 3);
        INSERT INTO orders (item_name, number) VALUES ('pear', 2);
        SELECT "--";
        SELECT * FROM items;
        SELECT * FROM orders;
        bob@dylan:~$ 
        bob@dylan:~$ cat 4-main.sql | mysql -uroot -p holberton 
        Enter password: 
        name    quantity
        apple   10
        pineapple   10
        pear    10
        --
        --
        name    quantity
        apple   6
        pineapple   10
        pear    8
        item_name   number
        apple   1
        apple   3
        pear    2
    </pre>
    <p>Solution: <code>4-store.sql</code></p>
    <h2>5. Email validation to sent</h2>
    <p>Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.</p>
    <p>Context: Nothing related to MySQL, but perfect for user email validation - distribute the logic to the database itself!</p>
    <pre>
        bob@dylan:~$ cat 5-init.sql
        -- Initial
        DROP TABLE IF EXISTS users;
        CREATE TABLE IF NOT EXISTS users (
            id int not null AUTO_INCREMENT,
            email varchar(255) not null,
            name varchar(255),
            valid_email boolean not null default 0,
            PRIMARY KEY (id)
        );
        INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");
        INSERT INTO users (email, name, valid_email) VALUES ("sylvie@dylan.com", "Sylvie", 1);
        INSERT INTO users (email, name, valid_email) VALUES ("jeanne@dylan.com", "Jeanne", 1);
        bob@dylan:~$ 
        bob@dylan:~$ cat 5-init.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 5-valid_email.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 5-main.sql
        Enter password: 
        -- Show users and update (or not) email
        SELECT * FROM users;
        UPDATE users SET valid_email = 1 WHERE email = "bob@dylan.com";
        UPDATE users SET email = "sylvie+new@dylan.com" WHERE email = "sylvie@dylan.com";
        UPDATE users SET name = "Jannis" WHERE email = "jeanne@dylan.com";
        SELECT "--";
        SELECT * FROM users;
        UPDATE users SET email = "bob@dylan.com" WHERE email = "bob@dylan.com";
        SELECT "--";
        SELECT * FROM users;
        bob@dylan:~$ 
        bob@dylan:~$ cat 5-main.sql | mysql -uroot -p holberton 
        Enter password: 
        id  email   name    valid_email
        1   bob@dylan.com   Bob 0
        2   sylvie@dylan.com    Sylvie  1
        3   jeanne@dylan.com    Jeanne  1
        --
        --
        id  email   name    valid_email
        1   bob@dylan.com   Bob 1
        2   sylvie+new@dylan.com    Sylvie  0
        3   jeanne@dylan.com    Jannis  1
        --
        --
        id  email   name    valid_email
        1   bob@dylan.com   Bob 1
        2   sylvie+new@dylan.com    Sylvie  0
        3   jeanne@dylan.com    Jannis  1
    </pre>
    <p>Solution: <code>5-valid_email.sql</code></p>
    <h2>6. Add bonus</h2>
    <p>Write a SQL script that creates a stored procedure AddBonus that adds a new correction for a student.</p>
    <p>Requirements:</p>
    <ul>
        <li>Procedure AddBonus is taking 3 inputs (in this order):</li>
        <ul>
            <li>user_id, a users.id value (you can assume user_id is linked to an existing users)</li>
            <li>project_name, a new or already exists projects - if no projects.name found in the table, you should create it</li>
            <li>score, the score value for the correction</li>
        </ul>
        <li>Context: Write code in SQL is a nice level up!</li>
    </ul>
    <pre>
        bob@dylan:~$ cat 6-init.sql
        -- Initial
        DROP TABLE IF EXISTS corrections;
        DROP TABLE IF EXISTS users;
        DROP TABLE IF EXISTS projects;
        CREATE TABLE IF NOT EXISTS users (
            id int not null AUTO_INCREMENT,
            name varchar(255) not null,
            average_score float default 0,
            PRIMARY KEY (id)
        );
        CREATE TABLE IF NOT EXISTS projects (
            id int not null AUTO_INCREMENT,
            name varchar(255) not null,
            PRIMARY KEY (id)
        );
        CREATE TABLE IF NOT EXISTS corrections (
            user_id int not null,
            project_id int not null,
            score int default 0,
            KEY `user_id` (`user_id`),
            KEY `project_id` (`project_id`),
            CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
            CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
        );
        INSERT INTO users (name) VALUES ("Bob");
        SET @user_bob = LAST_INSERT_ID();
        INSERT INTO users (name) VALUES ("Jeanne");
        SET @user_jeanne = LAST_INSERT_ID();
        INSERT INTO projects (name) VALUES ("C is fun");
        SET @project_c = LAST_INSERT_ID();
        INSERT INTO projects (name) VALUES ("Python is cool");
        SET @project_py = LAST_INSERT_ID();
        INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_c, 80);
        INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_py, 96);
        INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_c, 91);
        INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_py, 73);
        bob@dylan:~$ 
        bob@dylan:~$ cat 6-init.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 6-bonus.sql | mysql -uroot -p holberton 
        Enter password: 
        bob@dylan:~$ 
        bob@dylan:~$ cat 6-main.sql
        Enter password: 
        -- Show and add bonus correction
        SELECT * FROM projects;
        SELECT * FROM corrections;
        SELECT "--";
        CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "Python is cool", 100);
        CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "Bonus project", 100);
        CALL AddBonus((SELECT id FROM users WHERE name = "Bob"), "Bonus project", 10);
        CALL AddBonus((SELECT id FROM users WHERE name = "Jeanne"), "New bonus", 90);
        SELECT "--";
        SELECT * FROM projects;
        SELECT * FROM corrections;
        bob@dylan:~$ 
        bob@dylan:~$ cat 6-main.sql | mysql -uroot -p holberton 
        Enter password: 
        id  name
        1   C is fun
        2   Python is cool
        user_id project_id  score
        1   1   80
        1   2   96
        2   1   91
        2   2   73
        --
        --
        --
        --
        id  name
        1   C is fun
        2   Python is cool
        3   Bonus project
        4   New bonus
        user_id project_id  score
        1   1   80
        1   2   96
        2   1   91
        2   2   73
        2   2   100
        2   3   100
        1   3   10
        2   4   90
    </pre>
    <p>Solution: <code>6-bonus.sql</code></p>
    <h2>7. Average Score</h2>
<p>Write a SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and stores the average score for a student. Note: An average score can be a decimal</p>

<h3>Requirements:</h3>
<p>Procedure ComputeAverageScoreForUser is taking 1 input:
    <strong>user_id</strong>, a users.id value (you can assume user_id is linked to an existing users)
</p>

<pre>
<code>
-- Initial
DROP TABLE IF EXISTS corrections;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    average_score float default 0,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS projects (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS corrections (
    user_id int not null,
    project_id int not null,
    score int default 0,
    KEY `user_id` (`user_id`),
    KEY `project_id` (`project_id`),
    CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
);

INSERT INTO users (name) VALUES ("Bob");
SET @user_bob = LAST_INSERT_ID();

INSERT INTO users (name) VALUES ("Jeanne");
SET @user_jeanne = LAST_INSERT_ID();

INSERT INTO projects (name) VALUES ("C is fun");
SET @project_c = LAST_INSERT_ID();

INSERT INTO projects (name) VALUES ("Python is cool");
SET @project_py = LAST_INSERT_ID();


INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_c, 80);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_py, 96);

INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_c, 91);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_py, 73);
</code>
</pre>

<p><strong>Solution:</strong> 7-average_score.sql</p>

<h2>8. Optimize simple search</h2>
<p>Write a SQL script that creates an index idx_name_first on the table names and the first letter of name.</p>

<h3>Requirements:</h3>
<p>Import this table dump: names.sql.zip
    Only the first letter of name must be indexed
    Context: Index is not the solution for any performance issue, but well used, it’s really powerful!
</p>

<pre>
<code>
-- Index My Names
CREATE INDEX idx_name_first ON names (SUBSTRING(name, 1, 1));
</code>
</pre>

<p><strong>Solution:</strong> 8-index_my_names.sql</p>

<h2>9. Optimize search and score</h2>
<p>Write a SQL script that creates an index idx_name_first_score on the table names and the first letter of name and the score.</p>

<h3>Requirements:</h3>
<p>Import this table dump: names.sql.zip
    Only the first letter of name AND score must be indexed
</p>

<pre>
<code>
-- Index Name and Score
CREATE INDEX idx_name_first_score ON names (SUBSTRING(name, 1, 1), score);
</code>
</pre>

<p><strong>Solution:</strong> 9-index_name_score.sql</p>

<h2>10. Safe divide</h2>
<p>Write a SQL script that creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.</p>

<h3>Requirements:</h3>
<p>You must create a function
    The function SafeDiv takes 2 arguments:
    <strong>a</strong>, INT
    <strong>b</strong>, INT
    And returns a / b or 0 if b == 0
</p>

<pre>
<code>
-- Safe Divide Function
DELIMITER //
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
END //
DELIMITER ;
</code>
</pre>

<p><strong>Solution:</strong> 10-div.sql</p>

<h2>11. No table for a meeting</h2>
<p>Write a SQL script that creates a view need_meeting that lists all students that have a score under 80 (strict) and no last_meeting or more than 1 month.</p>

<h3>Requirements:</h3>
<p>The view need_meeting should return all students name when:
    They score are under (strict) to 80
    AND no last_meeting date OR more than a month
</p>

<pre>
<code>
-- Need Meeting View
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80 AND (last_meeting IS NULL OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH));
</code>
</pre>

<p><strong>Solution:</strong> 11-need_meeting.sql</p>
<h2>12. Average Weighted Score</h2>
<p>Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and stores the average weighted score for a student.</p>

<h3>Requirements:</h3>
<p>Procedure ComputeAverageScoreForUser is taking 1 input:
    <strong>user_id</strong>, a users.id value (you can assume user_id is linked to an existing users)
</p>
<p><strong>Tips:</strong> Calculate-Weighted-Average</p>

<pre>
<code>
-- Average Weighted Score
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;
    
    SELECT SUM(c.score * p.weight), SUM(p.weight)
    INTO total_score, total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;
    
    IF total_weight > 0 THEN
        UPDATE users
        SET average_score = total_score / total_weight
        WHERE id = user_id;
    ELSE
        UPDATE users
        SET average_score = 0
        WHERE id = user_id;
    END IF;
END //
DELIMITER ;
</code>
</pre>

<p><strong>Solution:</strong> 100-average_weighted_score.sql</p>

<h2>13. Average Weighted Score for All</h2>
<p>Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and stores the average weighted score for all students.</p>

<h3>Requirements:</h3>
<p>Procedure ComputeAverageWeightedScoreForUsers is not taking any input.</p>
<p><strong>Tips:</strong> Calculate-Weighted-Average</p>

<pre>
<code>
-- Average Weighted Score for All
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id_var INT;
    
    DECLARE user_cursor CURSOR FOR
    SELECT id FROM users;
    
    OPEN user_cursor;
    
    user_loop: LOOP
        FETCH user_cursor INTO user_id_var;
        IF user_id_var IS NULL THEN
            LEAVE user_loop;
        END IF;
        
        CALL ComputeAverageWeightedScoreForUser(user_id_var);
    END LOOP;
    
    CLOSE user_cursor;
END //
DELIMITER ;
</code>
</pre>

<p><strong>Solution:</strong> 101-average_weighted_score.sql</p>
    



