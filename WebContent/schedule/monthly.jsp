<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="oracle.sql.DATE"%>
<%@page import="java.util.Date"%>
<%@page import="com.baseball.schedule.service.ScheduleServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.baseball.schedule.scheduledao.ScheduleDaoImpl"%>
<%@page import="com.baseball.schedule.scheduleDto.ScheduleDto"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
	Map<String, List<ScheduleDto>> map = (Map<String, List<ScheduleDto>>) request.getAttribute("monthlymap");
%>
<%
	Calendar cal = Calendar.getInstance();
	System.out.println(request.getParameter("y") + " " + request.getParameter("m"));
	int year = request.getParameter("y") == null || request.getParameter("y").isEmpty() ? cal.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("y"));
	int month = request.getParameter("m") == null || request.getParameter("m").isEmpty() ? cal.get(Calendar.MONTH)
			: (Integer.parseInt(request.getParameter("m")) - 1);
	int day = request.getParameter("d") == null ? cal.get(Calendar.DAY_OF_MONTH)
			: (Integer.parseInt(request.getParameter("d")));
	cal.set(year, month, 1);
	int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
	int preYear = year;
	int preMonth = (month + 1) - 1;
	int nextYear = year;
	int nextMonth = (month + 1) + 1;

	if (preMonth < 1) {
		preYear--;
		preMonth = 12;
	}

	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}

	String y = year + "";
	String m = (cal.get(Calendar.MONTH) + 1) + "";
	//String d = cal.get(Calendar.DATE)+"";
	String ymd = y + m;
%>

<form id="searchForm" name="searchForm" method="get" action="">
	<input type="hidden" id="act" name="act" value="viewSchedule">
	<div id="schedule">
		<div class="container py-5">

			<div class="row">
				<div class="col-md-12">
					<p style="text-align: center">
						<img src="<%=root%>/img/gudan/2017KBOemblem2.png"
							class="img-fluid" style="max-height: 70px;">
					</p>
				</div>
			</div>


			<div class="row justify-content-between">
				<div class="col-6 text-left">
					<i class="fa fa-angle-left" aria-hidden="true"></i> <a
						href="<%=root%>/ScheduleController?act=monthlyview">월별일정/결과 </a>
				</div>
				<div class="col-6 text-right">
					<a href="<%=root%>/ScheduleController?act=daliyview">일별일정/결과 </a> <i
						class="fa fa-angle-right" aria-hidden="true"></i>
				</div>
			</div>


			<div class="row py-5">
				<div class="col-md-12">
					<div class="calendar">
						<p class="text-center">
							<a
								href="<%=root%>/ScheduleController?act=monthlyview&y=<%=preYear%>&m=<%=preMonth%>">
								&lt;</a> <span class="Ym"><%=year%>. <%=month + 1%></span> <a
								href="<%=root%>/ScheduleController?act=monthlyview&y=<%=nextYear%>&m=<%=nextMonth%>">
								&gt;</a>
						</p>

						<ul>
							<li class="header">
								<div class="Sun">SUN</div>
								<div class="Mon">MON</div>
								<div class="Tue">TUE</div>
								<div class="Wed">WED</div>
								<div class="Thu">THU</div>
								<div class="Fri">FRI</div>
								<div class="Sat">SAT</div>
							</li>


							<li>
								<%
									for (int i = 1; i < bgnWeek; i++)
										out.println("<div>&nbsp;</div>");
									while (cal.get(Calendar.MONTH) == month) {
										String d = (cal.get(Calendar.DATE)) + "";
										if (d.length() == 1) {
											d = "0" + d;
										}
										String cday = ymd + d;
								%>
								<div>
									<%=d%> <%--01, 02 03 04  --%>
									<%
										List<ScheduleDto> daylist = map.get(d);
										if(daylist != null) {
											for(ScheduleDto sdto : daylist) {
									%>
									<div class="text-center">
												<%=sdto.getHometeam().substring(0,sdto.getHometeam().indexOf(' '))%>&nbsp;<%=sdto.getScore1()%>&nbsp;:&nbsp;<%=sdto.getScore2()%>&nbsp;<%=sdto.getAwayteam().substring(0,sdto.getAwayteam().indexOf(' '))%>&nbsp;(<%=sdto.getSname().substring(0,2)%>)<br>
									</div>
									<%
											}
										} else {
									%>
									<p class="text-center py-3">예정 경기가 없습니다.</p>
									<%
										}
									%>
								</div> <%
 	if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY)
 			out.println("</li><li>");//토요일이면 엔터다음줄
 		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE) + 1);//년월일 넣고
 	}
 	for (int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++)
 		out.println("<div>&nbsp;</div>");//일주일넣고
 %>
							
							<li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 구단응원바로가기 : 구단커뮤니티로 바로 연결될 예정, 구단커뮤니티미완성으로 일단 자리만 차지하고있을께요~! -->
		<div class="container-fluid p-0">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel" style="background-color: black;">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block"
							src="<%=root%>/img/gudan/logo/doosan-logo.png"
							style="max-height: 100px;" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="..." style="min-height: 100px;"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="..." style="min-height: 100px;"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
</form>

<!--footer 영역-->
<%@ include file="/common/footer.jsp"%>
