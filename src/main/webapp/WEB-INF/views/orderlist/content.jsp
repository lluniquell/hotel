<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
section{
	height:500px;
}

table {
	border: 1px solid #DADADD;
	border-radius: 6px;
	border-collapse: collapse;
	font-size: 14px;
}

th, td {
	border: 1px solid #DADADD;
	padding: 16px;
}
</style>

<section>
	<table align="center">
		<caption>
			<h2>주문 내역</h2>
		</caption>
		<tr>
			<td>주문 번호</td>
			<td>${ovo.ordercode}</td>
			<td>주문자명</td>
			<td>${ovo.name}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${ovo.goodscode} 상품코드로 상품명 sql 추가</td>
			<td>수량</td>
			<td>${ovo.qty}</td>
			<td>가격</td>
			<td>${ovo.goodscode} 상품코드로 상품 가격 가져와서 ${ovo.qty} 곱하기
			<td>배송상태 </td>
			<td>${ovo.state}</td>
			<td>송장번호</td>
			<td>${ovo.delivery}</td>
		</tr>
		<tr>
			<td>총금액</td>
			<td>${ovo.totalprice} + 배송비</td>
		</tr>
		<tr>
			<td>주문요청사항</td>
			<td>${ovo.memo1}</td>
			<td>배송요청사항</td>
			<td>${ovo.memo2}</td>			
		</tr>
	</table>


</section>
