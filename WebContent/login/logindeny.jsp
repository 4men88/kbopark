<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDto"%>
<%@ include file="/common/header.jsp"%>
<%
String id = request.getParameter("id");
int mstatus = Integer.parseInt(request.getParameter("mstatus"));
if(mstatus==2){
%>
<script>
alert("<%=id%>는 활동이 정지된 회원입니다");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}else{
%>
<script>
alert("탈퇴한 회원입니다");
document.location.href = "<%=root%>/index.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp"%>