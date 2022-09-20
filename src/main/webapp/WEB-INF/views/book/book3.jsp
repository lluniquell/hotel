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
			<h2>예약 완료</h2>
		</caption>
		<tr>
			<td>예약 번호</td>
			<td colspan="3">${bvo.salescode}</td>			
		</tr>
		<tr>
			<td>체크인</td>
			<td>${bvo.checkin}</td>
			<td>체크아웃</td>
			<td>${bvo.checkout}</td>
		</tr>
		<tr>
			<td>객실명</td>
			<td>${bvo.room}</td>
			
		</tr>
		<c:if test="${bvo.breakfast>0}">
			<tr>
				<td colspan="4">조식 ${bvo.breakfast}분 신청되었습니다.</td>
			</tr>
		</c:if>
		<c:if test="${bvo.add_needs.trim().length() != 0}">
			<tr>
				<td colspan="4">추가 요청사항</td>
			</tr>
			<tr>
				<td colspan="4">${bvo.add_needs}</td>
			</tr>
		</c:if>
		<c:if test="${bvo.pay_state>0}">
			<tr>
				<td colspan="4">현장 결제를 선택하셨습니다. 이용전 반드시 결제 부탁드립니다.</td>
			</tr>
		</c:if>


	</table>


</section>