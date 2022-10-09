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
    section
    {
      width:600px;
      margin:auto;
      margin-top:50px;
      margin-bottom:50px;
    }
    section h2    {
      position:relative;    }
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
    section #rt
    {
      margin-top:10px;
      display:inline-block;
      margin-right:5px;
      font-size:13px;
      color:#1264a3;
    }
    section #st
    {
      display:inline-block;
      margin-left:345px;
      font-size:13px;
      color:#1264a3;
    }
    section textarea    {
      padding:5px;    }

    
  </style>
  <script>
    function fname_add()  // 사진 업로드 파일 추가(최대 4)
    {
    	var fname=document.getElementsByClassName("fname");
    	var len=fname.length;
    	
    	if (len < 4)
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
    
    function star_chg(n) // 별점 표시
    {
    	for(i=0;i<5;i++)
         { 
    		if(i<=n)
    		 document.getElementsByClassName("star")[i].src="../resources/img/star1.png";
    		else
    	     document.getElementsByClassName("star")[i].src="../resources/img/star2.png";	
         }
    	
    	document.getElementById("star").value=n+1;
    }
    
    function check(my)
    {
    	if(my.title.value.trim()=="")
    	{
    		alert("제목을 입력해주세요.");
    		return false;
    	}
    	else if(my.content.value.trim()=="")
    	{
    		alert("이용 후기를 입력해주세요.");
    		return false;
    	}
    	else
    	return true;    		
    }
  </script>
<body>

  <section>
    
   <form method="post" action="hugi_write_ok" enctype="multipart/form-data" onsubmit="return check(this)">
     <input type="hidden" name="bid" value="${bid}"> 
     <input type="hidden" value="${grade}" name="grade">
     <input type="hidden" id="star" name="star" value="5">
     
      <h2 style="text-align:center;"> 이용 후기  </h2>     
       <div style="text-align:center;font-size:14px;color:#1264a3;margin-bottom:40px;"> 본 페이지는 이용 후기 작성 페이지 입니다.</div>
       
       <div> 제목 <input type="text" name="title" placeholder="제 목" size="40"> </div>
 <!-- 객실 등급   -->
   <c:if test="${grade==1}">     
    <c:set var="gr" value="스탠다드"/>
   </c:if> 
   <c:if test="${grade==2}">     
    <c:set var="gr" value="슈페리어"/>
   </c:if> 
   <c:if test="${grade==3}">     
    <c:set var="gr" value="디럭스"/>
   </c:if> 
   <c:if test="${grade==4}">     
    <c:set var="gr" value="스위트"/>
   </c:if>    
       <div id="rt"> 객실 등급 :${gr}</div>
       <div id="st"> 
                 별점
         <c:forEach begin="0" end="4" var="i">
           <img src="../resources/img/star1.png" width="15 "class="star" onclick="star_chg(${i})"> 
         </c:forEach>                 
       </div>
     
       
       <div> <textarea cols="85" rows="15" name="content" placeholder="이용 후기를 작성해 주세요."></textarea> </div>
       
       <div id="files"> 
          <p class="fname" > <input type="file" name="fname1"> </p>        
       </div>
        <div style="font-size:10px;color:red;margin-bottom:10px;">
          *최대 4개까지 업로드 가능합니다. <br>
                       추가/삭제시 업로드파일이 없어질 수 있으니 갯수에 맞춰 먼저 추가해주세요. *
        </div>
        
        <input type="button" value="추가" onclick="fname_add()">
        <input type="button" value="삭제" onclick="fname_del()">
      <div style="text-align:center;"> <input type="submit" value="작성 완료"></div>  
    </form>
    
  </section>
  
</body>
</html>