<?xml version="1.0" encoding="EUC-KR"?>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.baseball.board.model.BoardDto,java.util.List"%>
<%
List<BoardDto> list = (List<BoardDto>) request.getAttribute("bestlist");
System.out.println("bestlist.jsp진입 listsize >>> " + list.size());
%>
<bestlist>
<%
for(BoardDto boardDto : list) {
%>
	<board>
		<bno><%=boardDto.getBno()%></bno>
		<bname><%=boardDto.getBname()%></bname>
		<replycnt><%=boardDto.getTotalreply()%></replycnt>
	</board>
<%
}
%>
</bestlist>
