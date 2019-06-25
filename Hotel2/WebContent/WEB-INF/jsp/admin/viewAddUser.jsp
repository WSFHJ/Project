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
用户管理 > 新增用户
</div>
<form id="UserForm" method="post" action="${ctxPath}/Admin/saveUser">
<br>
用户账号&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="account"/><br><br>
用户名称&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name"/><br><br>


用户角色&nbsp;&nbsp;&nbsp;&nbsp;
<select name="roleId" >
  <option value="*">系统管理员</option>
  <option value="0">酒店经理</option>
  <option value="1">酒店前台</option>
</select>

<br><br>

设置密码&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="pass"/><br><br>

<input type="submit" value="确认添加"/>
<input type="reset" value="  重置  "/>

</form>

