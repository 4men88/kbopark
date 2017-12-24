<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto,com.baseball.schedule.scheduleDto.ScheduleDto,java.util.List,com.baseball.gudan.model.StadiumDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
List<ScheduleDto> playlist = (List<ScheduleDto>) request.getAttribute("playlist");
List<StadiumDto> playstadium = (List<StadiumDto>) request.getAttribute("playstadium");
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

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

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

<%
int stadiumlist = playstadium.size();
System.out.println("weekly.jsp len >>>>>>>>>>>>>>>>>>>>>>> " + stadiumlist);
if(stadiumlist != 0) {
%>
			<div id="map" style="width:100%;height:350px;"></div>
<%
} else {
%>
			<div class="text-center">경기가 예정된 구장 정보가 없습니다.</div>
<%
}
%>		
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0101ddc1403bcc7a5e3b093d7b37b95"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points = [
<%
int cnt = playstadium.size();
for(int i=0;i<cnt;i++) {
	StadiumDto s = playstadium.get(i);
%>		
    new daum.maps.LatLng(<%=s.getLat()%>, <%=s.getLng()%>)
<%   
	if(i != len-1) {
%>
		, 
<%
	}
}
%> 
];

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds();    
var i, marker;
for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker = new daum.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(points[i]);
}

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

window.onload=function(){
	setBounds();
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
</script>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>