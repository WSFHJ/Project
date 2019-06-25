<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<style>
body{ background:white; margin-left:25px; }
#dv_top{
	font-size:19px; font-family:微软雅黑;
	height:45px; color:#666;line-height:45px;
}
th:nth-child(1){ width:120px; }
th:nth-child(2){ width:150px; }
th:nth-child(3){ width:150px; }
th:nth-child(4){ width:150px; }
th:nth-child(5){ width:150px; }
th:nth-child(6){ width:170px; }
#tbl th{ height:45px; }
#tbl td{ font-weight:normal; height:45px; font-family:微软雅黑; }

.pageBtn{
	border:1px solid #666; text-align:center;
	width:35px; height:35px; float:left; line-height:35px;
}
.pagePrev, .pageNext { 
	border:1px solid #666;
	width:70px; height:35px; float:left;
	text-align:center;  line-height:35px;
}
</style>
<link rel="stylesheet" href="${ctxPath}/css/table.css" />

<script>
function gotoPage( toPage ){
	window.location = "${ctxPath}/Admin/viewUserList?curPage="+ toPage;
}
function gotoDel( id ){
	window.location = "${ctxPath}/Admin/delUser?id="+ id;
}
</script>

<div id="dv_top">
系统管理 > 用户管理
</div>
<table id="tbl">
	<tr>
		<th>用户ID</th>
		<th>用户帐号</th>
		<th>用户名称</th>
		<th>用户级别</th>
		<th>创建日期</th>
		<th>操作</th>		
	</tr>
	<c:forEach items="${usPage.list}" var="user" varStatus="sta">
	<tr>
		<td>u00${sta.count}</td>
		<td>${user.account}</td>
		<td>${user.name}</td>		
		<td>${user.roleName}</td>
		<td>${user.createDate}</td>
		<td>
		    <img src="${ctxPath}/images/edit.png" />
		    <img src="${ctxPath}/images/del.png" onclick="gotoDel(${user.id});" />
		</td>		
	</tr>
	</c:forEach>
</table>

<div style="margin-top:50px;text-align:center;">
	<div style="width:500px; margin:auto;">
		<div class="pagePrev" onclick="gotoPage(${usPage.prevPage});">
		       上一页
		</div>
		<c:forEach begin="${usPage.start}" end="${usPage.end}" varStatus="sta">
		<div class="pageBtn" onclick="gotoPage(${sta.count});">
		     ${sta.count}
		</div>
		</c:forEach>
		<div class="pageNext" onclick="gotoPage(${usPage.nextPage});">
		        下一页
		</div>
	</div>
</div>