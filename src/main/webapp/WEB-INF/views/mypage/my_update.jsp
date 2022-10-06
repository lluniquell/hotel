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
	text-align:center;
    background:#FFFFC6;
   }
   section div{
   margin-top:5px;
   }
   
</style>
</head>
<body>
 <section>
   <form name="pom" method="post" action="my_update_ok" onsubmit="return check(this)">
   
     <caption><h2> 정 보 수 정</h2></caption>
    <b style="color:blue;font-size:10px">*는 필수 입력 항목입니다.</b>

     <div>* 이름</div>
     <div><input type="text" name="name" value="${mvo.name}" required></div>
     
     <div>* 생년월일</div>
     <div>
      <input type="text" name="ymd" value="${mvo.ymd}" placeholder="ex) 19960101" maxlength="8" required > 
     </div>
     
     <div>* 전화번호</div>
     <div><input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"></div>
     
     <div> 이메일 (선택)</div>
     <div><input type="text" name="email" value="${mvo.email}"></div>
     
    
    <div><input type="submit" value="변경하기"></div>
     
  </form>
  
 </section>
</body>
</html>