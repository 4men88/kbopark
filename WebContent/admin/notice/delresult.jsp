<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp" %>
<%
int cnt = Integer.parseInt(request.getParameter("cnt"));
if(cnt!=0){
%>
<script>
alert("������ �����Ǿ����ϴ�");
document.location.href="<%=root%>/admin?act=notice";
</script>
<%
}else{
%>
alert("���� ������ �����Ͽ����ϴ�");
document.location.href="<%=root%>/admin?act=notice";
<%
}
%>
<%@ include file="/common/footer.jsp" %>