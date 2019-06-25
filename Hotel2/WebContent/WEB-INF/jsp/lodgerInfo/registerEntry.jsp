<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" href="${ctxPath}/css/table.css" />

<link rel="stylesheet" href="${ctxPath}/css/lodging/iframe.css" />
<link rel="stylesheet" href="${ctxPath}/css/lodging/page.css" />

<link rel="stylesheet" href="${ctxPath}/css/lodging/roomBox.css" />
<link rel="stylesheet" href="${ctxPath}/css/lodging/logerBox.css" />
<link rel="stylesheet" href="${ctxPath}/css/lodging/addLodge.css" />

<style>
body { background:white; margin-left:0px; }
#form1 td { font-family:微软雅黑; border:none; }
caption{
	color:gray; font-family:微软雅黑;
}
</style>
<link rel="stylesheet" href="${ctxPath}/css/lodging/jquery-ui.css">
<script src="${ctxPath}/js/jquery-1.10.2.min.js"></script>
<script src="${ctxPath}/js/jquery-ui.js"></script>
<script>
$( function() {
  $( "#entryDate" ).datepicker( {dateFormat:'yy-mm-dd'} );
  $( "#leaveDate" ).datepicker( {dateFormat:'yy-mm-dd'} );
} );
function showDate( objId ){
	var obj = document.getElementById( objId );	
	obj.focus();
}
</script>
<script>
var showRoom = 0;
function showRoomBox( flag ){
	var roomBox = document.getElementById("roomBox");
	if( flag==0 ){
		roomBox.style.visibility = 'hidden';
		showRoom = 0;
		return;
	}	
	if( showRoom ){
		roomBox.style.visibility = 'hidden';
		showRoom = 0;
	}else{
		roomBox.style.visibility = 'visible';
		showRoom = 1;
	}
}

function doSubmit(){	
	var jsonText = getLodgersJson();
	//{ps} 获取表单对象
	var form = document.getElementById("lodgingForm");
	//{ps} 设置表单提交地址
	//     去数据库查一下提交地址。
	form.action = "${ctxPath}/LodgingInfo/saveRegisterEntry";
	
	//{ps} 将 jsonText 设置到表单项目中 (id="lodgerData")
	var data = document.getElementById("lodgerData");
	data.value = jsonText;

	//{ps} 作表单的提交
	form.submit();
}

//功能定义 : 返回所有住客的 json 数据格式...
//格式是怎么样的 ?
//[
//  {"lodgerName":"张三",...},
//  {"lodgerName":"李四",...},
//  {"lodgerName":"王五",...}  	
//]
function getLodgersJson(){
	//{1} 更新数据到数组 ...
	updateLodger();
	//{2} 做格式的拼接 ..
	var jsonText = "[";
	//{3} 迭代这一个数组 lodgerList
	for( var i=1; i<=lodgerList.length; i++ ){
		var lodger = lodgerList[i];
		if( lodger ){
			jsonText += lodger.toJson() +",";
		}
	}	
	//{ps} 将最后一个 "逗号" 去除..
	jsonText = jsonText.substring(0,jsonText.length-1);	
	jsonText += "]";
	return jsonText;
}

function getValue( id ){
	var obj = document.getElementById( id );
	return (obj!=null) ? obj.value : null;
}

