<?xml version="1.0" encoding="EUC-KR"?>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.board.model.ReplyDto,java.util.List"%>
<%
List<ReplyDto> list = (List<ReplyDto>) request.getAttribute("replylist");
%>
<replylist>
<%
for(ReplyDto replyDto : list) {
%>
	<reply>
		<reno><%=replyDto.getReno()%></reno>
		<bno><%=replyDto.getBno()%></bno>
		<id><%=replyDto.getMid()%></id>
		<name><%=replyDto.getReplyname()%></name>
		<recontent><%=replyDto.getRecontent().replace("<", "&lt;").replace(">", "&gt;")%></recontent>
		<retime><%=replyDto.getRetime()%></retime>
	</reply>
<%
}
%>
</replylist>