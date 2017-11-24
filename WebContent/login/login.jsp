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
		alert("아이디를 입력하세요");
	}else if(document.getElementById("pass").value==""){
		alert("패스워드를 입력하세요");
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
아이디<input type="text" name="id" id="id" value="">
비밀번호<input type="password" name="pass" id="pass" value="">
<input type="button" name="" id="" value="로그인버튼" onclick="javascript:login();">
<a href="">회원가입</a>
<a href="">아이디찾기</a>
<a href="">비밀번호 찾기</a>
</form>
</body>
</html>