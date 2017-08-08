CREATE TABLE marvels (ID INTEGER PRIMARY KEY,
    name TEXT,
    popularity INTEGER,
    alignment TEXT,
    gender TEXT, 
    height_m NUMERIC,
    weight_kg NUMERIC,
    hometown TEXT,
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);
    
INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4); 
INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4); 
INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 6, 7, 3, 7, 5, 4); 
INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Norway", 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, "Jean Greay", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);
INSERT INTO marvels VALUES(13, "Storm", 2, "Good", "Female", 1.78, 75.75, "Wakanda", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(14, "Emma Frost", 12, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(15, "Kitty Pryde", 13, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(16, "Daredevil", 14, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(17, "Carol Danvers", 15, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(18, "Scarlet Witch", 21, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(19, "Black Widow", 22, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(20, "She-Hulk", 25, "Good", "Female", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);

-- Calculate statistics of characters' attributes.
SELECT AVG(popularity), AVG(height_m), AVG(weight_kg), AVG(intelligence), AVG(strength), AVG(speed), AVG(durability), AVG(energy_Projection), AVG(fighting_Skills) FROM marvels;

SELECT MAX(popularity), MAX(height_m), MAX(weight_kg), MAX(intelligence), MAX(strength), MAX(speed), MAX(durability), MAX(energy_Projection), MAX(fighting_Skills) FROM marvels;

SELECT MIN(popularity), MIN(height_m), MIN(weight_kg), MIN(intelligence), MIN(strength), MIN(speed), MIN(durability), MIN(energy_Projection), MIN(fighting_Skills) FROM marvels;

-- Group characters that have high fighting_skills.
SELECT name, energy_Projection FROM marvels
GROUP BY hometown
HAVING fighting_skills > 5;

-- Group characters by a new column, brains_or_brawn.
SELECT COUNT(*),
    CASE
        WHEN intelligence > strength THEN "brains"
        WHEN intelligence < strength THEN "brawn"
        WHEN intelligence = strength THEN "both"
    END AS "brains_or_brawn"
    FROM marvels
GROUP BY brains_or_brawn;

-- Select characters that are good and high in popularity.
SELECT * FROM marvels
    WHERE alignment = "Good" AND popularity < 10;
