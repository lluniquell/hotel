<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

 <style>
   section
   {
     width:1000px;
     margin:auto;      
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
     top:38px;
     bottom:0;
     width:30px;
     margin-left:-15px;
     height:1px;
     background:#cccccc;
   } 
   section #h2_sub
   {
     font-size:14px;
     color:#cccccc; 
     text-align:center;     
   }
   section #faq_area
   {
     margin:auto;
     width:100%;
     position:relative;
     margin-top:100px;
   }
   section .faq_tab
   {   
     position:absolute;;
     top:-41px;
     left:200px;
     margin:auto; 
     text-align:center;
     display:flex;
     /* justify-content: center; */
   }
   
   section .faq_tab > div:first-child
   {
      border-left:1px solid black;
      /* border-bottom:1px solid #eaedf5; */
      height:31px;
      background:#eaedf5; 
      color:black; 
   }
   section .faq_tab > div
   {
     width:120px;
     height:30px;
     padding-top:10px;
     text-align:center;
     border-top:1px solid black;
     border-right:1px solid black;
     display:inline-block;
     background:white; 
     cursor:pointer;  
     color:#A6A6A6;  
   }
      section .faq_tab > div:hover
   {
     background:#eaedf5 !important;
     color:#4375DB !important; 
     height:31px !important;
   }
   
   
  section #answer_area
  {
    margin-top:50px;
    margin:auto;
    width:100%;
    padding-top:50px;
    padding-bottom:50px;
    background:#eaedf5;
    border-top:1px solid black;
    
  } 
  section .answer
   {
     width:600px;
     margin:auto;
   }
   section .answer .que:first-child
   {
      border-top:2px solid black; 
   }
   section .answer .que
   {
     position:relative;
     padding:17px;
     border-bottom:1px solid #cccccc;  
     font-size:14px;   
     cursor:pointer;
   }
   section .answer .que > h4:before
   {
     display:inline-block;
     content:"Q";
     font-size:14px;
     color:#006633;
     margin:5px;
   }
   
   section .answer .que .on > h4
   {
     color:#006633;
   }
   section .answer .ans
   {
     display:none;
     /* transition:all .70s; */
     overflow:hidden;
     font-size:14px;
     padding:27px;
     background-color:#f4f4f2;
   }
   section .answer .ans:before
   {
     display:inline-block;
     content:"A";
     font-size:14px;
     font-weight:bold;
     color:#666;
     margin:5px;
   }
   section .answer .btn
   {
     position:absolute;
     width:20px;
     height:20px; 
     /* border:1px solid red; */ 
     top:40%;
     right:30px; 
     cursor:pointer;  
   }
   
   section .answer .btn > span:nth-child(1)
   {
     position:absolute;
     display:block;
     width:100%;
     height:1px;
     border-radius:10px;
     background:#1e1852;
     /* transtion:all .35s; */
     transition-duration:0.7s;     
     top:46%;
   }
   section .answer .btn > span:nth-child(2)
   {
     position:absolute;
     display:block;
     width:1px;
     height:100%;
     border-radius:10px;
     background:#1e1852;
     /* transtion:all .35s; */
     transition-duration:0.7s;
     left:46%;     
   }
  section .answer .que.on > .btn span:nth-child(1)
   {
      transform:translateY(0) rotate(360deg);
   }
   section .answer .que.on > .btn span:nth-child(2)
   {
      transform:translateY(0) rotate(90deg);
   } 
   
 
 </style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script>
  function ans_view(n)  // 분류별 드러내기 
   {   	
     var len=document.getElementsByClassName("answer").length;
     for(i=0;i<len;i++)
     {
  	  if(i==n)    	
  	  { 
  	    document.getElementsByClassName("answer")[i].style.display="block";
  	    document.getElementsByClassName("tabs")[i].style.height="31px";
  	    document.getElementsByClassName("tabs")[i].style.background="#eaedf5";
  	    document.getElementsByClassName("tabs")[i].style.color="black";
  	  }
  	  else 
  	  {
  	   document.getElementsByClassName("answer")[i].style.display="none";
  	   document.getElementsByClassName("tabs")[i].style.height="30px";
	   document.getElementsByClassName("tabs")[i].style.background="white";
	   document.getElementsByClassName("tabs")[i].style.color="#A6A6A6";
  	  }
     }
     
   }
  
 $(function()
    {
	    $(".que").click(function()
	    {
	    	$(this).next(".ans").stop().slideToggle(600);	    	
	    	$(this).toggleClass("on").siblings().removeClass("on");	 
	    	$(this).next(".ans").siblings(".ans").slideUp(600);
	    });    	

    	 
    });    

  </script>
   </head>
