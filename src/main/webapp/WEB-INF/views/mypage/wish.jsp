<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/wish.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->

<c:set var="height" value="${wlist.size()*100+600}"/> <!-- 래코드 늘어날수록  세로증가 -->
<style>
section {
    margin-top:50px;
	width: 1000px;
	height:${height}px;
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

 section table{
  text-align:center;
  border-spacing: 0 10px;
  
 }
  section table td{
  height:100px;
 }
 section table tr:first-child td{
  background:#eeeeee;
   height:50px;
 }

 section #content{
  margin-top:50px;
 }
</style>

<script>


function maincheck(ck) // ck=> true, false
{
	   
	   var len=document.getElementsByClassName("subchk").length;
	   if(ck)  // main이 체크가 되면
	   {  // class='subchk'를 checked속성을 true
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=true;
		   }	   
	   }	 
	   else
	   {
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=false;
		   }
	   }	    
}

 function subcheck()
 {
	 var chk=0;
	 var len=document.getElementsByClassName("subchk").length;
	 
	 for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
			   chk++;
	   }
	 
	 if(chk==len)
	   {
		   document.getElementById("mainchk").checked=true;
	   }	
	   else
	   {
		   document.getElementById("mainchk").checked=false;
	   }
 }
  
 function sel_del()
 {
	  // 체크된 상품을 삭제
	   var len=document.getElementsByClassName("subchk").length;
	   var str="";
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked) // 삭제체크가 되었다면
		      str=str+document.getElementsByClassName("subchk")[i].value+",";
	   }
	  location="wish_del?id="+str;    // delid=삭제할id 
 }
 function move_cart()
 {
	   var gcode=""; // 하나이상이 존재
	  
	   var len=document.getElementsByClassName("subchk").length;
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
			   {
			   gcode=gcode+document.getElementsByClassName("gcode")[i].value+",";
			   }
	   }	    
	  
	   location="move_cart?goodscode="+gcode;
 }
 
 onload=function(){
	  document.getElementsByClassName("categori")[3].style.marginBottom="35px";
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
  
 <div id="content">
 
 <table align="center" width="1000">
 <caption><h1 align="left"><b style="color:red">♥&nbsp;</b>찜 리스트</h1></caption>
  <tr>
   <td width="80"> 선택 </td>
   <td colspan="2">상품</td>
   <td width="90">배송비</td>
   <td width="100">상품가격</td>
   <td width="200"></td>
  </tr>
 <c:forEach items="${wlist}" var="wish">
 <input type="hidden" class="gcode" value="${wish.goodscode}">
 <tr>
 <td ><input type="checkbox" class="subchk" onclick="subcheck()" value="${wish.id}"></td>
 <td  width="140"><img src="../resources/img/${wish.timg}" width="135" height="95"></td>
 <td  width="400">${wish.title}</td>
 
 <td><fmt:formatNumber value="${wish.deliveryfee}"/>원 </td>
 
 <td>\<fmt:formatNumber value="${wish.price}"/>원</td>
 <td>
 <div class="cartadd"><a href="move_cart?goodscode=${wish.goodscode}">장바구니 담기</a></div><p>
 <div class="wishdel"><a href="wish_del?id=${wish.id}">삭제</a></div></td>
 </tr>
  </c:forEach>
  <tr>
    <td colspan="2" align="center"> 
    <input id="mainchk" type="checkbox" onclick="maincheck(this.checked)"> 전체선택 
    <b onclick="sel_del()">/선택삭제 </b><br>
    <b onclick="move_cart()">장바구니 담기</b>
    </td>
    <td colspan="3">
        << < > >>
    </td>
  </tr>
 </table>
 </div>

 
 </section>
</body>
</html>