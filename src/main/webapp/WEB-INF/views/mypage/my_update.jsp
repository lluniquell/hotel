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
	width:1000px;
	height: 700px;
	margin: auto;	

}
section #title{
 height:35px;
 font-size:25px;
 font-weight: bold;
 margin: auto;
 width:100%;
 text-align: center;
 border-bottom: 2px solid silver;
 margin-bottom: 15px;
}
section #main{
 margin: auto;
 width:465px;
 height:650px;
 line-height:18px;
 font-weight:400;
 text-decoration: none solid rgb(26, 30, 41);
 font-family: Lato;
	font-size: 16px;
	 margin-top:50px;
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
  border-top:2px solid silver;
  padding-top: 20px;
 }
 
</style>
</head>
<body>
 <section>
   
   <div id="main">
    <div id="title"> 개인정보변경 </div>
  <form name="pom" method="post" action="my_update_ok" onsubmit="return check(this)">  
    <b style="color:blue;font-size:10px">*는 필수 입력 항목입니다.</b>

     <div class="label">* 아이디 </div>
     <div><input type="text" value="${mvo.userid}" readonly="readonly" style="background:#eeeeee"></div>
     
     <div class="label">* 이름</div>
     <div><input type="text" name="name" value="${mvo.name}" required ></div>
     
     <div class="label">* 생년월일</div>
     <div>
      <input type="text" name="ymd" placeholder="ex) 19960101" maxlength="8" value="${mvo.ymd}" required> 
     </div>
     
     <div class="label">* 전화번호</div>
     <div><input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"></div>
     
     <div class="label"> 이메일 (선택)</div>
     <div><input type="text" name="email" value="${mvo.email}"></div>
     
    
    <div id="end" align="center">
    <input type="button" onclick="location='myinfo'" class="silverbtn" value="취소">&nbsp;&nbsp;&nbsp;
    <input type="submit" class="silverbtn" value="수정">
    </div>
   
  </form>
</div>
 </section>
</body>
</html>