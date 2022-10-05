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
}
</style>
<script>
window.onload=function() // 문서를읽을떄 온로드
{
  <c:if test="${state == '0'}">
   document.getElementById("st").value="${state}";
   <c:set var="title" value="답변대기중"/>
   </c:if>
  <c:if test="${state == '1'}">
  document.getElementById("st").value="${state}";
  <c:set var="title" value="답변완료"/>
 </c:if>
	}
function state_change(state)
  {
	 location="qna_list?state="+state;
} 
</script>
</head>
<body>
<section>
 <table width="600" align="center">
 <caption>
 <h2> ${title}</h2>
 <select id="st" name="state" onchange="state_change(this.value)">
  <option value="0"> 답변대기중 </option>
  <option value="1"> 답변완료</option>
 </select>

 </caption>
  <tr>
   <td> 종류 </td>
   <td> 문의제목 </td>
   <td> 회원ID </td>
   <td> 작성일 </td>
   <td> 상태  </td>
  </tr>
  <c:forEach items="${list}" var="cvo">
   <tr>
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
    
   <td> <a href="qna_content?id=${cvo.id}">${cvo.title }</a></td>
   <td> ${cvo.userid } </td>
   <td> ${cvo.writeday }</td>
   <c:if test="${cvo.state==0}">
    <td><input type="button" onclick="location='qna_content?id=${cvo.id}'" value="답변하기"></td>
   </c:if>
   <c:if test="${cvo.state==1}">
    <td><b style="color:blue"> 답변완료</b></td>
   </c:if>
   
  </tr>
  </c:forEach>
 </table>
</section>
</body>
</html>