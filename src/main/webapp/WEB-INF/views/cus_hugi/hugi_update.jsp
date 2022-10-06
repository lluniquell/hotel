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
    section h2
    {
      position:relative;;
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
    section div
    {
       
    }
    section #rt
    {
      margin-top:10px;
      display:inline-block;
      margin-right:5px;      
      /* border:1px solid black; */
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
    section textarea
    {
      padding:5px;
    }
    
    section #himgs
    {
      margin-top:30px;
      text-align:center;
    }
/*     section #rt #grade
    {
       outline:none;
       border:none;
       font-size:12px;  
       color:#1264a3;
       text-align:center;     
    } */
    
  </style>
  <script>
    var addsu=0;  
   
    function imgchk()
    {
      var hchk=document.getElementsByName("hchk");
  	  var len=hchk.length;
  	  addsu=0;
  	
  	  for(i=0;i<len;i++)
       {    		 
  		 if(hchk[i].checked)
  		  {
  			 document.getElementById("fadd").type="button";
  			 document.getElementById("fdel").type="button";
  			 document.getElementById("files").innerHTML="<p class='fname'> <input type='file' name='fname1' id='files'> </p>";       
  			 document.getElementById("imsg").style.marginTop="0px";
  			 addsu++;
  		  }  		 
        }
  	  
  	  if(addsu==0)
  	  {
  		document.getElementById("fadd").type="hidden";
		document.getElementById("fdel").type="hidden";
		document.getElementById("files").innerHTML=" ";
		document.getElementById("imsg").style.marginTop="30px";
  	  }
  	  
  	  if(document.getElementsByClassName("fname").length < 4)
  		  {
  		     document.getElementById("fadd").type="button";
			 document.getElementById("fdel").type="button";
			 document.getElementById("files").innerHTML="<p class='fname'> <input type='file' name='fname1' id='files'> </p>";       
			 document.getElementById("imsg").style.marginTop="0px";
  		  }
  	
  	  /* document.getElementById("addsu").value=addsu; */   	
    }
    
    function fname_add()  // 사진 업로드 파일 추가(최대 4)
    {
    	var fname=document.getElementsByClassName("fname");
    	var len=fname.length;
    	/* var addsu=document.getElementById("addsu").value; */
    	var cnt=4-${hvo.cnt};
    	var num=cnt+addsu;
    	if (len < num)
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
    	var len=document.getElementsByClassName("star").length;
    	var star=document.getElementsByClassName("star");
    	
    	for(i=0;i<=n;i++)
    		star[i].src="../resources/img/star1.png";
    	for(i=n+1;i<len;i++)
    		star[i].src="../resources/img/star2.png";
    	
    	document.getElementById("star").value=n+1;
        
    	// alert(document.getElementById("star").value);
    }
    
    function check(upform)
    {      	    	
    	if(upform.title.value.trim()=="")
        {
        	alert("제목을 입력해주세요.");
            return false;
        }
        else if(upform.content.value.trim()=="")
        {
        	alert("이용 후기를 입력해주세요.");
        	return false;
        }
        else
        {
        	var chk=document.getElementsByName("hchk");
        	var len=hchk.length;
        	var del="";
        	var str="";

    	 	for(i=0;i<len;i++)
            {
    		   if(chk[i].checked)
    		    del=del+chk[i].value+",";
    		   else
    		    str=str+chk[i].value+",";
            }
    	    upform.del.value=del;
    	    upform.str.value=str;
    	    
    	    return true;
        }
           
    }
   
  </script>
<body>

  <section>
    
   <form method="post" action="hugi_update_ok" enctype="multipart/form-data" onsubmit="return check(this)">
     <input type="hidden" name="id" value="${hvo.id}">
     <input type="hidden" name="grade" value="${hvo.grade}">     
     <input type="hidden" id="star" name="star" value="5">
     <input type="hidden" name="del">
     <input type="hidden" name="str">
     
      <h2 style="text-align:center;"> 이용 후기 수정  </h2>     
       <div style="text-align:center;font-size:14px;color:#1264a3;margin-bottom:40px;"> 본 페이지는 이용 후기 작성 페이지 입니다.</div>
       
       <div> 제목 <input type="text" name="title" placeholder="제 목" size="40" value="${hvo.title}"> </div>
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
       <div id="rt"> 객실 등급 :${gr}</div> 
       <div id="st"> 
                 별점
         <c:forEach begin="1" end="${hvo.star}" varStatus="my">
           <img src="../resources/img/star1.png" width="15" class="star" onclick="star_chg(${my.index-1})"> 
         </c:forEach>
         <c:forEach begin="1" end="${5-hvo.star}" varStatus="my">
           <img src="../resources/img/star2.png" width="15" class="star" onclick="star_chg(${my.index+hvo.star-1})"> 
         </c:forEach>                 
       </div>     
       
       <div> <textarea cols="85" rows="15" name="content" placeholder="이용 후기를 작성해 주세요.">${hvo.content}</textarea> </div>
               
          <c:set var="imgsu" value="0"/>     
       <div id="himgs">
         <c:forEach items="${fimg}" var="img">
           <input type="checkbox" name="hchk" value="${img}" onchange="imgchk()">
           <img src="../resources/himg/${img}" width="100" height="70">
           <c:set var="imgsu" value="${imgsu+1}"/>         
         </c:forEach>
          <div style="font-size:10px;color:#FF9090;margin-top:8px;"> 삭제 하실 파일을 선택해주세요.(최대 4장안에서 삭제선택에 따라 추가/삭제가 가능해집니다.)</div>
       </div>
       
       <c:if test="${imgsu==4}"> 
        <c:set var="bh" value="hidden"/>
        <div id="files"> </div>
       </c:if> 
       <c:if test="${imgsu!=4}"> 
        <c:set var="bh" value="button"/>
        <div id="files"> 
          <p class="fname" > <input type="file" name="fname1" id="files"> </p>        
       </div>
       </c:if>      
       
        <div id="imsg" style="font-size:10px;color:#FF5A5A;margin-top:16px;margin-bottom:15px">
          *최대 4개까지 업로드 가능합니다. <br>
                       추가/삭제시 업로드파일이 없어질 수 있으니 갯수에 맞춰 먼저 추가해주세요. *
        </div>
        
        <input type="${bh}" id="fadd" value="추가" onclick="fname_add()">
        <input type="${bh}" id="fdel" value="삭제" onclick="fname_del()">
      <div style="text-align:center;margin-top:20px;"> <input type="submit" value="수정 완료"></div>  
    </form>
    
  </section>
  
</body>
</html>