<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section> 
<table width="1000" align="center">
	<tr>
		<td colspan="5"> 에약요청일 ${checkin} ~ ${checkout}</td>	
	</tr>
	<tr>
		<td>객실명</td>
		<td>최대인원</td>
		<td>객실 등급</td>
		<td>가격</td>	
		<td></td>	
	</tr>
	<c:forEach items="${list}" var="rvo">
	
	<tr>
	<form method="post" action="book2">
	<input type="hidden" name="room" value="${rvo.name}">
	<input type="hidden" name="checkin" value="${checkin}">
	<input type="hidden" name="checkout" value="${checkout}">
	<input type="hidden" name="person" value="${person}">
		<td>${rvo.name}</td>
		<td>${rvo.maxperson}</td>
		<td>${rvo.grade}</td>
		<td>${rvo.price}</td>
		<td><input type="submit" value="예약하기"></td>		
	</form>
	</tr>

	</c:forEach>
	
</table>
</section>