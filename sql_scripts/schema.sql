USE etl_db;
SHOW TABLES;
CREATE TABLE retail_orders (
	order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(20),
    segment varchar(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price DECIMAL(7,2),
    profit DECIMAL(7,2)
);

SELECT * FROM retail_orders;