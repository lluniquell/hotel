<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 section{
  width:1000px;
  margin:auto;
  height:800px;
 
 }
 section table{
  text-align:center;
 }
  section table tr:first-child td{
  height:50px;
 }
 section table td{
  height:100px;
 }
 
 /*  ㅡㅡㅡㅡㅡ*/
 
     section .left{
     width:130px;
     height:100px;
     background:red;
     float:left;
     }
     section .right{
      width:450px;
     height:100px;
     background:green;
      float:right;
     }
     section .top{
     width:100%;
     height:50px;
     background:;
     }
     section .bot{
    width:100%;
     height:50px;
     background:pink;
     }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script>
    $(function()
    {
    	 var exprice=[${str}]; //[10000,20000,33333,23444,] .. 이런형식
    	 var $imsi=$(".spinner");
    	 $(".spinner").spinner(
    	{
    	   min:1,	
    	   max:10,
    	   spin:function(e,ui) // 값이 바뀔떄 동작하는 영역
    	   {
    	      var n=$imsi.index(this); //인덱스
    		  var s=ui.value; // 바뀐수량
    		  
    		 // var price=$(".price").eq(n).text(); //상품가격 : 4,500원 ',' ,'원' 제거하기 
    	     // price=price.replace("원",""); // '원' 없애기
    	     // price=price.replace(/,/g,""); // ,없에기
    		  var total=exprice[n]*s;
    	      //자바스크립트로 , 넣기
    	      total=new Intl.NumberFormat().format(total);
    	      total=total+"원";
    	      $(".price").eq(n).text(total);
    	   }
    	});
    });
  </script>
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
  
</script>
</head>
<body>
<section>
  <table width="950" align="center" border="1">
   <caption><h2>나의 장바구니</h2></caption>
   <tr>
    <td width="120"><input id="mainchk" type="checkbox" onclick="maincheck(this.checked)"> 전체선택 </td>
    <td width="600">상품정보</td>
    <td width="120">상품금액</td>
    <td width="120">배송비</td>
   </tr>
  <c:forEach items="${list}" var="gvo">
   <tr>
    <td><input type="checkbox" class="subchk" onclick="subcheck()" value="${gvo.cid}"></td>
    <td id="second">
    
     <div class="left">상품사진</div>
     <div class="right">
       <div class="top">${gvo.title }</div>
        
        <c:set var="qty_price" value="${gvo.cqty*gvo.price}"/> <!-- 수량 x 상품단가 = qty_price -->
      
       <div class="bot">
        ${gvo.deliveryday}일 도착보장      
              수량:<input type="text" class="spinner" value="${gvo.cqty}" readonly> | 
      <b class="price"> <fmt:formatNumber value="${gvo.price*gvo.cqty}"/>원</b>
       </div>
     </div>
    </td>
    <td>${gvo.price}</td>
    <td>${gvo.deliveryfee}</td>
   </tr>
  </c:forEach>
  </table>
</section>
</body>
</html>