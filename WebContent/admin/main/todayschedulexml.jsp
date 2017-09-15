<?xml version="1.0" encoding="EUC-KR"?>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List,com.baseball.schedule.scheduleDto.ScheduleDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List<ScheduleDto> list = (List<ScheduleDto>)request.getAttribute("todaylist");
%>
<schedulelist>
<%
for(ScheduleDto scheduleDto : list){
%>
	<schedule>
	<home><%=scheduleDto.getHometeam()%></home>
	<away><%=scheduleDto.getAwayteam()%></away>
	<hemblem><%=scheduleDto.getHomeemblem()%></hemblem>
	<aemblem><%=scheduleDto.getAwayemblem()%></aemblem>
	<playdate><%=scheduleDto.getPlaydate()%></playdate>
	<playtime><%=scheduleDto.getPlaytime()%></playtime>
	</schedule>
<%
}
%>
</schedulelist>