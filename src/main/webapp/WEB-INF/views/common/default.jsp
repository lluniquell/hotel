<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <style>
   body
   {
     margin:0px;
   }
   footer{
    margin-top:150px;
   }
  #login_area a{
    text-decoration: none;
    color:white;
   }
 /* 간단 팝업창 */
   #message  /*  간단메시지 */ 
   {
     position:sticky;
     top:0px;
     width:100%;
     height:60px;
     background:#f2d166;
     margin:auto;
   }
   #message #mleft /* 메세지 */
   {
     position:absolute;     
     left:48%; 
     transform:translate(-48%,0%);   
     text-align:center;
     padding-top:18px;
     cursor:default;
     /* background:red; */
   }
   #message #mright /* 메세지 닫기 */
   {
     float:right;
     margin-right:15px;
     font-size:38px;
     font-weight:lighter;
     cursor:pointer;     
   }
 /* 로고, 로그인, 회원가입 */
   header
   {
     position:sticky; 
     top:60px;  
     margin:auto;
     background:white;
     border-bottom:1.5px solid #d7e0e5;     
     width:100%;
     height:65px;
     box-shadow:0px 1px 5px #D5D5D5;
   }

/* 메뉴 버튼 */
   header #menu_btn   
   {
     display:none;
     cursor:pointer;
   }
   header label {
     color:#1e1852 }
   header label:hover   
   {
     color:#79ABFF;   
     transition-duration:0.5s;
   }
   header #menu_btn:hover + label > span   {
     background:#79ABFF;   }  
   header #menu_btn + label
   {
     display:inline-block;
     margin:30px;
     width:40px;
     height:17px;
     position:relative;
     cursor:pointer;
     margin-top:20px;
   }   
   header #menu_btn + label > span
   {
     display:block;
     position:absolute;
     width:100%;
     height:3px;
     border-radius:10px;
     background:#1e1852;
     /* transtion:all .35s; */
     transition-duration:0.5s;     
   }
   header #menu_btn + label > span:nth-child(1)   {
     top:0;   }
   header #menu_btn + label > span:nth-child(2)   {
     bottom:0;   }
   header #menu_btn:checked
   {
     overflow:hidden;
   }     
   header #menu_btn:checked + label   {
     z-index:2;   }   
   header #menu_btn:checked + label > span   {     
     background:#1e1852;   }
   header #menu_btn:hover + label > span   {
     background:#79ABFF;   } 
   header #menu_btn:checked + label > span:nth-child(1)
   {
     top:50%;
     transform:translateY(-50%) rotate(45deg);
   }
   header #menu_btn:checked + label > span:nth-child(2)
   {
     bottom:50%;
     transform:translateY(50%) rotate(-45deg);
   }
/*    header #menu_btn:checked + label + nav .side_menu   {
     left:0;   } */
   body.on   {
     overflow:hidden;   }

/* 로고  */ 
   header #logo
   {
     display:inline-block;
     position:absolute;
     left:48%; 
     margin-top:3px;
     transform:translate(-48%,0%);
     cursor:pointer;    
   }
/* 로그인/ 회원가입/ 고객센터 / 예약 */    
   header #login_area
   {
     display:inline-block;
     float:right;
     margin-right:15px;
     margin-top:10px;
     background:#1e1852;
     width:auto;
     height:auto;
     padding:10px;
     padding-left:20px;
     padding-right:20px;   
     border-radius:30px;  
   }
   header #login_area > div
   {
      display:inline-block;
      width:auto;
      height:auto;
      padding:5px;
      
      font-size:12px;
      border:1px solid white;
      margin:3px;
      color:white;
      cursor:pointer;
   }
   
   nav
   {
   
   }
