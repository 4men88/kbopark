<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto,com.baseball.schedule.scheduleDto.ScheduleDto,java.util.List,com.baseball.gudan.model.StadiumDto"%>
<!--header ����-->
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

<!-- ���ܳ׺������ -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="weekly-list">
	<div class="container py-5">
		<div class="row pt-5">
			<div class="col-md-12">
				<h4>
					<strong>�̹��� ����</strong>
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
			<div class="text-center">��Ⱑ ������ ���� ������ �����ϴ�.</div>
<%
}
%>		
			</div>
			<div class="col-md-6">
				<ul class="list-group">
				<%
					String[] week = {"��","ȭ","��","��","��","��","��"};
					int len = playlist.size(); 
					System.out.println("weekly.jsp listsize >>>" + len);
					for (int i=0;i<len;i++) {
						ScheduleDto sdto = playlist.get(i);
				%>	
					<li class="list-group-item">
					
				<%		if ("��".equals(week[i])) { %>
						<span class="week" style="color: #2453a5;">��</span>	
				<%		} else if ("��".equals(week[i])) { %>
							<span class="week" style="color: #cc2220;">��</span>
				<%		} else { %>
							<span class="week"><%=week[i]%></span>
				<%		} %>	

					<%	if(sdto != null) { %>
							<%=sdto.getHometeam()%>&nbsp;VS&nbsp;<%=sdto.getAwayteam()%>&nbsp;<%=sdto.getSname()%>&nbsp;<%=sdto.getPlaytime() %>
					<%	} else { %>
							������ ��Ⱑ �����ϴ�.
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
				<strong>Ƽ�Ͽ���</strong>
			</h4>
			<span>Ƽ�Ͽ��Ŵ� �� ���� ����Ʈ���� ����˴ϴ�.</span>
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
			<h5 class="mb-3">2017 Ƽ�� ����</h5>
			<h5 class="mb-0"><%=gudanDto.getTname() %></h5>
			<h6 class="mb-3">����� ���Կ� ���� ���� �˷��帳�ϴ�.</h6>
			<h5 class="mb-3">���Źٷΰ���<i class="fa fa-chevron-right mx-2" aria-hidden="true"></i></h5>
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
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
 
// ��ư�� Ŭ���ϸ� �Ʒ� �迭�� ��ǥ���� ��� ���̰� ���� ������ �缳���մϴ� 
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

//������ �缳���� ���������� ������ ���� LatLngBounds ��ü�� �����մϴ�
var bounds = new daum.maps.LatLngBounds();    
var i, marker;
for (i = 0; i < points.length; i++) {
    // �迭�� ��ǥ���� �� ���̰� ��Ŀ�� ������ �߰��մϴ�
    marker = new daum.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
    bounds.extend(points[i]);
}

//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var mapTypeControl = new daum.maps.MapTypeControl();

// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

window.onload=function(){
	setBounds();
}

function setBounds() {
    // LatLngBounds ��ü�� �߰��� ��ǥ���� �������� ������ ������ �缳���մϴ�
    // �̶� ������ �߽���ǥ�� ������ ����� �� �ֽ��ϴ�
    map.setBounds(bounds);
}
</script>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>