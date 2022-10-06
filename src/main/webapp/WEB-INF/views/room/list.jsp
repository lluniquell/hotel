<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section> 
	<table>
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
				<td>${rvo.price}</td>
				<td><a href="update_room?id=${rvo.id}">수정</a></td>
				<td><a href="del_room?id=${rvo.id}">삭제</a></td>		
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7"><a href="../room/add_room">객실 추가 등록</a></td>
			
		</tr>
	</table>
</section>