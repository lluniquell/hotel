<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
 background:#EBF7FF;
}
#main{
 width:80%;
 margin: auto;
}
#title{
 text-align: center;
 font-size: 25px;
 font-weight: bold;
 margin-top: 30px;
}
 #view{
  margin-top:150px;
  display:none;
 }
 #pwd{
  font-size:20px;
  font-weight:bold;
  font-style:italic;
  color:green;
 }
 input{
  height: 40px;
width: 300px;
 }
 .label{
 margin-top:15px;
 font-weight: bold;
 margin-bottom: 3px;
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
<div id="main">
  <form name="pom">
     <div id="title"> 비밀번호 찾기 </div>
      <div class="label">아이디</div>
     <div><input type="text" name="userid" placeholder="아이디를 입력하세요 "> </div>
     <div class="label">이름</div>
     <div><input type="text" name="name" placeholder="이름을 입력하세요"> </div>
     <div class="label">전화번호</div>
     <div><input type="text" name="phone" placeholder="전화번호를 입력하세요"> </div>
     <div style="margin-top:30px"><span id="loginbtn" onclick="searching_pwd()">비밀번호 찾기</span> </div>
  </form>
    <div id="view" align="center">
         비밀번호는 <span id="pwd"></span> 입니다.
     <div><span id="loginbtn" onclick="hide()" style="margin-top:20px;">창 닫기</span></div>
     </div>
</div>
</body>
<style>
 #loginbtn{
  /* Font & Text */
	font-family: Lato;
	font-size: 16px;
	font-style: normal;
	font-variant: common-ligatures;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 24px;
	text-decoration: none solid rgb(255, 255, 255);
	text-align: center;
	text-indent: 0px;
	text-transform: uppercase;
	vertical-align: baseline;
	white-space: nowrap;
	word-spacing: 0px;

	/* Color & Background */
	background-attachment: scroll;
	background-color: rgb(30, 24, 82);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: repeat;
	color: rgb(255, 255, 255);

	/* Box */
	height: 50px;
	width: 300px;
	border: 1px solid rgb(30, 24, 82);
	border-top: 1px solid rgb(30, 24, 82);
	border-right: 1px solid rgb(30, 24, 82);
	border-bottom: 1px solid rgb(30, 24, 82);
	border-left: 1px solid rgb(30, 24, 82);
	margin: 15px 0px;
	padding: 12px 24px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 200px;

	/* Positioning */
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	float: none;
	display: block;
	clear: none;
	z-index: auto;

	/* List */
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;

	/* Table */
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;

	/* Miscellaneous */
	overflow: visible;
	cursor: pointer;
	visibility: visible;

	/* Effects */
	transform: none;
	transition: all 0.15s ease 0s;
	outline: rgb(255, 255, 255) dashed 0px;
	outline-offset: 0px;
	box-sizing: border-box;
	resize: none;
	text-shadow: none;
	text-overflow: clip;
	word-wrap: normal;
	box-shadow: none;
	border-top-left-radius: 25px;
	border-top-right-radius: 25px;
	border-bottom-left-radius: 25px;
	border-bottom-right-radius: 25px;

 }
 #loginbtn:hover{
  background:green;
  color:white;
  font-weight: bold;
}
</style>
</html>

