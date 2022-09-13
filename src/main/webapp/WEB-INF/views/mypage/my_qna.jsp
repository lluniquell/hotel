<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
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
 section a{
  text-decoration:none;
  color:black;
 }
 .myTab{
 margin-top:50px;
 margin-left:0px;
 width:800px;
  position:relative;
 
  }
 .main li{
  list-style-type:none;
  display:inline-block;
  width:150px;
  height:30px;
  border:1px solid #cccccc;
  border-left:0px;
  margin-left:0px;
  text-align:center;
   padding-top:10px;
    padding-bottom:5px;
    font-weight:bold;
 }
 .main .sub3
 { 
  background:skyblue;
 }
 #tb
 {
  margin-top:0px;
  width:700px;
  height:400px;
  position:absolute;
  text-align:center;
 }
 #tb table{
   border-spacing: 0 10px;
 }
 
 #tb table tr:first-child > td{
   border-bottom:2px solid skyblue;
   
   font-weight:bold;
  
 }+
 table td{
  padding-top:5px;
  height:30px;
 }

</style>
</head>
<body>
<section>
 <div class="myTab">
  <ul class="main">
   <li class="sub1"><a href="myinfo">회원정보수정</a></li><li class="sub2"><a href="reserve_info">예약조회</a></li><li class="sub3"><a href="my_qna">문의내역</a></li>
  </ul>
  </div>
 <div id="tb"> 
 
 <table width="800">
     <caption>
     <div style="color:#cccccc;font-size:15px;"> **제목을 클릭하시면 상세 내용을 볼  수 있습니다**</caption>

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
       <td> <a href="../mypage/qna_content?id=${qvo.id}"> ${qvo.title} </a> </td>
       <td> ${qvo.writeday} </td>         
    <c:choose> 
    <c:when test="${qvo.state==0}">
       <td><b style="color:#FFA7A7"> 답변 대기 </b> </td>  
     </c:when>
     <c:when test="${qvo.state==1}">
       <td><b style="color:blue"> 답변 완료</b> </td>  
     </c:when>
    </c:choose>
       </td>   
     </tr>
  </c:forEach>

     <tr>
      <td colspan="4" align="right" height="100">
        <input type="button" value="문의하기" onclick="location='../cus_qna/qna_write'">
      </td>
     </tr>

   </table>
</div>



</section>
</body>
</html>