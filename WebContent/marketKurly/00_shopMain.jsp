<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리</title>
<style>
	a{ color: black; }
	a:hover { color: puple; }
</style>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String center = request.getParameter("center");
		
		if(center == null) {
			center = "03_center.jsp";
		}
	%>
	
	<div align="center">
		<jsp:include page="01_top.jsp"></jsp:include>
		<jsp:include page="<%=center%>"></jsp:include>
		<jsp:include page="02_bottom.jsp"></jsp:include>
	</div>

</body>
</html>

<!-- 

CREATE DATABASE marketkurlydb01;
USE marketkurlydb01;

/*회원정보*/
CREATE TABLE customer(
	id VARCHAR(50),
    pw VARCHAR(16),
    name VARCHAR(10),
    reg_date VARCHAR(50),
    tel VARCHAR(20),
    address VARCHAR(100),
	email VARCHAR(20)
);

select * from customer;

/*상품정보*/
CREATE TABLE item(
	item_number int(50),
	item_category VARCHAR(10),
    item_name VARCHAR(16),
    item_price int(50),
    item_stock int(50),
    item_image VARCHAR(10),
    item_info VARCHAR(100),
    discount_rate int(50),
    reg_date VARCHAR(50),
	sold int(50)
);

select * from item;

/*장바구니 정보*/
CREATE TABLE cart(
	cart_number int(50),
	buyer VARCHAR(50),
	item_name VARCHAR(16),
	buy_price int(50),
	buy_count int(50),
	item_image VARCHAR(50)
);

select * from cart;

/*구매목록*/
CREATE TABLE buy(
	customer_id VARCHAR(50),
	customer_name VARCHAR(50),
	cart_number int(50),
	item_name VARCHAR(50),
	buy_price int(50),
	buy_count int(50),
	item_image VARCHAR(50),
	buy_date VARCHAR(50),
	howpay VARCHAR(50),
	address VARCHAR(100)
);

select * from buy;

/*관리자 정보*/
CREATE table manager(
	id varchar(50),
    pw varchar(50),
    name varchar(50)
);

select * from manager;

/*게시판 정보(고객센터)*/
create table board(
	num int(10),
	writer varchar(20),
	title varchar(50),
	pw varchar(20),
	reg_date date,
	ref int(10),
	re_step int(10),
	re_level int(10),
	readcount int(10),
	content varchar(100)
);

select * from board;

---------------------------------------------------------------------------
	insert into manager values('admin','admin','관리자');
    
	insert into customer values('rshhoi5','1234','유소희','2020-11-18','01040002606','서울시 광진구','rhbhoi5@naver.com');
	
    insert into item values(1,'채소', '대파',1200,3,'1.jpg', '대파입니다', 0, now(), 10);
	insert into item values(2,'채소', '상추',2000,4,'2.jpg', '상추입니다', 10, now(), 0);
	insert into item values(3,'채소', '당근',2500,8,'3.jpg', '당근입니다', 10, now(), 0);
	insert into item values(4,'채소', '깻잎',1200,0,'4.jpg', '깻잎입니다', 0, now(), 0);
	insert into item values(5,'채소', '애호박',1000,5,'5.jpg', '애호박입니다', 0, now(), 0);
	insert into item values(6,'채소', '버섯',1500,4,'6.jpg', '버섯입니다', 20, now(), 0);
	insert into item values(7,'채소', '단호박',3000,7,'7.jpg', '단호박입니다', 10, now(), 0);
	insert into item values(8,'채소', '파프리카',3000,6,'8.jpg', '파프리카입니다', 10, now(), 0);
	insert into item values(9,'채소', '아스파라거스',3000,10,'9.jpg', '아스파라거스입니다',0, now(), 0);
	insert into item values(10,'채소', '양파',2000,11,'10.jpg', '양파입니다', 0, now(), 0);
	insert into item values(11,'해산물', '자반고등어',5000,20,'11.jpg', '고등어입니다', 0, now(), 4);
	insert into item values(12,'해산물', '연어',14000,40,'12.jpg', '노르웨이산 연어입니다', 0, now(), 0);
	insert into item values(13,'해산물', '오징어',5000,10,'13.jpg', '오징어입니다', 10, now(), 0);
	insert into item values(14,'해산물', '바지락',7000,0,'14.jpg', '바지락입니다', 0, now(), 0);
	insert into item values(15,'해산물', '새우',10000,1,'15.jpg', '새우입니다', 10, now(), 0);
	insert into item values(16,'해산물', '전복',20000,5,'16.jpg', '전복입니다', 0, now(), 0);
	insert into item values(17,'육류', '막창',20000,5,'17.jpg', '막창입니다', 0, now(), 0);
	insert into item values(18,'육류', '안심스테이크',18000,0,'18.jpg', '안심스테이크입니다',0, now(), 0);
	insert into item values(19,'육류', '닭', 12000,4,'19.jpg', '닭입니다', 20, now(), 0);
	insert into item values(20,'육류', '닭다리',10000,7,'20.jpg', '닭다리입니다', 0, now(), 8);
	insert into item values(21,'육류', '폭립',20000,10,'21.jpg', '폭립니다', 10, now(), 0);
	insert into item values(22,'육류', '양념갈비',25000,20,'22.jpg', '양념갈비입니다', 30, now(), 0);
	insert into item values(23,'육류', '등갈비구이',20000,0,'23.jpg', '등갈비구이입니다', 0, now(), 5);
	insert into item values(24,'육류', '치즈돈가스',13000,1,'24.jpg', '치즈돈가스입니다', 0, now(), 50);
	insert into item values(25,'육류', '닭가슴살',5000,4,'25.jpg', '닭가슴살입니다', 0, now(), 0);
	insert into item values(26,'육류', '차돌박이',20000,3,'26.jpg', '차돌박이입니다', 10, now(), 10);
	insert into item values(27,'전자제품', '그라인더',28000,3,'27.jpg', '그라인더입니다', 10, now(), 0);
	insert into item values(28,'전자제품', '스팀다리미',30000,3,'28.jpg', '스팀다리미입니다', 10, now(), 0);
	insert into item values(29,'전자제품', '헤어드라이기',25000,3,'29.jpg', '헤어드라이기입니다', 10, now(), 0);
	insert into item values(30,'전자제품', '체중계',19000,3,'30.jpg', '체중계입니다', 10, now(), 0);
	insert into item values(31,'전자제품', '전자체중계',22000,3,'31.jpg', '전자체중계입니다', 10, now(), 0);
	insert into item values(32,'전자제품', '미니선풍기',16000,0,'32.jpg', '미니선풍기입니다', 10, now(), 0);
	insert into item values(33,'전자제품', '청소기',40000,3,'33.jpg', '청소기입니다', 10, now(), 0);
	insert into item values(34,'전자제품', '카메라',50000,3,'34.jpg', '카메라입니다', 10, now(), 0);
	insert into item values(35,'전자제품', '믹서기',3800,3,'35.jpg', '믹서기입니다', 10, now(), 7);


 -->