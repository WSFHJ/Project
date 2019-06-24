<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.gec.model.User"
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<%
	User user = (User)pageContext.findAttribute("user");
	request.setAttribute("menuKey", "menu_"+ user.getRoleId());
%>

<!-- 从应用程序域中取出对应角色的菜单
	applicationScope['key']
	key = "menu_"+ roleId;
 -->

<style>
body{ margin:0px; }
#nav #topic{
	width:360px; font-size:25px;
	text-align:left;
	text-indent:0.3em;
}
#blk_left{
	width:180px; height:650px;
	background:#F2F2F2; float:left;
}
#blk_right{
	width:auto; height:650px;
	background:white; padding:0px;
}
iframe{
	width:1094px;
	height:650px;
	border:none; margin:0px;
}
</style>
<link rel="stylesheet" href="${ctxPath}/css/bar.css" />
<link rel="stylesheet" href="${ctxPath}/css/left.css" />
<script src="${ctxPath}/js/jquery-1.10.2.min.js"></script>
<script src="${ctxPath}/js/menu.js"></script>
<script>

window.onload = function() {
		//获取元素id
        var show = document.getElementById("time");
        //设置定时器1s执行一次
        setInterval(function() {
            var time = new Date();   // 程序计时的月从0开始取值后+1
            var m = time.getMonth() + 1;
            var t = time.getFullYear() + "-" + m + "-"
                + time.getDate() + " " + time.getHours() + ":"
                + time.getMinutes() + ":" + time.getSeconds();
            show.innerHTML = t;
        }, 1000);
    };

$( init );    //文档加载完自动执行该函数
function func(){
	console.log( "func" );
	flag = false;
}
var $last = undefined;
function gotoURL( obj, page ){
	if( $last ){
		$last.css('background', '#E3E3E3');
	}
	var $obj = $( obj );
	$last = $obj;
	$obj.css( 'background', '#D2D2D2' );
	var win = document.getElementById( "win" );
	win.src = '${ctxPath}'+ page;
}
</script>
<ul id="nav" >
	<li id="topic">怡观海高级商务酒店管理系统</li>	
	<li id="user">
	登陆时间: <span id="time"></span>
	用户: ${user.name}
	<a href="${ctxPath}/User/logout">退出登陆</a>
	</li>
</ul>
<div style="clear:float;"></div>
<div style="margin-top:-15px;width:1950px;">
	<div id="blk_left">
	<ul id="left">
		<c:forEach items="${applicationScope[ menuKey ]}" var="entry" >
			<!-- entry.key,  entry.value ==> menu -->
			<li class="item">
				<div class="title">${entry.value.menuName}</div>
				<ul style="display:none;">
					<c:forEach items="${entry.value.items}" var="itemMenu">
						<c:if test="${itemMenu.visible=='1'}">
							<li onclick="gotoURL(this,'${itemMenu.urlLink}');">
								${itemMenu.itemName}
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:forEach>		
	</ul>
	</div>
	<div id="blk_right">
		<iframe id="win" src="${ctxPath}/welcome.jsp"></iframe>
	</div>
</div>





