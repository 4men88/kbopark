<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
String root = request.getContextPath();
String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function findid(){
	if(document.getElementById("fname").value==''){
		alert("�̸��� �Է����ּ���");
	}else if(document.getElementById("email1").value==''||document.getElementById("email2").value==''){
		alert("�̸����� �Է����ּ���")
	}else{
		fname=document.getElementById("fname").value;
		email1=document.getElementById("email1").value;
		email2=document.getElementById("email2").value;
	
		document.location.href ="<%=root%>/kbopark?act=findid&fname="+fname+"&email1="+email1+"&email2="+email2;
	}
}
</script>
</head>
<body>
<center>
<h3>���̵� ã��</h3>
<div>
<input type="hidden" name="act" id="act">
<label style="width:150px">�̸�</label>
<input id="fname" name="fname" type="text" class="" />
</div>
<div>
<label style="width:150px">E-mail</label>
<input id="email1" name="email1" type="text" class="" />@<input id="email2" name="email2" type="text" class="" />
<input type="button" value="���̵�ã��" onclick="javascript:findid();">
</div>
<%
if(id==null){
%>
ã���ô� ���̵� �Է����ּ���
<%	
}else{
	String fid = request.getParameter("fid");
	if(fid!=null){
%>
		ã���ô� ���̵��(<%=fid%>)�Դϴ�.
<%
	}else{
%>
		ã���ô� ���̵� ������ �����ϴ�
<%
	}
}
	
%>
</center>
</body>
</html>