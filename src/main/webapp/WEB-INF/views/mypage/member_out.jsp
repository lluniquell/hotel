<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    background:#FFFFC6;
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
 <form method="post" action="member_out_ok">
 <div>
  - 회원 탈퇴시 데이터를 복구 할 수 없습니다. <br>
- 회원 탈퇴를 원하시면 비밀번호 입력 후 탈퇴 버튼을 클릭해 주십시오.
 </div>
  
 <div id="main">
 <div>아이디* <b>${userid}</b></div>
 <div>비밀번호*  <input type="password" name="pwd"> </div>
 <div><input type="submit" value="탈 퇴"></div>
 </div>
 </form>
 
 </section>
</body>
</html>