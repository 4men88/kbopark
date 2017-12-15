<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp"%>
<%
int cnt = Integer.parseInt(request.getParameter("cnt"));
if(cnt!=0){
%>
<script>
alert("    회원가입이 완료되었습니다\n     다시 로그인하여 주세요");
document.location.href = "<%=root%>/login/login.jsp";
</script>
<%
}else{
%>
<script>
alert("    서버의 문제로 회원가입에 실패하였습니다\n    다시 시도해 주세요");
document.location.href = "<%=root%>/join/join.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp"%>