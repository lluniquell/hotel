<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
	$(function() {
		$('input[name="daterange"]').daterangepicker({
			locale: {
					format : "YYYYMMDD",
					opens : "bottom"
				}
		
						
	})
	
	});		

function view_restroom()
{
	document.getElementById("restroom").style.display="table-cell";	
}


function check_restroom()
{
	var date=document.getElementsByName("daterange")[0].value;
	var person=document.getElementsByName("person")[0].value;
	var newdate=date.replace(/\s+/g,'');
		newdate=newdate.replace(/[/]/g,'');
		//alert(newdate);

	
	location="book1?date="+newdate+"&person="+person; 
}


</script>
<style>
section {
	width: 1000px;
	height: 600px;
	margin: auto;
	text-align: center;
	display:table;
	table-layout:fixed;
}

#person_add{
	 display:none; 
}
</style>

<section>
	<div>
		<table width=500px>
			<tr>
				<td>체크인 / 체크아웃</td>				
				<td>인원</td>
			</tr>
			<tr>
				<td><input type="text" name="daterange"
					value="<fmt:formatNumber value='${today}'/>"></td>
				<td>
					<select name="person">
						<option>1</option>
						<option selected>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</td>				
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="검색" onclick="check_restroom()">
				</td>
			</tr>		
		</table>
		<div id="restroom">
			<table width=500px>				
				<tr>
					<td>객실명</td>
					<td>등급</td>
					<td>최대인원</td>
					<td>가격</td>												
				</tr>					
			</table>		
		</div>
	</div>
</section>
