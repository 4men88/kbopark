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
function findid(){
	String fname=document.getElementById("fname").value;
	String email1=document.getElementById("fname").value;
	String email2=document.getElementById("fname").value;
	
	document.location.href ="<%=root%>/member?act="+fname+"";
}
</script>
</head>
<body>
<center>
<h3>비밀번호 찾기</h3>
<div>
<label style="width:150px">이름</label>
<input id="fname" name="fname" type="text" class="" />
</div>
<div>
<label style="width:150px">아이디</label>
<input id="fid" name="fid" type="text" class="" />
</div>
<div>
<label style="width:150px">E-mail</label>
<input id="email1" name="email2" type="text" class="" />@<input id="email2" name="email2" type="text" class="" />
<input type="button" value="비밀번호찾기" onclick="javascript:findid();">
</div>
</center>
</body>
</html>