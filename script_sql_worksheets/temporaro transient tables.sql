CREATE OR REPLACE DATABASE TTDB;
USE DATABASE TTDB;

CREATE OR REPLACE TEMPORARY TABLE temp_sales (
    id INT,
    product STRING,
    amount NUMBER
);

CREATE OR REPLACE TRANSIENT TABLE stage_sales (
    id INT,
    product STRING,
    amount NUMBER
);

SHOW TABLES;

INSERT INTO temp_sales (id, product, amount) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.50),
(3, 'Tablet', 450.75),
(4, 'Monitor', 300.00),
(5, 'Keyboard', 49.99);


INSERT INTO stage_sales (id, product, amount) VALUES
(101, 'Headphones', 199.99),
(102, 'Smartwatch', 249.50),
(103, 'Camera', 799.00),
(104, 'Gaming Console', 499.99),
(105, 'Wireless Mouse', 29.95);


CREATE OR REPLACE TRANSIENT SCHEMA TTDB.stage_sales_schema;