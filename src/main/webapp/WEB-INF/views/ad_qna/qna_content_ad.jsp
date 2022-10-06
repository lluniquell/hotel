<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>  
  function del_chk() /* 삭제시 알림 */
  {	  
	  if(confirm("삭제시 복구 할 수 없습니다. 문의를 삭제 하시겠습니까?"))
	   {
		  location="qna_delete?id=${qvo.id}";
	   }
  } 
  
  function answer_update(id, content, userid)
  {
	  document.aform.id.value=id;
	  document.aform.id.disabled=false;
	  document.aform.content.value=content;
	  document.aform.userid.value=userid;
	  
	  document.getElementById("as_dnt").disabled=false;
	  document.getElementById("as_dnt").value="수정하기"
	  
	  document.aform.action="answer_update_ok";
  }
</script>
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
   <c:if test="${qvo.state == 0}"> 
       <td colspan="2" align="center">
         <input type="button" value="목록" onclick="location='qna_list'">
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
  <form name="aform" method="post" action="qna_answer_ok"> 
  <input type="hidden" name="qid" value="${qvo.id}"> <!-- 답글다는 문의글의 id -->
  <input type="hidden" name="id" disabled> <!-- 문의글의 id => 수정시 필요 --><!--  disabled를 하지않으면  빈값으로 가서 자료형이 안맞음(수정시만 쓸수있게 하기) -->
  <table align="center" width="400" border="1">
   <tr>   
    <td colspan="4">  
     <table width="350" border="1">
      <tr>
       <td width="30"> <input type="text" name="userid" value="${userid}" readonly style="border:none;outline:none;"> </td> 
       <td> <textarea cols="60" rows="4" name="content" placeholder="답변을 기입해주세요"></textarea> </td>
       <td>
       <c:if test="${qvo.state == 0}">
         <input type="submit" value="답변 작성">
       </c:if>
       <c:if test="${qvo.state == 1}">
         <input type="submit" disabled value="답변 작성" id="as_dnt">
       </c:if>
       </td>
      </tr>
     </table>
    </td>     
   </tr> 
  <c:if test="${qvo.state == 1}"> <!-- 답변이 달렸다면 -->
    <tr> 
      <td> 작성자 </td>
      <td> 답 변 </td>
      <td> 작성일 </td>          
      <td> 비 고  </td>  
    </tr>
    <tr> 
      <td> 문의 담당자 </td>
      <td> ${avo.content} </td>
      <td> ${avo.writeday} </td>  
      <td>      
        <input type="button" value="수정" onclick="answer_update(${avo.id}, '${avo.content}', '${avo.userid}')" > <!-- 문자로 된것은 ""('')를 붙여야 한다!->안 그러면 변수로 인식 -->
        <input type="button" value="삭제" onclick="location='../ad_qna/qna_answer_delete?id=${avo.id}'">         
     </td>   
    </tr>
   </c:if>
  </table>
  </form>
</body>
</html>