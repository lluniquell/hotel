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
      width:750px;
      margin:auto;
      /* border:1px solid black; */
      padding:80px;
   }
   section h2
   {
     text-align:center;
     position:relative;
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
   section h4
   {
     position:relative;
     margin-top:80px;
     margin-bottom:30px;
   }    
   section h4:after
   {
     content:'';
     position:absolute;
     left:15px;
     top:28px;
     bottom:0;
     width:80px;
     margin-left:-15px;
     height:2px;
     background:#C4DEFF;
   
   }
   section #st
   {      
      /* margin:auto; */
      /* text-align:center; */ 
      margin-top:30px;
      margin-bottom:20px;
   }
   section #st #star_chk
   {
     text-align:center;
     margin-top:30px;
   }
   
   section #gumae
   {  
      margin:auto;     
      margin-top:50px;
      margin-bottom:30px;
      width:500px;      
      border:1px solid black;
      border-radius:5px;
      padding:15px;  
      position:relative;
      
      
   } 
   section #gumae #pimg
   {      
      /* border:1px solid red; */
      padding:2px;
      /* position:relative; */
   }   
   section #gumae #pro_content
   {  
     display:inline-block;
     position:absolute;
     padding :0px;
    /* border:1px solid blue; */
     width:370px;
     top:30px;
     left:27%;
   }
   section #gumae #pro_content:before
   {
     content:'';
     position:absolute;  
     top:-0.5px;
     left:0; 
     bottom:0;  
     margin-left:-15px;
     width:3px;
     height:80px;
     background:#cccccc;
   } 
   
   section #evs
   {
      /* margin:auto; */      
      /* border:1px solid blue; */
      text-align:center;
      margin-top:50px;
      margin-bottom:30px;
      /* padding:8px; */
   }
   section #evs .ev
   {
      display:inline-block;
      margin-right:10px;
   }
   section #evs .ev > b
   {
      font-size:15px;
   }
   section #evs .ev > span
   {
     border:1px solid #1e1852; 
     margin-right:1px;    
     border-radius:20px;
     background:white;
     color:#1e1852;
     padding:3px;
     font-size:12px;  
     cursor:pointer;   
   } 
   section #evs .ev > .ev_bea:nth-child(3)
   {
     background:#1e1852;
     color:white;       
   }
    section #evs .ev > .ev_de:nth-child(3)
   {
     background:#1e1852;
     color:white;       
   }
   section #evs .ev > .ev_du:nth-child(3)
   { 
     background:#1e1852;
     color:white;       
   } 
   section .review
   {
     margin-bottom:30px;
   }
 </style>
 
 <script>
   function change_star(n)
   {
	   for(i=0;i<=4;i++)
	   {
		  if(i<=n)
		   document.getElementsByClassName("star")[i].src="../resources/img/star1.png";
		  else
		   document.getElementsByClassName("star")[i].src="../resources/img/star2.png";		  
	   }
	   
	   document.rf.star.value=n+1;	   
   }
   function fname_add()  // 사진 업로드 파일 추가(최대 3)
   {
   	var fname=document.getElementsByClassName("fname");
   	var len=fname.length;
   	
   	if (len < 3)
   	 {
   	    len++;    	
   	
   	    var ff="<p class='fname' > <input type='file' name='fname"+len+"'> </p>"
           document.getElementById("files").innerHTML=document.getElementById("files").innerHTML+ff;  	 
   	 }    	
   }
   
   function fname_del() // 사진 업로드 파일 감소(최소 1)
   {
   	var fname=document.getElementsByClassName("fname");
   	var len=fname.length; 
   	len--;
   	
   	if(len!=0)
        document.getElementsByClassName("fname")[len].remove();
   }
   function bea_chk(n)
   {
	   var len=document.getElementsByClassName("ev_bea").length;
	   for(i=0;i<len;i++)
	   {
		 if(i==n)
	      {
			 document.getElementsByClassName("ev_bea")[i].style.background="#1e1852";
			 document.getElementsByClassName("ev_bea")[i].style.color="white";
	      }
		 else
		  {			 
			 document.getElementsByClassName("ev_bea")[i].style.color="#1e1852";
			 document.getElementsByClassName("ev_bea")[i].style.background="white";
		  }		   
	   }
	   document.getElementById("bea_ev").value=n;
	   /* alert(document.getElementById("bea_ev").value); */
   }
   function de_chk(n)
   {
	   var len=document.getElementsByClassName("ev_de").length;
	   for(i=0;i<len;i++)
	   {
		 if(i==n)
	      {
			 document.getElementsByClassName("ev_de")[i].style.background="#1e1852";
			 document.getElementsByClassName("ev_de")[i].style.color="white";
	      }
		 else
		  {			 
			 document.getElementsByClassName("ev_de")[i].style.color="#1e1852";
			 document.getElementsByClassName("ev_de")[i].style.background="white";
		  }		   
	   }
	   document.getElementById("de_ev").value=n;
	   /* alert(document.getElementById("de_ev").value); */
	   
   }
   function du_chk(n)
   {
	   var len=document.getElementsByClassName("ev_du").length;
	   for(i=0;i<len;i++)
	   {
		 if(i==n)
	      {
			 document.getElementsByClassName("ev_du")[i].style.background="#1e1852";
			 document.getElementsByClassName("ev_du")[i].style.color="white";
	      }
		 else
		  {			
			 document.getElementsByClassName("ev_du")[i].style.color="#1e1852";
			 document.getElementsByClassName("ev_du")[i].style.background="white";
		  }		   
	   }
	   document.getElementById("du_ev").value=n;
	  /* alert(document.getElementById("du_ev").value); */
   }
   
   function check(my)
   {
   	if(my.title.value.trim()=="")
   	{
   		alert("한줄 후기를 입력해주세요.");
   		return false;
   	}
   	else if(my.content.value.trim()=="")
   	{
   		alert("상세 구매 후기를 입력해주세요.");
   		return false;
   	}
   	else
   	return true;
   		
   }
 </script>
<body>
  <section>
  <form name="rf" method="post" action="review_write_ok" enctype="multipart/form-data" onsubmit="return check(this)">
   <input type="hidden" name="pcode" value="${pvo.pcode}">
   <input type="hidden" name="gid" value="${pvo.id}"> 
   <input type="hidden" name="bea_ev" id="bea_ev" value="1">
   <input type="hidden" name="de_ev" id="de_ev" value="1">
   <input type="hidden" name="du_ev" id="du_ev" value="1">
   <input type="hidden" name="star" value="5">
   
   <h2> Review </h2>
   <div id="h2_sub">  상품 후기 작성 페이지 입니다.   </div>
    
    <div id="st">
       <h4>${name}님, 상품을 어떠셨나요?</h4> 
       <div id="star_chk">
         <c:forEach begin="0" end="4" var="i">
          <img src="../resources/img/star1.png" width="50" class="star" onclick="change_star(${i})">          
          </c:forEach>        
       </div>
    </div>
    
    <h4 style="margin-bottom:8px;">구매 상품</h4>  <!-- 구매 이력에서 정보 가져오기 -->
    <div id="gumae">
     <img src="../resources/img/${gvo.pimg}" width="150" height="150" >
     <div id="pro_content">
       상품명: ${gvo.ptitle}<p>  
   <fmt:formatNumber value="${gvo.totprice}" pattern="#,###"/>원/${rvo.psu}개    
       구매일 :${gvo.pwriteday}
     </div>    
    </div>
    
    <h4> 상품 평가 </h4>
    <div id="evs"> 
      <div class="ev">
       <b>배송</b> 
        <span class="ev_bea" onclick="bea_chk(0)">빨라요</span>
        <span class="ev_bea" onclick="bea_chk(1)">보통이에요</span>
        <span class="ev_bea" onclick="bea_chk(2)">느려요</span>
      </div>
      <div class="ev">
       <b>디자인 </b>
        <span class="ev_de" onclick="de_chk(0)">멋져요</span>
        <span class="ev_de" onclick="de_chk(1)">보통이에요</span>
        <span class="ev_de" onclick="de_chk(2)">별로에요</span>
      </div>
      <div class="ev">
       <b>내구성</b> 
        <span class="ev_du" onclick="du_chk(0)">훌륭해요</span>
        <span class="ev_du" onclick="du_chk(1)">보통이에요</span>
        <span class="ev_du" onclick="du_chk(2)">별로에요</span>
      </div>
      
      
    </div>
    <div class="review">
      <h4>상품 한줄 후기</h4>
     <input type="text" name="title" placeholder="상품 구매 한줄 후기를 작성해 주세요 ." size="104" style="height:25px;">
    </div>
    <div class="review">
     <h4>상품 구매 상세후기</h4>
     <textarea cols="105" rows="10" name="content" placeholder="상세 상품 구매 후기를 작성해주세요." style="padding:5px;"></textarea>     
    </div>
    
    <div id="files">
      <p class="fname"> <input type="file" name="fname1"> </p>
    </div>
    <div style="font-size:10px;color:red;margin-bottom:10px;">
          *최대  3개까지 업로드 가능합니다. <br>
                       추가/삭제시 업로드파일이 없어질 수 있으니 갯수에 맞춰 먼저 추가해주세요. *
     </div>        
        <input type="button" value="추가" onclick="fname_add()">
        <input type="button" value="삭제" onclick="fname_del()">
    </div>
    
    <div style="text-align:center;margin-top:80px;"> 
       <input type="submit" value="작성 완료">
        <input type="button" value="작성 취소" onclick="location='../mypage/myjumun'"> <!--  나중에 해당 상품 페이지로 돌아가기 -->
    </div>
    
   </form>
  </section>
</body>
</html>