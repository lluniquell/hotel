<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>   
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
 a{
  text-decoration:none;
  color:black;
 }
 #userid{
  color:red;
  font-weight:bold;
 }
</style>
<script>
window.onload=function() // 문서를읽을떄 온로드
{ 
	if(<%=request.getParameter("del")%>==1)
	{
		alert("회원기록이 삭제되었습니다");
	}
	// 검색필드를 보여주기 (select태그의 밸류가 일치할경우)
	<c:if test="${sel !='id'}">
	 document.getElementById("sel").value="${sel}";
	 </c:if>
	 
	 <c:if test="${!empty state}">
	 document.getElementById("st").value="${state}";
	 </c:if>
}
function state_change(state)
{
	 location="member_list?state="+state;
	} 
</script>
</head>
<body>
<section>
 
 <b>
  ※요구사항 ※<p>
 1. 멤버리스트 출력 <p>
 2. 페이징구현 </b> 
 3. 상태(state)항목 누를시 상태별정렬 <p>
 현재 에러 : 선택항목 만들기 , select 항목눌럿을떄 페이징 1,2,3,4,5,6 .. 계속뜸
 <c:if test="${ empty list }">
    없음
 </c:if>
 <table width="1000" align="center" border="1">
 
 <caption>
 <h2><a href="member_list">회원정보조회</a></h2> <p>
 <div>
<form method="post" action="member_list">
 <select name="sel" id="sel">
  <option value="userid">아이디</option>
  <option value="phone">전화번호</option>
  <option value="email">이메일</option>
 </select>
 <input type="text" name="keyword" size="10" value="${keyword}">
 <input type="submit" value="검색">
 </div>
 
 </caption>
 <tr>
  <td>
  <select id="st" name="state" onchange="state_change(this.value)">
   <option value="0">정상회원</option>
   <option value="1">탈퇴신청중 회원</option>
   <option value="2">탈퇴완료 회원</option>
   <option value="777"> 관리자</option>
   <option value="999"> 가짜회원</option>
  </select>
</form>
  </td>
  <td>고유값(id)</td>
  <td id="userid">회원 아이디</td>
  <td>비밀번호</td>
  <td>이름</td>
  <td width="300">고객메모</td>
 </tr>
 
   <c:if test="${empty list}"> <!-- 검색된값이 없을떄 출력부분 -->
    <tr>
      <td colspan="8" align="center" height="300">
           <b style="font-size:30px;"> 검색된 값이 없습니다. </b>
      </td>
    </tr>
   </c:if>
   
  <c:forEach items="${list}" var="mvo">
     <c:if test="${mvo.state == 0}">
       <c:set var="state" value="<b style='color:green'> 정상회원 </b>" />
     </c:if>
      <c:if test="${mvo.state == 1}">
        <c:set var="state" value="<span style='text-decoration:line-through'>탈퇴신청중 </span>" />
       </c:if>
    <c:if test="${mvo.state == 2}">
         <c:set var="state" value="<b>탈퇴완료</b>"/>
     </c:if>
     <c:if test="${mvo.state == 777}">
         <c:set var="state" value="<b style='color:red'>관리자</b>" />       
     </c:if>
     <c:if test="${mvo.state == 999}">
         <c:set var="state" value="<b style='color:orange'>가짜회원</b>" />       
     </c:if>
 <tr>
  <td>${state}</td>
  <td>${mvo.id}</td>
  <td> <a id="userid" href="member_content?id=${mvo.id}&page=${page}&sel=${sel}&keyword=${keyword}">${mvo.userid}</a></td> <!-- 고유값 id들고가기 -->
  <td>${mvo.pwd}</td>
  <td>${mvo.name}</td>
 
 <td>
  <c:if test="${mvo.memo.length()>10}"> <!-- 고객 memo가 10자리이상이면 ... -->
    <c:set var="len" value="${fn:substring(mvo.memo,0,9)}   ....."/>
     ${len}
  </c:if>
   <c:if test="${mvo.memo.length()<10}">
   ${mvo.memo}
  </c:if>
  </td> 
  </tr>    
 </c:forEach>
 
  <tr>
     <td colspan="6" align="center">
     
         <!-- ◀◀   -->
     <c:if test="${pstart!=1}">
	    <a href="member_list?page=${pstart-1}&sel=${sel}&keyword=${keyword}"  style='color:red'>◀◀</a>
	   </c:if>
	  <!-- ◀   -->
		<c:if test="${page!=1}">
		 <a href="member_list?page=${page-1}&sel=${sel}&keyword=${keyword}">◀ </a>
		</c:if>
		
		<%--  1,2,3,4,5,6,7,8,9,10--%>
		<c:forEach begin="${pstart}" end="${pend}" var="i">
		  <c:if test="${page==i}">
		   <c:set var="style" value="style='color:red'"/>
		  </c:if>
		  <c:if test="${page!=i}">
		   <c:set var="style" value=""/>
		</c:if>
		   <a href="member_list?page=${i}&sel=${sel}&keyword=${keyword}" ${style}> ${i}</a>
		</c:forEach>
		
		<!-- ▶ -->
		<c:if test="${page<chong}">
		 <a href="member_list?page=${page+1}&sel=${sel}&keyword=${keyword}">▶</a>
		</c:if>
		<!-- ▶▶ -->
		<c:if test="${pend!=chong}">
	    <a href="member_list?page=${pend+1}&sel=${sel}&keyword=${keyword}"  style='color:red'>▶▶</a>
	   </c:if>
	   
	    </td>
		</tr>
		
 </table>
 <input type="button" onclick="location='dobae'" value="계정 50개생성"> 
 <a href="state_change"> 회원탈퇴요청 </a>
 </section>
</body>
</html>