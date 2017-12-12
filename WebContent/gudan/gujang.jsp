<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.*"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
StadiumDto stadiumDto = (StadiumDto) request.getAttribute("stadiumdto");
System.out.println("gujang.jsp gudandto >>> " + gudanDto);
System.out.println("gujang.jsp tno >>> "+NullCheck.nullToZero(request.getParameter("tno")));
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
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><%=gudanDto.getEmblem()%>
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
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">����</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>"><%=gudanDto.getTname() %></a></li>
						<li class="breadcrumb-item active" aria-current="page">����ȳ�</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div id="gudan-nav">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">����</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">����ȳ�</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">������</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=gudanDto.getTno()%>');">Ŀ�´�Ƽ</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>

<div id="stadium-map">
<div class="container py-5">
	<div class="row">
		<div class="col-md-12 py-5">
			<h4 class="mb-4">
				<strong><%=stadiumDto.getSname() %></strong>
			</h4>
            <img class="d-block mb-3 w-100 img-fluid mx-auto" src="<%=root%><%=stadiumDto.getImage()%>">
		</div>
		
		<!-- �ð��̵Ǹ� ĳ���� ����� �̹��� �ڵ� ����! -->
		
		<div class="col-md-12 py-5">
			<h4 class="mb-4">
				<strong>ã�ƿ��ô±�</strong>
			</h4>
			
           <div id="map" style="width:100%;height:700px;"></div>

		</div>
	</div>
</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0101ddc1403bcc7a5e3b093d7b37b95"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ �߽���ǥ
    mapOption = { 
        center: new daum.maps.LatLng(33.451475, 126.570528), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// ������ ��Ŀ�� ǥ���մϴ� 
var marker = new daum.maps.Marker({
    map: map, 
    position: new daum.maps.LatLng(33.450701, 126.570667)
});

// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 
var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            <%=stadiumDto.getSname()%>' + 
            '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<%=root%><%=gudanDto.getEmblem()%>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis"><%=stadiumDto.getSloc()%></div>' + 
            '                <div><a href="<%=gudanDto.getWeb1()%>" target="_blank" class="link">����Ȩ������</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
var overlay = new daum.maps.CustomOverlay({
    content: content,
    map: map,
    position: marker.getPosition()       
});

// ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
daum.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

// Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
function closeOverlay() {
    overlay.setMap(null);     
}

//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var mapTypeControl = new daum.maps.MapTypeControl();

//������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
//daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
</script>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>