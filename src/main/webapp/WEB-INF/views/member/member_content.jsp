<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
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
    margin-top:50px;
}
section table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
</style>
<script>
 onload=function()
 {  
	 
	 if(<%=request.getParameter("chk")%>=="1")
	 {
		 alert("수정되었습니다");
		 
	 }
	 document.getElementsByClassName("st")[${mvo.state}].checked=true;
 }
 
 var uchk=1;
 var pchk=1;
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
 					  document.getElementById("aa").innerText="이미있는아이디";
 					  document.getElementById("aa").style.color="red";
                  uchk=0;
 				 } 
 				   
 			  } 
 	     }
 	 } /* if종료 */
 	  else
 		 {
 		   document.getElementById("aa").innerText="아이디는 6자이상입니다";
 		   document.getElementById("aa").style.color="red";
 		    uchk=0;
 		 }
 }  
 
 function check_pwd(pwd) // 비밀번호 입력부분  비번확인,글자수 체크
 {   
	 var bb=document.getElementById("bb");
	 
	 var num = pwd.search(/[0-9]/g);
	 var eng = pwd.search(/[a-z]/ig);
	
	 
	 if(pwd.trim().length >= 6) //비밀번호 6글자 이상
	 {
	  if(pwd.search(/\s/) != -1) // 공백체크
		   {
			 bb.innerText="비밀번호는 공백없이 입력하세요";
			 bb.style.color="red";
			 pchk=0;
		   }	 
	   else if(num < 0 || eng < 0)
		 {
			 bb.innerText="영문,숫자를 혼합하여 입력하세요";
			 bb.style.color="red";
			 pchk=0;
		 }
		 
		  else
			 {
		    bb.innerText="";
			pchk=1; // 올바른입력 (true) 
			 }	
	 }
	 
	 else // 비밀번호 6글자 미만
	 {
		 bb.innerText="비밀번호는 6글자이상입니다";
		 bb.style.color="red";
		 pchk=0;
	 }
 }
 
 function check(my) // 폼 유효성검사
 {
	 if(uchk != 1)
		 {
		 alert("아이디를 확인하세요");
		 return false;
		 }
	 else if(pchk != 1)
		 {
		 alert("비밀번호를 확인하세요");
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
 
 function mem_del(id)
 {
	 if(confirm("회원을 삭제하시겠습니까?\n※ 삭제시 데이터를 복구 할 수 없습니다. ※"))
		 {
		  location="member_delete?id="+id;
		 }
 }
</script>
</head>
<body>
<section>
<form method="post" action="update_ok" onsubmit="return check(this)">
 <table  width="800" align="center">
  <caption><h2>정보·수정·삭제</h2></caption>
  <input type="hidden" name="id" value="${mvo.id}">
  <input type="hidden" name="page" value="${page}">
  <input type="hidden" name="sel" value="${sel}">
  <input type="hidden" name="keyword" value="${keyword}">
  <tr>
    <td>회원 아이디</td>
    <td>
    <input type="text" name="userid" value="${mvo.userid}" onkeyup="check_userid(this.value)">
    <b id="aa"></b>
    </td>
    
  </tr>
  <tr>
    <td>비밀번호</td>
    <td>
    <input type="text" name="pwd" value="${mvo.pwd}" onkeyup="check_pwd(this.value)">
    <b id="bb"></b>
    </td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input type="text" name="name" value="${mvo.name}"></td>
  </tr>
   <tr>
    <td>생년월일</td>
    <td><input type="text" name="ymd" value="${mvo.ymd}" maxlength="8"></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input type="text" name="phone" value="${mvo.phone}" maxlength="10"></td>
  </tr>
  <tr>
    <td> 이메일 </td>
    <c:if test="${mvo.email==null}">
    <td> <b style="text-decoration:line-through">없음</b> </td>
    </c:if>
   <c:if test="${mvo.email!=null}">   
    <td><input type="text" name="email" value="${mvo.email}"></td>
    </c:if>
  </tr>
  <tr>
    <td>회원상태 </td>
    <td>
          정상<input class="st" type="radio" name="state" value="0"> 
          탈퇴신청중 <input class="st" type="radio" name="state" value="1">
          탈퇴완료 <input class="st" type="radio" name="state" value="2">
    </td>
  </tr>
  
  <tr>
   <td> 고객메모 </td>
   <td>
    <textarea rows="5" cols="60" name="memo">${mvo.memo}</textarea>
   </td>
  </tr>
  
  <tr>
    <td><b>고유값 (id)</b> / 가입일 </td>
    <td><b>${mvo.id }</b>/ ${mvo.writeday}</td>
  </tr>
  <tr>
   <td colspan="2" align="center">
    <input type="submit" value="수정하기">
    <input type="button" onclick="mem_del(${mvo.id})" value="회원삭제">    
   </td>
  </tr>
  <tr>
   <td colspan="2" align="center">
    <input type="button" onclick="location='member_list?page=${page}&sel=${sel}&keyword=${keyword}'" value="목록">
    </td>
  </tr>  
 </table>
 </form>
 
</section>
</body>
</html>