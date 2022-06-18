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
    `status` int(11) default(1),
	created_at date,
    updated_at date
);

create table tblGiftPoint
(
    id int auto_increment primary key,
    customer_id int,
    content varchar(128),
    `point` int,
    created_at date
);

create table tblStore
(
    id int auto_increment primary key,
    `name` varchar(128) not null,
    `address` varchar(128) not null,
    phone varchar(11) not null unique,
    employee_id int,
    open_time int,
    close_time int
);

create table tblRole
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    position varchar(64) not null
);

create table tblEmployee
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    gender int(11) default(1),
    birthday date not null,
    phone varchar(11) not null unique,
    email varchar(128) unique,
    `address` varchar(128),
    role_id int,
    salary float default(0),
    username varchar(64),
    `password` varchar(64),
    `status` int(11) default(1),
	created_at date,
    updated_at date
);

create table tblCategory
(
    id int auto_increment primary key,
    `name` varchar(64) not null,
    `description` varchar(128),
    `image` varchar(256) not null
);

create table tblUnit
(
    id int auto_increment primary key,
    `name` varchar(32) not null,
    `value` varchar(64)
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
    note varchar(128),
    `status` int(11) default(1)
);

create table tblPayment
(
    id int auto_increment primary key,
    `name` varchar(64),
    note varchar(128),
    `status` int(11) default(1)
);

create table tblInvoice
(
    id int auto_increment primary key,
    created_at datetime,
    ship_at datetime,
    shipment_id int,
    payment_id int,
    customer_id int,
    employee_id int ,
    `status` int(11) default(1),
    address_ship varchar(128) not null,
    phone_ship int(11) not null,
    note varchar(128)
);

create table tblProduct
(
    id int auto_increment primary key,
    `name` varchar(128) not null,
    `image` varchar(128),
    category_id int,
    unit_id int,
    provider_id int,
    quantity int default(0),
    price float default(0),
    saleable_qty int,
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
    price float
);