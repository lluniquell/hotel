<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
div {
width:1000px;
}
a {
text-decoration-line:none;
}
.link{
text-align:center;
align:center;
}
.link a {
   text-decoration: none;
   color: #000;
   margin-left:10px;
   margin-top:20px;
   display:inline-block;
   width:20px;
   height:20px;
   border: 1px solid #fff;
   text-align:center;
   font-size:18px;
   padding-bottom:28px;
}

.link a:hover {
   background:#ccbfbf;
   color:#000;
 }
 
</style>
<script>
    function check(my)
    {
        if(my.sel.selectedIndex != 0 && my.sword.value.trim().length != 0)
        {
            return true;
        }		  
        else
            return false;
    }
    
    function init()
    {
        <c:if test="${sel != 'id'}">
            document.search.sel.value="${sel}";
        </c:if>
    }
</script>
</head>
<body onload="init()">
 <div class="container">
  <h1 class="mt-4" style="text-align:center">공지사항</h1> 
    <table class="table table-hover"> 
     <thead class="table-light">
       <tr height="50px">
         <td width="70%">제목</td>
         <td width="20%">작성일</td>
         <td width="10%">조회수</td>
       </tr>
     </thead>
     <tbody>
       <c:forEach items="${notice_list}" var="nvo">
         <tr>
           <td><a href="../notice/notice_readnum?id=${nvo.id}&page=${page}&sel=${sel}&sword=${sword}" style="color:#000;">${nvo.title}</a></td>
           <td>${nvo.writeday}</td>
           <td>${nvo.readnum}</td>
         </tr>
        </c:forEach>
     </tbody>
     <tfoot>
       <div class="search_box" style=" width:1100px; align:left" >
         <form name="search" method="post" action="notice_list" onsubmit="return check(this)" >
           <input type="hidden" name="page" value="1">
             <select name="sel">
               <option> 선택 </option>
               <option value="title"> 제목 </option>
               <option value="content"> 내용 </option>
             </select>
                <input type="text" name="sword" value="${sword}">
                <input type="submit" value="검색">
                <c:if test="${sel != 'id'}">
                <input type="button" onclick="location='notice_list?page=1'" value="전부보기">
               </c:if>
           </form>
        </div>

      </tfoot>
     </table>
   </div>
   <table style="margin-left:auto;margin-right:auto;">
       <tr class="link">
         <td colspan="5" align="center" >
         <!-- 10페이지 이전으로 이동 -->
         <c:if test="${pstart != 1}">
           <a href="../notice/notice_list?page=${pstart-1}&sel=${sel}&sword=${sword}" style="color:#000;"> << </a>
         </c:if>
         <c:if test="${pstart == 1}"> << </c:if>
            
         <!-- 1페이지 이전으로 이동 -->
         <c:if test="${page != 1}">
          <a href="../notice/notice_list?page=${page-1}&sel=${sel}&sword=${sword}" style="color:#000;"> < </a>
         </c:if>
         <c:if test="${page == 1}"> < </c:if>
 
         <c:forEach begin="${pstart}" end="${pend}" var="i">
         <c:if test="${page == i}">
          <a href="../notice/notice_list?page=${i}&sel=${sel}&sword=${sword}" style="background:#a17e48e0; margin-bottom:20px; height:25px;">${i}</a>
         </c:if>
         <c:if test="${page != i}">
          <a href="../notice/notice_list?page=${i}&sel=${sel}&sword=${sword}">${i}</a>
         </c:if>
         </c:forEach>
         <!-- 1페이지  이동 시작-->
         <c:if test="${page != chongpage}">
          <a href="notice_list?page=${page+1}&sel=${sel}&sword=${sword}"  style="color:#000;"> > </a>
         </c:if>
         <c:if test="${page == chongpage}"> > </c:if>
         <!-- 1페이지 단위 다음 이동 끝 --> 
        
          <!-- 10페이지 단위 다음 이동 시작-->
         <c:if test="${pend != chongpage}">
          <a href="notice_list?page=${pend+1}&sel=${sel}&sword=${sword}" style="color:#000;"> >> </a>
         </c:if>
         <c:if test="${pend == chongpage}"> >> </c:if>
         <!-- 10페이지 단위 다음 이동 끝 -->
        </td>
       </tr>
    </table>
</body>
</html>