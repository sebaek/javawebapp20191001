insert into comments (comment, item_id, user_id)
values ('새로운 댓글 aljf a;lkjdf lkj alkdfj lakjd falkj a', 57, 'busan');
select * from comments order by id desc;
delete from comments where id = 13;

update items set body='[Verse 1: V]
첫눈에 널 알아보게 됐어
서롤 불러왔던 것처럼
내 혈관 속 DNA가 말해줘
내가 찾아 헤매던 너라는 걸

[Verse 2: J-Hope, RM]
우리 만남은 수학의 공식
종교의 율법 우주의 섭리
내게 주어진 운명의 증거
너는 내 꿈의 출처
Take it take it
너에게 내민 내 손은 정해진 숙명

[Pre-Chorus: Jungkook, V]
걱정하지 마 love
이 모든 건 우연이 아니니까
우린 완전 달라 baby
운명을 찾아낸 둘이니까

[Chorus: Jimin, Jungkook]
우주가 생긴 그 날부터 계속
무한의 세기를 넘어서 계속
우린 전생에도 아마 다음 생에도
영원히 함께니까' where id=57;

select * from comments;
create table comments (
id int primary key auto_increment,
comment varchar(1000),
item_id int,
user_id varchar(255),
created datetime default now()
);
drop table comments;

alter table items 
add column file varchar(255);

select * from items order by id desc limit 0, 5;
set @@global.time_zone = '+00:00';
set time_zone = '+00:00';
select @@time_zone;
update items set created='1999-11-11' where id=1;
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