<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<style>
section {
	width: 1000px;
	height: 700px;
	margin: auto;
    margin-top:100px;
}

#loginbtn:hover{
  background:#fff;
  color:black;
  font-weight: bold;
}
section #err
{
 font-size:20px;
 font-weight:bold;
 color:red;
}
#main{
height: 300px;
width: 465px;
margin: auto;
margin-top: 50px;
border-bottom: 1px solid silver;
}
section input[type=text],section input[type=password]{
 height: 40px;
width: 465px;
}
section .label{
 margin-top:15px;
 font-weight: bold;
 margin-bottom: 3px;
}
section #title{
 width:70%;
 margin:auto;
 font-size: 25px;
 text-align: center;
 font-weight:bold;
 height:50px;
 border-bottom: 1px solid silver;
}
section #end{

width: 465px;
margin: auto;
 margin-top:50px;
}
</style>
<script>
 function userid_search()
 {
	 window.open("userid_search","아이디 찾기" , "width=450, height=400, top=100, left=300");
	 
 }
 function pwd_search()
 {
	 window.open("pwd_search","비밀번호 찾기" , "width=450, height=500, top=100, left=300");
	 
 }
</script>
</head>
<body>
<section>
 <form name="pom" method="post" action="login_ok">
  <div id="title"> 로 그 인</div>
<div id="main">
 <div class="label">아이디</div>
 <div><input type="text" name="userid" placeholder="아이디를 입력하세요" value="test12345"></div>
  
  <div class="label">비밀번호</div>
 <div><input type="password" name="pwd" placeholder="비밀번호를 입력하세요" value="test12345"></div>
  
  <div> <input type="submit" value="로그인" id="loginbtn"></div>
  <!-- 아이디,비번찾기 -->
  <div align="center">
  <b onclick="userid_search()">아이디 찾기</b> |
  <b onclick="pwd_search()">비밀번호 찾기 </b>
  </div>
  <c:if test="${err==1}">
  <c:set var="err" value="아이디,비밀번호가 일치하지않습니다"/>
  </c:if>
  <c:if test="${state==1}">
  <c:set var="err" value="탈퇴신청중 회원입니다"/>
  </c:if>
  <c:if test="${state==2}">
  <c:set var="err" value="탈퇴한 회원입니다"/>
  </c:if>
  <div id="err">${err}</div>
</div>
 </form>
<div align="center" style="margin-top:50px"> 아직 계정이 없으십니까?  </div>

<div id="end"><span id="loginbtn2" onclick="location='../member/member_input'">회원가입</span> </div>

 

</section>

</body>
</html>