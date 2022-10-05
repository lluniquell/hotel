<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.del_form.zip.value = data.zonecode; // 우편번호
        document.del_form.juso.value = addr;  // 주소
        document.del_form.juso_etc.value ="";
        // 커서를 상세주소 필드로 이동한다.
        document.del_form.juso_etc.focus();
    }
  }).open();
}

onload=function(){
	document.del_form.state.value=${dvo.state};
	
}
</script>
<style>
 #del_form{
  width:80%;
  height:300px;
  margin:auto;
  text-align: left;
  border:2px solid skyblue;
  padding-left:20px;
  padding-right:20px;
  margin-top:50px;
  margin-bottom: 50px;
  }
  #del_form div{
  width:100%;
  margin-top:5px; 
  }
  #del_form input[type=text]
  {
   width:70%;
   height:20px;
  }
#del_form input[type=submit]{
margin-top:20px; 
width:100px;
 border:0px;
 font-weight:bold;
 background:#eeeeee;
 
}
#btn{
 float: right;
 font-size: 12px;
}
</style>
</head>
<body>
 <div id="del_form">
  <span id="btn" onclick="location='delivery_list'">▶ 배송목록</span>
   <form name="del_form" method="post" action="delivery_update_ok">
     <caption><h3 align="center">배송지 변경</h3></caption>
     <input type="hidden" name="id" value="${dvo.id}">
     <div><input type="text" name="name" placeholder="받는 사람" value="${dvo.name}"></div>
     <div><input type="text" id="zip" name="zip" readonly placeholder="우편번호찾기" value="${dvo.zip}"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </div>
     <div><input type="text" name="juso" placeholder="주 소" value="${dvo.juso}" readonly> </div>
     <div><input type="text" name="juso_etc" placeholder="상세주소" value="${dvo.juso_etc}"> </div>
     <div><input type="text" name="phone" placeholder="휴대폰 번호" value="${dvo.phone}"></div>
     <div>배송요청사항 
     <select name="state">
      <option value="0"> 없음 </option>
      <option value="1"> 문 앞 </option>
      <option value="2"> 택배함</option>
      <option value="3"> 기타사항</option>
     </select></div>
     
     <div align="center">
     <input type="submit" value="저장"> 
     </div>
    </form>
   </div>

</body>
</html>