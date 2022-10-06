<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 700px;
	margin: auto;           
	margin-top:50px;
	margin-bottom:50px;
}

#tb1{
width:800px;
 position:relative;
}
section #tb1 table td{
 border-top:1px solid black;
 padding-top:5px;
}
#tb2{
width:800px;
 margin-left:70px;
 position:absolute;
}

</style>
<script>

 function pom_view() // 문의답변하는 폼 보이게
 {
	 document.getElementById("tb2").style.display="block";
	 document.getElementById("btn").style.display="none";
 }
 function check(my)
 {
	 if(my.anwser.value.length<4)
		 {
		 alert("답변을 입력하세요");
		 return false;
		 }
	 else
		 return true;
 }
</script>
</head>

<body>
 <section>
 <div id="tb1">
  <table width="600" align="center">
  <caption><h2> 문의내용 </h2> </caption>
   <tr>
    <td>종류</td>
     <c:choose> 
     <c:when test="${cvo.gubun == 'g0' || cvo.gubun == 'r0'}">
                  <td><b>객실 문의</b></td>  
     </c:when>
     <c:when test="${cvo.gubun == 'g1' || cvo.gubun == 'r1'}">
               <td><b>멤버십 문의</b></td> 
     </c:when>
     <c:when test="${cvo.gubun == 'g2' || cvo.gubun == 'r2'}">
                   <td><b>서비스 문의</b></td> 
     </c:when>
     <c:when test="${cvo.gubun == 'g3' || cvo.gubun == 'r3'}">
                   <td><b>기타 문의</b></td> 
     </c:when>
    </c:choose> 
   </tr>
   
    <tr>
     <td> 제 목 </td>
     <td>${cvo.title}</td>
    </tr>
    <tr>
     <td>내용</td>
     <td height="100">${cvo.content}</td>
    </tr>
     <tr>
     <td>작성일</td>
     <td>${cvo.writeday}</td>
    </tr>
     <tr>
     <td>상태 </td>
     
     <c:if test="${cvo.state==0}">
     <c:set var="display" value="none"/>
      <td>
      <b style="color:red"> 답변대기중</b> 
       <span id="btn">
        <br><input type="button" onclick="pom_view()" value="답변하기"> 
         <input type="button" value="목록" onclick="location='qna_list'"> 
       </span>
      </td>
     </c:if>
     
     <c:if test="${cvo.state==1}">
      <c:set var="display" value="block"/>
      <td> 답변완료</td>
     </c:if>
     </tr>
  </table>
   </div>
   
    <!--  답변대기중일때 출력내용 -->
   <c:if test="${cvo.state==0}">
     <div id="tb2" style="display:${display}">
    <form method="post" action="qna_anwser_ok" onsubmit="return check(this)">
    <input type="hidden" name="id" value="${cvo.id}">
    <table width="600" align="center">
    <tr>
    <td colspan="2" align="left"> <b align="left">└></b></td>
    <tr>
     <td colspan="2" align="center"><b> 문의결과 </b></td>
    </tr>
    <tr>
     <td height="200"> 문의답변 </td>
     <td align="center"><textarea rows="10" cols="60" name="anwser"></textarea> </td>
    </tr>
    <tr>
     <td colspan="2" align="center">
     <input type="submit" value="답변하기">
     <input type="button" value="목록" onclick="location='qna_list'">
     </td>
    </tr>
     </table>
     </form>
     </div>
     </c:if>
     
     
     <!--  답변완료 출력내용 -->
     <c:if test="${cvo.state==1}">
     <div id="tb2" style="display:${display}">
     <b align="left">└> </b>
     <table width="600" border="1">
      <caption><h2> 문의결과 </h2></caption>
     <tr>
      <td height="200" width="200"><b>문의답변</b> </td>
      <td width="400">${cvo.anwser}</td>
     </tr>
     <tr>
      <td colspan="2" align="center"><a href="qna_list">목록</a> </td>
     </tr>
     </table>
     </div>
     </c:if>	
 </section>
</body>
</html>