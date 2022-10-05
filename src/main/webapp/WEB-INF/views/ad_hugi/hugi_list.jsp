<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
 section
 {
   width:600px;
   margin:auto;
   margin-top:50px;
   margin-bottom:50px;
 }
 section h2
 {
   position:relative;
   cursor:default;
 }
 section h2:after
 {
   content:'';
   position:absolute;
   left:50%;
   top:38px;
   bottom:0;
   width:30px;
   margin-left:-15px;
   height:1px;
   background:#cccccc;
 }
 section .himg
 {
   position:relative;   
   /* border:1px solid black; */
   margin-bottom:10px;
   /* padding:5px; */
   cursor:pointer;
   overflow:hidden;
   border-radius:7px;
 }
  section .himg #f_img
  {
     transform:scale(1);
     transition:0.9s;
     border-radius:7px;
  }
  section .himg:hover #f_img
  {
     transform:scale(1.3);
     transition:1s;     
  }
  section .himg img
  {
     transform:scale(1);
     transition:0.9s;    
  }
 section .cnt
 {
   position:absolute;
   color:#1264a3;
   font-size:13px;
   bottom:6px;
   right:6px;
   text-align:right;
   font-weight:bold;
   text-shadow:1px 1px 2px #BDBDBD;
 }  
 
 section #title
 {
   text-decoration:none;
   color:black;    
   cursor:pointer;
   font-size:18px;   
 }
 section #title:hover {
   color:#1245AB;    }
 section .plink  {
   font-size:18px;  }
 section .plink
 {
   text-decoration:none;
   color:#3162C7;
   font-weight:bold;
  }
 section .plink:hover  {
   color:#068484;  }
 section table tr
 {
   border-bottom:1px solid black;
 }
 section li:hover
 {
   color:#3162C7;
 }
</style>
<body>
  <section>
    <c:set var="tr3" value="0"/>
    <table align="center" cellspacing="25">
     <caption><h2> 이용 후기 </h2></caption>
      <tr>
    <c:forEach items="${hlist}" var="hvo">  
       <td width="235">
         <div class="himg" onclick="location='hugi_readnum?id=${hvo.id}'"> 
           <img id="f_img" src="../resources/himg/${hvo.img}" width="240" height="180">
            <div class="cnt">
             <c:if test="${hvo.cnt>1}"> 
              <div style="margin-bottom:-2px;">
               <img style="margin-right:-3.5px;margin-bottom:-2px;" src="../resources/img/camera.png" width="12" > 
               <div style="display:inline-block;font-size:13px;" id="cnt"> +${hvo.cnt-1}  </div><br>
              </div>
             </c:if>
               <img style="margin-bottom:-1px;margin-right:-2px" src="../resources/img/eye2.png" width="12"> 
               <fmt:formatNumber value="${hvo.readnum}" pattern="#,###"/> 
            </div>   
         </div>
 
         <div> <!-- 별점 -->
          <c:forEach begin="1" end="${hvo.star}">
           <img src="../resources/img/star1.png" width="15">
          </c:forEach>
          <c:forEach begin="1" end="${5-hvo.star}">
           <img src="../resources/img/star2.png" width="15">
          </c:forEach>
         </div>
         <div> <a href="hugi_readnum?id=${hvo.id}" id="title"> ${hvo.title} </a> </div>
         <img style="margin-left:1px;margin-right:-1px;margin-bottom:-4px;" src="../resources/img/user.png" width="15" >
         <div style="font-size:13px;color:#068484;cursor:default;display:inline-block;"> ${hvo.name} </div> <br>
       <!-- 객실 등급   -->
   <c:if test="${hvo.grade==1}">     
    <c:set var="gr" value="스탠다드"/>
   </c:if> 
   <c:if test="${hvo.grade==2}">     
    <c:set var="gr" value="슈페리어"/>
   </c:if> 
   <c:if test="${hvo.grade==3}">     
    <c:set var="gr" value="디럭스"/>
   </c:if> 
   <c:if test="${hvo.grade==4}">     
    <c:set var="gr" value="스위트"/>
   </c:if>
         <img style="margin-right:-3px;margin-bottom:-4px;" src="../resources/img/bed.png" width="17" >      
         <div style="font-size:13px;color:#068484;cursor:default;display:inline-block"> 객실 등급 : ${gr} </div>      
       </td>
    <c:set var="tr3" value="${tr3+1}"/>  
    <c:if test="${tr3%3==0}">
      </tr>
      <tr>
    </c:if>
    </c:forEach>
      </tr>
      <tr>
        <td colspan="3" align="center">
         <c:if test="${pstart==1}">
        <span class="li" style="cursor:default;">  ≪  </span>
         </c:if>
         <c:if test="${pstart!=1}">
           <a class="li" href="../ad_hugi/hugi_list?page=${pstart-1}"> ≪ </a>
         </c:if>
         <c:if test="${pstart==1}">
          <span class="li" style="cursor:default;">＜ </span>
         </c:if>
         <c:if test="${pstart!=1}">
           <a class="li" href="../ad_hugi/hugi_list?page=${page-1}">＜ </a>
         </c:if>
        
          <c:forEach begin="${pstart}" end="${pend}" var="i">
           <c:if test="${page==i}">
             <a class="plink" href="../ad_hugi/hugi_list?page=${i}" >${i}</a>
           </c:if>
           <c:if test="${page!=i}">
             <a class="plink" href="../ad_hugi/hugi_list?page=${i}">${i}</a>
           </c:if>
          </c:forEach>
         
         <c:if test="${page == chong}">
         <span class="li" style="cursor:default;"> ＞ </span>
         </c:if>
         <c:if test="${page != chong}">
           <a class="li" href="../ad_hugi/hugi_list?page=${page+1}">＞ </a>
         </c:if>
         <c:if test="${pend == chong}">
           <span class="li" style="cursor:default;"> ≫ </span>
         </c:if>
         <c:if test="${pend != chong}">
           <a class="li" href="../ad_hugi/hugi_list?page=${pend+1}"> ≫ </a>
         </c:if>
        </td>
      </tr>
    </table>
  </section>
</body>
</html>