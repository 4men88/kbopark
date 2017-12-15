<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp" %>
<%
int cnt = Integer.parseInt(request.getParameter("rs"));
if(cnt!=0){
%>
<script>
alert("게시물이 삭제되었습니다");
document.location.href="<%=root%>/admin?act=community";
</script>
<%
}else{
%>
alert("게시물이 삭제를 실패하였습니다");
document.location.href="<%=root%>/admin?act=community";
<%
}
%>
<%@ include file="/common/footer.jsp" %>