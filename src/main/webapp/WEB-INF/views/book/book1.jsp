<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#img {
	margin: 0 auto;
	border-radius: 30px;
	overflow: hidden;
}

#roombox{
	height:100px;
}

#pricebox {
	background-color:#F4F4F5;
	border: none;
	border-radius: 6px;
	height:120px;
}

#choice {
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
	<table width="1000" align="center" >
		<tr>
			<td colspan="2">에약요청일 ${checkin} ~ ${checkout}</td>
		</tr>

		<c:forEach items="${blist}" var="bvo">
		<c:if test="${bvo.chk==0}"> 
				<form method="post" action="book2">
				<tr>

						<input type="hidden" name="room" value="${bvo.name}">
						<input type="hidden" name="checkin" value="${checkin}"> 
						<input type="hidden" name="checkout" value="${checkout}"> 
						<input type="hidden" name="person" value="${person}">
						
						<c:if test="${bvo.grade==1}">
						<td id="img" rowspan="3" width="350" height="200">
							<img src="../resources/img/1.jpg">
						</td>
						</c:if>
						<c:if test="${bvo.grade==2}">
						<td id="img" rowspan="3" width="350" height="200">
							<img src="../resources/img/2.jpg">						
						</td>
						</c:if>
						<c:if test="${bvo.grade==3}">
						<td id="img" rowspan="3" width="350" height="200">
							<img src="../resources/img/3.jpg">
						</td>
						</c:if>
						<c:if test="${bvo.grade==4}">
						<td id="img" rowspan="3" width="350" height="200">
							<img src="../resources/img/4.jpg">						
						</td>
						</c:if>
						
						
						
						<td id="roombox">
						${bvo.name}호<br>
						객실 등급 	
						<c:if test="${bvo.grade==1}">						
							스탠다드
						</c:if>
						<c:if test="${bvo.grade==2}">						
							슈페리어
						</c:if>
						<c:if test="${bvo.grade==3}">						
							디럭스
						</c:if>
						<c:if test="${bvo.grade==4}">						
							스위트
						</c:if>
						
						</td>



				
				</tr>
				<tr>
					<td align="right" id="pricebox"><fmt:formatNumber
							value="${bvo.price}" type="currency" /> 부터</td>
				</tr>
				<tr>
					<td align="right"><input id="choice" type="submit" value="룸선택"></td>
						
				</tr>
				</form>
			</c:if>

		</c:forEach>


	</table>
</section>