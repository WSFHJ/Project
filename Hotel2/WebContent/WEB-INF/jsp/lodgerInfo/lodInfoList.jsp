<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctxPath}/css/iframe.css" />
<style>
.list th:nth-child(1){ width:100px; }
.list th:nth-child(2){ width:120px; }
.list th:nth-child(3){ width:80px; }
.list th:nth-child(4){ width:135px; }
.list th:nth-child(5){ width:120px; }
.list th:nth-child(6){ width:120px; }
.list th:nth-child(7){ width:100px; }
.list th:nth-child(8){ width:135px; }
a:link{ text-decoration:none; }
</style>
<link rel="stylesheet" href="${ctxPath}/css/table.css" />
<link rel="stylesheet" href="${ctxPath}/css/page.css" />
<div id="banner">
入住管理 > 预订入住
</div>
<table class="list">
	<tr>
		<th>订单编号</th>
		<th>宾客</th>
		<th>入住房间</th>	
		<th>入住时间</th>
		<th>结束时间</th>
		<th>入住天数</th>
		<th>押金</th>
		<th>操作</th>
	</tr>
	<!-- 
		req.setAttribute("list", list);
		int id;      //入住日期
		
		String entryDate;  //入住日期
		String leaveDate;  //离店日期
		String roomId;   //房间 ID (如: 302)
		int deposit;     //押金 (如: 250)
		String registerName;
		private String reservationId;
	 -->
	<c:forEach items="${list}" var="lodInfo">
		<tr>
			<td>${lodInfo.id}</td>
			<td>${lodInfo.registerName}</td>
			<td>${lodInfo.roomId} 房</td>
			<td>${lodInfo.entryDate}</td>
			<td>${lodInfo.leaveDate}</td>	
			<td>${lodInfo.days}</td>
			<td>${lodInfo.deposit}</td>
			<td><a href="#">[详情]</a></td>
		</tr>
	</c:forEach>
</table>

<div style="margin-top:50px;text-align:center;">
	<div style="width:500px; margin:auto;">
		<div class="pagePrev">上一页</div>
		<div class="pageBtn">1</div>
		<div class="pageBtn">2</div>
		<div class="pageBtn">3</div>
		<div class="pageBtn">4</div>
		<div class="pageBtn">5</div>
		<div class="pageNext">下一页</div>
	</div>
</div>