create table accounts(
id int auto_increment primary key,
username varchar(100),
password varchar(255),
address varchar(255),
status bit
);

create table bill(
id int auto_increment,
bill_type bit,
acc_id int,
created datetime,
auth_date datetime,

primary key(id, bill_type),
foreign key (acc_id) references accounts(id)
);

create table product(
id int auto_increment primary key,
name varchar(255),
created date,
price double,
stock int,
status bit
);

create table bill_detail(
id int auto_increment,
bill_id int,
product_id int,
quantity int,
price double,

primary key(id, bill_id, product_id),
foreign key (bill_id) references bill(id),
foreign key (product_id) references product(id)
);

insert into accounts(username,password,address,status) values
('Hùng','123456',1,1),
('Cường','654321',0,1),
('Bách','135790',1,1);

insert into bill(bill_type,acc_id,created,auth_date) values 
(0,1,'2022-02-11','2022-03-12'),
(0,1,'2023-05-10','2023-10-10'),
(1,2,'2024-05-15','2024-05-04'),
(1,3,'2022-02-01','2022-02-10')
;

insert into product(name,created,price,stock,status) values
('Quần dài','2022-03-12',1200,5,1),
('Áo dài','2023-03-15',1500,8,1),
('Mũ cối','1999-03-08',1600,10,1)
;

insert into bill_detail(bill_id,product_id,quantity,price) values
(1,1,3,1200),
(1,2,4,1500),
(2,1,1,1200),
(3,2,4,1500),
(4,3,7,1600);

-- show list account and sort user_name z-a
select * from accounts 
order by accounts.username desc;

-- show list bill from 2023-02-11 to 2023-05-15
select * from bill 
where bill.created between '2023-02-11' and '2023-05-15';

-- show bill_detail by bill_id
select * from bill_detail
where bill_detail.bill_id = 2;

-- show product by name and sort z-alter
select * from product
order by product.name desc;

-- show product with stock >10
select * from product
where product.stock >= 10;

-- show product still active (status = 1)
select * from product
where product.status = 1;

