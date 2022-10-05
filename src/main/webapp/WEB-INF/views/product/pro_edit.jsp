<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
  <h1 class="display-3" style="text-align:center; width:1000px;height:100px;margin:0 auto; margin-top:50px; font-size:40px;">상품 수정</h1>
 

<div class="container">
  <form name="inpro" class="form-horizontal" enctype="multipart/form-data" method="post" action="pro_edit_ok" style='width:1000px;'> 
     <div class="form-group row justify-content-center" >
       <label class="col-sm-2"> 상품 코드 </label>
        <div  class="com-sm-3"> 
         <input type="text" name="pcode" value="${pvo.pcode}" readonly class="form-control">
        </div>
       </div>
        
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 이미지1</label>
         <div  class="col-sm-4"> <input type="file" name="pimg1" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 이미지2</label>
         <div  class="col-sm-4"> <input type="file" name="pimg2" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 이미지3</label>
        <div  class="col-sm-4"> <input type="file" name="pimg3" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품상세 이미지</label>
        <div  class="col-sm-4"> <input type="file" name="cimg" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 제목</label>
       <div  class="col-sm-3"> <input type="text"  name="title" value="${pvo.title}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 가격</label>
       <div  class="col-sm-3"> <input type="text" name="price" value="${pvo.price}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">제조사</label>
       <div  class="col-sm-3"> <input type="text" name="made" value="${pvo.made}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">할인율</label>
       <div  class="col-sm-3"> <input type="text" name="halin" value="${pvo.halin}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 수량</label>
       <div  class="col-sm-3"> <input type="text" name="su" value="${pvo.su}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">배송비</label>
       <div  class="col-sm-3"> <input type="text" name="baesong" value="${pvo.baesong}" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2"> 배송예정일 </label>
       <div  class="col-sm-3"> <input type="text" name="baeday" value="${pvo.baeday}" class="form-control"> </div>
     </div>
			<div class="form-group row justify-content-center">
				<div class="col-sm-offset-5 col-sm-100" >
					<input type="submit" class="btn btn-primary" value="등록" >
				</div>
			</div>
  </form>
</div>
</body>
</html>