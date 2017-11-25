<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/common/setting.jsp"%>

<header class="sticky-top" style="background-color: white;">
	<div id="top-header" class="py-2 text-right border-b">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span style="margin-right: 20px;">키트리님 반갑습니다</span> <a href="#"
						style="margin-right: 20px">로그인</a> <a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<nav id="main-header" class="navbar navbar-expand-md border-b">
		<div class="container py-2">
			<a class="navbar-brand" href="#"> <img class="d-block"
				src="<%=root%>/img/logo.png" style="height: 30px;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item mx-1"><a class="nav-link" href="#">일정/결과</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">루키경매</a></li>
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
			</div>
		</div>
	</nav>
</header>