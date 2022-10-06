<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 divansitional//EN" "http://www.w3.org/div/html4/loose.ddiv">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 
</style>
 <script> 
   function bunho()
   {
	   
	   var cate=document.inpro.cate.value;
	   var code="p"+cate;
	   var chk=new XMLHttpRequest();
	   chk.open("get","getbunho?code="+code);
	   chk.send();
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
		     
			    var bunho=parseInt(chk.responseText)+1;
		      
		      
		        bunho=bunho+"";  
		        if(bunho.length==1)
		        {
		        	bunho="00"+bunho;
		        }
		        else if(bunho.length==2)
		        	 {
		        	     bunho="0"+bunho;
		        	 }
		        
		        document.inpro.pcode.value=code+bunho;
		   }
	   }
   }
 </script>
</head>
<body> 
 <h1 class="display-3" style="text-align:center; width:1000px;height:100px;margin:0 auto; margin-top:50px; font-size:40px;">상품 등록</h1>

<div class="container">
  <form name="inpro" class="form-horizontal" enctype="multipart/form-data" method="post" action="product_ok" style='width:1000px;'> 
     <div class="form-group row justify-content-center" >
       <label class="col-sm-2"> 상품 코드 </label>
        <div  class="com-sm-3"> 
         <input type="text" name="pcode" readonly class="form-control">
         </div>
          <select name="cate">
           <option>선택</option>
            <c:forEach items="${list}" var="cvo">
           <option value="${cvo.code}"> ${cvo.title} </option>
            </c:forEach>
         </select>
          <input type="button" onclick="bunho()" value="상품코드생성">
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
       <div  class="col-sm-3"> <input type="text"  name="title" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 가격</label>
       <div  class="col-sm-3"> <input type="text" name="price" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">제조사</label>
       <div  class="col-sm-3"> <input type="text" name="made" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">할인율</label>
       <div  class="col-sm-3"> <input type="text" name="halin" value="0" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">상품 수량</label>
       <div  class="col-sm-3"> <input type="text" name="su" value="1" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2">배송비</label>
       <div  class="col-sm-3"> <input type="text" name="baesong" value="0" class="form-control"> </div>
     </div>
     <div class="form-group row justify-content-center">
       <label class="col-sm-2"> 배송예정일 </label>
       <div  class="col-sm-3"> <input type="text" name="baeday" value="2" class="form-control"> </div>
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