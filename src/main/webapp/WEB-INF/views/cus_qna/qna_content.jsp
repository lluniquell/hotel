<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<head>
  <style>
    section
    {
      margin:auto;
      margin-top:50px;
      margin-bottom:100px;
      width:1000px;
    }
  </style>
<script>  
  function del_chk()
  {	  
	  if(confirm("아직 문의답변을 받지 않으셨습니다. 문의를 삭제 하시겠습니까?"))
	   {
		  location="qna_delete?id=${qvo.id}";
	   }
  } 
</script>
</head>

<body>
 <section>
 
  <table width="400" align="center" border="1">
    <caption> <h3> 1:1 문의 </h3> </caption>
 
     <tr>
      <c:choose> 
       <c:when test="${qvo.gubun == 'g0' || qvo.gubun == 'r0'}">
         <c:set var="gubun" value="객실 문의"/>  
       </c:when>
       <c:when test="${qvo.gubun == 'g1' || qvo.gubun == 'r1'}">
         <c:set var="gubun" value="멤버쉽 문의"/> 
       </c:when>
       <c:when test="${qvo.gubun == 'g2' || qvo.gubun == 'r2'}">
         <c:set var="gubun" value="서비스 문의"/> 
       </c:when>
       <c:when test="${qvo.gubun == 'g3' || qvo.gubun == 'r3'}">
         <c:set var="gubun" value="기타 문의"/>
       </c:when>
     </c:choose>  
       <td colspan="2" height="15px;" align="right" style="font-size:12px;color:#B7F0B1;"> 문의 내용 : ${gubun} </td>
     </tr>
     <tr>
       <td width="90" align="center"> 제 목  </td>
       <td> ${qvo.title} </td>
     </tr>
     <tr>
       <td align="center"> 내 용  </td>
       <td> ${qvo.content} </td>
     </tr>
     <tr>
       <td align="center"> 작성일  </td>
       <td> ${qvo.writeday} </td>
     </tr>
     <tr>
       <td align="center"> 문의 상태 </td>
    <c:choose> 
     <c:when test="${qvo.state==0}">
       <td style="color:#FFA7A7;"> 답변 대기 </td>  
     </c:when>
     <c:when test="${qvo.state==1}">
       <td style="color:#B7F0B1;"> 답변 완료 </td>  
     </c:when>
    </c:choose>
     </tr>
     <tr height="80">
   <c:if test="${qvo.state == 0 || userid == 'admin'}"> <!-- 문의 답받기 전에는 수정 삭제 가능/관리자는 언제든 가능 -->
       <td colspan="2" align="center">
         <input type="button" value="목록" onclick="location='qna_list'">
         <input type="button" value="수정" onclick="location='qna_update?id=${qvo.id}'">
         <input type="button" value="삭제" onclick="del_chk()">
       </td>    
   </c:if>  
   <c:if test="${qvo.state == 1}">  <!-- 문의 답받은 후에는 수정 삭제 불가능 -->
       <td colspan="2" align="center">
         <input type="button" value="목록" onclick="location='qna_list'">
       </td>   
   </c:if>  
     </tr>

  </table>
 
 <!-- 답변 작성 및 답글 테이블  --> 
  <table align="">
    <tr> 
      <td>
        
      </td>
    </tr>
  </table>

</section>

</body>
