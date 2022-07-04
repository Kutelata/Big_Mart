create database BigMart_DB;

use BigMart_DB;

create table tblCustomer
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    gender int(11) default(1),
    birthday date,
    phone varchar(11) not null unique,
    `address` varchar(128),
    email varchar(128) not null unique,
    `password` varchar(64) not null,
    `status` int(11) default(1)
);

create table tblRole
(
    id int auto_increment primary key,
    `name` varchar(64) not null
);

create table tblUser
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    `image` varchar(256),
    `account` varchar(64) not null,
    `password` varchar(64) not null,
    role_id int
);

create table tblCategory
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    `image` varchar(256) not null,
    `status` int(11) default(1)
);

create table tblProvider
(
    id int auto_increment primary key,
    `name` varchar(128) not null,
    `address` varchar(128) not null,
    phone varchar(11) not null,
    email varchar(256) not null unique,
    `status` int(11) default(1)
);

create table tblShipment
(
    id int auto_increment primary key,
    `name` varchar(64),
    code varchar(128),
    price float default(0),
    `status` int(11) default(1)
);

create table tblPayment
(
    id int auto_increment primary key,
    `name` varchar(64),
    code varchar(128),
    price float default(0),
    `status` int(11) default(1)
);

create table tblInvoice
(
    id int auto_increment primary key,
    shipment_id int,
    payment_id int,
    customer_id int,
    total float default(0),
    `status` int(11) default(1)
);

create table tblProduct
(
    id int auto_increment primary key,
    `name` varchar(128) not null,
    `image` varchar(128),
    category_id int,
    provider_id int,
    quantity int default(0),
    price float default(0),
    saleable_qty int,
    point int,
    `status` int(11) default(1),
    `description` varchar(128),
    created_at date,
    updated_at date
);

create table tblInvoiceDetail
(
    id int auto_increment primary key,
    invoice_id int,
    product_id int,
    quantity int,
    row_total float
);