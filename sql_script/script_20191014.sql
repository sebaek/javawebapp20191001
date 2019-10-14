select * from items;
insert into items (title, body, user_id)
values ('세번째 게시물', '본문3', 'ulsan');
insert into items (title, body, user_id)
values ('첫번째 게시물', '본문1', 'busan');
insert into items (title, body, user_id)
values ('두번째 게시물', '본문2', 'busan');

create table items (
	id int primary key auto_increment,
	title varchar(255),
    body varchar(3000),
    user_id varchar(255),
    created datetime default now()
);
desc items;


use w3schools;
INSERT INTO users (id, password, nickname, email)
				VALUES ('us', 'us', 'us', 'us');

select * from users;
alter table users
add column email varchar(255);