<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>
<!-- 구단커뮤니티 바로가기 추가해야함!!!!!!!!!!!!!!!!디자인아직미완성 -->
<script type="text/javascript">
	$(function() {
		'use strict'

		$('[data-toggle="offcanvas"]').on('click', function() {
			$('.row-offcanvas').toggleClass('active')
		})
	})
</script>
<div class="container-fluid auction-category">
	<div class="row row-offcanvas row-offcanvas-left">
		<nav class="col-6 col-md-2 bg-light sidebar-offcanvas pt-3 pb-5"
			id="sidebar">
			<div class="pb-5">
				<a class="nav-link" href="#item-total">전체보기</a> <a class="nav-link"
					href="#item-gudan">구단별보기</a> <a class="nav-link" href="#item-1">유니폼</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="#item-1-1">상의</a> <a
						class="nav-link ml-3" href="#item-1-2">하의</a> <a
						class="nav-link ml-3" href="#item-1-3">모자</a> <a
						class="nav-link ml-3" href="#item-1-4">기타</a>
				</nav>
				<a class="nav-link" href="#item-2">경기용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="#item-2-1">야구공</a> <a
						class="nav-link ml-3" href="#item-2-2">배트</a> <a
						class="nav-link ml-3" href="#item-2-3">글러브</a> <a
						class="nav-link ml-3" href="#item-2-4">보호장구</a> <a
						class="nav-link ml-3" href="#item-2-4">기타</a>
				</nav>
				<a class="nav-link" href="#item-3">응원용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="#item-3-1">피켓</a> <a
						class="nav-link ml-3" href="#item-3-2">LED피켓</a> <a
						class="nav-link ml-3" href="#item-3-3">기타</a>
				</nav>
				<a class="nav-link" href="#item-3">기타잡화</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="#item-4-1">사진</a> <a
						class="nav-link ml-3" href="#item-4-2">티켓</a> <a
						class="nav-link ml-3" href="#item-4-3">카드</a> <a
						class="nav-link ml-3" href="#item-4-4">기타</a>
				</nav>
			</div>
		</nav>

		<div>
			<p class="float-left d-md-none">
				<button type="button"
					class="align-self-center btn btn-primary btn-sm"
					data-toggle="offcanvas">
					카테고리&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i>
				</button>
			</p>
		</div>

		<div class="col-12 col-md-10 px-5 pt-0">

			<div class="row p-3" style="background-color: black;">
				<%-- 			<div class="col-md-12 align-self-center" style="max-height: 100px; background-image: url('<%=root%>/img/gudan/logo/doosan-logo.png'); background-size: cover;"> --%>
				<img src="<%=root%>/img/gudan/logo/doosan-logo.png"
					class="img-fluid" style="max-height: 100px;">
			</div>

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end mb-0"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">전체</a></li>
						<li class="breadcrumb-item"><a href="#">유니폼</a></li>
						<li class="breadcrumb-item active" aria-current="page">모자</li>
					</ol>
				</nav>
			</div>

			<!--/row-->
			<div class="row">
				<div class="row">

					<div id="auc-recommended" class="pb-5">
						<div class="container py-5">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs nav-justified" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#menu1">진행경매</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu2">종료경매</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div id="menu1" class="container tab-pane active">
									<div class="row p-2 text-right">
										<div class="dropdown show col-md-12 align-self-end">
											<a class="btn dropdown-toggle btn-sm" href="#" role="button"
												id="dropdownMenuLink" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"
												style="width: 160px;"> 정렬보기 </a>

											<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
												<a class="dropdown-item" href="#">아이템기준</a> <a
													class="dropdown-item" href="#">인기경매순</a> <a
													class="dropdown-item" href="#">마감임박순</a> <a
													class="dropdown-item" href="#">신규경매순</a> <a
													class="dropdown-item" href="#">조회많은순</a> <a
													class="dropdown-item" href="#">조회적은순</a> <a
													class="dropdown-item" href="#">높은가격순</a> <a
													class="dropdown-item" href="#">낮은가격순</a>
											</div>
										</div>
									</div>
									<div class="row p-2 text-center">
										<div class="col-md-3">
											<div class="row p-2">
												<div class="col-md-12 col-4 align-self-center">
													<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
												</div>
												<div class="col-md-12 col-8 align-self-center">
													<p class="mb-2">
														<strong>KBO 2017 공인구</strong><br>입찰자수 : 22명<br>남은시간
														: 5일 3시간 20분
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
														<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 31명<br>남은시간
														: 1일 2시간 15분
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
														<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간
														: 3일 3시간 20분
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간
														: 1일 1시간 12분
													</p>
													<p>
														<strong>현재입찰가 : 100,000원</strong>
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간
														: 1일 1시간 12분
													</p>
													<p>
														<strong>현재입찰가 : 100,000원</strong>
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간
														: 1일 1시간 12분
													</p>
													<p>
														<strong>현재입찰가 : 100,000원</strong>
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간
														: 1일 1시간 12분
													</p>
													<p>
														<strong>현재입찰가 : 100,000원</strong>
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간
														: 1일 1시간 12분
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
														<strong>KBO 2017 공인구</strong><br>입찰자수 : 21명<br>남은시간
														: 3일 2시간 20분
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
														<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 21명<br>남은시간
														: 2일 2시간 15분
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
														<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간
														: 3일 3시간 20분
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
														<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 97명<br>남은시간
														: 1일 1시간 12분
													</p>
													<p>
														<strong>현재입찰가 : 120,000원</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>



							</div>
						</div>

						<div class="col-12 py-3">
							<ul class="pagination pagination-sm">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--right section-->
			</div>
			<!--/row-->



			<!-- 구단별 로고 >> 링크 구단페이지로 -->
			<div id="main-gudan-logo" class="py-5">
				<div class="container">
					<div class="row text-center">
						<div class="col-md-12">
							<h4 class="mb-3">구단별 모아보기</h4>
						</div>
					</div>
					<div class="row">
						<div class="p-0 col-md-1 col-12"></div>
						<div class="p-0 col-md-1 col-12 text-center main-doosan-mobile">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-lotte.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-kt.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-nexen.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-kia.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center main-doosan-pc">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-lg.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-sk.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="#"> <img
								src="<%=root%>/img/gudan/emblem/emblem-nc.png" class="img-fluid">
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


		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>