var LodgerCnt = 1;
var lodgerList = ['','first'];

function Lodger( _lodgerName, _certificate, 
		_certificateNo, _sex, _phone ){
	this.lodgerName = _lodgerName;
	this.certificate = _certificate;
	this.certificateNo = _certificateNo;
	this.sex = _sex;
	this.phone = _phone;
	this.isRegister = "0";

	this.toJson = function(){
		var json = "{"+
			"\"lodgerName\":\""+ this.lodgerName +"\","+
			"\"certificate\":\""+ this.certificate +"\","+
			"\"certificateNo\":\""+ this.certificateNo +"\","+
			"\"sex\":\""+ this.sex +"\","+
			"\"phone\":\""+ this.phone +"\","+
			"\"isRegister\":\""+ this.isRegister +"\""+
			"}";
		return json;
	}
}

function updateLodger(){
	var lodgerName, certificate, certificateNo, sex, phone;
	for(var i=1; i<=LodgerCnt; i++){
		lodgerName = getE("lodgerName"+ i);
		console.log( "{js} updateLodger: i=%d, lodgerName=%s", i, lodgerName.value );
		certificate = getE("certificate"+ i);
		certificateNo = getE("certificateNo"+ i);
		sex = getE("sex"+ i);
		phone = getE("phone"+ i);
		lodgerList[i] = new Lodger( lodgerName.value, 
							certificate.value, 
							certificateNo.value, 
							sex.value, phone.value );
		if( i==1 ){
			lodgerList[i].isRegister = 1;
		}
	}
}

function getE( id ){
	return document.getElementById( id );
}

function addLodger(){	
	updateLodger();	   //{ps} 调用了: updateLodger();
	var list = $("#list");
	var html = makeHead();
	for(var i=2; i<=LodgerCnt; i++){
		console.log( "{js} addLodger: i = "+ i );
		html += makeRow( i, lodgerList[i] );
	}
	LodgerCnt ++;
	var newLodger = new Lodger("", "", "", "", "");
	html += makeRow(LodgerCnt,newLodger);
	html += makeFoot();
	list.html( html );
}

function makeHead(){
	var html = "<caption style=\"color:gray;\">同来宾客</caption>"+
	"<tr>"+
		"<th>用户名称</th>"+
		"<th>证件号码</th>"+
		"<th>性别</th>"+
		"<th>操作</th>"+
	"</tr>"
	return html;
}

function makeFoot(  ){
	return "<tr>"+
		"<td colspan=\"4\" style=\"text-align:center;height:42px;\">"+
			"<input type=\"button\" value=\"添加宾客\" onclick=\"addLodger();\"/>"+
			"<input type=\"button\" value=\"添加备注\" />"+
		"</td>"+
	"</tr>";
}

/* http://localhost:8080/images/common/cancel.png */
function makeRow( cnt, lodger ){
	
	console.log("{1} lodger: "+ lodger);
	var html = "<tr>"+
		"<td class=\"blk_td\">"+
			"<input class=\"blank\" type=\"text\" id=\"lodgerName"+ cnt +
			"\" value=\""+ lodger.lodgerName +"\" onfocus=\"setBack(this);\" />"+
		"</td>"+
		"<td class=\"blk_td\">"+
			"<input class=\"blank\" type=\"text\" id=\"certificateNo"+ cnt +
			"\" value=\""+ lodger.certificateNo +"\" onfocus=\"setBack(this);\" />"+
		"</td>"+
		"<td class=\"blk_td\">"+
			"<input class=\"blank\" type=\"text\" id=\"sex"+ cnt +
			"\" value=\""+ lodger.sex +"\" onfocus=\"setBack(this);\" />"+
		"</td>"+
		"<td>"+
			"<img src=\"../images/common/cancel.png\"/>"+
			"<input type=\"hidden\" id=\"certificate"+ cnt +"\" value=\"1\" />"+
			"<input type=\"hidden\" id=\"phone"+ cnt +"\" />"+
		"</td>"+
	"</tr>";
	return html;
}

var lastTD = undefined;
function setBack( obj ){
	//console.log("setBack: "+ obj.name );
	var par = $( obj ).parent();
	if( lastTD ){
		lastTD.css("background","white");
	}
	par.css("background","blue");
	lastTD = par;
}


