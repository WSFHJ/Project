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

</style>

<script type="text/javascript">

</script>

<div id="dv_top">
房间信息管理  > 新增房间类型
</div>
<form method="post" action="${ctxPath}/RoomType/saveType">
<br>
类型名称&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="typeName"/><br><br>
价格（天）&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="dayPrice"/><br><br>
价格（小时）&nbsp;<input type="text" name="hourPrice"/><br><br>

可住人数&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"/>人<br><br>

<br><br>

<input type="submit" value="确认添加"/>
<input type="reset" value="  重置  "/>

</form>

