<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<style>
section {
    margin-top:50px;
	width: 1000px;
	height: 800px;
	margin: auto;
}
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

 section #tb
 {
  margin:auto;
  width:80%;
  height:600px;
  text-align:center;
 }
 #tb table{
 margin-top:50px;
   border-spacing: 0 10px;
   border-top: 1px solid black;
   border-bottom: 1px solid black;
   padding-bottom:50px;
   padding-top:30px;
   width:100%;
 }
 
 #tb table td:first-child{
   width:150px;
   font-weight:bold;
  
 }
 table td{
  padding-top:5px;
  height:30px;
  border-bottom:1px solid #eeeeee;
 }
 table tr{
  height: 50px;
 }
 #end{
 margin:auto;
  width:100%;
  font-size: 18px;
  padding-top:20px;
  padding-left:20px;

 }
</style>
<script>
  onload=function(){
	  document.getElementsByClassName("categori")[0].style.marginBottom="35px";
  }
</script>
</head>
<body>
<section>
 <div class="myTab">
  <ul class="main">
 <li class="categori" onclick="location='../mypage/myinfo'">회원정보수정</li><li class="categori" onclick="location='../book/list'">예약조회</li><li class="categori" onclick="location='../mypage/my_qna'">문의내역</li><li class="categori" onclick="location='../mypage/wish'">나의 찜한 상품</li><li class="categori" onclick="location='../mypage/cart'">나의 장바구니</li>
</ul>
  </div>
 <div id="tb"> 
  <table>
  <tr>
    <td> * 아이디 </td>
    <td>${mvo.userid} </td>
  </tr>
  <tr>
    <td>* 이름 </td>
    <td>${mvo.name }</td>
  </tr>
  <tr>
   <td>* 생년월일 </td>
   <td>${mvo.ymd }</td>
  </tr>
  <tr>
   <td>* 전화번호 </td>
   <td>${mvo.phone }</td>
  </tr>
 <c:if test="${empty mvo.email}">
  <tr> 
    <td> 이메일 (선택) </td>  
    <td> X </td>
  </tr>
 </c:if>
  <c:if test="${!empty mvo.email}">
  <tr> 
    <td> 이메일 (선택) </td>  
    <td>${mvo.email }</td>
  </tr>
  </c:if>
 </table>
 <div id="end">
   <div id="loginbtn" onclick="location='pwd_change'"> 비밀번호변경</div> 
   <div id="loginbtn" onclick="location='my_update'"> 수정하기 </div> 
   <div id="loginbtn" onclick="location='member_out'"> 회원탈퇴</div> 
</div>
</div>
</section>
<style>
 #loginbtn{
   margin-left:150px;
   margin-top:30px;
 }
</style>
</body>
</html>