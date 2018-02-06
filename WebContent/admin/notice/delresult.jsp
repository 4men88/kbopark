<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp" %>
<%
int cnt = Integer.parseInt(request.getParameter("cnt"));
if(cnt!=0){
%>
<script>
alert("공지가 삭제되었습니다");
document.location.href="<%=root%>/admin?act=notice";
</script>
<%
}else{
%>
alert("공지 삭제를 실패하였습니다");
document.location.href="<%=root%>/admin?act=notice";
<%
}
%>
<%@ include file="/common/footer.jsp" %>