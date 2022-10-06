<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
    section {
    width:1000px;
    margin:auto;
    margin-top:100px;
    padding-top:30px;
    border-top: 2px solid #ddd;
    }
        section #a1 {
      width:1000px;
      height:500px;
    }
    section #a1 #left {
      width:500px;
      height:500px;
      float:left;
      text-align:center;
    }
    section #a1 #right {
      width:500px;
      height:500px;
      float:right;
      padding-left:80px;
    }
  
    section #right div {
      margin-top:28px;
    }
    section #right .etc {
      text-align: right; padding:20px 0;
    }
    section #right .etc button {
      padding:15px 0;
    }
    section #right .etc  #cart-btn {
      width:130px; background:white; color:black;
    }
    section #right .etc #order-btn {
      width:120px; background:#a9a9a9; color:white; 
    }
    section #right .etc #like-btn {
      width:120px; background:#ddd;
    }
    
    #a2 {
     margin-top:50px;
    }
    left img {
     height:1100px;
    }
    #title {
     
    }
  
    
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script>
    $(function()
    {
    	 $("#spinner").spinner(
    	 {
    		 min:1,
    		 max:100,
    		 spin:function(e,ui) // 아래위로가는 버튼 클릭시 실행
    		 {
    			 var total=parseInt(${ pvo.price - ( pvo.price*(pvo.halin/100) )  }*ui.value); 
    			                   // 할인금액을 뺀 상품금액   *  수량
    			 total=new Intl.NumberFormat().format(total); // 자바스크립트에 , 넣기
    			 document.getElementById("tot").innerText=total+"원";
    			 
    		 }
    	 });
    	 
    	 
    });
</script>
</head>
<body> 
  <section>
    <article id="a1">
     <div id="left"> 
       <div id="sd" class="carousel slide" data-ride="carousel" data-interval="0">
          <ul class="carousel-indicators">
            <li data-target="#sd" data-slide-to="0" class="active" > </li>
            <li data-target="#sd" data-slide-to="1"></li>
            <li data-target="#sd" data-slide-to="2"></li>
          </ul>
         <div class="carousel-inner">
         <div class="carousel-item active">
           <img src="../resources/img/product/${pvo.pimg1}" style="width:500px; height:400px;" alt="1번 이미지" >
         </div>
         <div class="carousel-item">
           <img src="../resources/img/product/${pvo.pimg2}" style="width:500px; height:400px;" alt="2번 이미지" >
         </div>
         <div class="carousel-item">
           <img src="../resources/img/product/${pvo.pimg3}" style="width:500px; height:400px;" alt="3번 이미지 " >
        </div>
        </div>
           <!-- 좌우 이동 버튼 -->
          <a class="carousel-control-prev" href="#sd" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </a>
          <a class="carousel-control-next" href="#sd" data-slide="next">
            <span class="carousel-control-next-icon"></span>
          </a>
     </div>
    </div>
      
  <div id="right">
    <div id="title"> ${pvo.title} </div>
     <div id="star"> </div>
      <div id="price"> ${pvo.price} 원 </div>
    
       <hr>               
         <c:choose>
          <c:when test="${pvo.yoil == 1}">
            <c:set var="yo" value="일요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 2}">
            <c:set var="yo" value="월요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 3}">
            <c:set var="yo" value="화요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 4}">
            <c:set var="yo" value="수요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 5}">
            <c:set var="yo" value="목요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 6}">
            <c:set var="yo" value="금요일"/>
          </c:when>
          <c:when test="${pvo.yoil == 7}">
            <c:set var="yo" value="토요일"/>
          </c:when>
         </c:choose>
       <div id="bae"> 배송 예정일 : ${yo} : ${pvo.baeday2}  </div> 
         <div id="su"> 
         상품구매 수량 : <input type="text" id="spinner" name="su" value="1" readonly style="width:100px;">
        </div> <!-- 수량 -->
     <div id="price">
          <c:if test="${pvo.halin != 0}"> <!-- 할인율이 0이 아닌경우 -->
            ${pvo.halin}% <s> <fmt:formatNumber value="${pvo.price}"/>원 </s> <br>
           <span id="tot"><fmt:formatNumber value="${ pvo.price - ( pvo.price*(pvo.halin/100) )  }" pattern=",000"/>원</span>
          </c:if>
          <c:if test="${pvo.halin == 0}"> <!-- 할인율이 0인 경우 -->
           <span id="tot"><fmt:formatNumber value="${pvo.price}"/>원</span>
          </c:if>
        </div>  
        
        <div class="etc">        
         <!-- 장바구니 관련 -->  
         <c:if test="${userid != null}">
          <button type="button"  id="cart-btn"  onclick="cart_add()"> 장바구니 </button>
         </c:if>
         <c:if test="${userid == null}"> 
          <button type="button" id="cart-btn" onclick="alert('로그인을 하세요')"> 장바구니 </button> 
         </c:if>  
          <button type="button" id="order-btn" onclick="pro_submit()"> 바로구매 </button>
                   <!-- wish관련 -->
         <c:if test="${userid == null}"> 
          <button type="button" id="like-btn" onclick="alert('로그인을 하세요')"> 찜하기 </button> 
         </c:if>       
          <c:if test="${userid != null}"> <!-- 로그인을 한 경우 -->
          <c:if test="${wishcnt == 0}"> <!-- wish테이블에 존재하지 않는경우 -->
            <button type="button" id="like-btn" onclick="wish_add()"> 찜하기 </button>
          </c:if>
          <c:if test="${wishcnt == 1}"> <!-- 테이블에 존재하는 경우 -->
            <button type="button" id="like-btn" onclick="location='wish_cancel?pcode=${pvo.pcode}'"> 이미 찜리스트에 있습니다. </button>
          </c:if>
         </c:if>
        </div>  
      </div>
    </article>
   
    <article id="a2">
      <img src="../resources/img/product/${pvo.cimg}" width="900">
    </article>
  </section>

</body>
</html>