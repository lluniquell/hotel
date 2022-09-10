<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 400px;
	margin: auto;
    margin-top:100px;
}
div{
 margin-top:10px;
}
.inputName{
 margin-right:10px;
 font-weight:bold;
 font-size:18px;
 color:brown;
}
#btn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#btn:hover{
  background:#fff;
  color:#1AAB8A;
}
section #err
{
 font-size:20px;
 font-weight:bold;
 color:red;
}


</style>
<script>
 function userid_search()
 {
	 window.open("userid_search","아이디 찾기" , "width=400, height=300, top=100, left=300");
	 
 }
 function pwd_search()
 {
	 window.open("pwd_search","비밀번호 찾기" , "width=400, height=600, top=100, left=300");
	 
 }
</script>
</head>
<body>
<section>
 <form name="pom" method="post" action="login_ok" align="center">
  <h2 style="color:brown"> 로 그 인 </h2>
  <div>
   <span class="inputName">아이디</span> 
  <input type="text" name="userid" placeholder="아이디를 입력하세요" value="test12345">
  </div>
   <div>
   <span class="inputName">비밀번호</span> 
  <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" value="test12345">
  </div>
  
  <div> <input type="submit" value="로그인" id="btn"></div>
  <!-- 아이디,비번찾기 -->
  <div>
  <b onclick="userid_search()">아이디 찾기</b> |
  <b onclick="pwd_search()">비밀번호 찾기 </b> |
  <b onclick="location='../member/member_input'">회원가입</b>
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
 </form>

 

</section>
</body>
</html>