<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.*"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
StadiumDto stadiumDto = (StadiumDto) request.getAttribute("stadiumdto");
System.out.println("gujang.jsp gudandto >>> " + gudanDto);
System.out.println("gujang.jsp tno >>> "+NullCheck.nullToZero(request.getParameter("tno")));
System.out.println(stadiumDto.getLat() + " " +stadiumDto.getLng() + " " + stadiumDto.getLocid());
%>

<!-- ���ܳ׺������ -->
<%@ include file="/gudan/gudan_nav.jsp"%>

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
        center: new daum.maps.LatLng(<%=stadiumDto.getLat()%>, <%=stadiumDto.getLng()%>), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// ������ ��Ŀ�� ǥ���մϴ� 
var marker = new daum.maps.Marker({
    map: map, 
    position: new daum.maps.LatLng(<%=stadiumDto.getLat()%>, <%=stadiumDto.getLng()%>)
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
            '                <div><a href="http://place.map.daum.net/'+ <%=stadiumDto.getLocid()%> + '" target="_blank" class="link">���� �󼼺���</a></div>' + 
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