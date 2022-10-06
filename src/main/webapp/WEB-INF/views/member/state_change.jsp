<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <section>
 <table width="600" align="center">
  <caption><h2> 회원탈퇴 요청</h2></caption>
 <tr>
  <td>아이디</td>
  <td>이름</td>
  <td></td>
 </tr>
 <c:forEach items="${list}" var="mvo">
 <tr>
  <td>${mvo.userid}</td>
  <td>${mvo.name}</td>
  <td>
   <input type="button" onclick="location='state2'" value="탈퇴승인"> <br>
   <input type="button" onclick="location='state1'" value="탈퇴취소">
   
  </td>
 </tr>
 </c:forEach>
 </table>
  
 </section>
</body>
</html>