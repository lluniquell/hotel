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

function toYYYYMMDD(d){
    var yyyy = d.getFullYear().toString();
    var mm = (d.getMonth() + 101).toString().slice(-2); /* 월은 0이 1월 */
    var dd = (d.getDate() + 100).toString().slice(-2);
    
    return yyyy + mm + dd; 
}
	var startDate=toYYYYMMDD(new Date());
	var endDate=(parseInt(startDate)+1).toString();

	$(function() {
		$('input[name="daterange"]').daterangepicker({
			startDate:startDate,			
			endDate:endDate,
			minDate:toYYYYMMDD(new Date()),
			
		 	locale : {
				format : "YYYYMMDD",
				opens : "bottom"
			}
		})
	});

	function view_restroom() {
		document.getElementById("restroom").style.display = "table-cell";
	}

	function book1() {
		var date = document.getElementsByName("daterange")[0].value;
		var person = document.getElementsByName("person")[0].value;
		var newdate = date.replace(/\s+/g, '');
		newdate = newdate.replace(/[/]/g, '');
		//alert(newdate);

		location = "book1?date=" + newdate + "&person=" + person;
	}

	function outline_view(n)
	{	
		
		/* document.getElementsByClass("outline")[n].style.outline-style = "solid"; 
		document.getElementsByClass("outline")[n].outline-color = "RGB(52, 112, 223)";
		document.getElementsByClass("outline")[n].outline-width = "1px)";  */
	}

	function outline_hide(n) {
		/* document.getElementsByClassName("outline")[n].outline = "none"; */
	}
</script>
<style>
section {
	width: 1000px;
	height: 600px;
	margin: auto;
	text-align: center;
	display: table;
	table-layout: fixed;
	font-family: roboto;
}

section div {
	margin-top: 80px;
}



#button {
	font-size: 16px;
	color:white;
	line-heigth:24px;
	text-decoration: none solid RGB(255, 255, 255);
	text-align: center;
	background-color: #068484;
	heigth: 58x;
	width: 144px;
	display: block;
	width: 144px;
	height: 51px;
	border: 1px solid #1E1852;
	border-radius: 30px;
}

section td {
	text-align: left;
}
</style>

<section>
	<div>
		<table width="500px" align="center" border="1px">
			<tr>
				<td>체크인 / 체크아웃</td>
				<td>투숙 인원</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" class="outline"
					onmouseover="outline_view(0)" onmouseout="outline_hide(0)"
					name="daterange" value="<fmt:formatNumber value='${today}'/>"></td>
				<td><select name="person" class="outline"
					onmouseover="outline_view(1)" onmouseout="outline_hide(1)">
						<option>1</option>
						<option selected>2</option>
						<option>3</option>
						<option>4</option>
				</select></td>
				<td><input type="button" id="button" class="outline"
					onmouseover="outline_view(2)" onmouseout="outline_hide(2)"
					onclick="book1()" value="검색하기"></td>

			</tr>
		</table>
	</div>
</section>
