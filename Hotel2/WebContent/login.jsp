<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>用户登陆</title>
<style>
[type='text'], [type='password']{
	text-indent:0.4em; margin-left:10px;
	width:300px; height:32px;
	border:1px solid #B2B2B2;
	font-size:16px; font-family:'微软雅黑';
}
label { margin-left:20px; font-size:25px; }
body {
	font-family:微软雅黑; margin:0px;
	background-image:url('${ctxPath}/images/back.jpg');
	text-align:center;
}
table {
	border:1px solid #B2B2B2;
	border-collapse:collapse;
	background-color:#FFF;
} 
#outbox {
	/* background:#333; */
	margin:0px 0px;
	position:absolute;
	top:50%; left:50%;
	margin:-155px -230px;
	text-align:center;
}
#up_box {
	width:500px; height:230px;
	margin:auto auto;
	display:table-cell;
	margin-left:25px;
} 
#btnLogin:hover{ cursor:pointer; }
.head{
	text-align:left; text-indent:0em;
	background:#9CC715; height:55px;
}
[type='radio']{ width:17px; height:17px; font-size:15px;  }

#select_bar{
	text-indent:0em;display:inline-block;
	width:350px; height:35px;
	line-height:35px;
}


#title{
	font-size: 45px;
    font-family: 微软雅黑;
    color: white;
    font-style: italic;
	text-align:center;
	letter-spacing:5px;
	position:relative;
	right:110px;
}
#title2{
    padding-bottom:25px;
	text-align:center;
	color: #F9A818;
	position:relative;
	top:-6px;
	font-size: 30px;
	right:110px;
    letter-spacing:2px;
}
#title3{
    padding-top:25px;
    color: #F9A818;
    text-align:center;
	position:relative;
	right:110px;
	letter-spacing:5px;
	font-size: 20px
}
#title4{
    position:relative;
	right:110px;
	top:4px;
    color: white;
	letter-spacing:3px;
	font-size: 18px
}

</style>
<script>
function gotoSub(){
	var form = document.getElementById( 'userForm' );
	form.submit();	
}

function keyFunc( e ){
	var keyNum = window.event ? e.keyCode : e.which;
	if( keyNum==13 ){
		gotoSub();
		return true;
	}
	return false;
}

function init(){
	//document.body.clientWidth 
	var height = document.body.clientHeight;
	var box = document.getElementById( 'up_box' );
	//box.style.marginTop = (height - 230)/2 +'px';
}

</script>
</head>
<body onKeyUp="return keyFunc(event);" onload="init();">

<div id="outbox">
	<div id="title">怡观海高级商务酒店管理系统</div>
	<div id="title2">YiGuanHai Advance Hotel Manange System</div>
	<div id="up_box">
		<table>
			<form id="userForm" action="${ctxPath}/User/login"
				accept-charset="UTF-8" method="post">
			<tr>
				<td colspan="2" class="head"><label>用户登陆</label></td>		
			</tr>
			<tr>
				<td colspan="2" style="height:20px;"></td>
			</tr>
			<tr>
				<td width="125" style="text-align:right;">用户帐号</td>
				<td width="375" style="text-align:left;"><input type="text" name="account"/></td>
			</tr>
			<tr>
				<td style="text-align:right;">用户密码</td>
				<td style="text-align:left;">
				<input type="password" name="pass"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="middle" height="90">
				<img id="btnLogin" src="${ctxPath}/images/img_login.png" onClick="gotoSub();"/>
				</td>
			</tr>
			</form>
		</table>
	</div>
	<div id="title3">技术支持：物联信息科技有限公司</div>
	<div id="title4">Right: ALE Infomation Technology Co.Ltd (2010-2020)</div>
</div>
</body>

</html>

