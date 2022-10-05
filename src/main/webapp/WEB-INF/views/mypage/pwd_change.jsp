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
 section div{
  margin-top:20px;
 }
 #err{
  color:red;
  font-size:20px;
 }
</style>
<script>


 function check(my)
{
	 var pwd=document.pom.pwd.value;
	 var pwd1=my.pwd1.value;
	 var pwd2=my.pwd2.value;
	 var num = pwd1.search(/[0-9]/g);
	 var eng = pwd1.search(/[a-z]/ig); 
	
	  if(pwd.trim().length>=6)
		  {
		   if(pwd1.search(/\s/) != -1) // 공백체크
		   {
			   alert("비밀번호는 공백없이 입력하세요");
			   return false;
		   }
		   else if(pwd1.trim().length <6 || pwd2.trim().length <6)
		   {
		   alert("변경할 비밀번호는 6글자 이상입니다");
		   return false;
		   }		  		   
		   else if(pwd1.trim() != pwd2.trim() )
		      {
		       alert("변경할 비밀번호가 일치하지 않습니다");
		        return false;
		       }
		   else if(num < 0 || eng < 0)
		   {
		   alert("영문,숫자를 혼합하여 입력하세요");
		   return false;
		   }		
		   else 
			   return true;
		  }
	  
	  
	  
	  else
		  {
		  alert("기존 비밀번호를 입력해주세요");
		    return false;
		  }
	 }
</script>
</head>
<body>
<section>
 <form name="pom" method="post" action="pwd_change_ok" onsubmit="return check(this)" align="center">
 <caption><h2> 비 밀 번 호 변 경</h2></caption>
  
  <div>기존 비밀번호    <input type="password" name="pwd" placeholder="기존 비밀번호"></div>
  <div>변경할 비밀번호 <input type="password" name="pwd1" placeholder="변경할 비밀번호" ></div>
  <div>비밀번호 확인  <input type="password" name="pwd2" placeholder="변경할 비밀번호 확인"> </div><p>
   <% 
   if(request.getParameter("err")!=null)
   {   %>
  <b id="err">기존 비밀번호가 일치하지 않습니다</b>
   <%} %>
  
  
  <div><input type="submit" value="변경하기"></div>
 </form>
 </section>
</body>
</html>