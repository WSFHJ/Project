<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctxPath}/css/iframe.css" />
<link rel="stylesheet" href="${ctxPath}/css/table.css" />
<link rel="stylesheet" href="${ctxPath}/css/page.css" />
<style>

.PageBtn{ cursor:pointer;}
.pageBtn:hover{ background:#A3A3A3; }

#container{ margin-top:15px; margin-left:25px; }
.box{
	background:blue; position:relative;
	width:150px; height:100px;	
	border:1px solid #666; float:left;
	margin-left:15px;
}
.icon{
	width:15px; height:20px;
	display:inline-block;
	vertical-align:middle;
}
.user{ background:url('${ctxPath}/images/room_user.jpg'); }
.clean{ background:#8DC63F; }
.mtain{ background:gray; }
.empty{ background:url('${ctxPath}/images/room_empty.jpg'); }

.user .icon{ background:url('${ctxPath}/images/ic_user.png'); }
.clean .icon{ background:url('${ctxPath}/images/ic_clean.png'); }
.mtain .icon{ background:url('${ctxPath}/images/ic_mtain.png'); }
.empty .icon{ background:url('${ctxPath}/images/ic_empty.png'); }

.bx_bar{
	background:url('${ctxPath}/images/room_bar.png');
	width:150px; height:25px; font-family:微软雅黑;
	position:absolute; bottom:0px; color:white;
	text-align:center;
}
.bx_top{
	width:150px; height:25px; font-family:微软雅黑;
	position:absolute; top:0px; color:white;
	text-align:left; text-indent:0.5em;
}
.info{
	position:absolute; top:35px; color:white;
	font-family:微软雅黑; font-size:17px;
	height:20px; width:150px; 
	line-height:20px; text-align:center;
}
.info img{ vertical-align:middle;  }
.info div{ display:inline-block; }
</style>

<script>
    function gotoPage( toPage ){
        window.location = "${ctxPath}/LodgingInfo/viewStateList?curPage="+ toPage;
    }
</script>

<div id="banner">
房态信息管理 > 实时房态
</div>
<div id="container">
	
    <c:forEach items="${svPage.list}" var="room">
        <c:if test="${room.status==1}">
            <div class="box empty">
                <div class="bx_top">${room.id} 房</div>
                <div class="bx_bar">${room.typeName}</div>
                <div class="info">
                    <div class="icon"></div>
                    <div>空闲中</div>
                </div>
            </div>
        </c:if>

        <c:if test="${room.status==4}">
            <div class="box user">
                <div class="bx_top">${room.id} 房</div>
                <div class="bx_bar">${room.typeName}</div>
                <div class="info">
                    <div class="icon"></div>
                    <div>居住中</div>
                </div>
            </div>
        </c:if>

        <c:if test="${room.status==2}">
            <div class="box clean">
                <div class="bx_top">${room.id} 房</div>
                <div class="bx_bar">${room.typeName}</div>
                <div class="info">
                    <div class="icon"></div>
                    <div>打扫中</div>
                </div>
            </div>
        </c:if>

        <c:if test="${room.status==3}">
            <div class="box mtain">
                <div class="bx_top">${room.id} 房</div>
                <div class="bx_bar">${room.typeName}</div>
                <div class="info">
                    <div class="icon"></div>
                    <div>维修中</div>
                </div>
            </div>
        </c:if>

    </c:forEach>

    <div style="clear:both;"></div>
</div>

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