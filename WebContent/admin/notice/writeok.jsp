<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp" %>
<%
int cnt = Integer.parseInt(request.getParameter("rs"));
if(cnt!=0){
%>
<script>
alert("�Խù��� ��ϵǾ����ϴ�");
document.location.href="<%=root%>/admin?act=notice";
</script>
<%
}else{
%>
alert("�Խù��� ��Ͽ� �����Ͽ����ϴ�");
document.location.href="<%=root%>/admin?act=notice";
<%
}
%>
<%@ include file="/common/footer.jsp" %>