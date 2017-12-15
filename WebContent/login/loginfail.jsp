<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp"%>
<%
String id = request.getParameter("id");
%>
<script>
alert("등록되지 않은 회원입니다\n회원가입후 이용해주세요");
document.location.href = "<%=root%>/index.jsp";
</script>
<%@ include file="/common/footer.jsp"%>