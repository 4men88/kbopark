<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp"%>
<%
int cnt = Integer.parseInt(request.getParameter("cnt"));
if(cnt!=0){
%>
<script>
alert("    ȸ�������� �Ϸ�Ǿ����ϴ�\n     �ٽ� �α����Ͽ� �ּ���");
document.location.href = "<%=root%>/login/login.jsp";
</script>
<%
}else{
%>
<script>
alert("    ������ ������ ȸ�����Կ� �����Ͽ����ϴ�\n    �ٽ� �õ��� �ּ���");
document.location.href = "<%=root%>/join/join.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp"%>