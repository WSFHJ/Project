<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.gec.model.User"
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctxPath}/css/iframe.css" />
<style>
.list th:nth-child(1){ width:80px; }
.list th:nth-child(2){ width:150px; }
.list th:nth-child(3){ width:150px; }
.list th:nth-child(4){ width:150px; }
.list th:nth-child(5){ width:150px; }
.list th:nth-child(6){ width:100px; }

.PageBtn{ cursor:pointer;}
.pageBtn:hover{ background:#A3A3A3; }

</style>
<link rel="stylesheet" href="${ctxPath}/css/table.css" />
<link rel="stylesheet" href="${ctxPath}/css/page.css" />

<script>
function gotoPage( toPage ){
	window.location = "${ctxPath}/Room/viewRoomList?curPage="+ toPage;
}
</script>

<div id="banner">
房间信息管理 > 房间列表
</div>
<table class="list">
	<tr>
		<th>序号</th>
		<th>房间编号</th>		
		<th>房间类型</th>
		<th>所属楼层</th>		
		<th>操作</th>		
	</tr>
	<c:forEach items="${svPage.list}" var="room" varStatus="sta">
	<tr>
		<td>${sta.count}</td>
		<td>${room.id }</td>		
		<td>${room.typeName}</td>		
		<td>${room.floor} 层</td>
		<td>
			<img src="${ctxPath}/images/edit.png"/>
			<img src="${ctxPath}/images/del.png"/>
		</td>		
	</tr>
	</c:forEach>
</table>

<div style="margin-top:50px;text-align:center;">
	<div style="width:500px; margin:auto;">
		<div class="pagePrev" onclick="gotoPage(${svPage.prevPage});">
		       上一页
		</div>
		<c:forEach begin="${svPage.start}" end="${svPage.end}" varStatus="sta">
		<div class="pageBtn" onclick="gotoPage(${sta.count});">
		     ${sta.count}
		</div>
		</c:forEach>
		<div class="pageNext" onclick="gotoPage(${svPage.nextPage});">
		        下一页
		</div>
	</div>
</div>