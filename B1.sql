
create table color
(
    id     int primary key auto_increment,
    name   varchar(100),
    status bit
);

create table product
(
    id      int primary key auto_increment,
    name    varchar(100),
    created date
);

create table size
(
    id     int primary key auto_increment,
    name   varchar(100),
    status bit
);

create table product_detail
(
    id         int auto_increment,
    product_id int not null,
    color_id   int not null,
    size_id    int not null,
    price      double,
    stock      int,
    status     bit,
    primary key(id, product_id,color_id,size_id),

    FOREIGN KEY (product_id) REFERENCES product(id),
    foreign key (color_id) references color(id),
    foreign key (size_id) references size(id)
);

show tables;

insert into color(name, status) values 
('red', 0),
('blue', 0),
('green', 0)
;

insert into size(name,status) values
('X',0),
('M',0),
('L',0),
('XL',0),
('XXL',0)
;

insert into product(name,created) values
('Quần dài','1990-5-12'),
('Áo dài','2005-10-05'),
('Mũ phớt','1995-07-07')
;

insert into product_detail(product_id, color_id,size_id,price,stock,status) values
(1,1,1,1200,5,0),
(2,1,1,1500,2,0),
(1,2,3,500,3,0),
(1,2,3,1600,3,1),
(3,1,4,1200,5,0),
(3,3,5,1200,6,0)
;
select color.id, color.name,case when status = 0 then 'true' when status = 1 then 'false' end as status from color ;

select id,name,case when status = 0 then 'true' when status = 1 then 'false' end as 'status' from size ;

select id,product_id,color_id,size_id,price,stock,case when status = 0 then 'true' when status = 1 then 'false' end as 'status' from product_detail ;

select id,product_id,color_id,size_id,price,stock,case when status = 0 then 'true' when status = 1 then 'false' end as 'status' from product_detail where price >=1200 ;

select id,product_id,color_id,size_id,price,stock,case when status = 0 then 'true' when status = 1 then 'false' end as 'status' from product_detail where product_id =1 ;
