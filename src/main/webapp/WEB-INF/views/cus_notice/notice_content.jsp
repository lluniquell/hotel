<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
 border-collapse: collapse;	
  margin-top: 15px;
  margin-bottom: 20px;
}
h2 {
 margin-top:15px;
 margin-bottom:15px;
 padding:20px 0;
 font-size:30px;
}
table tr #a {
 border-top:2px solid #ddd;
 border-bottom:2px solid #ddd;
 padding:15px 0;
 
}
table tr #b {
line-height: 3rem;
height: 150px;
padding:20px;
}
table tr #c {
 border-bottom:2px solid #ddd;
 padding:15px 0;
}
#con {
border-bottom:2px solid #ddd;

}
img {
  display : block;
  margin : auto;}
}
#btn {
padding-top:40px;
margin-top:100px;
margin-bottom:50px;
padding-bottm:50px;
text-align:center;
margin-left:10px;
margin-right:auto;"
}
a {
text-decoration-line:none;
}
</style>
<script>
$("img").error(function () {
    $(this).hide();
    // or $(this).css({visibility:"hidden"}); 
});
</script>
</head>
<body>
        <table align="center" width="1000">
         <caption><h2>공지사항</h2></caption>	
            <tr>   
                <td id="a">${nvo.title}</td>
                <td id="a">${nvo.writeday}</td>
                <td id="a">조회수</td>
                <td id="a">${nvo.readnum}</td>
            </tr> 
            <tr> 	
                <td id="b"><img src="../resources/img/notice/${nvo.fname}" width="400" height="400" onerror="this.style.display='none'"> </td>
            </tr>
            <tr>
                <td id="con" colspan="6">${nvo.content}</td>
            </tr>
            <tr>
              <td id="btn" colspan="5" align="center" style="padding-top:20px;">
                <input  type="button" value="목록" onclick="location.href='../cus_notice/notice_list?page=1'">
              </td>
            </tr>
         </table>
</body>
</html>