CREATE TABLE IF NOT EXISTS conformed.dim_product (
    dim_product_id int8 identity(-1,1) not null,
    batch_id numeric(10, 0) not null,
    dim_retailer_id int8 not null,
    product_bkey varchar(50) not null,
    effective_start_date_time timestamp not null default '2007-01-01 00:00:00'::timestamp without time zone,
    effective_end_date_time timestamp not null default '2500-01-01 00:00:00'::timestamp without time zone,
    product_name varchar(100) not null,
    product_description varchar(512),
    product_sku_code varchar(50),
    product_size varchar(20),
    product_colour_code char(10),
    product_colour varchar(50),
    product_gender char(10),
    product_age_group varchar(50),
    brand_name varchar(100),
    supplier_name varchar(50),
    product_status varchar(10),
    PRIMARY KEY (dim_product_id),
    FOREIGN KEY (dim_retailer_id) REFERENCES conformed.dim_retailer (dim_retailer_id)
);