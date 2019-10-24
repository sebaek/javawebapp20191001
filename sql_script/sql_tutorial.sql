INSERT INTO mysql.user (host,user,password) VALUES ('%','root',password('admin'));
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

select * from 
products join categories where
products.CategoryId = categories.Categoryid;

# sql tutorial
create database myDB;
use mydb;
create table members (
member_id varchar(10) not null primary key,
member_password varchar(10) not null
);

insert into members (member_id, member_password)
values ('가''다라마바사아자차', 'abc');
insert into members (member_id, member_password)
values ('abcdefghij', 'abc');

use mydb;
select * from members where member_id is not null;
drop table members2;

create table members2(

first_inserted datetime default now()
);

insert into members2 values();
select * from members2;