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
	width: 80%;
	height: 800px;
	margin: auto;	

}
section #main{
 margin: auto;
 width:465px;
 height:800px;
 line-height:18px;
 font-weight:400;
 text-decoration: none solid rgb(26, 30, 41);
 font-family: Lato;
	font-size: 16px;
	
max-width: 465px;	
}
section div{

}
 section #input
 {
 width:500px;
 margin:auto;

 }
section #main input[type=text],#main input[type=password]
 {
  width:465px;
  height:40px;
  font-size: 16px;
 }
 section .label
 {
  font-size:12px;
  font-family:lato;
  text-decoration: none solid rgb(26, 30, 41);
  line-height: 18px;
  margin-top:8px;
  padding-top:5px;
 }
 section #end{
  margin-top:50px;
 }
 
</style>
<script>
var uchk=0; //사용자가 아이디의 중복체크 결과값을 가진다 1 =가능 0=불가능
var pchk=0;
function check_userid(userid)  // 아이디 입력부분 중복 & 글자수 체크
{ 
	
	   if(userid.trim().length >= 6)
	 {
		document.getElementById("aa").innerText="";
		
	   var chk=new XMLHttpRequest();
	   chk.open("get","check_userid?userid="+userid);
	   chk.send();
	   chk.onreadystatechange=function()
	    {
		 if(chk.readyState==4)
			  {
			
			if(chk.responseText=="0")
				  {
				  document.getElementById("aa").innerText="사용가능한아이디입니다";
				  document.getElementById("aa").style.color="blue";
                  uchk=1; //유효성검사할떄
				  }
			  else
				  
				  {
					  document.getElementById("aa").innerText="※ 이미있는아이디";
					  document.getElementById("aa").style.color="red";
                 uchk=0;
				 } 
				   
			  } 
	     }
	 } /* if종료 */
	  else
		 {
		   document.getElementById("aa").innerText="※ 아이디는 6자이상입니다";
		   document.getElementById("aa").style.color="red";
		 }
}  
 function pwd_check(pwd2) // 비밀번호 입력부분  비번확인,글자수 체크
 {   
	 var bb=document.getElementById("bb");
	 var pwd=document.pom.pwd.value;
	 
	 var num = pwd.search(/[0-9]/g);
	 var eng = pwd.search(/[a-z]/ig);
	
	 
	 if(pwd2.trim().length >= 6) //비밀번호 6글자 이상
	 {
	  if(pwd.search(/\s/) != -1) // 공백체크
		   {
			 bb.innerText="※ 비밀번호는 공백없이 입력하세요";
			 bb.style.color="red";
			 pchk=0;
		   }	 
	   else if(num < 0 || eng < 0)
		 {
			 bb.innerText="※ 영문,숫자를 혼합하여 입력하세요";
			 bb.style.color="red";
			 pchk=0;
		 }
		 
		  else
			 {
			 if(pwd==pwd2)
			 {
			  bb.innerText="비밀번호가 일치합니다";
			  bb.style.color="blue";
			  pchk=1;
			 }
		      else if(pwd!=pwd2)
		     {
		     bb.innerText="※ 비밀번호가 일치하지않습니다";
		     bb.style.color="red";
		     pchk=0;
		     }
		     else if(pwd2.trim().length<6)
		     {
			 bb.innerText="※ 비밀번호는 6글자이상입니다";
			  bb.style.color="red";
			 pchk=0;
		    }
			 }	
	 }
	 
	 else // 비밀번호 6글자 미만
	 {
		 bb.innerText="※ 비밀번호는 6글자이상입니다";
		 bb.style.color="red";
		 pchk=0;
	 }
 }

 function check(my) // 필수입력 : 아이디(uchk=1 정상),비번(pchk=1 정상),이름,생년월일,핸드폰번호
 {
	 
	 if(uchk==0)
		 {
		 alert("아이디를 다시 확인하세요")
		 return false;
		 }
	 else if(pchk==0)
		 {
		 alert("비밀번호를 다시 확인하세요")
		 return false;
		 }
	 else if(my.name.value.trim().length==0)
	     {
		 alert("이름을 입력하세요 ")
		 return false;
		 }
	 else if(my.ymd.value.trim().length != 8) // 생년월일 제대로들어오는지 유효성검사 (아직미완성) 
			 {
		     alert("생년월일은 8글자입니다 ")
		     return false;
			 }
	 else if(my.phone.value.trim()=="") // 전화번호 양식 제대로인지 체크 (미구현)
		 {
		 alert("핸드폰번호를 입력하세요");
		 return false;
		 }
	 else
		 {
		 return true;
		 }
	
 }
 
 

</script>

</head>
<body>
<section>
  <div id="main">
  <form name="pom" method="post" action="member_input_ok" onsubmit="return check(this)">
   
     <caption><h1 align="center"> 계정 만들기</h1></caption>
    <b style="color:blue;font-size:10px">*는 필수 입력 항목입니다.</b>

     <div class="label">* 아이디 </div>
     <div> <input type="text" name="userid" maxlength="10" onkeyup="check_userid(this.value)"></div>
      <!-- 중복일시 경고창 --><div id="aa"></div>
     
     
     <div class="label">* 비밀번호</div>
     <div><input type="password" name="pwd" placeholder="비밀번호"></div>    
    
     
     <div class="label">* 비밀번호확인</div>
     <div><input type="password" name="pwd2" placeholder="비밀번호확인" onkeyup="pwd_check(this.value)"></div> 
     <div id="bb"></div>       
     
     <div class="label">* 이름</div>
     <div><input type="text" name="name" required></div>
     
     <div class="label">* 생년월일</div>
     <div>
      <input type="text" name="ymd" placeholder="ex) 19960101" maxlength="8" required> 
     </div>
     
     <div class="label">* 전화번호</div>
     <div><input type="text" name="phone" placeholder="전화번호"></div>
     
     <div class="label"> 이메일 (선택)</div>
     <div><input type="text" name="email"></div>
     
    
    <div id="end"><input type="submit" id="loginbtn" value="회원가입"></div>
   
  </form>
</div>
</section>
</body>
</html>