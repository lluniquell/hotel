<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
section {
	height: 800px;
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

input[name="name"],input[name="price"] {
	display: block;
	width: 160px;
	height: 40px;
	border: 1px solid #1E1852;
	border-radius: 4px;
}

select[name="grade"],select[name="maxperson"] {
	display: block;
	width: 166px;
	height: 45px;
	border: 1px solid #1E1852;
	border-radius: 4px;
}


input[type="submit"] {
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

	<form method="post" action="update_room_ok">
		<table align="center">
		 	<caption><h2>객실 정보 수정</h2></caption>
			<tr>
				<td>객실명</td>
				<td><input type="text" name="name" value="${rvo.name}"></td>
			</tr>
			<tr>
				<td>등급</td>
				<td><select name="grade" value="${rvo.grade}">
						<option>등급 선택</option>
						<option value="1">스탠다드</option>
						<option value="2">슈페리어</option>
						<option value="3">디럭스</option>
						<option value="4">스위트</option>
				</select></td>
			</tr>
			<tr>
				<td>최대인원</td>
				<td><select name="maxperson" value="${rvo.maxperson}">
						<option>최대 인원 선택</option>
						<option>3</option>
						<option>4</option>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${rvo.price}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	
	
</section>