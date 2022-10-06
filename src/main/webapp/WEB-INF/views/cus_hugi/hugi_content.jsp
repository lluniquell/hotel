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
     width:1500px;
     margin:auto;
     margin-top:50px;
     margin-bottom:50px;
     /*  border:1px solid black;  */  
   }
   section h2
   {
     position:relative;
     text-align:center;
     
   }
   section h2:after
   {
     content:'';
     position:absolute;
     left:50%;
     top:40px;
     bottom:0;
     width:30px;
     margin-left:-15px;
     height:1px;
     background:#cccccc;
   }
   section .slider
   {
     width:400px;
     height:280px;
     position:relative;
     margin:auto;
     margin-top:80px;
   }
   section .slider input[type=radio]
   {
      display:none;
   }
   section .himgs
   {
     padding:0;
     margin:0;
   }
   section .himgs li
   {
     position:absolute;
     list-style-type:none;
     padding:0;
     margin:0;
     transition-delay:0.7s;
     cursor:pointer;
   }
   section .himgs li:nth-child(1)
   {      
     left:0;
     transition:0.75s;
     z-index:1;
     box-shadow:14px -5px 35px -21px rgba(0,0,0,0.66);
   }
   section .himgs li:nth-child(2)
   {      
     left:170px;
     transition:0.75s;
     z-index:0;
     transform:scale(0.7);
     opacity:0.8;
     box-shadow:14px -5px 35px -21px rgba(0,0,0,0.66);
   }
   section .himgs li:nth-child(3)
   {      
     left:230px;
     transition:0.75s;
     z-index:-1;
     transform:scale(0.5);
     opacity:0.5;
     box-shadow:14px -5px 35px -21px rgba(0,0,0,0.66);
   }
   section .himgs li:nth-child(4)
   {      
     left:290px;
     transition:0.75s;
     z-index:-2;
     transform:scale(0.3);
     opacity:0.3;
     box-shadow:14px -5px 35px -21px rgba(0,0,0,0.66);
   }
   section .bullets
   {
     position: absolute;
     left:50%;
     transform:translateX(-50%);
     bottom:-15px;
     z-index:2;
   }
   section .bullets label
   {
     display:inline-block;
     border-radius:50%;
     background:rgba(18,100,163,0.55);
     width:10px;
     height:10px;
     cursor:pointer;
   }
   section .bullets label:nth-child(1)
   {
     background:#C4DEFF;     
   }
   section #con
   {
     width:400px;
     margin:auto;
     /* border:1px solid black; */
     padding:10px;
     position:relative; 
     margin-top:20px;    
   }
   section #con:after
   {
     content:'';
     position:absolute;
     top:33px;;
     left:25px;
     bottom:0;
     width:115px;
     margin-left:-15px;
     height:1px;
     background:#1264a3;
   }
   section #jungbo
   {
     font-size:13px;
     color:#068484; 
     padding-top:2px;    
   }
  section #msg_b /* 확인 메세지 바탕 + 중앙정렬 */
  {     
     position:absolute;     
     padding:100%;
     background:rgba(140,140,140,0.5);     
     left:50%;
     top:50%;
     transform:translate(-50%,-50%);
     align-items:center;
     visibility:hidden;
     z-index:10;
  }
  section #del_msg /* 확인 메세지 */
  {  
     width:300px;
     height:150px;  
     padding:25px;
     background:white;     
     margin:auto;   
     text-align:center;  
     color:red;
     font-size:20px;
     background-image:url("../resources/img/12.gif");
     background-repeat:no-repeat;
     background-position:center;
     background-size:80%;
     border-radius:7px;
     box-shadow:14px -5px 35px -15px rgba(0,0,0,0.66);
  } 
  
  section #del_msg > input[type=submit] /* 확인 메세지_ 버튼 */
  {
     align-items:center;
     margin-left:200px;     
  }
 </style>
 
   <script>
     function chg(n)
     {
    	 var len=document.getElementsByClassName("bula").length;
    	     	     	 
    	 for(i=0;i<len;i++)
    	 { 
    		 if(i==n)
    		   document.getElementsByClassName("bula")[i].style.background="#C4DEFF"; 
    		 else
    			 document.getElementsByClassName("bula")[i].style.background="rgba(18,100,163,0.55)"	  
    	 }
    	 
    	 for(i=0;i<len;i++)
    	 {     		 
    		 if(i==n)
    		  {
    			 document.getElementsByClassName("himg")[i].style.left="0";
    	    	 document.getElementsByClassName("himg")[i].style.transition="0.75s";
    	    	 document.getElementsByClassName("himg")[i].style.zIndex="1";
    	    	 document.getElementsByClassName("himg")[i].style.transform="scale(1)";
    	    	 document.getElementsByClassName("himg")[i].style.opacity="1";
    	    	 document.getElementsByClassName("himg")[i].style.boxShadow="14px -5px 35px -21px rgba(0,0,0,0.66)";
    		  }
    		 else if(i == n-1 || i == n+1)
    	      {
    			 if(i == n-1)
    			   document.getElementsByClassName("himg")[i].style.left="-170px";
    			 else
    				document.getElementsByClassName("himg")[i].style.left="170px";
    			 
    	    	 document.getElementsByClassName("himg")[i].style.transition="0.75s";
    	    	 document.getElementsByClassName("himg")[i].style.zIndex="0";
    	    	 document.getElementsByClassName("himg")[i].style.transform="scale(0.7)";
    	    	 document.getElementsByClassName("himg")[i].style.opacity="0.8";
    	    	 document.getElementsByClassName("himg")[i].style.boxShadow="14px -5px 35px -21px rgba(0,0,0,0.66)";
    	      }
    		 else if(i == n-2 || i == n+2)
   	         {
    			  
    			 if(i == n-2)
      			   document.getElementsByClassName("himg")[i].style.left="-230px";
      			 else
      				document.getElementsByClassName("himg")[i].style.left="230px";
   	    	    document.getElementsByClassName("himg")[i].style.transition="0.75s";
   	    	    document.getElementsByClassName("himg")[i].style.zIndex="-1";
   	    	    document.getElementsByClassName("himg")[i].style.transform="scale(0.5)";
   	    	 document.getElementsByClassName("himg")[i].style.opacity="0.5";
   	    	    document.getElementsByClassName("himg")[i].style.boxShadow="14px -5px 35px -21px rgba(0,0,0,0.66)";
   	         }
    		 else if(i == n-3 || i == n+3)
   	         {
    			  
    			 if(i == n-3)
      			   document.getElementsByClassName("himg")[i].style.left="-290px";
      			 else
      				document.getElementsByClassName("himg")[i].style.left="290px";
   	    	    document.getElementsByClassName("himg")[i].style.transition="0.75s";
   	    	    document.getElementsByClassName("himg")[i].style.zIndex="-2";
   	    	    document.getElementsByClassName("himg")[i].style.transform="scale(0.3)";
   	    	 document.getElementsByClassName("himg")[i].style.opacity="0.3";
   	    	    document.getElementsByClassName("himg")[i].style.boxShadow="14px -5px 35px -21px rgba(0,0,0,0.66)";
   	         }    			 
    	 }
     }
     function del_chk()
     {
    	 document.getElementById("msg_b").style.visibility="visible";
     }
     function del_clo()
     {   // 확인 메세지 닫기
    	 document.getElementById("msg_b").style.visibility="hidden";
     }
   </script>
