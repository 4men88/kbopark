<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root%>/img/etc/grass.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3">KIA TIGERS</h1>
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
							aria-hidden="true"></i><a href="#">구단</a></li>
						<li class="breadcrumb-item"><a href="#">기아타이거즈</a></li>
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
			<div class="gudan-nav-inner p-3">메인</div>
			<div class="gudan-nav-inner p-3">구장안내</div>
			<div class="gudan-nav-inner p-3">스케줄</div>
			<div class="gudan-nav-inner p-3">커뮤니티</div>
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
					<li class="list-group-item"><span class="week">월</span> 예정된
						경기가 없습니다.</li>
					<li class="list-group-item"><span class="week">화</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
					<li class="list-group-item"><span class="week">수</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
					<li class="list-group-item"><span class="week">목</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
					<li class="list-group-item"><span class="week">금</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
					<li class="list-group-item"><span class="week" style="color: #2453a5;">토</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
					<li class="list-group-item"><span class="week" style="color: #cc2220;">일</span> 두산
						VS 한화 기아챔피언스필드 6:30</li>
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
			<h5 class="mb-0">두산 베어스</h5>
			<h6 class="mb-3">입장권 구입에 대해 상세히 알려드립니다.</h6>
			<h5 class="mb-3">예매바로가기<i class="fa fa-chevron-right mx-2" aria-hidden="true"></i></h5>
			<p class="text-center mb-0"><img class="img-fluid mx-auto"
					src="<%=root%>/img/community/ticket.png" style="width:240px; height:auto;"></p>
		</div>
		<div class="col-md-12">
			<div class="border-b my-3" style="border-color: #007bff;"></div>
		</div>	
	</div>
</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>