<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/wish.css" />" rel="stylesheet"> <!--  css 불러오기 -->

<style>
 section{
  width:1000px;
  margin:auto;
  height:800px;
 
 }
 section table{
  text-align:center;
 }
 section table td{
  height:100px;
 }
</style>

</head>
<body>
<section>
 <table align="center" width="1000" border="1">
 <caption><h1 align="left" style="color:red">♥찜 리스트</h1></caption>
 <c:forEach items="${wlist}" var="wish">
 <tr>
 <td width="80"><input type="checkbox" class="chk" onclick="check()" value="${wish.id}"></td>
 <td width="140">이미지</td>
 <td width="680">${wish.title}<br>${wish.price}</td>
 <td width="200"><div class="cartadd">장바구니 담기</div><p><div class="wishdel">삭제</div></td>
 </tr>
  </c:forEach>
 </table>
 

 
 </section>
</body>
</html>