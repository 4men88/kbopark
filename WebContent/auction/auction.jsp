<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역 -->
<%@ include file="/common/header.jsp"%>


유니폼, 경기용품, 응원용품, 기타잡화 유니폼 -> 상의, 하의, 모자,기타 응원용품 -> 피켓, LED피켓, 기타 경기용품 ->
야구공, 배트, 벨트, 헬멧, 글러브, 배팅장갑, 수비장갑, 팔보호대, 안면보호대, 무릎보호대, 발목보호대 야구화, 기타 잡화용품
-> 사진, 티켓, 카드, 기타
작업중 ㅠㅠ



<div class="container py-5 my-5">
	<div class="navbar-template text-center"></div>
</div>




<!-- 추천별 경매물품 섹션: best pick: 관리자가 초이스한 상품들 -->
<div id="auc-recommended" class="py-5">
<div class="container py-5">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs nav-justified" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#menu1">BEST PICK</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu2">마감임박</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu3">인기물품</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu4">신규물품</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="menu1" class="container tab-pane active">
			<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 22명<br>남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 70,000원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 31명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 100,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu2" class="container tab-pane fade">
						<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 21명<br>남은시간 : 3일 2시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 50,000원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 21명<br>남은시간 : 2일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 4,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 97명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 120,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="menu3" class="container tab-pane fade">
						<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 22명<br>남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 70,000원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 21명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 9,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 212명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 8,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 91명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 150,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu4" class="container tab-pane fade">
			<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 12명<br>남은시간 : 4일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 70,300원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 32명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 9,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 111,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-6 p-0">
				<div id="image-overlay"></div>
				<div>
					<img src="../img/auction/auction-hanwha.jpg" class="img-fluid">
				</div>
			</div>
			<div class="p-0 col-md-3 col-6" style="">
				<img src="../img/auction/auction-doosan.jpg" class="img-fluid">
				<div class="carousel-caption">두산 베어스</div>
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-kia.jpg" class="img-fluid"
					style="overflow: hidden">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-lotte.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="p-0 col-md-3 col-6 p-0">
				<img src="../img/auction/auction-samsung.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-kt.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-nexen.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-nc.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-sk.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="../img/auction/auction-lg.jpg" class="img-fluid">
			</div>
		</div>
	</div>
</div>

<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div class="py-5" style="background-color: #3452FF;">
	<div class="container text-center">
		<div class="row">
			<div class="col-md-12 col-12">
				<a class="text-white" href="#">한화 이글스</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">두산 베어스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KIA
					타이거즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">롯데 자이언츠</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">삼성 라이온즈</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KT
					위즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">넥센 히어로즈</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">NC 다이노스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">SK
					와이번스</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">LG 트윈스</a>
			</div>
		</div>
	</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>














<!-- <nav class="navbar navbar-expand-md bg-primary navbar-dark">
	<div class="container">
		<a class="navbar-brand" href="#"><i
			class="fa d-inline fa-lg fa-cloud"></i><b> Brand</b></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbar2SupportedContent"
			aria-controls="navbar2SupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse text-center justify-content-end"
			id="navbar2SupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa d-inline fa-lg fa-bookmark-o"></i> Bookmarks</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa d-inline fa-lg fa-envelope-o"></i> Contacts</a></li>
			</ul>
			<a class="btn navbar-btn ml-2 text-white btn-secondary"><i
				class="fa d-inline fa-lg fa-user-circle-o"></i> Sign in</a>
		</div>
	</div>
</nav>

유니폼 -> 상의, 하의, 모자, 기타 응원용품 -> 피켓, LED피켓, 기타 경기용품 -> 야구공, 배트, 벨트, 헬멧,
글러브, 배팅장갑, 수비장갑, 팔보호대, 안면보호대, 무릎보호대, 발목보호대 야구화, 기타 잡화용품 -> 사진, 티켓, 카드,
기타

<div class="navbar navbar navbar-expand-md navbar-default"
	role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">NavBar</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="https://github.com/fontenele/bootstrap-navbar-dropdowns"
					target="_blank">GitHub Project</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu
						1 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu multi-level">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
						<li class="dropdown-submenu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li class="dropdown-submenu"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
									<ul class="dropdown-menu">
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
											<ul class="dropdown-menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
												<li class="divider"></li>
												<li><a href="#">One more separated link</a></li>
											</ul></li>
									</ul></li>
							</ul></li>
					</ul></li>

				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu
						2 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
						<li class="dropdown-submenu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li class="divider"></li>
								<li class="dropdown-submenu"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
									<ul class="dropdown-menu">
										<li class="dropdown-submenu"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
											<ul class="dropdown-menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
												<li class="divider"></li>
												<li><a href="#">One more separated link</a></li>
											</ul></li>
									</ul></li>
							</ul></li>
					</ul></li>
			</ul>
		</div>
		/.nav-collapse
	</div>
</div>



<div class="text-center bg-primary text-white py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="display-4"></h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"><a class="nav-link active" href="#">ㅇㅇㅇㅇ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

 -->




