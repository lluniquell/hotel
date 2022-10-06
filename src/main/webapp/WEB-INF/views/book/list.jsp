<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
section{
	height:800px;
	margin-top:20px;
}

table {
	text-align:center;
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

#pay{
	width:200px;
	height:150px;
	background:gray;
	border:2px solid black;
	position:fixed;
	display:none;
}
</style>
<script>
var id;
function setId(){
	return id
}
function show(n){	
	id=n;
	
	var x=window.innerWidth;
	var y=window.innerHeight;
	
	var xx=(x/2)-100;
	var yy=(y/2)-30;
	
	document.getElementById("pay").style.left=xx+"px";
	document.getElementById("pay").style.top=yy+"px";
	
	document.getElementById("pay").style.display="inline";
}

function paycard(id){
	id=setId();
	var pay_method="card";
	location="pay_state_change?id="+id+"&pay_method="+pay_method;
	hide();
}

function paycash(id){
	id=setId();
	var pay_method="onsite";
	location="pay_state_change?id="+id+"&pay_method="+pay_method;
	hide();
}

function hide(){
	document.getElementById("pay").style.display="none";
	id="";
}

</script>

<section>
<div id="pay" align="center">
	<h2>결제방법</h2>
	<input type="button" value="카드결제" onclick="paycard()">
	<input type="button" value="현금결제" onclick="paycash()"><br><br>
	<input type="button" value="취소" onclick="hide()">
</div>
	<table align="center">
		<tr>
			<td colspan="3"><a href="book">즉시예약</a></td>
			<td colspan="9" align="right">
			<form method="post" action="list">
			<select name="sel">
				<option value="salescode">예약번호</option>
				<option value="name">고객명</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="검색">
			</form>
			</td>
		</tr>
		<tr>
			<td>예약번호</td>
			<td>USERID</td>
			<td>예약고객명</td>
			<td>연락처</td>
			<td>객실명</td>
			<td>체크인</td>
			<td>체크아웃</td>
			<td>예약인원</td>
			<td>조식</td>
			<td>추가 요청사항</td>
			<td>결제자명</td>
			<td>결제방법</td>
			<td>결제여부</td>
		</tr>
		<c:forEach items="${blist}" var="bvo">
		<tr>
			<td>${bvo.salescode}</td>
			<td>${bvo.userid}</td>
			<td>${bvo.name}</td>
			<td></td>
			<td>${bvo.room}</td>
			<td>${bvo.checkin}</td>
			<td>${bvo.checkout}</td>
			<td>${bvo.person}</td>
			<td>${bvo.breakfast}</td>
			<td>${bvo.add_needs}</td>
			<td>${bvo.name}</td>
			<td>${bvo.pay_method}</td>
			<td>
				<c:if test="${bvo.pay_state==1}">
					<input type="button" value="결제" onclick="show(${bvo.id})">
 				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</section>	