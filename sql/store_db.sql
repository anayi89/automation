CREATE TABLE mystore(id INTEGER PRIMARY KEY, clothing TEXT, quantity INTEGER, size TEXT, price INTEGER);

INSERT INTO mystore VALUES(1, "children's sneakers", 10, "small", 30);
INSERT INTO mystore VALUES(2, "women's sneakers", 10, "medium", 30);
INSERT INTO mystore VALUES(3, "men's sneakers", 10, "large", 30);
INSERT INTO mystore VALUES(4, "children's socks", 50, "small", 5);
INSERT INTO mystore VALUES(5, "women's socks", 50, "medium", 1);
INSERT INTO mystore VALUES(6, "men's socks", 100, "large", 50);
INSERT INTO mystore VALUES(7, "children's pants", 50, "small", 5);
INSERT INTO mystore VALUES(8, "women's pants", 50, "medium", 1);
INSERT INTO mystore VALUES(9, "men's pants", 100, "large", 50);
INSERT INTO mystore VALUES(10, "children's shirts", 50, "small", 5);
INSERT INTO mystore VALUES(11, "women's shirts", 50, "medium", 1);
INSERT INTO mystore VALUES(12, "men's shirts", 100, "large", 50);
INSERT INTO mystore VALUES(13, "children's hats", 50, "small", 5);
INSERT INTO mystore VALUES(14, "women's hats", 50, "medium", 1);
INSERT INTO mystore VALUES(15, "men's hats", 100, "large", 50);

-- show all of the items
SELECT * FROM mystore;

-- sort all of the items by price
SELECT * FROM mystore ORDER BY price;

-- show the highest price in the database
SELECT MAX(price) FROM mystore;
