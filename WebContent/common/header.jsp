<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/common/setting.jsp"%>

<header class="sticky-top" style="background-color: white;">
<%
if(memberDto!=null){
%>
	<div id="top-header" class="py-2 text-right border-b">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span style="margin-right: 20px;"><%=memberDto.getName()%>님 반갑습니다</span>
					<a href="<%=root %>/kbopark?act=logout" style="margin-right: 20px">로그아웃</a>
					<a href="<%=root %>/kbopark?act=mypage">마이페이지</a>
				</div>
			</div>
		</div>
	</div>
<%
}else{
%>
	<div id="top-header" class="py-2 text-right border-b">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span style="margin-right: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<a href="<%=root %>/kbopark?act=mvlogin" style="margin-right: 20px">로그인</a>
					<a href="<%=root %>/kbopark?act=mvjoin">회원가입</a>
				</div>
			</div>
		</div>
	</div>
<%
}
%>
	<nav id="main-header" class="navbar navbar-expand-md border-b">
		<div class="container py-2">
			<a class="navbar-brand" href="<%=root%>/index.jsp"> <img class="d-block"
				src="<%=root%>/img/logo.png" style="height: 30px;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item mx-1"><a class="nav-link" id = "schedule" href="<%=root%>/ScheduleController?act=viewschedule">일정/결과</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="<%=root%>/auctioncontroller?act=mainlist">루키경매</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">NEWS</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">구단커뮤니티</a></li>
				</ul>
				<form class="form-inline m-0">
					<input class="form-control mr-2" type="text" style="">
					<button id="search" class="btn btn-lg" type="submit">
						<a href="#"><i class="fa fa-search" aria-hidden="true"
							style="color: #007bff;"></i></a>
					</button>
				</form>
				<body>
				<form id="auctionForm" name="auctionForm" method="get" action="">
					<input type="hidden" id="aact" name="act" value="">
					<input type="hidden" id="aano" name="ano" value="">
					<input type="hidden" id="acategory" name="category" value="">
					<input type="hidden" id="apg" name="pg" value="">
					<input type="hidden" id="akey" name="key" value="">
					<input type="hidden" id="aword" name="word" value="">
					<input type="hidden" id="aseq" name="seq" value="">
				</form>
			</div>
		</div>
	</nav>
</header>