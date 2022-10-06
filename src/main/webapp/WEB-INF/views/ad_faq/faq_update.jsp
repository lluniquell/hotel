<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <style>

   section
   {
      width:800px;
      margin:auto;
      margin-top:100px;
      text-align:center;
   }
   section h2
   {
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
   }
   section #que
   {
     margin-top:50px;
    /*  border-bottom:1px solid #cccccc; */
     position:relative     
   }
   section #que:after
   {
     content:'';
     position:absolute;
     left:265px;
     top:150px;
     bottom:0;
     width:300px;
     margin-left:-15px;
     height:1px;
     background:#cccccc;
   } 
   section #ans
   {
     margin-top:50px;
   }
   section #btns
   {
     margin-top:50px;
   }
  </style>
  <script>
  function init()
  {
	  var gu=${fvo.gubun};
	  document.faq_up.gubun[gu].checked=true;	  
  }
  function check(form)
  {
     if(form.question.value.trim()=="")
     {
        alert("질문을 입력해 주세요.");
        form.question.focus();
        return false;
      }
     else if(form.answer.value.trim()=="")
     {
        alert("답변을 입력해 주세요.");
        form.answer.focus();
        return false;
      }
     else
      return true;
  }  
  </script>
<body onload="init()">
  <section>    

    <form name="faq_up" method="post" action="faq_update_ok" onsubmit="return check(this)">
    <input type="hidden" name="id" value="${fvo.id}">
     <h2>FAQ 수정</h2>
     <div id="h2_sub">자주묻는 질문 내용 및 답변 수정 페이지</div>
    
     <div id="que"> 
     <h4> 질문 작성</h4>
      <div id="que_gubun"> 분류 :
        <input type="radio" name="gubun" value="0"> 예약
        <input type="radio" name="gubun" value="1"> 서비스
        <input type="radio" name="gubun" value="2"> 회원
        <input type="radio" name="gubun" value="3"> 기타
      </div>
      <p>

      <textarea cols="80" rows="3" name="question" placeholder="자주 묻는 질문을 입력해 주세요">${fvo.question}</textarea> 
     </div>

     <div id="ans">
     <h4> 답변 작성</h4>
      <textarea cols="80" rows="10" name="answer" placeholder="자주 묻는 질문의 답변을 입력해 주세요">${fvo.answer}</textarea> 
     </div>
     
     <div id="btns">
       <input type="submit" value="FAQ수정"> <p>
       <input type="button" value="취소" onclick="location='../ad_faq/faq_list'"> <!-- 목록으로 돌아가기 -->
     </div> 
    </form>

  </section>

</body>
</html>