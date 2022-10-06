<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<title>Insert title here</title>
<style>
   section{width:1000px;margin:auto;margin-top:70px;margin-bottom:80px}
   section caption h2{text-align:center;margin:auto}

</style>
</head>
<body>
   <section>
    <form name="inpro" enctype="multipart/form-data" method="post" action="notice_update_ok">
     <input type="hidden" name="id" value="${nvo.id}">
      <caption> <h2> 공지사항 등록 </h2> </caption>
      <table width="800" align="center">
       
      <tr height="50">
        <td> 제목 
         <input type="text" name="title" value="${nvo.title}">
        </td>
      </tr>
     <tr> 
       <td>  <textarea class="summernote" name="content">${nvo.content}</textarea> <td>
        <script>
        $('.summernote').summernote({
      	  lang: "ko-KR",
        	  toolbar: [
        		    // [groupName, [list of button]]
        		    ['style', ['bold', 'italic', 'underline', 'clear']],
        		    ['font', ['strikethrough', 'superscript', 'subscript']],
        		    ['fontsize', ['fontsize']],
        		    ['color', ['color']],
        		    ['para', ['ul', 'ol', 'paragraph']],
        		    ['height', ['height']]
        		  ]

        	});    
        </script> 
     </tr>
      
      <tr>
        <td> <input type="file" name="fname" >
             <img src="../resources/img/notice/${nvo.fname}" width="100" height="100"> </td>
      </tr>
      <tr>
        <td> 
             <input type="checkbox" name="state" value="1"> 중요공지 지정 
             <input type="checkbox" name="state" value="0"> 지정해제
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="수정완료">
          <input type="button" value="목록" onclick="location.href='notice_list'">
        </td>
      </tr>
     </table>
    </form>
   </section>
</body>
</html>