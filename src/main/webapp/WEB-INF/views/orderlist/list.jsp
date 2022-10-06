<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function order_cancel(ordercode) {
		alert("예약 취소 : " + ordercode);
		location = ""
	}

	function review_write(goodscode) {
		alert("리뷰쓰기: " + goodscode);
	}
</script>
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
</style>
<section>
	<table align="center">
		<caption>
			<h2>주문내역</h2>
		</caption>
		<tr>
			<td>주문코드</td>
			<td>상품명</td>
			<td>상태</td>
			<td>송장번호</td>
			<td>취소요청</td>
			<td>리뷰쓰기</td>

		</tr>
		<c:forEach items="${olist}" var="ovo">
			<tr>
				<td><a href="">${ovo.ordercode}</a></td>
				<td><a href="">${ovo.goodcode} | sql에 상품명 조회 추가해서 상품명으로 바꾸기</a></td>
				<td><a href="">${ovo.state}</a></td>
				<td><a href="">${ovo.delivery}</a></td>
				<td><input type="button" value="주문 취소"
					onclick="order_cancel('${ovo.ordercode}')"></td>
				<td><input type="button" value="리뷰 쓰기"
					onclick="review_write('${bvo.goodscode}')"></td>
			</tr>
		</c:forEach>
	</table>
</section>