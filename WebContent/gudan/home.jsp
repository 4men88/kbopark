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
						<li class="breadcrumb-item active" aria-current="page">메인</li>
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

<div id="comm-home">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-6 py-5">

				<h5>
					<strong>HOT루키경매</strong>
				</h5>
				<div class="border-b-strong mb-3"></div>
				
				<ul class="list-group">
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper align-self-center text-center col-4">
								<img src="<%=root%>/img/news/news1.jpg" class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>kt, 외국인 타자 로하스와 100만달러 재계약</b>
								</h5>
								<p class="my-1">kt 위즈가 외국인 타자 멜 로하스 주니어와 재계약을 체결햇다. 로하스도
									100만달러의 사나이가 됐다.</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper align-self-center text-center col-4">
								<img src="<%=root%>/img/news/news2.jpg" class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>최고 극찬 최승준, 시련의 2017년 저문다</b>
								</h5>
								<p class="my-1">SK의 거포 자원 최승준(29)은 2017년을 정리해 달라는 질문에 깊은 한숨,
									그리고 멋쩍은 웃음으로 대신했다..</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper align-self-center text-center col-4">
								<img src="<%=root%>/img/news/news3.jpg" class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>두산 외국인 선수 계약 방침 '우선 니퍼트 집중'</b>
								</h5>
								<p class="my-1">두산 베어스는 2018년 시즌을 준비하면서 외국인 선수 보강에 신경을 쏟고
									잇다. 먼저 에이스로 7시즌 동안 함께...</p>
							</div>
						</div>
					</li>
				</ul>
				
				<p class="text-dark text-right py-1" style="font-size: 14px;">+ 전체보기</p>
			</div>
			<div class="col-md-6 py-5">

				<h5>
					<strong>HOT커뮤니티</strong>
				</h5>
				<div class="border-b-strong mb-3"></div>
				
				<ul class="list-group">
					<li class="list-group-item">

						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>유심하게 관찰할 필요가 있을듯.</b>
								</h5>
								<p class="my-1">플옵 1차전에서 스크럭스한테 만루홈런 맞은공, 코시 5차전에서 이범호한테
									만루홈런 맞은공이 모두 다 슬라이더였죠.</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>잘하자</b>
								</h5>
								<p class="my-1">잘하자 승준이까지 살아나면 최정 로맥 한동민 김동엽 정의윤 최승준 거포라인
									무지막지하다</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">

						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">

								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>충분히 10승은 할수 있는 투수이다</b>
								</h5>
								<p class="my-1">내가보기에는 니퍼트는 더이상 에이스급이 아니라 제2용병급으로 보내고 연봉도 그에
									맞게 책정해줘야 한다...</p>
							</div>
						</div>
					</li>
				</ul>
				<p class="text-dark text-right py-1" style="font-size: 14px;">+ 전체보기</p>
			</div>
		</div>
	</div>
</div>


<button type="button" class="py-4 btn btn-primary btn-lg btn-block" style="border-radius: 0;">구단 공식 홈페이지 바로가기</button>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>