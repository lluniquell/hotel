<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.del_form.zip.value = data.zonecode; // 우편번호
          document.del_form.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.del_form.juso_etc.focus();
      }
    }).open();
  }
  
  var chk=0;
  function form_view()
  {
	  if(chk%2==0)
	  {
		  document.getElementById("del_form").style.display="inline-block";
	  }
	  else{
		  document.getElementById("del_form").style.display="none";		  
	  }
	  chk++;
  }
 </script>
 <style>
 body{
  margin:0px;

 }
 .del_tb{
 width:80%;
 margin:auto;
 margin-top:20px;
 border:1px solid black;
 padding:10px;
 }
 .del_tb table{
  width:100%;
 } 
 .del_tb table tr:last-child{
  
 }
 .del_tb .left{
 float:left;
 width:80px;
 height:25px;
 margin-left:20px;
 font-size:16px;
 color:blue;
 border:1px solid silver;
 }
 .del_tb .right{
  float:right;
 width:80px;
 height:25px;
 margin-right:20px;
 font-size:16px;
 background:skyblue;
 color:white;
 border:3px solid skyblue;
 }
 #first{
 margin-top:10px;
  width:100%;
  height:35px;
  font-size:20px;
  font-weight:bold;
  border-bottom:2px solid skyblue;
  text-align: center;
 }
  #add{
   margin-top:20px;
   width: 100%;
   text-align: center;
   height: 80px;
  }
  #add #add_btn{
  margin:auto;
  width:80%;
  height:30px;
  padding-top:5px;
  border:1px solid silver;
  font-size:18px;
  font-weight:bold;
  font-style:italic;
  color:red;
  }
  #add_btn:hover {
	background:#eeeeee;
}

 #del_form{
  display:none;
  width:80%;
  height:300px;
  margin:auto;
  text-align: left;
  border:2px solid skyblue;
  padding-left:20px;
  padding-right:20px;
  margin-top:50px;
  margin-bottom: 50px;
  }
  #del_form div{
  width:100%;
  margin-top:5px; 
  }
  #del_form input[type=text]
  {
   width:70%;
   height:20px;
  }
input[type=submit]{
margin-top:20px; 
width:100px;
 border:0px;
 font-weight:bold;
 background:#eeeeee;
}
#cap{
 border-bottom:1px solid black;
}
 </style>
 <script>
 function change(n) // 현재 창의 주소를 부모창의 배송주소로 이동
 { 
	   // 앞에 oppener만 붙혀주면 부모창 ★
	    // 부모창의 요소 = 현재창의 요소;
	   opener.document.getElementById("name").innerText=document.getElementsByClassName("name")[n].innerText;
	   opener.document.getElementById("juso").innerText=document.getElementsByClassName("juso")[n].innerText;
	   opener.document.getElementById("phone").innerText=document.getElementsByClassName("phone")[n].innerText;
	   opener.document.getElementById("state").innerText=document.getElementsByClassName("state")[n].innerText;
	   self.close();
 }
 </script>
</head>
<body>
   <div id="first">배송지선택</div> 
   <c:forEach items="${dlist}" var="dvo">
    <c:set var="i" value="0"/>
    <div class="del_tb">
    <table>
     <h3 align="left" id="cap">${dvo.name}</h3>
     <tr>
      <td>이 름</td> <td class="name">${dvo.name}</td>
     </tr>
     <tr>
      <td>배송주소</td> <td class="juso">${dvo.juso} / ${dvo.juso_etc}</td>
     </tr>
     <tr>
      <td>연락처</td> <td class="phone">${dvo.phone}</td>
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
      <td class="state">${state}</td>
     </tr>
     
     <tr height="40"><td colspan="2" align="center">
     <span class="left" onclick="location='delivery_update?id=${dvo.id}'">수정</span>
     <span class="right" onclick="change(${i})">선택</span>
     </td></tr>
    </table>
    </div>
    <c:set var="i" value="${i+1}"/>
   </c:forEach>
   <div id="add"><div id="add_btn" onclick="form_view()">└ 배송지 추가</div>
   
   <div id="del_form">
   <form name="del_form" method="post" action="del_add_ok">
     <caption><h3 align="center">배송지 추가</h3></caption>
     <div><input type="text" name="name" placeholder="받는 사람"></div>
     <div><input type="text" id="zip" name="zip" readonly placeholder="우편번호찾기"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </div>
     <div><input type="text" name="juso" placeholder="주 소" readonly> </div>
     <div><input type="text" name="juso_etc" placeholder="상세주소"> </div>
     <div><input type="text" name="phone" placeholder="휴대폰 번호"></div>
     <div>배송요청사항 
     <select name="state">
      <option value="0"> 없음 </option>
      <option value="1"> 문 앞 </option>
      <option value="2"> 택배함</option>
      <option value="3"> 기타사항</option>
     </select></div>
     <div align="center"><input type="submit" value="저장"></div>
    </form>
   </div>
   
</body>
</html>