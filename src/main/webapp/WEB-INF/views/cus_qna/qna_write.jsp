<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style>
  section
  {
    margin:auto;
    margin-top:50px;
    margin-bottom:100px;
    width:1000px;
  }  
 
  section #msg_sub  /* 부가 안내말 */
  {
    font-size:14px;
    color:#cccccc;
  }
  
  section #msg_b /* 확인 메세지 바탕 + 중앙정렬 */
  {     
     position:absolute;     
     padding:100%;
     background:rgba(140,140,140,0.5);
     border:1px solid #cccccc;
     left:50%;
     top:50%;
     transform:translate(-50%,-50%);
     align-items:center;
     visibility:hidden;
  }
  section #check_msg /* 확인 메세지 */
  {  
     width:500px;  
     padding:40px;
     padding-bottom:20px;
     background:white;
     border:1px solid #cccccc;
     margin:auto;     
  } 
  section #check_msg > input[type=submit] /* 확인 메세지_ 버튼 */
  {
     align-items:center;
     margin-left:200px;     
  }
  
  section #qna_content /* 문의내용  in 확인 메세지 */
  {    
    border:1px solid #cccccc;
    width:477px;
    padding:10px;
    margin-bottom:10px;
    overflow:auto;
    margin-top:-12px;
  }
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script>
 function msg_view()
 {   // 문의 내용 확인 메세지
	 document.getElementById("msg_b").style.visibility="visible";
	 document.getElementById("qna_content").innerText=document.ht.content.value.replace('r\n\'','<br>');
	 
	 var gubun_2=document.ht.gubun_2.value
	 if(gubun_2=="0")
	  document.getElementById("qna_gubun").innerText=" 객 실 문 의 ";
	 else if(gubun_2=="1")
	  document.getElementById("qna_gubun").innerText=" 멤버쉽 문 의 ";
	 else if(gubun_2=="2")
	  document.getElementById("qna_gubun").innerText=" 서비스 문 의 ";
	 else if(gubun_2=="3")
	  document.getElementById("qna_gubun").innerText=" 기 타 문 의 ";
 }
 function msg_clo()
 {   // 확인 메세지 닫기
	 document.getElementById("msg_b").style.visibility="hidden";
	 document.getElementById("qna_content").innerText="";
	 document.getElementById("qna_gubun").innerText="";
 }
 
 var g1=0;
 function gubun1(n)
 {	// 문의 선택 값 1
	var gubun=document.ht.gubun.value;
	gubun=document.ht.gubun_1.value;
	g1=1;
 }
 var g2=0;
 function gubun2(n)
 {	 // 문의 내용 값 2
	 var gubun_1=document.ht.gubun_1.value;
	 var gubun;
	 if(gubun_1!="")
	 {
       gubun=gubun_1+document.ht.gubun_2.value;
	   g2=1;
	   
	   // 저장할 문의 구분 값
	   document.ht.gubun.value=gubun;
	   //alert(document.ht.gubun.value);
	 }
	 else
	  {
		 alert("문의 선택을 해주세요");
		 document.ht.gubun_2[n].checked=false;		 
	  }
	 
 }
 function check_emp()
 {
	 if(g1==0)
     {
		alert("문의 선택을 해주세요."); 
     }
	 else if(g2==0)
	 {
		alert("문의 내용을 선택해주세요."); 
	 }
	 else if(document.ht.title.value.trim()=="")
	 {
		 alert("문의 제목을 입력해주세요."); 
	 }
	 else if(document.ht.content.value.trim()=="")
	 {
		 alert("문의 내용을 입력해주세요.");
	 }
	 else
	   msg_view();
 }
 </script>
</head> 

<body>

<section>

  <form name="ht" method="post" action="qna_write_ok" >
  <input type="hidden" name="userid" value="123">  <!-- session생기면 삭제하기 ${userid} -->
  <input type="hidden" name="gubun">
  
  <table width="830" align="center">
   <caption> <h1> 문의 하기 </h1> 
   <hr>
   <p id="msg_sub" height="100"> 해당페이지는 1:1문의 페이지입니다. <br> 
   문의를 남겨주시면 빠른시일내에 담당자가 확인하여 답변해 드리겠습니다.</p>
  <div align="right" style="color:red;font-size:10px;" > ** 모든 항목 선택 및 기재 필수 **</div>  
   </caption> 
   
    <tr>
      <td align="center" width="150"> 성 명  </td>
      <td>
        <input id="qna_name" type="text" name="name" value="123" readonly> <%-- value="${name}" --%>
      </td>
    </tr>
    <tr>
      <td align="center"> 문의 선택 </td>
      <td>
        <input type="radio" value="g" name="gubun_1" onclick="gubun1(0)"> 일반 문의
        <input type="radio" value="r" name="gubun_1" onclick="gubun1(1)"> 예약 문의
      </td>
    </tr>
    <tr>
      <td align="center"> 문의 내용 </td>
      <td>
        <input type="radio" value="0" name="gubun_2" onclick="gubun2(0)"> 객 실 
        <input type="radio" value="1" name="gubun_2" onclick="gubun2(1)"> 멤버쉽
        <input type="radio" value="2" name="gubun_2" onclick="gubun2(2)"> 서비스
        <input type="radio" value="3" name="gubun_2" onclick="gubun2(3)"> 기 타
      </td>
    </tr>
    <tr>
      <td align="center" > 제 목 </td>
      <td>
        <input id="qna_title" type="text" name="title" placeholder="제 목" size="20"> 
      </td>
    </tr>
    <tr>
      <td align="center"> 내 용 </td>
      <td><textarea cols="80" rows="20" name="content" placeholder="문의 사항을 기재해주세요."></textarea> </td>
    </tr>
    <tr>
      <td colspan="2" align="center" height="100">
        <input type="button" onclick="check_emp()" value="등록">
      </td>
    </tr>
  </table>
  
  <div id="msg_b">  
   <div id="check_msg"> 
      <h3> ${name}님  <!--  나중에 session값  -->
       <br>아래내용으로 문의를  제출 하시겠습니까? :)
      </h3>
      <span style="font-size:10px;color:#cccccc;margin-top:-20px;"> - 문의 내역은 마이 페이지에서 확인이 가능합니다. -  </span> <p>
      <span style="font-size:16px;" id="qna_gubun"></span><div id="qna_content"></div>
      <input type="submit" value="제출"> 
      <input type="button" onclick="msg_clo()" value="닫기">
   </div>
  </div>
  
 </form> 
 
</section> 

</body>
