<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 #view{
  display:none;
 }
 #pwd{
  font-size:20px;
  font-weight:bold;
  color:green;
 }
 
</style>
<script>
function searching_pwd()
  {
	var userid=document.pom.userid.value;
	var name=document.pom.name.value;
	var phone=document.pom.phone.value;
	var err=0;
	
    var chk=new XMLHttpRequest(); 
    chk.open("get","searching_pwd?userid="+userid+"&name="+name+"&phone="+phone);
    chk.send();
    chk.onreadystatechange=function()
    {
       if(chk.readyState==4)
    	   {
    	     if(chk.responseText=="null")
    	    	 {
    	    	  alert("비밀번호를 찾을수 없습니다");
    	    	   err=0;
    	    	 }
    	     else
    	    	 {
    	    	   document.pom.style.display="none";
    	    	  document.getElementById("view").style.display="inline-block";
    	    	  document.getElementById("pwd").innerText=chk.responseText;
    	    	 }
    	   } 
    }
  }
  function hide()
  {
	  self.close();
	
  }
</script>
</head>
<body>
  <form name="pom">
    <h1> 비밀번호 찾기 </h1>
     <div class="inputName">아이디</div>
     <div><input type="text" name="userid" placeholder="아이디를 입력하세요 "> </div>
     <div class="inputName">이름</div>
     <div><input type="text" name="name" placeholder="이름을 입력하세요"> </div>
     <div class="inputName">전화번호</div>
     <div><input type="text" name="phone" placeholder="전화번호를 입력하세요"> </div>
     <div><input type="button" onclick="searching_pwd()" value="비밀번호 찾기"> </div>
  </form>
 <div id="view">
  비밀번호는 <span id="pwd"></span> 입니다.
  <div><input type="button" onclick="hide()" value="창 닫기"></div>
 </div>
 
</body>
</html>

