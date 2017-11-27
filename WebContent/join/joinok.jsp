<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDetailDto"%>
<%
MemberDetailDto memberdto = (MemberDetailDto)request.getAttribute("registInfo");
 %>
<%@ include file="/common/header.jsp" %>
<center>
<%=memberdto.getName() %>
회원가입성공<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</center>
<%@ include file="/common/footer.jsp" %>