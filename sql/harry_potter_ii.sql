CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    house TEXT);

INSERT INTO characters (fullname, house) VALUES ("Harry Potter", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Hermione Granger", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Ronald Weasley", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Ginny Weasley", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Hannah Abbott", "Hufflepuff");
INSERT INTO characters (fullname, house) VALUES ("Neville Longbottom", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("George Weasley", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Angelina Johnson", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Draco Malfoy", "Slytherin");
INSERT INTO characters (fullname, house) VALUES ("Astoria Greengrass", "");
INSERT INTO characters (fullname, house) VALUES ("Luna Lovegood", "Ravenclaw");
INSERT INTO characters (fullname, house) VALUES ("Rolf Scamander", "");
INSERT INTO characters (fullname, house) VALUES ("James Potter", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Lily Potter", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Nymphadora Tonks", "Gryffindor");
INSERT INTO characters (fullname, house) VALUES ("Remus Lupin", "Gryffindor");

CREATE table pairings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

SELECT * FROM characters;

INSERT INTO pairings (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (2, 3);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (5, 6);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (7, 8);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (9, 10);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (11, 12);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (13, 14);
INSERT INTO pairings (person1_id, person2_id)
    VALUES (15, 16);

-- Select the 'fullname' from the 'characters' table, based on which character their IDs are paired with in the 'pairings' table.
SELECT a.fullname, b.fullname FROM pairings
    JOIN characters a
    ON pairings.person1_id = a.id
    JOIN characters b
    ON pairings.person2_id = b.id;
