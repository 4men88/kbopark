<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDto"%>
    
<%
MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
���� �α��� �Ͻ� ���̵�� <%=memberDto.getId()%> �̸��� <%=memberDto.getName() %> 
</center>
</body>
</html>