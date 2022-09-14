<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function breakfast_price(){
		var num=parseInt(document.getElementById("breakfast").value*55000);
		document.getElementById("breakfast_price").innerText =num;
		var room_price=parseInt(document.getElementById("room_price").innerText); // input 태그만 value, jsp에서는 innertext
		 
		document.getElementsByName("totalprice")[0].innerText=(num+room_price)+"원";
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

<section>
	<form method="get" action="book3">
	<input type="hidden" name="person" value="${bvo.person}">
	<input type="hidden" name="room" value="${rvo.name}">
	<input type="hidden" name="checkin" value="${bvo.checkin}">		
	<input type="hidden" name="checkout" value="${bvo.checkout}">
	<span id="str"></span>	
		<table>
			<tr>
				<td>객실명</td>
				<td>${rvo.name}</td>
				<td id="room_price">${rvo.price*(bvo.checkout-bvo.checkin)}</td>
				<td>예약요청일</td>
				<td>${bvo.checkin}~ ${bvo.checkout}
					${bvo.checkout-bvo.checkin}박</td>
				<td></td>
			</tr>
			<tr>
				<td>조식</td>
				<td><select name="breakfast" id="breakfast" onchange="breakfast_price()">
						<c:forEach var="i" begin="0" end="${bvo.person}" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select></td>
				<td id="breakfast_price"></td>
				<td>추가요청사항</td>
				<td><textarea name="add_needs"></textarea></td>
				<td></td>
			</tr>
			<tr>
				<td>결제자 성명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>총금액</td>
				<td name="totalprice"></td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="radio" name="pay_method" value="card" onclick="pay_state(0)"> 신용카드 
					<input type="radio" name="pay_method" value="onsite" onclick="pay_state(1)"> 현장결제</td>
			</tr>
			<tr>
				<td colspan="6"><input type="submit" value="결제하기"></td>
			<tr>
		</table>
	</form>

</section>