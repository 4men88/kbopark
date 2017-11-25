<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<!-- 메인이미지(작업중) -->
<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root %>/img/main-background.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3 mb-4">Hero image intro</h1>
				<p class="lead mb-5">
					Pingendo is a HTML editor for everyone. Easy for newbies, useful
					for professionals. <br>Code quality is a must. Pingendo
					generates clean, battle-tested, modular Bootstrap 4 code.
				</p>
				<a href="#" class="btn btn-lg mx-1 btn-secondary">A claim here</a> <a
					href="#" class="btn btn-lg btn-primary mx-1">Your call to
					action</a>
			</div>
		</div>
	</div>
</div>

<!-- 메인영상
<div class="embed-responsive embed-responsive-16by9">

	<iframe class="embed-responsive-item"
		src="http://www.youtube.com/embed/jdijTw-XDwQ?autoplay=1&amp;autohide=0&amp;controls=0&amp;disablekb=1&amp;fs=0&amp;loop=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;enablejsapi=1&amp;wmode=transparent&amp;widgetid=1&amp;vq=hd1080"
		allowfullscreen="1" frameborder="0" width="100%" height="100%"
		style="pointer-events: none;"> </iframe>
</div> -->



<!-- 오늘의 경기 (작업중) >> 경기일정 슬라이더로 -->

<div class="py-5 text-center" style="background-color: white;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="mb-4">오늘의 경기(작업중)</h3>
			</div>
		</div>


		<div class="row">
			<div class="col-12">
				<div id="carouselArchitecture" class="carousel slide"
					data-ride="carousel">
					<!--       <ol class="carousel-indicators">
              <li data-target="#carouselArchitecture" data-slide-to="0" class="active"><i></i></li>
              <li data-target="#carouselArchitecture" data-slide-to="1" class=""><i></i></li>
              <li data-target="#carouselArchitecture" data-slide-to="2" class=""><i></i></li>
            </ol> -->
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_3.jpg"
								data-holder-rendered="true">
							<div class="carousel-caption">
								<h3>홈팀 VS 어웨이팀</h3>
								<p>경기시각안내</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_3.jpg"
								data-holder-rendered="true">
							<div class="carousel-caption">
								<h3>SK VS 한화</h3>
								<p>경기시각안내</p>
							</div>
						</div>
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_3.jpg"
								data-holder-rendered="true">
							<div class="carousel-caption">
								<h3>두산 VS KT</h3>
								<p>경기시각안내</p>
							</div>
						</div>
					</div>

					<a class="carousel-control-prev" href="#carouselArchitecture"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselArchitecture"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- 경매섹션(작업중) >> 관리자가 느끼기에 최고의 상품 1개, 입찰자수높은 경매3개 -->
<div class="py-5" style="background-color: #FAFAFA;">
	<div class="container">

		<div class="row">
			<div class="py-5 col-md-3">
				<div class="row">
					<div class="col-md-12">
						<h3 class="mb-4 text-secondary">HOT루키경매</h3>
					</div>
				</div>

				<div class="row"
					style="background-color: white; border: 1px solid black;">
					<div class="text-center col-md-12 col-6">
						<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
					</div>
					<div class="col-md-12 col-6">
						<div class="row">

							<div class="col-md-8 col-12">

								KBO 2017 공인구<br> 입찰자수 :22명

							</div>
							<div class="col-md-4 col-12">
								<span class="align-middle">70000원</span>
							</div>


						</div>
					</div>
				</div>

			</div>

			<div class="py-5 col-md-9">

				<div class="row">
					<div class="col-md-12">
						<h3 class="mb-4 text-secondary">BEST물품</h3>
					</div>
				</div>

				<div class="row" style="border: 1px solid black;">

					<div class="text-center col-md-4" style="background-color: white;">

						<div class="row">

							<div class="col-md-12 col-6">
								<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
							</div>

							<div class="col-md-12 col-6">
								<h5 class="mb-3 text-primary">
									<b>sdfsdf</b>
								</h5>
								<p class="my-1">sdfsdf</p>
							</div>

						</div>
					</div>

					<div class="text-center col-md-4" style="background-color: white;">

						<div class="row">

							<div class="col-md-12 col-6">
								<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
							</div>

							<div class="col-md-12 col-6">
								<h5 class="mb-3 text-primary">
									<b>sdfsdf</b>
								</h5>
								<p class="my-1">sdfsdf</p>
							</div>

						</div>
					</div>

					<div class="text-center col-md-4" style="background-color: white;">

						<div class="row">

							<div class="col-md-12 col-6">
								<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
							</div>

							<div class="col-md-12 col-6">
								<h5 class="mb-3 text-primary">
									<b>sdfsdf</b>
								</h5>
								<p class="my-1">sdfsdf</p>
							</div>

						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>



