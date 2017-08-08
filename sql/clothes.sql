CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

-- Add a new column to the 'clothes' table called 'price'.
ALTER TABLE clothes ADD price INTEGER;

SELECT * FROM clothes;

-- Add values in the new 'price' column for each row.
UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;

SELECT * FROM clothes;

-- Insert a new row which values for each column, including the new 'price' row.
INSERT INTO clothes (type, design, price)
    VALUES ("suitcase", "leather", 40);

SELECT * FROM clothes;
