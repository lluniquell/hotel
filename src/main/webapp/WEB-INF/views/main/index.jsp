<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		location = "../book/book1?date=" + newdate + "&person=" + person;
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
 section{
  width:80%;
  margin: auto;
  margin-top: 50px;
 }
 section #first{
  font-weight:bold;
  font-size:25px;
  height:100px;
  border-bottom: 2px solid #eeeeee; 
 }
 section #second{
  height:200px;
    border-bottom: 2px solid #eeeeee; 
  
 }
 section table {
  text-align: center;
 }
 section select,section input[type=text]{
  height: 53px;
	width:200px;
  font-size: 14px;
  padding: 10px;
 }
 section #button{
  background:#068484;
   height: 53px;
	width:200px;
	font-size:16px;
  color:white;
  padding:5px;
  border-radius:25px;
  border:0px;
 }
 section #button:hover{
  border:1px solid black;
  background:black;
  
 }
  section #third{
  margin-top:50px;
 }
 
</style>
	<section> 
	<div id="first"> ALL – Accor Live Limitless 와 함께 지금까지 경험하지 못한 세상을 경험하세요. </div>
	
	<div id="second">
		<table width="1000" align="center">
			<tr height="70">
				<td>체크인 / 체크아웃</td>
				<td>투숙 인원</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" class="outline" style="height:30px";
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
	
	
	
 <div id="third" align="center"><img src="../resources/img/메인화면.jpg"></div>
 
 
	</section>