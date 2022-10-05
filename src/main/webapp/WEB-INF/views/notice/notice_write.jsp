<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
  section h2 {width:1000px;margin-top:100px;margin-bottom:40px; text-align:center;padding-bottom:20px;border-bottom:2px solid #ddd; } 
  section td {padding:10px;}
  .summernote [data-event="showImageDialog"] {display: none !important;}
  .summernote [data-event="showVideoDialog"] {display: none !important; }
</style>
<script>
    function check(my)
    {
        if(my.title.value=="")
        {
            alert("제목을 입력하세요");
            my.title.focus();
            return false;
        }
        if(my.content.value=="")
        {
            alert("내용을 입력하세요");
            my.content.focus();
            return false;
        }
    }
</script>
</head>
<body>
 <section>
   <form method="post" enctype="multipart/form-data" action="notice_write_ok">
     <table width="800" align="center">
     <h2>공지사항 작성</h2>
     <tr>
       <td> 제목  <input type="text" name="title" size="50" >  </td>
     </tr>
     
     <tr> 
       <td>  <textarea class="summernote" name="content"></textarea> <td>
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
      <td id="outer"> 
         <p class="fname"> <input type="file" name="fname"> </p> 
      </td>
     <tr>
      <td> 중요공지 등록 <input type="checkbox" name="state" value="1"> </td>
    </tr>
     <tr>
       <td align="center" colspan="2"> <input type="submit" value="저장">  </td>
     </tr>
   </table>
   </form>
  </section>

</body>
</html>