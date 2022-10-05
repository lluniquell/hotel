<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    .link a {
        text-decoration: none;
        color: #000;
        margin-left:10px;
        margin-top:10px;
        display:inline-block;
        width:20px;
        height:20px;
        border: 1px solid #fff;
        text-align:center;
        font-size:18px;
        
    }
    .link a:hover {
        background:#ccbfbf;
        color:#000;
    }

    #search {
        margin: 0 auto;
        width: 700px;
        text-align: center;
    }
    #notice_list{
        width:1100px;
        text-align:center;
        margin:auto;
    
    }
    #notice_list #h2{
        background-color:#ccc;
        padding:10px;
    }
    #notice_list tr{
        height: 30px;
    }
    #notice_top {
        width: 1100px;
        height:100px;
        text-align: center;
        margin: auto;
        font-size:30px;
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
    <table id="notice_top"> <td> 공 지 사 항 <td> </table>
    
              <div class="search_box" style="border: 1px solid black; width:1100px; margin:auto;" >
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
      
       <table id="notice_list" align="center" >
        <tr>
            <td width="70%">제목</td>
            <td width="20%">작성일</td>
            <td width="10%">조회수</td>
        </tr>
        <c:forEach items="${notice_list}" var="nvo">
            <tr>
                <td><a href="../notice/notice_readnum?id=${nvo.id}&page=${page}&sel=${sel}&sword=${sword}" style="color:#000;">${nvo.title}</a></td>
                <td>${nvo.writeday}</td>
                <td>${nvo.readnum}</td>
            </tr>
        </c:forEach>
         <tr class="link">
             <td colspan="4" align="center">
                <!-- 10페이지 이전으로 이동 -->
                <c:if test="${pstart != 1}">
                    <a href="../notice/notice_list?page=${pstart-1}&sel=${sel}&sword=${sword}" style="color:#000;"> << </a>
                </c:if>
                <c:if test="${pstart == 1}">
                     << 
                </c:if>
            
                <!-- 1페이지 이전으로 이동 -->
                <c:if test="${page != 1}">
                    <a href="../notice/notice_list?page=${page-1}&sel=${sel}&sword=${sword}" style="color:#000;"> < </a>
                </c:if>
                <c:if test="${page == 1}">
                      <  
                </c:if>
 
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
          <a href="notice_list?page=${page+1}&sel=${sel}&sword=${sword}" class="btn" style="color:#000;"> > </a>
         </c:if>
         <c:if test="${page == chongpage}">
          >  
         </c:if>
       <!-- 1페이지 단위 다음 이동 끝 --> 
        
       <!-- 10페이지 단위 다음 이동 시작-->
         <c:if test="${pend != chongpage}">
          <a href="notice_list?page=${pend+1}&sel=${sel}&sword=${sword}" style="color:#000;"> >> </a>
         </c:if>
         <c:if test="${pend == chongpage}">
           >> 
         </c:if>
       <!-- 10페이지 단위 다음 이동 끝 -->
              
             </td>
         </tr>
       <tr>
         <td colspan="4"> <a href="notice_write"> 공지글 작성 </a>
       </tr>
    </table>

</body>
</html>