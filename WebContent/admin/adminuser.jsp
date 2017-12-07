<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDetailDto,java.util.*"%>
<%@ include file="/admin/adcom/adheader.jsp" %>

<script type="text/javascript" src="<%=root %>/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload=function(){
	memberlist();
}
function memberlist() {
	var key = document.getElementById("key").value;
	var word = document.getElementById("word").value;
	var params="act=memberlist&key="+key+"&word="+word;
	sendRequest("<%=root%>/admin", params, viewlist, "GET");
}

function viewlist(){
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
			
			makelist(listxml);
		}	
	}
}

function makelist(listxml){
	
	var tbody = document.getElementById("mlist");
	removetbody(tbody);
	var len = listxml.getElementsByTagName("member").length;
	for(var i=0;i<len;i++){
		var row = makerow(listxml.getElementsByTagName("member")[i]);
		tbody.appendChild(row);
	}
}

function makerow(member){
	var userid = member.getElementsByTagName("userid")[0].firstChild.data;
	var name = member.getElementsByTagName("name")[0].firstChild.data;
	var rookie = member.getElementsByTagName("rookie")[0].firstChild.data;
	var penalty = member.getElementsByTagName("penalty")[0].firstChild.data;
	var tname = member.getElementsByTagName("tname")[0].firstChild.data;
	var status = member.getElementsByTagName("status")[0].firstChild.data;
	var joindate = member.getElementsByTagName("joindate")[0].firstChild.data;
	
	var cell1 = makecell(userid,"id");
	var cell2 = makecell(name,"name");
	var cell3 = makecell(rookie,"rookie");
	var cell4 = makecell(penalty,"pen");
	var cell5 = makecell(tname,"tname");
	var cell6 = makecell(status,"status");
	var cell7 = makecell(joindate,"join");
	//var cell8 = makebtn();
	//var cell8 = makebutton();
	//var penbtn = makebtn();
	
	var row = document.createElement("tr");//<tr></tr>
	
	row.appendChild(cell1);
	row.appendChild(cell2);
	row.appendChild(cell3);
	row.appendChild(cell4);
	row.appendChild(cell5);
	row.appendChild(cell6);
	row.appendChild(cell7);
	//row.appendChild(cell8);
	//row.appendChild(penbtn);
	return row;
	
}
var ids="";
function makecell(data,tag){
	var td = document.createElement("td");//<td></td> ����
	var txtnode=document.createTextNode(data);
	
	if(tag=="id"){
		ids=data;
	}
	
	td.setAttribute("align","center");
	td.appendChild(txtnode);//<td bgcolor="#cc0033">txtnode</td>
	if(tag=="status"){
		td.appendChild(txtnode);//<td bgcolor="#cc0033">txtnode</td>
		var select = document.createElement("select");
		select.setAttribute("name", "status");
		var option = document.createElement("option");
		option.text = "�����ϼ���";
		option.value = "";
		var option1 = document.createElement("option");
		option1.text = "ȸ��";
		option1.value = "1";
		var option2 = document.createElement("option");
		option2.text = "����";
		option2.value = "2";
		var option3 = document.createElement("option");
		option3.text = "Ż��";
		option3.value = "3";
		select.appendChild(option);
		select.appendChild(option1);
		select.appendChild(option2);
		select.appendChild(option3);
		select.setAttribute("onchange", "javascript:statusChange(this);");
		td.appendChild(select);
	}
	if(tag=="pen"){
		var down = document.createElement("input");
		down.setAttribute("type", "button");
		down.setAttribute("value", "-");
		down.setAttribute("onclick", "javascript:down(this);");
		var up = document.createElement("input");
		up.setAttribute("type", "button");
		up.setAttribute("value", "+");
		up.setAttribute("onclick", "javascript:uppen(this);");
		td.appendChild(down);
		td.appendChild(txtnode);//<td bgcolor="#cc0033">txtnode</td>
		td.appendChild(up);
	}
	return td;
}

function removetbody(tbody){
	var len = tbody.childNodes.length;
	for(var i=len-1;i>=0;i--){
		tbody.removeChild(tbody.childNodes[i]);
	}
}
function uppen(obj){
	var tr = $(obj).parent().parent();
	var td = tr.children();
	var userid = td.eq(0).text();
	var params = "act=updatePen&id="+userid+"&type=up";
	sendRequest("<%=root%>/admin", params, memberlist, "GET");

}

function down(obj){
	var tr = $(obj).parent().parent();
	var td = tr.children();
	var userid = td.eq(0).text();
	var params = "act=updatePen&id="+userid+"&type=down";
	sendRequest("<%=root%>/admin", params, memberlist, "GET");
	
}
function statusChange(obj){
	var tr = $(obj).parent().parent();
	var td = tr.children();
	var userid = td.eq(0).text();
	var stat = obj.value;
	alert("���̵�="+userid+"����="+stat);
	var params = "act=changestat&id="+userid+"&stat="+stat;
	sendRequest("<%=root%>/admin", params, memberlist, "GET");
}

</script>
<center>

<div style="height:50px; margin-top:20px; align-content:center"><h4>ȸ������</h4></div>
<table width="1000px">
<tr>
	<td>
	<select id="key">
		<option value="id">���̵�</option>
		<option value="name">�̸�</option>
	</select>
	<input type="text" name="word" id="word">
	<input type="button" value="�˻�" onclick="javascript:memberlist();">
	</td>
	<td>ȸ������&nbsp;
		<select id="status">
		<option value="1" selected="selected">ȸ��</option>
		<option value="2">����</option>
		<option value="3">Ż��</option>
		</select>
	</td>
	<td>
	<input type="button" id=""; name=""; onclick="javascript:" value="�˻�">
	</td>
</tr>
</table>
<div style="height:15px;  border-bottom: 1px solid black">&nbsp;</div>

<table width="1000px" border="1">
<tr>
<td align="center" >�̸�</td>
<td align="center">���̵�</td>
<td align="center">������Ű</td>
<td align="center">�г�Ƽ</td>
<td align="center">��ȣ����</td>
<td align="center">ȸ������</td>
<td align="center">��������</td>

</tr>
<tbody id="mlist"></tbody>
</table>
</center>
<%@ include file="/admin/adcom/adfooter.jsp" %>

