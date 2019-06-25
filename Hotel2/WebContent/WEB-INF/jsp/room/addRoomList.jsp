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
房间信息管理  > 新增房间
</div>
<form method="post" action="${ctxPath}/Room/saveRoom">
<br>
房间编号&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id"/><br><br>
所属楼层&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="floor"/><br><br>


房间类型&nbsp;&nbsp;&nbsp;&nbsp;
<select name=typeId >
  <option value="1">标准单人房</option>
  <option value="2">标准双人房</option>
  <option value="3">豪华单人房</option>
  <option value="4">豪华双人房</option>
</select>

<br><br>

<input type="submit" value="确认添加"/>
<input type="reset" value="  重置  "/>

</form>

