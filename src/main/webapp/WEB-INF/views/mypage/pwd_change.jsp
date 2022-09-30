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
	height: 600px;
	margin: auto;
   }
 section #title{
  width:80%;
  height:30px;
  padding-top:10px;
  padding-bottom:20px;
  padding-left:20px;
  font-size:25px;
  font-weight:bold;
  margin: auto;
  border-bottom: 1px solid black;
 }
  section #main{
  width: 60%;
  margin: auto;
  margin-top: 50px;
 }
 section .label{
 margin-top:20px;
 font-weight: bold;
 font-size:15px;
 margin-bottom: 6px;
}
section input[type=text],section input[type=password]{
 height: 40px;
width: 520px;
font-size: 18px;
}

 #err{
  color:red;
  font-size:20px;
 }
 section #btn1{
  width:100px;
  height:40px;
  border-radius: 100px;
  border:1px solid rgb(30,24,82);
  font-size: 20px;
  background:white;
 }
  section #btn1:hover{
   background:rgb(30, 24, 82);
   color:white;
  }
  section #btn2{
   width:100px;
   height: 40px;
  	background-color: rgb(30, 24, 82);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: repeat;
	color: rgb(255, 255, 255);
	border-radius: 100px;
	margin-left: 50px;
	font-size: 20px;
  }
   section #btn2:hover{
   background:skyblue;
   border:1px solid skyblue;
  }
  section #end{
  width:100%;
  margin-top:60px;
   height:50px;
   text-align: right;
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
 <div id="title">비밀번호</div>
 
 <div id="main">
 <form name="pom" method="post" action="pwd_change_ok" onsubmit="return check(this)"> 
  <div class="label">현재 비밀번호 </div>
  <div><input type="password" name="pwd" placeholder="기존 비밀번호"></div>
  <div class="label">변경할 비밀번호</div>
  <div> <input type="password" name="pwd1" placeholder="변경할 비밀번호" ></div>
  <div class="label">비밀번호 확인 </div>
   <div><input type="password" name="pwd2" placeholder="변경할 비밀번호 확인"> </div><p>
   <% 
   if(request.getParameter("err")!=null)
   {   %>
  <b id="err">기존 비밀번호가 일치하지 않습니다</b>
   <%} %>
  <div id="end">
 <input id="btn1" type="button" value="취소" onclick="location='myinfo'">
 <input id="btn2" type="submit" value="저장">
 
  </div>
 </form>
 </div>
 </section>
</body>
</html>