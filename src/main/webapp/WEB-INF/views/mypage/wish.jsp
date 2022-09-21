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
</script>

</head>
<body>
<section>
 <table align="center" width="1000" border="1">
 <caption><h1 align="left"><b style="color:red">♥&nbsp;</b>찜 리스트</h1></caption>
 <c:forEach items="${wlist}" var="wish">
 <input type="hidden" class="gcode" value="${wish.goodscode}">
 <tr>
 <td width="80"><input type="checkbox" class="subchk" onclick="subcheck()" value="${wish.id}"></td>
 <td width="140">이미지</td>
 <td width="680">${wish.title}<br>${wish.price}</td>
 <td width="200">
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
 

 
 </section>
</body>
</html>