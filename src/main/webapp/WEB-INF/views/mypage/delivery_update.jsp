<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
     <h3 align="left" id="cap">${dvo.name}</h3>
     <tr>
      <td>이 름</td> <td>${dvo.name}</td>
     </tr>
     <tr>
      <td>배송주소</td> <td>${dvo.juso} / ${dvo.juso_etc}</td>
     </tr>
     <tr>
      <td>연락처</td> <td>${dvo.phone}</td>
     </tr>
     <tr>
      <td>배송 요청사항</td> 
       <c:if test="${dvo.state==0}">
        <c:set var="state" value="없음"/>       
       </c:if>
       <c:if test="${dvo.state==1}">
        <c:set var="state" value="문 앞"/>       
       </c:if>
       <c:if test="${dvo.state==2}">
        <c:set var="state" value="택배함"/>       
       </c:if> 
       <c:if test="${dvo.state==3}">
        <c:set var="state" value="기타사항"/>       
       </c:if>
      <td>${state}</td>
     </tr>
     
     <tr height="40"><td colspan="2" align="center">
     <span class="left" onclick="delivery_update?id=${dvo.id}">수정</span>
     <span class="right">선택</span>
     </td></tr>
    </table>
</body>
</html>