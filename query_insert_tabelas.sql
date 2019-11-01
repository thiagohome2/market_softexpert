CREATE TABLE products(
    id  SERIAL PRIMARY KEY,
	group_product_id int,
    description  TEXT,
    price 	real,
	unid	char(50),
	image text,
    created_at   timestamp with time zone,
    updated_at   timestamp with time zone
);

CREATE TABLE group_products(
    id  SERIAL PRIMARY KEY,
    description  TEXT,
    tax 	real,
    created_at   timestamp with time zone,
    updated_at   timestamp with time zone
);

CREATE TABLE sales(
    id  SERIAL PRIMARY KEY,
    client  char(100),
    total	real,
	tax_total real,
	qtd_items int,
    created_at   timestamp with time zone,
    updated_at   timestamp with time zone
	
);

CREATE TABLE sale_items(
    id  SERIAL PRIMARY KEY,
	sale_id int,
	product_id int,
	description  TEXT,
    unid  char(50),
	qtd_unids real,
	price_unit real,
    total	real,
	tax real,
	tax_total_item real,
    created_at   timestamp with time zone,
    updated_at   timestamp with time zone,
	FOREIGN KEY (sale_id) REFERENCES sales
);