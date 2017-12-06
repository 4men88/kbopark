<%@page import="com.baseball.schedule.scheduleDto.ScheduleDto"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<%
	Calendar cal = Calendar.getInstance();
	//int year = cal.get(Calendar.YEAR);
	//int month = cal.get(Calendar.MONTH)+1;
	//int day = cal.get(Calendar.DAY_OF_WEEK);

	int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("y"));
	int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH)
			: (Integer.parseInt(request.getParameter("m")) - 1);
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
%>
<div id="schedule">
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
				<a href="./monthly.jsp">월별일정/결과 </a>
			</div>
			<div class="col-6 text-right">
				<a href="./daily.jsp">일별일정/결과 </a>
 					<i class="fa fa-angle-right" aria-hidden="true"></i>
			</div>
		</div>


		<div class="row py-5">
			<div class="col-md-12">
				<div class="calendar">
					<p class="text-center">
						<a href="<%=root %>/schedule/monthly.jsp?y=<%=preYear%>&m=<%=preMonth%>">&lt;</a>
						<span class="Ym"><%=year%>. <%=month + 1%></span> 
						<a href="<%=root %>/schedule/monthly.jsp?y=<%=nextYear%>&m=<%=nextMonth%>">&gt;</a>

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
						 //ScheduleDto scheduleDto = new ScheduleDto();
						 
						 //if ScheduleDto의 playdate 랑 cal.get(Calendar.DATE)랑 같으면 디비에 갔다와서 데이터 뿌려라....
						 
						 //if(scheduleDto.getPlaydate() == cal.get(Calendar.DATE))
						 	//out.println(scheduleDto.getScore1("score1"), scheduleDto.getScore2("score2"));
						 
						 
						for(int i =1; i<bgnWeek; i++) out.println("<div>&nbsp;</div>");
						 while(cal.get(Calendar.MONTH)==month){
							 out.println("<div>" + cal.get(Calendar.DATE) + "</div>");
							 if(cal.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY) out.println("</li><li>");//토요일이면 엔터다음줄
							 cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);//년월일 넣고
						 }
						 for(int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++)out.println("<div>&nbsp;</div>");//일주일넣고
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

</div>

<!--footer 영역-->
<%@ include file="/common/footer.jsp"%>
