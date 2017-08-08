CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);

-- Select the names and emails of customers, along with their order's items and prices, such that the customer ID = the orders' customer ID.
SELECT customers.name, customers.email, orders.item, orders.price
    FROM customers
    LEFT OUTER JOIN orders
    ON customers.id = orders.customer_id;

-- Select the above, along with the total amount of money spent on orders and sort by the amount of money spent from most to least.
SELECT customers.name, customers.email, SUM(orders.price)
    FROM customers
    LEFT OUTER JOIN orders
    ON customers.id = orders.customer_id
    GROUP BY customers.name
    ORDER BY SUM(orders.price) DESC;
