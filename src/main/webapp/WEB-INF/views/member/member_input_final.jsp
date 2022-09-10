<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#content{
 
 width:600px;
 height:300px;
 margin:auto;
}

#btn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#btn:hover{
  background:#fff;
  color:#1AAB8A;
}
</style>
</head>
<body>
<div id="content">
  <h2 style="color:red"> ???호텔 회원가입이 완료 되었습니다. </h2>
   
   <p> 저희 호텔에 가입해주셔서감사합니다  </p>
   <p> 이제, ??호텔 회원이 누릴 수 있는 다양한 서비스를 확인해 보세요 </p> 
   
   <div align="center">
   <input type="button" onclick="location='../login/login'" value="홈으로 ☞ " id="btn">
   </div>
  </div>
</body>
</html>