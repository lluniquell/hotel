<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->

<script>
  //추가한내용
 onload=function(){
	  document.getElementsByClassName("categori")[1].style.marginBottom="35px";
  }
  
	function book_cancel(salescode) {
		alert("예약 취소 : " + salescode);
		location = ""
	}

	function review_write(salescode) {
		alert("예약 취소 : " + salescode);
	}
</script>
<c:set var="height" value="${blist.size()*50+600}"/> <!-- 래코드 늘어날수록  세로증가 -->
<style>
section {
    margin-top:50px;
	width: 1000px;
	height:${height}px;
	margin: auto;
}
table {
  margin-top:50px;
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
/* 추가  */
 section a{
  text-decoration:none;
  color:black;
 }
 .myTab{
  margin:auto;
 width:100%;
 height:60px;
 margin-top:50px;
  }

 .main li{
  list-style-type:none;
  display:inline-block;
  width:180px;
  height:30px;
  border:1px solid #cccccc;
  border-left:0px;
  margin-left:0px;
  text-align:center;
   padding-top:10px;
    padding-bottom:5px;
    font-weight:bold;
 }

</style>
<section>
<div class="myTab">
  <ul class="main">
 <li class="categori" onclick="location='../mypage/myinfo'">회원정보수정</li><li class="categori" onclick="location='../book/list'">예약조회</li><li class="categori" onclick="location='../mypage/my_qna'">문의내역</li><li class="categori" onclick="location='../mypage/wish'">나의 찜한 상품</li><li class="categori" onclick="location='../mypage/cart'">나의 장바구니</li>
</ul>
  </div>
  
	<table align="center">
		<caption>
			<h2>예약내역</h2>
		</caption>
		<tr>
			<td>예약코드</td>
			<td>체크인</td>
			<td>체크아웃</td>
			<td>객실명</td>
			<td>결제정보</td>
			<td>예약 변경</td>
			<td>리뷰</td>
		</tr>
		<c:forEach items="${blist}" var="bvo">
			<tr>

				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.salescode}</a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.checkin}
						| ${today} </a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.checkout}</a></td>
				<td><a href="book_view?salescode=${bvo.salescode}">${bvo.room}</a></td>

				<td>${bvo.pay_state}</td>
				<td><input type="button" value="예약 취소"
					onclick="book_cancel('${bvo.salescode}')"></td>
				<td><input type="button" value="리뷰 쓰기"
					onclick="review_write('${bvo.salescode}')"></td>




			</tr>
		</c:forEach>
	</table>
</section>