</script>
<script src="${ctxPath}/js/lodging/addLodger.js"></script>
<div id="banner">入住管理 > 登记入住</div>
<table id="form1">
	<form id="lodgingForm" method="post" >
	<tr>
		<td>宾客姓名</td>
		<td><input type="text" id="lodgerName1" /></td>
		<td>证件类型</td>
		<td>
			<select id="certificate1">
				<option value="0">请选择证件</option>
				<option value="1">身份证</option>
				<option value="2">军官证</option>
				<option value="3">港澳通行证</option>
			</select>
		</td>
		<td>证件号码</td>
		<td><input type="text" id="certificateNo1" /></td>
	</tr>
	<tr>		
		<td>手机号</td>
		<td><input type="text" id="phone1" /></td>
		<td>入住日期</td>
		<td>
			<div>
				<input type="text" id="entryDate" name="entryDate" readonly /><!--
				--><div class="btnArrow" onclick="showDate('entryDate')"></div>
			</div>
		
		</td>
		<td>离店日期</td>
		<td>
			<div>
				<input type="text" id="leaveDate" name="leaveDate" readonly /><!--
				--><div class="btnArrow" onclick="showDate('leaveDate')"></div>
			</div>
		</td>
	</tr>
	<tr>
		<td>性别 </td>
		<td><input type="text" id="sex1" style="width:125px;" value="男" /></td>
		<td>房间号</td>
		<td colspan="3">
			<input type="text" id="roomId" name="roomId" 
				style="width:95px;vertical-align:middle;" /><!-- 
		 --><input type="button" onclick="showRoomBox();" 
		 	 value="选择房间" style="vertical-align:middle;width:95px;"/>
		</td>
	</tr>
	<tr>		
		<td>收受押金</td>
		<td><input type="text" name="deposit" /></td>
		<td colspan="4"></td>
	</tr>
	
		<input type="hidden" id="lodgerData" name="lodgerData" />  
		<input type="hidden" name="operatorId" value="${user.id}"/>
		<input type="hidden" name="days" value="0"/>
		
	</form>
</table>

<table id="list" class="list">
	<caption>同来宾客</caption>
	<tr>
		<th>用户名称</th>
		<th>证件号码</th>
		<th>性别</th>
		<th>操作</th>
	</tr>	
	<tr>
		<td colspan="4" style="text-align:center;height:42px;">
			<input type="button" value="添加宾客" onclick="addLodger();"/>
			<input type="button" value="添加备注" />
		</td>
	</tr>
</table>
<br/>
<div style="width:100%;text-align:center;">
	<input id="confirm" type="button" 
		class="btn" value="确认入住" onclick="doSubmit();" />
	<input id="confirm" type="button" class="btn" value="重置数据" />
</div>

<!--
	对话框 ----------------------------------------------
-->
 <div id="roomBox">
	<div id="boxTitle">
		<div class="minTitle">选择房间</div>
		<div class="minClose" onclick="showRoomBox(1);"></div>
	</div>
	<div id="component">
		<span>选择房型 : </span>
		<select style="width:150px;height:30px;">
			<option>查询全部</option>
			<option>标准单人间</option>
			<option>标准双人间</option>
			<option>豪华单人间</option>
			<option>豪华双人间</option>
		</select>
	</div>
	<table id="boxTbl">
		<tr style="background:#D2D2D2;">
			<td>序号</td>
			<td>房号</td>
			<td>房间类型</td>
			<td>操作</td>
		</tr>
		<tr>
			<td>1</td>
			<td>302</td>
			<td>标准单人间</td>
			<td>
				<input type="checkbox" value="" />
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>303</td>
			<td>标准单人间</td>
			<td>
				<input type="checkbox" value="" />
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>304</td>
			<td>标准单人间</td>
			<td>
				<input type="checkbox" value="" />
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>304</td>
			<td>标准单人间</td>
			<td>
				<input type="checkbox" value="" />
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>304</td>
			<td>标准单人间</td>
			<td>
				<input type="checkbox" value="" />
			</td>
		</tr>
	</table>
	<div style="margin-top:15px;text-align:center;height:50px;">
		<div style="width:325px; margin:auto;height:55px;">
			<div class="pagePrev" style="height:33px;line-height:33px;">上一页</div>
			<div class="pageBtn" style="height:33px;line-height:33px;">1</div>
			<div class="pageBtn" style="height:33px;line-height:33px;">2</div>
			<div class="pageBtn" style="height:33px;line-height:33px;">3</div>
			<div class="pageBtn" style="height:33px;line-height:33px;">4</div>
			<div class="pageBtn" style="height:33px;line-height:33px;">5</div>
			<div class="pageNext" style="height:33px;line-height:33px;">下一页</div>
		</div>
	</div>
	<div style="text-align:center;">
		<div class="btn confirm">确认选择</div>
		<div class="btn cancel" onclick="showRoomBox(1);">取消操作</div>
	</div>
</div>
