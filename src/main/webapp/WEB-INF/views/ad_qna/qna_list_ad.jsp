<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <style>
  section a
  {
    text-decoration:none;
    color:black;    
  }
  section a:hover
  {
    color:#8BBCFF;
  }
  section .plink
  {
    font-size:18px;
    text-decoration:none;
    color:black; 
  }
 section .plink:hover
  {
    color:#8BBCFF;
  }
 </style>
<body>
 <section>
   <table width="600" align="center">
     <caption> <h2 style="margin-bottom:0px;"> 1:1 문의 </h2>
     <div style="color:#cccccc;font-size:12px;"> **제목을 클릭하시면 상세 내용을 볼  수 있습니다**</div></caption>
     <tr align="center" style="border-bottom:1px solid black" height="40">
       <td> 문의 내용  </td>
       <td> 제 목 </td>
       <td> 작성일 </td>    
       <td> 문의 상태 </td>   
     </tr>
  <c:forEach items="${list}" var="qvo"> 
      <tr align="center">
       <td id="qna_k">
    <c:choose> 
     <c:when test="${qvo.gubun == 'g0' || qvo.gubun == 'r0'}">
                   객실 문의  
     </c:when>
     <c:when test="${qvo.gubun == 'g1' || qvo.gubun == 'r1'}">
                   멤버쉽 문의 
     </c:when>
     <c:when test="${qvo.gubun == 'g2' || qvo.gubun == 'r2'}">
                   서비스 문의 
     </c:when>
     <c:when test="${qvo.gubun == 'g3' || qvo.gubun == 'r3'}">
                   기타 문의
     </c:when>
    </c:choose>  
       </td>
       <td> <a href="../ad_qna/qna_content?id=${qvo.id}"> ${qvo.title} </a> </td>
       <td> ${qvo.writeday} </td>         
    <c:choose> 
     <c:when test="${qvo.state==0}">
       <td style="color:#FFA7A7;"> 답변 대기 </td>  
     </c:when>
     <c:when test="${qvo.state==1}">
       <td style="color:#B7F0B1;"> 답변 완료 </td>  
     </c:when>
    </c:choose>
       </td>   
     </tr>
  </c:forEach>
     <tr id="page_btn" height="50">
       <td colspan="4" align="center">
        <c:if test="${pstart==1}">
          ≪
        </c:if>
        <c:if test="${pstart!=1}">
          <a href="../ad_qna/qna_list?page=${pstart-1}"> ≪ </a>
        </c:if>
        <c:if test="${pstart==1}">
          ＜
        </c:if>
        <c:if test="${pstart!=1}">
          <a href="../ad_qna/qna_list?page=${page-1}">＜ </a>
        </c:if>
        
         <c:forEach begin="${pstart}" end="${pend}" var="i">
          <c:if test="${page==i}">
            <a class="plink" href="../ad_qna/qna_list?page=${i}" style="font-weight:bold;color:#3162C7;">${i}</a>
          </c:if>
          <c:if test="${page!=i}">
            <a class="plink" href="../ad_qna/qna_list?page=${i}">${i}</a>
          </c:if>
         </c:forEach>
         
        <c:if test="${page == chong}">
          ＞
        </c:if>
        <c:if test="${page != chong}">
          <a href="../ad_qna/qna_list?page=${page+1}">＞ </a>
        </c:if>
        <c:if test="${pend == chong}">
          ≫
        </c:if>
        <c:if test="${pend != chong}">
          <a href="../ad_qna/qna_list?page=${pend+1}"> ≫ </a>
        </c:if>
       </td>
     </tr>
   </table>
   
 </section>
</body>
</html>