<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
section{

}

table {
	text-align:center;
	border: 2px solid #DADADD;
	border-collapse: collapse;
	font-size: 14px;
}

th, td {
	border : 2px solid #DADADD;
	padding: 1px;
}
</style>
<section>

<table width="700px" align="center" >
	<caption><h2>매출 관리</h2></caption>
	<tr>
		<td colspan="4">
		<input type="button"> 연으로 보기
		<input type="button"> 다른달 보기
		</td>	
	</tr>
	<tr>
		<td>일자</td>
		<td>카드결제</td>
		<td>현장결제</td>
		<td>합계</td>
	</tr>
	<c:forEach var="i" begin="1" end="${lastday}" step="1">
		<tr>
			<td>
				<!-- 월이 1자리 일때 2자리로 -->
				<c:if test="${fn:length(mm)==1}">
					<c:set var="mm" value="0${mm}"/>	
				</c:if>
			
				<!-- 일이 1자리 일때 2자리로 -->
				<fmt:formatNumber value="${i}" var="dd" />
			
				<c:if test="${fn:length(dd)==1}">
					<c:set var="dd" value="0${dd}"/>	
				</c:if>
				
				<!-- 데이트 변수 설정 -->
				<c:set var="date" value="${yy}-${mm}-${dd}" />
			
			${date} 
			</td>	
			<td>
				<c:forEach items="${card}" var="card">
					<c:if test="${date==card.writeday}">
						<fmt:formatNumber value="${card.card}" type="currency" currencySymbol="" />
						<c:set var="cardprice" value="${card.card}" /> 
						<c:set var="cardtotal" value="${cardtotal+cardprice}" />
					</c:if>
				</c:forEach>	
			</td>
			<td>
				<c:forEach items="${onsite}" var="onsite">
					<c:if test="${date==onsite.writeday}">
						<fmt:formatNumber value="${onsite.onsite}" type="currency" currencySymbol="" /> 
						<c:set var="onsiteprice" value="${onsite.onsite}" /> 
						<c:set var="onsitetotal" value="${onsitetotal+onsiteprice }" />
					</c:if>
				</c:forEach>	
			</td>
			<td>
				<fmt:formatNumber value="${cardprice+onsiteprice}" type="currency" currencySymbol=""/>
				<c:set var="cardprice" value="" />
				<c:set var="onsiteprice" value="" />
			</td>
		</tr>
		
	</c:forEach>
	<tr>
			<td>합계</td>
			<td><fmt:formatNumber value="${cardtotal}" type="currency" currencySymbol=""/></td>
			<td><fmt:formatNumber value="${onsitetotal}" type="currency" currencySymbol="" /></td>
			<td><fmt:formatNumber value="${cardtotal+onsitetotal}" type="currency" currencySymbol=""/></td>
		</tr>
</table>
</section>