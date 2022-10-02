<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<c:set var="height" value="${list.size()*120+700}"/> <!-- 래코드 늘어날수록  세로증가 -->
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
 section #content{
  margin-top:50px;
 }
 section table{
   border-spacing: 0 10px;
 }
  section table tr:first-child td{
  height:50px;
   text-align:center;
   background:#eeeeee;
 }

  section table td:first-child{
   text-align:center;
 }
 section table td{
  height:120px;
 }
 
 /*  ㅡㅡㅡㅡㅡ*/
 
     section .left{
     width:130px;
     height:100px;
     float:left;
     }
     section .right{
      width:500px;
     height:100px;
      float:right;
     }
     section .top{
     width:100%;
     height:20px;
     padding-top:15px;
     text-aling:left;
     font-size:18px;
     font-weight: bold;
     }
     section .bot{
     width:100%;
     height:40px;
     margin-top:10px;
     padding-top:10px;
     border-top:2px solid #eeeeee;  
    
     }
     .spinner{
     width:50px;
      text-align:right;
      height:10px;
     }
     .bleft{
     float:left;
     width:40%;
     }
     .bright{
       width:60%;
     float:right;
     }
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script>
 
 onload=function(){
	  document.getElementsByClassName("categori")[4].style.marginBottom="35px";
}
 
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
	  location="cart_del?id="+str;    // delid=삭제할id 
 }
 function gumae()
 {
	   //선택되어진 상품의 pcode, 수량을 콤마로 구분하여 하나의 문자열로 완성
	   var gcode="";
	   var qty="";
	 
	   
	   var subchk=document.getElementsByClassName("subchk");
	   var len=subchk.length; // 상품의 리스트 갯수
	   for(i=0;i<len;i++)
		   {
		   if(subchk[i].checked)
		    {
			   gcode=gcode+document.getElementsByClassName("goodscode")[i].value+",";
		        qty=qty+document.getElementsByClassName("spinner")[i].value+",";      
		    }
		   }
	  
     location="../mypage/goods_order?gchk=2&goodscode="+gcode+"&qty="+qty;
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
  <table width="950" align="center">
   <caption><h2 align="left">쇼 핑 카 트</h2></caption>
   <tr>
    <td width="120"><input id="mainchk" type="checkbox" onclick="maincheck(this.checked)"> 전체선택 </td>
    <td width="650">상품정보</td>
    <td width="80">배송비</td>
     <td width="100">상품금액</td>
   </tr>
  <c:forEach items="${list}" var="gvo">
   <input type="hidden" class="goodscode" value="${gvo.goodscode}">
   <tr>
    <td><input type="checkbox" class="subchk" onclick="subcheck()" value="${gvo.cid}"></td>
    <td id="second">
    
     <div class="left"><img src="../resources/img/${gvo.timg}" width="120" height="100"></div>
     <div class="right">
       <div class="top">${gvo.title }</div>
        
        <c:set var="qty_price" value="${gvo.cqty*gvo.price}"/> <!-- 수량 x 상품단가 = qty_price -->
      
       <div class="bot">
       
      <div class="bleft">${gvo.deliveryday}일 도착보장</div>
      <div class="brigt">      
      \<fmt:formatNumber value="${gvo.price}"/>원 &nbsp;<input type="text" class="spinner" value="${gvo.cqty}" readonly> 
      </div>
       </div>
     </div>
    </td>
    <td>\<fmt:formatNumber value="${gvo.deliveryfee}"/>원</td>
    <td><b class="price"> \<fmt:formatNumber value="${gvo.price*gvo.cqty}"/>원</b></td>
   </tr> 
  </c:forEach>
   <tr>
    <td> 
    <input id="mainchk" type="checkbox" onclick="maincheck(this.checked)"> <p><b>전체선택</b> 
    </td>
   <td colspan="4">   
   <div id="box" onclick="sel_del()">선택삭제 </div>  
    <div id="box" onclick="gumae()">장바구니 담기</div>   
    
    </td>
  </tr>
  </table>
  </div>
 
</section>
<style>
 #box{
  text-align:center;
  float:left;
  width:120px;
  height:20px;
  padding:8px;
  border-radius:30px;
 background:#068484;
 color: white;
 margin-left:50px;
 display: inline-block;
  }
  #box:hover {
  border:1px solid #068484;
	background:white;
	color:black;
}
</style>
</body>
</html>