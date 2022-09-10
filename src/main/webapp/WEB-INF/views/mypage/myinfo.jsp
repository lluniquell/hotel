<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 400px;
	margin: auto;

    
}

 .main{
   color:red;
 }
 .main li{
  list-style-type:none;
  display:inline-block;
 }
 section div{
 margin-top:5px;
 }
 section a{
  text-decoration:none;
  color:black;
 }
</style>
</head>
<body>
<section align="center">
 
  <ul class="main">
   <li><a href="myinfo">회원정보수정</a></li>
  <li><a href="reserve_info">예약조회</a></li>
  <li><a href="user_qna">문의내역</a></li>
  </ul>
    
  <table align="center" border="1" width="400px">
  <tr>
    <td>* 아이디 </td>
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
  <tr> 
    <td> 이메일 (선택) </td>  
    <td>${mvo.email }</td>
  </tr>
 </table>
 <div><a href="pwd_change"> 비밀번호변경</a> </div>
 <div><a href="my_update"> 회원정보수정</a> </div>
 <div><a href="member_out"> 회원탈퇴 </a></div>
</section>
</body>
</html>