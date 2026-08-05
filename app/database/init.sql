CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    price NUMERIC(12,2),
    description TEXT
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer VARCHAR(100),
    total NUMERIC(12,2),
    status VARCHAR(50)
);

INSERT INTO products (name, category, price, description)
VALUES
('Dell XPS 15','Laptop',2450000,'15-inch Intel Core Ultra laptop'),
('Samsung Galaxy S25','Phone',1180000,'Flagship Android smartphone'),
('Apple Watch Ultra','Wearable',980000,'Premium smartwatch'),
('Sony WH-1000XM6','Audio',620000,'Noise cancelling headphones');

INSERT INTO orders (customer,total,status)
VALUES
('John Doe',3070000,'Processing');