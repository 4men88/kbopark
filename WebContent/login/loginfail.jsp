<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp"%>
<%
String id = request.getParameter("id");
%>
<script>
alert("��ϵ��� ���� ȸ���Դϴ�\nȸ�������� �̿����ּ���");
document.location.href = "<%=root%>/index.jsp";
</script>
<%@ include file="/common/footer.jsp"%>