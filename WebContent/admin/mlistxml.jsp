<?xml version="1.0" encoding="EUC-KR"?>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List,com.baseball.member.model.MemberDetailDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List<MemberDetailDto> list = (List<MemberDetailDto>)request.getAttribute("mlist");
%>
<memberlist>
<%

for(MemberDetailDto memberDto : list){

%>
	<member>
	<userid><%=memberDto.getId()%></userid>
	<name><%=memberDto.getName()%></name>
	<rookie><%=memberDto.getRookie()%></rookie>
	<penalty><%=memberDto.getPenalty()%></penalty>
	<tname><%=memberDto.getFavoriteteam()%></tname>
	<status><%=memberDto.getMstatus()%></status>
	<joindate><%=memberDto.getJoindate()%></joindate>
	</member>
<%
}
%>
</memberlist>