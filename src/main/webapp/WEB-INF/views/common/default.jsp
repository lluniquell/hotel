<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

body {
	
}

a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}

#message {
	width: 1000px;
	height: 29px;
	background: red;
	margin: auto;
}

#message #left {
	float: left;
	width: 980px;
	text-align: center;
	padding-top: 4px;
}

#message #right {
	float: right;
	width: 20px;
	padding-top: 4px;
}

header {
	width: 1000px;
	height: 36px;
	margin: auto;
}

header #left {
	float: left;
	padding-top: 10px;
}

header #right {
	float: right;
	position: relative;
	padding-top: 10px;
}

header #right ul {
	position: absolute;
	left: 73px;
	top: 18px;
	padding-left: 0px;
	padding: 5px;
	display: none;
	background: white;
}

header #right ul li {
	list-style-type: none;
	height: 24px;
}

header a {
	display: inline-block;
	height: 30px;
	text-decoration: none;
	color: black;
}

nav {
	width: 1000px;
	height: 40px;
	margin: auto;
}


nav .menu>li { 
	list-style-type: none;
	display: inline-block;
	width: 130px;
	height: 30px;
	font-size: 17px;
	text-align: center;
}


footer {
	width: 1000px;
	height: 300px;
	background: gray;
	margin: auto;
}
</style>
<decorator:head/>

</head>
<body>

	<div id="message">
		<!-- 간단메세지 -->
		<div id="left">최상단 배너</div>
		<div id="right">X</div>
	</div>

	<header> <!--  로고, 로그인, 회원가입 -->
	<div id="left"> <a href="../main/index">?? 호텔 </a></div>
	<div id="right">
		<c:if test="${userid != null}">
			${userid}(${name}) 님 반갑습니다  
			<a href="../logout">로그아웃</a> |
			<a href="../mypage/myinfo">회원정보</a> 
 		</c:if>
 		<c:if test="${userid == null }">
		<a href="/hotel/login/login">로그인</a> | <a href="/hotel/member/member_input">회원가입</a>
		</c:if>
		
     <a href="/hotel/admin/member_list"> 회원들 db </a>
	</div>
	</header>

	<nav> <!-- 메뉴및 링크 -->
	<ul class="menu">
		<li>공지사항</li>
		<li>객실소개</li>
		<li><a href="/hotel/book/book">예약하기</a></li>
		<li>FAQ</li>
		<li>이용후기</li>
		<li>호텔 몰</li>
		
	</ul>
	</nav>
	
	<decorator:body/>
	
	<footer>
		사이트 정보
	</footer>
	<!-- 사이트 관련 하단부  -->
</body>
</html>