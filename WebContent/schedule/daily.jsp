<%@page import="java.util.List"%>
<%@page import="com.baseball.schedule.scheduledao.ScheduleDaoImpl"%>
<%@page import="com.baseball.schedule.scheduleDto.ScheduleDto"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
List<ScheduleDto> list = (List<ScheduleDto>)request.getAttribute("sch");
%>


<%
	Calendar cal = Calendar.getInstance();
	//int year = cal.get(Calendar.YEAR);
	//int month = cal.get(Calendar.MONTH)+1;
	//int day = cal.get(Calendar.DAY_OF_WEEK);

	int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("y"));
	int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH)
			: (Integer.parseInt(request.getParameter("m")) - 1);
	int day = request.getParameter("d") == null ? cal.get(Calendar.DAY_OF_MONTH)
			: (Integer.parseInt(request.getParameter("d")));
	cal.set(year, month, 1);
	int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
	int preYear = year;
	int preMonth = (month + 1);
	int nextYear = year;
	int nextMonth = (month + 1);
	int preDay = day - 1;
	int nextDay = day + 1;
	int lastDay = cal.getActualMaximum(Calendar.DATE);
	System.out.println(lastDay);
	int startDay = cal.getActualMinimum(Calendar.DATE);
	System.out.println(startDay);
	
	if (preDay < 1) {
		preMonth--;
		preDay = lastDay;
	}

	if (nextDay > lastDay) {
		nextMonth++;
		nextDay = 1;
	}
	
	if (preMonth < 1) {
		preYear--;
		preMonth = 12;
	}

	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}
	if (preMonth == 2){
		
	}
	
%>

<div id="schedule" class="pb-5">
	<div class="container py-5">

		<div class="row">
			<div class="col-md-12">
				<p style="text-align: center">
					<img src="<%=root%>/img/gudan/2017KBOemblem2.png" class="img-fluid"
						style="max-height: 70px;">
				</p>
			</div>
		</div>


		<div class="row justify-content-between">
			<div class="col-6 text-left">
				<i class="fa fa-angle-left" aria-hidden="true"></i> 
				<a href="<%=root %>/schedule/monthly.jsp"> 월별일정/결과 </a>
			</div>
			<div class="col-6 text-right">
				<a href="<%=root %>/schedule/daily.jsp">일별일정/결과 </a>
				<i class="fa fa-angle-right" aria-hidden="true"></i>
			</div>
		</div>


<div id="daily" class="carousel slide" data-ride="carousel">
			<div class="calendar">
				<p class="text-center">
					<a href="<%=root %>/schedule/daily.jsp?y=<%=preYear%>&m=<%=preMonth%>&d=<%=preDay%>">&lt;</a> 
					<span class="Ym"><%=year%>. <%=month +1%>. <%=day %></span>
					<a href= "<%=root %>/schedule/daily.jsp?y=<%=nextYear%>&m=<%=nextMonth%>&d=<%=nextDay%>">&gt;</a>
				</p>
			</div>
			
			
		
	
