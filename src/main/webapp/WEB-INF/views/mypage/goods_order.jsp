<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
  section{
   width:1000px;
   height:1200px;
   margin:auto;
   /* background: yellow; */
  }

  #c1{
  
   margin-top:50px;
   height:50px;
   border-bottom:3px solid black;
  }
   #c1 .left{
  float:left;
  font-size:30px;
  font-weight: bold;
  }
  #c1 .right{
  padding-top:25px;
  font-size:14px;
  float:right;
  }
  section caption{
  border-bottom:3px solid black;
  }
   section table{
  margin-top:50px;
  }
   section table td{
  border-top:1px solid #eeeeee; 
  }
   section table tr:first-child td{
  background:#eeeeee; 
  }
  section table caption{
  text-align: left;
  }
 </style>
</head>
<body>
 <section>

 <div id="c1"><span class="left">주문/결제</span><span class="right"><a style="color:silver">장바구니</a> ><b>주문결제</b> ><a style="color:silver">주문완료</a> </span></div>

   <table id="tb_goods" width="800" align="center">
    <caption><h2>구매상품</h2></caption>  
    <tr>
     <td></td>
     <td>상품정보</td>
     <td>가격</td>
     <td>수량</td>
     <td>배송비</td>
     <td>총금액</td>
    </tr>
    <c:forEach items="${list}" var="gvo">
     <tr>
      <td><img src="${gvo.timg}" width="135" height="95"></td>
      <td>${gvo.title}</td>
      <td>${gvo.price}</td>
      <td>${gvo.qty}</td>
      <td>
      ${gvo.deliveryfee}<br>
           배송일출력
      </td>    
      <td>\ ${(gvo.price*gvo.qty)+gvo.deliveryfee}원</td>
     </tr>
    </c:forEach>
    
    <table id="tb_member" width="800" align="center">
    <caption><h2>구매자 정보</h2></caption>
    <tr>
     <td>이름</td><td>${mvo.name}</td>
     </tr>
    <tr>
     <td>전화번호</td><td>${mvo.phone}</td>
    </tr>
    <tr>
     <td>이메일</td><td>${mvo.email}</td>
    </tr>
   </table>
   
   <table width="800" align="center">
    <caption><h2>받는사람 정보</h2></caption>
   </table>
 </section>
</body>
</html>