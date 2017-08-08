CREATE TABLE game (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    score INTEGER,
    level INTEGER);

INSERT INTO game (name, score, level)
VALUES ("Red", 13193, 20);
INSERT INTO game (name, score, level)
VALUES ("Chuck", 12856, 19);
INSERT INTO game (name, score, level)
VALUES ("Bomb", 10553, 5);
INSERT INTO game (name, score, level)
VALUES ("Matilda", 17246, 18);

SELECT * FROM game;

-- Update the 'score' of the row that contains the 'id' of 1 in the 'game' table.
UPDATE game SET score = 13201 WHERE id = 1;

SELECT * FROM game;

-- Delete the row that contains the 'id' of 3.
DELETE FROM game WHERE id = 3;

SELECT * FROM game;