<body>
  <section>
       <h2> 이용 후기 </h2>
       <div class="slider"> <!-- 사진 -->
            <ul id="imgholder" class="himgs">
             <c:set var="sn" value="0"/>
             <c:forEach items="${fimg}" var="fi">  
               <li class="himg" style="border-radius:7px;" >
                <img src="../resources/himg/${fi}" onclick="chg(${sn})" width="400" height="265" style="border-radius:7px;">
               </li>
              <c:set var="sn" value="${sn+1}"/>
             </c:forEach>
            </ul>
            <div class="bullets">
             <c:set var="bn" value="0"/>
             <c:forEach begin="1" end="${hvo.cnt}">  
              <label for="siled${bn}" onclick="chg(${bn})" class="bula">&nbsp;</label>
             <c:set var="bn" value="${bn+1}"/>
             </c:forEach>
            </div>            
       </div>
       
     <div id="con">  
       <div> <!-- 별점 -->
          <c:forEach begin="1" end="${hvo.star}">
           <img src="../resources/img/star1.png" width="18">
          </c:forEach>
          <c:forEach begin="1" end="${5-hvo.star}">
           <img src="../resources/img/star2.png" width="18">
          </c:forEach>
       </div>
       
       <div style="font-size:20px;padding-top:13px;font-weight:bold;"> ${hvo.title} </div> <!-- 제목 -->
       
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
     <!-- 이름, 객실, 조회수, 작성일 -->       
       <div id="jungbo"> ${hvo.name} · ${gr} · view.<fmt:formatNumber value="${hvo.readnum}" pattern="#,###"/> · ${hvo.writeday} </div>
     
       <div width="400" style="font-size:17px;margin-top:20px"> ${hvo.content} </div> <!-- 후기 내용 -->
    </div>   
       <div style="text-align:center;padding-top:30px;">
         <input type="button" value="목록" onclick="location='../cus_hugi/hugi_list'">
      <c:if test="${userid == hvo.userid}"> 
        <p>  
         <input type="button" value="수정" onclick="location='../cus_hugi/hugi_update?id=${hvo.id}'">
         <input type="button" value="삭제" onclick="jacascript:del_chk()">
      </c:if>     
       </div>
       
      <!-- 삭제 재확인 -->
      <div id="msg_b">      
       <div id="del_msg">
        <form method="post" action="hugi_delete">
        <input type="hidden" value="${hvo.id}" name="id">
         <div style="margin-top:25px;margin-bottom:30px;"> 정말 삭제하시겠습니까? <br>  * 삭제시 복구가 어렵습니다.*  </div>
         <input type="submit" value="삭제">
         <input type="button" value="취소" onclick="jacascript:del_clo()">
        </form> 
       </div>
      </div> 
  </section>
</body>
</html>