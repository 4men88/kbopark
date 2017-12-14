<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto,com.baseball.schedule.scheduleDto.ScheduleDto,java.util.List"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
List<ScheduleDto> playlist = (List<ScheduleDto>) request.getAttribute("playlist");

System.out.println("weekly.jsp gudandto >>> " + gudanDto);
System.out.println("weekly.jsp tno >>> "+NullCheck.nullToZero(request.getParameter("tno")));
%>
<script type="text/javascript">
function listArticle(tno) {
	document.getElementById("cact").value = "listarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = 1;
	
	document.getElementById("commonForm").action = root + "/board";
	document.getElementById("commonForm").submit();
}

</script>

<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root%>/img/etc/grass.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3"><%=gudanDto.getEnname() %></h1>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end"
						style="background-color: white;">
						<li class="breadcrumb-item"><i class="fa fa-home mr-2"
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">구단</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>"><%=gudanDto.getTname() %></a></li>
						<li class="breadcrumb-item active" aria-current="page">스케줄</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div id="gudan-nav">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">메인</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">구장안내</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">스케줄</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=gudanDto.getTno()%>');">커뮤니티</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>


<div id="weekly-list">
	<div class="container py-5">
		<div class="row pt-5">
			<div class="col-md-12">
				<h4>
					<strong>이번주 일정</strong>
				</h4>
				<div class="border-b-strong mb-5"></div>
			</div>
			<div class="col-md-6">
				<img class="d-block mb-3 w-100 img-fluid mx-auto"
					src="<%=root%>/img/community/gujang/gujang-sk.jpg">
			</div>
			<div class="col-md-6">
				<ul class="list-group">
				<%
					String[] week = {"월","화","수","목","금","토","일"};
					int len = playlist.size();
					System.out.println("weekly.jsp listsize >>>" + len);
					for (int i=0;i<len;i++) {
						ScheduleDto sdto = playlist.get(i);
				%>	
					<li class="list-group-item">
					
				<%		if ("토".equals(week[i])) { %>
						<span class="week" style="color: #2453a5;">토</span>	
				<%		} else if ("일".equals(week[i])) { %>
							<span class="week" style="color: #cc2220;">일</span>
				<%		} else { %>
							<span class="week"><%=week[i]%></span>
				<%		} %>	

					<%	if(sdto != null) { %>
							<%=sdto.getHometeam()%>&nbsp;VS&nbsp;<%=sdto.getAwayteam()%>&nbsp;<%=sdto.getSname()%>&nbsp;<%=sdto.getPlaytime() %>
					<%	} else { %>
							예정된 경기가 없습니다.
					<%	} %>
					</li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="weekly-ticket">
<div class="container py-5">
	<div class="row py-5">
		<div class="col-md-12">
			<h4>
				<strong>티켓예매</strong>
			</h4>
			<span>티켓예매는 각 구단 사이트에서 진행됩니다.</span>
			<div class="border-b my-3" style="border-bottom: 3px solid #004EA3;"></div>
		</div>
		<div class="col-md-3 p-4 infosubject">
			<span style="color: #004EA3;">TICKETING</span><br>
			<span style="color: #007bff;">INFO</span>
		</div>
		<div id="hideborder-wrapper" class="col-12 px-4">
			<div id="hideborder"></div>
		</div>
		<div class="col-md-9 p-4">
			<h5 class="mb-3">2017 티켓 예매</h5>
			<h5 class="mb-0"><%=gudanDto.getTname() %></h5>
			<h6 class="mb-3">입장권 구입에 대해 상세히 알려드립니다.</h6>
			<h5 class="mb-3">예매바로가기<i class="fa fa-chevron-right mx-2" aria-hidden="true"></i></h5>
			<p class="text-center mb-0"><a href="<%=gudanDto.getWeb2()%>" target="_blank"><img class="img-fluid mx-auto"
					src="<%=root%>/img/community/ticket.png" style="width:240px; height:auto;"></a></p>
		</div>
		<div class="col-md-12">
			<div class="border-b my-3" style="border-color: #007bff;"></div>
		</div>	
	</div>
</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>