<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDto"%>
<%@ include file="/common/header.jsp"%>
<%
String id = request.getParameter("id");
int mstatus = Integer.parseInt(request.getParameter("mstatus"));
if(mstatus==2){
%>
<script>
alert("<%=id%>�� Ȱ���� ������ ȸ���Դϴ�");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}else{
%>
<script>
alert("Ż���� ȸ���Դϴ�");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp"%>