<!-- 뉴스/커뮤니티 섹션 -->
<!-- 뉴스/커뮤니티 섹션 >> 뉴스 최신뉴스3개-->
<div class="py-5" style="background-color: #F1F1F1;">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-6 p-0">

				<div class="row">
					<div class="col-md-12">
						<h3 class="mb-4 text-secondary">NEWS</h3>
					</div>
					<div class="col-md-12 text-right">
						<p class="text-dark">+ 전체보기</p>
					</div>
				</div>

				<ul class="list-group">

					<li class="list-group-item">

						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/news/news1.jpg" class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>kt, 외국인 타자 로하스와 100만달러 재계약</b>
								</h5>
								<p class="my-1">kt 위즈가 외국인 타자 멜 로하스 주니어와 재계약을 체결햇다. 로하스도
									100만달러의 사나이가 됐다.</p>
							</div>
						</div>

					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/news/news2.jpg" class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>최고 극찬 최승준, 시련의 2017년 저문다</b>
								</h5>
								<p class="my-1">SK의 거포 자원 최승준(29)은 2017년을 정리해 달라는 질문에 깊은 한숨,
									그리고 멋쩍은 웃음으로 대신했다. 그만큼 2017...</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">

						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/news/news3.jpg" class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>두산 외국인 선수 계약 방침 '우선 니퍼트 집중'</b>
								</h5>
								<p class="my-1">두산 베어스는 2018년 시즌을 준비하면서 외국인 선수 보강에 신경을 쏟고
									잇다. 먼저 에이스로 7시즌 동안 함께한 더...</p>
							</div>
						</div>

					</li>

				</ul>
			</div>


			<!-- 뉴스/커뮤니티 섹션 >> 커뮤니티 조회수높은커뮤니티 혹은 최신커뮤니티 3개 -->
			<div class="col-md-6 p-0">

				<div class="row">
					<div class="col-md-12">
						<h3 class="mb-4 text-secondary">COMMUNITY</h3>
					</div>
					<div class="col-md-12 text-right">
						<p class="text-dark">+ 전체보기</p>
					</div>
				</div>


				<ul class="list-group">
					<li class="list-group-item">

						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>유심하게 관찰할 필요가 있을듯.</b>
								</h5>
								<p class="my-1">플옵 1차전에서 스크럭스한테 만루홈런 맞은공, 코시 5차전에서 이범호한테
									만루홈런 맞은공이 모두 다 슬라이더였죠.</p>
							</div>
						</div>

					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>잘하자</b>
								</h5>
								<p class="my-1">잘하자 승준이까지 살아나면 최정 로맥 한동민 김동엽 정의윤 최승준 거포라인
									무지막지하다</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">

						<div class="row">
							<div class="text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8">
								<h5 class="mb-3 text-dark">
									<b>충분히 10승은 할수 있는 투수이다</b>
								</h5>
								<p class="my-1">내가보기에는 니퍼트는 더이상 에이스급이 아니라 제2용병급으로 보내고 연봉도 그에
									맞게 책정해줘야 한다. 그리고 강력...</p>
							</div>
						</div>

					</li>

				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="p-0 col-md-1 col-12"></div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-lotte.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-kt.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nexen.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-kia.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-lg.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-nc.png"
					class="img-fluid mr-2">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-samsung.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12"></div>
		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>