<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp" %>
<%
int cnt = Integer.parseInt(request.getParameter("rs"));
if(cnt!=0){
%>
<script>
alert("�Խù��� �����Ǿ����ϴ�");
document.location.href="<%=root%>/admin?act=community";
</script>
<%
}else{
%>
alert("�Խù��� ������ �����Ͽ����ϴ�");
document.location.href="<%=root%>/admin?act=community";
<%
}
%>
<%@ include file="/common/footer.jsp" %>