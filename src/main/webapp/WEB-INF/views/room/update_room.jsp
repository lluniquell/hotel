<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section> 
 <%-- <c:forEach items="${rvo}" var="rvo"> --%>
	<form method="post" action="update_room_ok">
		<table>
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
	<%-- </c:forEach>  --%>
	
</section>