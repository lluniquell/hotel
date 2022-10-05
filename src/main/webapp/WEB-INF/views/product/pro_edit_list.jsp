<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<style>
h1 {
text-align:center;
}
</style>
<body>
  <main class="mt-5 pt-5" style="width:1100px; margin:auto;" >
	<div class="container-fluid px-4" >
		<h1 class="mt-4" style="text-align:center">상품관리</h1>

		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="../product/pro_write"> <!-- <i class="fas fa-table me-1"></i> -->
					<i class="fas fa-edit"></i> 상품등록
				</a>
			</div>
			<div class="card-body"  > 
				<table class="table table-hover" >
					<thead>
						<tr>
							<th>상품번호</th>
							<th>상품명</th>
							<th>가격</th>
							<th>제조사</th>
							<th>할인율</th>
							<th>상품 수량 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="pvo">
							<tr onclick="location.href='../product/pro_edit?pcode=${pvo.pcode}'" style="cursor:hand">
								<td>${pvo.pcode}</td>
								<td>${pvo.title}</td>
								<td>${pvo.price}</td>
								<td>${pvo.made}</td>
								<td>${pvo.halin}</td>
								<td>${pvo.su}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
</body>
</html>