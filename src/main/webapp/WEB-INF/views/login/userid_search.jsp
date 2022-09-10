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
 #userid{
  font-size:20px;
  font-weight:bold;
  color:green;
 }
 
</style>
<script>
function searching_userid()
  {
	var name=document.pom.name.value;
	var ymd=document.pom.ymd.value;
	var err=0;
	
    var chk=new XMLHttpRequest(); 
    chk.open("get","searching_userid?name="+name+"&ymd="+ymd);
    chk.send();
    chk.onreadystatechange=function()
    {
    	
       if(chk.readyState==4)
    	   {
    	     if(chk.responseText=="null")
    	    	 {
    	    	  alert("아이디를 찾을수 없습니다");
    	    	   err=0;
    	    	 }
    	     else
    	    	 {
    	    	   document.pom.style.display="none";
    	    	  document.getElementById("view").style.display="inline-block";
    	    	  document.getElementById("userid").innerText=chk.responseText;
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
    <h1> 아이디 찾기 </h1>
     <div><input type="text" name="name" placeholder="이름 "> </div>
     <div><input type="text" name="ymd" placeholder="생년월일" maxlength="8"> </div>
     <div><input type="button" onclick="searching_userid()" value="아이디 찾기"> </div>
  </form>
 <div id="view">
  아이디는 <span id="userid"></span> 입니다.
  <div><input type="button" onclick="hide()" value="창 닫기"></div>
 </div>
 
</body>
</html>

