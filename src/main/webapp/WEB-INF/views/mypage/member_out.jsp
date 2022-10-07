<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/resources/css/util.css" />" rel="stylesheet"> <!--  css 불러오기 -->

<style>
   section {
	width: 1000px;
	height: 400px;
	margin: auto;
   }
   section #content{
    width:80%;
    margin: auto;
    margin-top:50px;
   }
   section .label{
 margin-top:15px;
 font-weight: bold;
 margin-bottom: 3px;
}
   
   section #main{
    font-size: 18px;
    margin-top:50px;
     width:80%;
     margin: auto;
     margin-top:50px;
   }
   section #main input[type=text],#main input[type=password]
 {
  width:465px;
  height:40px;
  font-size: 16px;
 }
 section #end{
 margin-top:50px;
 float: right;
 }
</style>
<script>
 onload=function(){
	 if(<%=request.getParameter("err")%>=="1")
	  {
		 alert("비밀번호가 일치하지않습니다");
	  }
 }
</script>
</head>
<body>
 <section>
 <div id="content">
 <form method="post" action="member_out_ok">
 <div style="font-size: 23px;">
  - 회원 탈퇴시 데이터를 복구 할 수 없습니다. <br>
- 회원 탈퇴를 원하시면 비밀번호 입력 후 탈퇴 버튼을 클릭해 주십시오.
 </div>
  
 <div id="main">
  <div class="label">아이디</div>
 <div><input type="text" name="userid" placeholder="아이디를 입력하세요" value="test12345"></div>
  
  <div class="label">비밀번호</div>
 <div><input type="password" name="pwd" placeholder="비밀번호를 입력하세요" value="test12345"></div>
  
 <div id="end">
 <input type="submit" class="silverbtn" value="탈 퇴">
 <input type="button" class="silverbtn" onclick="location='../mypage/myinfo'" value="취소">
 </div>
 </div>
 </form>
 </div>
 </section>
</body>
</html>