<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDto"%>
<%@ include file="/common/header.jsp"%>
<center>
현재 로그인 하신 아이디는 <%=memberDto.getId()%> 이름은 <%=memberDto.getName() %> 
</center>
<%@ include file="/common/footer.jsp"%>