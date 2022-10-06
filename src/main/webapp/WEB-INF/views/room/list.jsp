<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<style>
section {
	height: 1000px;
}

table {
	border-top: 2px solid #DADADD;
	border-bottom: 2px solid #DADADD;
	border-collapse: collapse;
	font-size: 14px;
}

th, td {
	border-top: 2px solid #DADADD;
	border-bottom: 2px solid #DADADD;
	padding: 16px;
}

.small {
	font-size: 16px;
	line-heigth: 24px;
	color: white;
	text-decoration: none solid RGB(255, 255, 255);
	height: 25px;
	width: 45px;
	background-color: #007576;
	border: none;
	border-radius: 30px;
}


.big {
	font-size: 16px;
	line-heigth: 24px;
	color: white;
	text-decoration: none solid RGB(255, 255, 255);
	height: 40px;
	width: 157px;
	background-color: #007576;
	border: none;
	border-radius: 30px;
}
</style>

<section> 
	<table align="center">
		<caption><h2>객실 관리</h2></caption>
		<tr>
			<td>DB ID</td>
			<td>객실명</td>
			<td>등급</td>
			<td>최대인원</td>
			<td>가격</td>
			<td>수정</td>
			<td>삭제</td>			
		</tr>
		
		<c:forEach items="${list}" var="rvo">	 	
			<tr>
				<td>${rvo.id}</td>
				<td>${rvo.name}</td>
				<td>${rvo.grade}</td>
				<td>${rvo.maxperson}</td>
				<td>${rvo.price}				
				</td>
				<td>
					<input type="button" class="small" onclick="location.href='update_room?id=${rvo.id}'" value="수정">
				</td>
				<td>
					<input type="button" class="small" onclick="location.href='del_room?id=${rvo.id}'" value="삭제">
				</td>		
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7" align="center">
				<input type="button" class="big" onclick="location.href='../room/add_room'" value="객실 추가 등록">
			</td>
			
		</tr>
	</table>
</section>