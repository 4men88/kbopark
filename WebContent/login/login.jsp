<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String root = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
function login(){
	if(document.getElementById("id").value==""){
		alert("���̵� �Է��ϼ���");
	}else if(document.getElementById("pass").value==""){
		alert("�н����带 �Է��ϼ���");
	}else{
		document.loginform.action="<%=root%>/kbopark";
		document.loginform.submit();
	}
}

</script>
</head>
<body>
<form name="loginform" mathod="post" action="">
<input type="hidden" name="act" id="act" value="login">
���̵�<input type="text" name="id" id="id" value="">
��й�ȣ<input type="password" name="pass" id="pass" value="">
<input type="button" name="" id="" value="�α��ι�ư" onclick="javascript:login();">
<a href="">ȸ������</a>
<a href="">���̵�ã��</a>
<a href="">��й�ȣ ã��</a>
</form>
</body>
</html>