/* 메뉴 */
   nav .side_menu
   {
     width:300px;
     height:calc(100% - 125px);
     background:#222;
     position:fixed;
     top:125px;
     left:-300px;
     z-index:1;
     transition:all .51s;
   }
      nav .sub_outer /*  섭메뉴 공간 */
   {
     width:calc(100% - 300px);
     left:300px;
     height:calc(100% - 125px);
     top:125px;     
     position:fixed;
     visibility:hidden; 
     /* background:rgb(93,93,93); */ 
     z-index:-1;   
   }
   nav .menu_ul, .smenu_ul /* 메뉴 ul */
   {
      list-style-type:none;
      color:white;
      /* border:1px solid red; */
   }
   nav .menu_ul /* 메인메뉴 ul */
   {
     height:30px;
     margin-top:60px;
   }
 /* 메인메뉴 */
   nav .main_menu /* 메인메뉴 버튼 */
   {
      width:auto;
      height:auto;
      background:none;
      color:white;
      border:none; 
      font-size:18px;      
      cursor:pointer;
   }
 /* 섭메뉴 */
   nav .sub_menu
   {
      margin-top:70px;
      margin-left:60px; 
      opacity:1;
      /* border:1px solid white; */          
   }
   nav .sub_menu:before
   {
     content:"";
     width:1px;
     height:100px;
     background:yellow;
     position:absolute;
     left:60px;
     top:75px;
   }
   nav .smenu_ul > li   
   {
     margin-bottom:20px;   
     cursor:pointer;
   }     
   
   #ura
   {
     top:125px;
     position:fixed;
     width:100%;
     height:calc(100% - 125px);
     background:#353535;     
     display:none;
   }
   footer
   {
   
   }
   
  </style>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
  <script>
   $(function()
   {
	   $("#message #mright").click(function()
	   {
		   $("#message").slideUp(500);
		   
		  /*  $("header").css("top","0px"); */
		   $("header").animate(
				   {
					   top:"0px"
			       },500,"swing");
		   
		   $(".side_menu").css("height","calc(100% - 65px)");
		   $(".side_menu").css("top","65px");
		   $(".sub_outer").css("height","calc(100% - 65px)");
		   $(".sub_outer").css("top","65px");
		   $("#ura").css("height","calc(100% - 65px)");
		   $("#ura").css("top","65px");
	   });
	   
	   var imsi=0;
	   $("header #menu_btn").change(function()
	   {			   
		   $("body").toggleClass("on");
		   
		   if(imsi==0)
			{	 		
			   $(".side_menu").css("left","0px");
			   
			   $("#ura").css("display","block");
		   
	     	   $("#ura").animate(
			   {
				   opacity:"0.9",
		       },600,"linear");
	     	   
	     	   imsi=1;
			}
		   else
			{
			   $(".side_menu").css("left","-300px");
			   
			   $("#ura").css("display","none");
			   
	     	   $("#ura").animate(
			   {
				   opacity:"0",
		       },600,"linear");
	     	   
	     	   imsi=0;
			}
	   });	  
   });
   
   function sub_look(n)
   {
	   document.getElementsByClassName("sub_outer")[n].style.visibility="visible";	   
   }
   
   function sub_hide(n)
   {
	   document.getElementsByClassName("sub_outer")[n].style.visibility="hidden";	   
   }
   
   
  </script>
<decorator:head/> 

</head>
<body>
   <div id="message"> <!-- 간단 팝업창 -->
     <div id="mleft"> 우리 호텔을 이용해 주셔서 감사합니다 </div>
     <div id="mright"> × </div>
   </div>
   <div id="ura"></div>
   <header> <!-- 로고, 로그인, 회원가입 -->
   <!--  메뉴 -->
    <input type="checkbox" id="menu_btn"> <!-- 메뉴버튼   -->
     <label for="menu_btn" >
       <span></span>
       <span></span>
       <p style="text-align:center;margin-top:20px;font-size:10px;"> 메뉴 </p>
     </label>       
    
    <div id="logo"> <!-- 로고 -->
     <a href="../main/index"><img src="../resources/img/logo.gif" width="100"></a>
    </div>
    
   	<c:if test="${userid == null }">
    <div id="login_area"> <!-- 로그인 -->
      <div id="loginicon"><a href="../login/login">로그인</a> </div>
      <div id="joinicon"> <a href="../member/member_input">가입</a></div>  
      <div id="reicon"><a href="/hotel/book/book">예약하기</a> </div>

    </div>   
    </c:if>
     	<c:if test="${userid != null }">
    <div id="login_area"> <!-- 로그인 -->
      <div><a href="../logout">로그아웃</a></div>
      <div id="cusicon"><a href="../mypage/myinfo">회원정보</a> </div>      
      <div id="reicon"><a href="/hotel/book/book">예약하기</a> </div>
    </div>   
    </c:if>
   </header>
      
   <nav> <!-- 메뉴및 링크 -->    
     <div class="side_menu"> <!-- 메뉴 -->
      <ul class="menu_ul">
        <li onmouseover="sub_look(0)" onmouseout="sub_hide(0)">
         <input class="main_menu" type="button" value="온라인 컨스어지" >
          <div class="sub_outer">
            <div class="sub_menu">
              <ul class="smenu_ul">
                <li> 호텔 안내 </li>
                <li> 공지/뉴스 </li>
                <li> 자주하는 진문 </li>
                <li> 문의 하기</li>
                <li> 이용 후기 </li>
                <li> 자유게시판 </li>
              </ul>
            </div>
          </div>         
        </li>
      </ul>
    </div>     
   </nav>


<decorator:body/>
<style>
footer a{
	font-color:#FFFFFF;
	text-align:center;
	font-size:14px;
}
footer{
	height:350px;
	background-color:#050033;
	color:#FFFFFF;
	text-align:center;
	font-size:14px;
}

hr{
	width:900px;
	height:0.5px;
	background-color:#FFFFFF;
}



</style>
  <footer> <!-- 사이트 관련 하단부  -->
  <br>
<hr>
<img src="../resources/img/logo.PNG">
<p>
서비스 일반 약관      멤버십 약관     개인정보   쿠키     법적 고지<p>

N6 HOTEL   |   대표자 : |  사업자등록번호  123-45-67890 <p>
경기도 고양시 일산동구 어딘가<p>
COPYRIGHT @ 2022 N6 HOTEL. ALL RIGHT RESERVED.
  
  </footer>
  
</body>
</html>