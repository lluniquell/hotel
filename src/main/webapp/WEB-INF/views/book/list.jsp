<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function book_cancel(salescode)
	{
		alert("예약 취소 : " + salescode);
		location=""
	}
	
	function review_write(salescode)
	{
		alert("예약 취소 : " + salescode);
	}
</script>
<style>
section {
	height:800px;
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

input {
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

	}
</style>
<section>
	<table align="center">
		<caption>
			<h2>예약내역</h2>
		</caption>
		<tr>
			<td>예약코드</td>
			<td>체크인</td>
			<td>체크아웃</td>
			<td>객실명</td>
			<td>결제정보</td>
			<td>예약 변경</td>
			<td>리뷰</td>
		</tr>
		<c:forEach items="${blist}" var="bvo">
			<tr>
				
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.salescode}</a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.checkin} | ${today}
				
				
				</a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.checkout}</a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.room}</a></td>
				
				<td>${bvo.pay_state}</td>
				<td><input type="button" value="예약 취소" onclick="book_cancel('${bvo.salescode}')"></td>
				<td><input type="button" value="리뷰 쓰기" onclick="review_write('${bvo.salescode}')"></td>
				
			
			
			
			</tr>
		</c:forEach>
	</table>
</section>