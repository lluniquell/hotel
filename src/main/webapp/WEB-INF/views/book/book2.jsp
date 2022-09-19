<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function breakfast_price(){
		var num1=parseInt(document.getElementById("num1").innerText)*1;
		//alert(breakfast);
		var num=parseInt(document.getElementById("breakfast").value)*55000*num1;
		document.getElementById("breakfast_price").innerText =num+" 원";
		var room_price=parseInt(document.getElementById("room_price").innerText); // input 태그만 value, jsp에서는 innertext
		 
		document.getElementsByName("totalprice")[0].innerText=(num+room_price)+" 원";
	}
	
	function pay_state(n){		
		document.getElementById("str").innerText="";
		document.getElementById("str").innerHTML="<input type=hidden name=pay_state value="+n+">";		
	}
window.onload= function(){
	breakfast_price();
	pay_state(n);
}
</script>
<style>
table{
	border :1px solid #DADADD;
	border-radius: 6px;
	border-collapse: collapse;
	font-size:14px;
}


  th, td {
    border: 1px solid #DADADD;
    padding:16px;
  }

select[name="breakfast"] {
	display: block;
	width: 50px;
	height: 30px;
	border: 1px solid #1E1852;
	border-radius: 4px;
}

textarea[name="add_needs"]{
	width:400px;
	height:100px;
	border: 2px solid #8B8A93;
	border-radius: 6px;
}

td[name="totalprice"]{
	font-size:18px;
	color:#068484;
}

input[name="name"]{
	width:400px;
	height:40px;
	border: 2px solid #8B8A93;
	border-radius: 6px;
}

#payment {
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
	<form method="get" action="book3">
	<input type="hidden" name="person" value="${bvo.person}">
	<input type="hidden" name="room" value="${rvo.name}">
	<input type="hidden" name="checkin" value="${bvo.checkin}">		
	<input type="hidden" name="checkout" value="${bvo.checkout}">
	<span id="str"></span>	
		<table align="center">
			<caption><h2>옵션 선택 및 결제</h2></caption>
			<tr>
				<td colspan="2"> 숙박</td>
			</tr>
			<tr>	
				<td colspan="2">
					${rvo.name}호 <br>
					${bvo.checkin} ~ ${bvo.checkout} <br>
					<span id="num1">${bvo.checkout-bvo.checkin}</span>박<br>
					${bvo.person} 명
				</td>
			</tr>
			<tr>
				<td>조식</td>
				<td><select name="breakfast" id="breakfast" onchange="breakfast_price()">
						<c:forEach var="i" begin="0" end="${bvo.person}" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>	
				<td colspan="2">추가요청사항</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="add_needs"></textarea></td>
			</tr>
		
			<tr>				
				<td>객실 금액</td>
				<td id="room_price" align="right">
				${rvo.price*(bvo.checkout-bvo.checkin)} 원
				</td>
			</tr>
			<tr>
				<td>조식 금액</td>
				<td id="breakfast_price" align="right"></td>
			</tr>
			<tr>
				<td>총금액</td>
				<td name="totalprice" align="right"></td>
			</tr>
			<tr>
				<td colspan="2">결제자 성명</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="radio" name="pay_method" value="card" onclick="pay_state(0)"> 신용카드 
					<input type="radio" name="pay_method" value="onsite" onclick="pay_state(1)"> 현장결제
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input id="payment" type="submit" value="결제하기"></td>
			</tr>
		
		</table>
	</form>

</section>