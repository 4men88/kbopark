<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,java.text.*"%>
<%
DateFormat df = new SimpleDateFormat("hh:mm:ss");
String time = df.format(new Date());
System.out.println(time);
%>
<font size="15" color="cyan"><%=time%></font>