<body>
 
  <section>
    <h2>FAQ</h2>
     <div id="h2_sub">자주묻는 질문</div>
     
<div id="faq_area">  
    <div class="faq_tab">
      <div class="tabs" id="all_tab" onclick="ans_view(0)" onmouseover="tabs_chk1(0)" onmouseout="tabs_chk2(0)"> 자주묻는 질문</div>
      <div class="tabs" id="re_tab" onclick="ans_view(1)" onmouseover="tabs_chk1(1)" onmouseout="tabs_chk2(1)"> 예약 </div>
      <div class="tabs" id="ser_tab" onclick="ans_view(2)" onmouseover="tabs_chk1(2)" onmouseout="tabs_chk2(2)"> 서비스 </div>
      <div class="tabs" id="mem_tab" onclick="ans_view(3)" onmouseover="tabs_chk1(3)" onmouseout="tabs_chk2(3)"> 회원 </div>
      <div class="tabs" id="etc_tab" onclick="ans_view(4)" onmouseover="tabs_chk1(4)" onmouseout="tabs_chk2(4)"> 기타 </div>
    </div>
 <div id="answer_area"> 
    <div class="answer" id="faq_all" >
    <c:set var="aa" value="0"/>
     <c:forEach items="${alist}" var="afvo">
      <div class="que"> <h4> ${afvo.question} </h4>
       <div class="btn" value="${aa}">
        <span></span>
        <span></span>
      </div>
      </div>
      <div class="ans"> 
         ${afvo.answer}
      </div>    
      <c:set var="aa" value="${aa+1}"/>  
     </c:forEach>
    </div>
    
    <div class="answer" id="faq_re" style="display:none;">
    <c:set var="rr" value="0"/>
     <c:forEach items="${rlist}" var="rfvo">
      <div class="que"> <h4> ${rfvo.question} </h4> 
       <div class="btn" value="${rr}">
        <span></span>
        <span></span>
       </div>
      </div>
      <div class="ans"> 
        ${rfvo.answer} 
      </div> 
      <c:set var="rr" value="${rr+1}"/>    
     </c:forEach>
    </div>
    
    <div class="answer" id="faq_ser" style="display:none;">
    <c:set var="ss" value="0"/>
     <c:forEach items="${slist}" var="sfvo">
      <div class="que"> <h4> ${sfvo.question}</h4> 
       <div class="btn" value="${ss}">
        <span></span>
        <span></span>
       </div>
      </div>
      <div class="ans"> 
        ${sfvo.answer}
      </div>
       <c:set var="ss" value="${ss+1}"/>
     </c:forEach>
    </div>
    
    <div class="answer" id="faq_mem" style="display:none;">
    <c:set var="mm" value="0"/>
     <c:forEach items="${mlist}" var="mfvo">
      <div class="que"> <h4> ${mfvo.question}</h4> 
       <div class="btn" value="${mm}">
        <span></span>
        <span></span>
       </div>
      </div>
      <div class="ans"> 
        ${mfvo.answer} 
      </div>
      <c:set var="ee" value="${mm+1}"/>
     </c:forEach>
    </div>
    
    <div class="answer" id="faq_etc" style="display:none;">
    <c:set var="ee" value="0"/>
     <c:forEach items="${elist}" var="efvo">
      <div class="que"> <h4> ${efvo.question} </h4> 
       <div class="btn" value="${ee}">
        <span></span>
        <span></span>
       </div>
      </div>
      <div class="ans"> 
        ${efvo.answer}        
      </div>
      <c:set var="ee" value="${ee+1}"/>
     </c:forEach>
    </div>
    
   </div>

  </div> 
  </section>
</body>
</html>