<% 
int i = 0;
for(i= 0; i<5; i++){
		 %>
				<div class="row text-white text-center mb-3">
				<div class="mx-auto rounded daily-size-wrapper"
					style="background-image: url(<%=root%>/img/etc/grass.jpg);">
					<div class="col-md-12 text-white p-2"
						style="background-color: rgba(50, 50, 50, 0.75);">
						<span class="px-3 border-r"><%= %></span>
						<span class="px-3"></span>
					</div>
					<div class="col-md-12 opaque-overlay py-2 px-3">
						<div class="row">
							<div class="col-md-5 p-0 col-12" style="text-align: left;">
								<img src="<%=root%><%=scheduleDto.getAwayemblem()%>"
									class="img-thumbnail">
									
									<label><%=scheduleDto.getHometeam()%></label>
							</div>
							<div class="col-md-2 p-0 col-12 align-self-center">
								<h2 class="m-0">
									<strong><%=scheduleDto.getScore1()%> VS <%=scheduleDto.getScore2() %></strong>
								</h2>
							</div>
							<div class="col-md-5 p-0 col-12" style="text-align: right;">
								
								<label><%=scheduleDto.getHometeam()%></label>
								<img src="<%=root%><%=scheduleDto.getHomeemblem() %>"
									class="img-thumbnail">
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
}
			%>
			
			<!--  
			<div class="row text-white text-center mb-3">
				<div class="mx-auto rounded daily-size-wrapper"
					style="background-image: url(<%=root%>/img/etc/grass.jpg);">
					<div class="col-md-12 text-white p-2"
						style="background-color: rgba(50, 50, 50, 0.75);">
						<span class="px-3 border-r">인천</span><span class="px-3">17:00</span>
					</div>
					<div class="col-md-12 opaque-overlay py-2 px-3">
						<div class="row">
							<div class="col-md-5 p-0 col-12" style="text-align: left;">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-thumbnail"><label>SK 와이번즈</label>
							</div>
							<div class="col-md-2 p-0 col-12 align-self-center">
								<h2 class="m-0">
									<strong>0 VS 0</strong>
								</h2>
							</div>
							<div class="col-md-5 p-0 col-12" style="text-align: right;">
								<label>KT 위즈</label><img
									src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
									class="img-thumbnail">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-white text-center mb-3">
				<div class="mx-auto rounded daily-size-wrapper"
					style="background-image: url(<%=root%>/img/etc/grass.jpg);">
					<div class="col-md-12 text-white p-2"
						style="background-color: rgba(50, 50, 50, 0.75);">
						<span class="px-3 border-r">인천</span><span class="px-3">17:00</span>
					</div>
					<div class="col-md-12 opaque-overlay py-2 px-3">
						<div class="row">
							<div class="col-md-5 p-0 col-12" style="text-align: left;">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-thumbnail"><label>SK 와이번즈</label>
							</div>
							<div class="col-md-2 p-0 col-12 align-self-center">
								<h2 class="m-0">
									<strong>0 VS 0</strong>
								</h2>
							</div>
							<div class="col-md-5 p-0 col-12" style="text-align: right;">
								<label>KT 위즈</label><img
									src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
									class="img-thumbnail">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-white text-center mb-3">
				<div class="mx-auto rounded daily-size-wrapper"
					style="background-image: url(<%=root%>/img/etc/grass.jpg);">
					<div class="col-md-12 text-white p-2"
						style="background-color: rgba(50, 50, 50, 0.75);">
						<span class="px-3 border-r">인천</span><span class="px-3">17:00</span>
					</div>
					<div class="col-md-12 opaque-overlay py-2 px-3">
						<div class="row">
							<div class="col-md-5 p-0 col-12" style="text-align: left;">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-thumbnail"><label>SK 와이번즈</label>
							</div>
							<div class="col-md-2 p-0 col-12 align-self-center">
								<h2 class="m-0">
									<strong>0 VS 0</strong>
								</h2>
							</div>
							<div class="col-md-5 p-0 col-12" style="text-align: right;">
								<label>KT 위즈</label><img
									src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
									class="img-thumbnail">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-white text-center mb-3">
				<div class="mx-auto rounded daily-size-wrapper"
					style="background-image: url(<%=root%>/img/etc/grass.jpg);">
					<div class="col-md-12 text-white p-2"
						style="background-color: rgba(50, 50, 50, 0.75);">
						<span class="px-3 border-r">인천</span><span class="px-3">17:00</span>
					</div>
					<div class="col-md-12 opaque-overlay py-2 px-3">
						<div class="row">
							<div class="col-md-5 p-0 col-12" style="text-align: left;">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-thumbnail"><label>SK 와이번즈</label>
							</div>
							<div class="col-md-2 p-0 col-12 align-self-center">
								<h2 class="m-0">
									<strong>0 VS 0</strong>
								</h2>
							</div>
							<div class="col-md-5 p-0 col-12" style="text-align: right;">
								<label>KT 위즈</label><img
									src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
									class="img-thumbnail">
							</div>
							-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- daily -->
	</div>
</div>

<!-- 구단응원바로가기 : 구단커뮤니티로 바로 연결될 예정, 구단커뮤니티미완성으로 일단 자리만 차지하고있을께요~! -->
<div class="container-fluid p-0">
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel" style="background-color: black;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block" src="<%=root%>/img/gudan/logo/doosan-logo.png"
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

<!--footer 영역-->
<%@ include file="/common/footer.jsp"%>
