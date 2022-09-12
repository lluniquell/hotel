<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 600px;
	margin: auto;

    
}
 section a{
  text-decoration:none;
  color:black;
 }
 .myTab{
 margin-top:50px;
 margin-left:0px;
 width:700px;
  position:relative;
 
  }
 
 .main li{
  list-style-type:none;
  display:inline-block;
  width:150px;
  height:30px;
  border:1px solid #cccccc;
  border-left:0px;
  margin-left:0px;
  text-align:center;
   padding-top:10px;
    padding-bottom:5px;
    font-weight:bold;
 }
 .main .sub1
 { 
  background:skyblue;
 }
 #tb
 {
  margin-top:0px;
 width:800px;
  height:400px;
  position:absolute;
  text-align:center;
 }
 #tb table{
   border-spacing: 0 10px;
 }
 
 #tb table td:first-child{
   width:150px;
   border-top:2px solid skyblue;
   font-weight:bold;
  
 }
 table td{
  padding-top:5px;
  height:30px;
 }

</style>
</head>
<body>
<section>
 <div class="myTab">
  <ul class="main">
   <li class="sub1"><a href="myinfo">회원정보수정</a></li><li class="sub2"><a href="reserve_info">예약조회</a></li><li class="sub3"><a href="my_qna">문의내역</a></li>
  </ul>
  </div>
 <div id="tb"> 
  <table width="800px">
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
  <tr>
   <td colspan="2" align="center">
   <a href="pwd_change"> 비밀번호변경</a> | 
   <a href="my_update"> 수정하기 </a>   |  
   <a href="member_out"> 회원탈퇴 </a>
   </td>
  </tr>
 </table>
</div>
</section>
</body>
</html>