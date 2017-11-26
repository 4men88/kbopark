<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<!-- stylesheet -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600italic,600' rel='stylesheet' type='text/css'>
<!-- bootstrap Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="/css/flexslider.css" type="text/css">
<!-- Favicon -->

<link type="text/css" media="all" rel="stylesheet" href="/css/jquery.tosrus.all.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/slick.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/owl.carousel.css" />
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/css/plugins/slide-in-panel/style.css" />
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="/css/custom.css">
<link rel="stylesheet" href="/theme/a/custom.css">
<link rel="stylesheet" href="/skin/custom.css">





<body>
<script type="text/javascript">

<!-- Bootstrap -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom style -->
<link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">



</script>


<div class="container-fluid">
 
    <div id="navibar" class="col-sm-2" style="background-color:#F8F8FF;">
    	<h3>navigator</h3>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">마이페이지</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">정보수정</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">경매 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">루키 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">게시물 관리</button></div>
       	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">로그아웃</button></div>
      </div>
      
 <!-- --------------------------Content------------------------------------------------------- -->
<div id="content" class="col-sm-9" style="min-height:600px";>
<!-- --------------------------내가 등록한 경매---------------------------- -->
      <div id="myproduct">
				      <!-- 경매섹션  >> 관리자가 느끼기에 최고의 상품 1개, 입찰자수높은 경매3개 -->
				<div id="main-auction" class="py-5" style="background-color: #FAFAFA;">
					<div class="container">
						<div class="row">
							<div class="col-md-3 py-5">
								<div class="px-3">
									<div class="row">
										<div class="col-md-12 px-2">
											<h3 class="mb-4 text-secondary">내가 올린 경매</h3>
										</div>
									</div>
									<div class="row box px-2 text-center"
										style="background-color: white;">
										<div class="col-md-12 col-6 align-self-center">
											<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
										</div>
										<div class="col-md-12 col-6 align-self-center">
											<p class="mb-2">
												<strong>KBO 2017 공인구</strong><br> 입찰자수 : 22명
											</p>
											<p >
												<strong>현재가:</strong>
												<strong style="color: red;">70,000원</strong>
											</p>
											<p class="mb-2">
												<strong>남은 시간:</strong>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-9 py-5">
								<div class="px-3">
									<div class="row">
										<div class="col-md-12 px-2">
											<h3 class="mb-4 text-secondary">&nbsp;</h3>
										</div>
									</div>
									<div class="row">
										<div class="text-center col-md-4 box"
											style="background-color: white;">
											<div class="row px-2">
												<div class="col-md-12 col-6 align-self-center">
													<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
												</div>
												<div class="col-md-12 col-6 align-self-center">
													<p class="mb-2">
														<strong>KBO 팀코리아 중 아대1</strong><br> 입찰자수 : 31명
													</p>
													<p>
														<strong>현재가:</strong>
														<strong style="color: red;">5,000원</strong>
													</p>
													<p class="mb-2">
														<strong>남은 시간:</strong>
													</p>
												</div>
											</div>
										</div>
										<div class="text-center col-md-4 box"
											style="background-color: white;">
											<div class="row px-2">
												<div class="col-md-12 col-6 align-self-center">
													<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
												</div>
												<div class="col-md-12 col-6 align-self-center">
													<p class="mb-2">
														<strong>KBO 팀코리아 중 아대2</strong><br> 입찰자수 : 202명
													</p>
													<p>
														<strong>현재가:</strong>
														<strong style="color: red;">5,000원</strong>
													</p>
													<p class="mb-2">
														<strong>남은 시간:</strong>
													</p>
												</div>
											</div>
										</div>
										<div class="text-center col-md-4 box"
											style="background-color: white;">
											<div class="row px-2">
												<div class="col-md-12 col-6 align-self-center">
													<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
												</div>
												<div class="col-md-12 col-6 align-self-center">
													<p class="mb-2">
														<strong>KBO 팀코리아 중 아대3</strong><br> 입찰자수 : 98명
													</p>
													<p>
														<strong>현재가:</strong>
														<strong style="color: red;">100,000원</strong>
													</p>
													<p class="mb-2">
														<strong>남은 시간:</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
      
      </div>
 <!-- --------------------------내가 등록한 경매---------------------------- -->     
      
      
  <!-- --------------------------내가 입찰 경매---------------------------- -->    
			      <div id="myrace">
			     <!-- 경매섹션  >> 관리자가 느끼기에 최고의 상품 1개, 입찰자수높은 경매3개 -->
			<div id="main-auction" class="py-5" style="background-color: #FAFAFA;">
				<div class="container">
					<div class="row">
						<div class="col-md-3 py-5">
							<div class="px-3">
								<div class="row">
									<div class="col-md-12 px-2">
										<h3 class="mb-4 text-secondary">참여한 경매</h3>
									</div>
								</div>
								<div class="row box px-2 text-center"
									style="background-color: white;">
									<div class="col-md-12 col-6 align-self-center">
										<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
									</div>
									<div class="col-md-12 col-6 align-self-center">
										<p class="mb-2">
											<strong>KBO 2017 공인구</strong><br> 
										</p>
										<p>
											<strong>입찰가:</strong>
											<strong style="color: blue;">70,000원</strong>
										</p>
										<p >
											<strong>현재가:</strong>
											<strong style="color: red;">70,000원</strong>
										</p>
										<p class="mb-2">
												<strong>남은 시간:</strong>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-9 py-5">
							<div class="px-3">
								<div class="row">
									<div class="col-md-12 px-2">
										<h3 class="mb-4 text-secondary">&nbsp;</h3>
									</div>
								</div>
								<div class="row">
									<div class="text-center col-md-4 box"
										style="background-color: white;">
										<div class="row px-2">
											<div class="col-md-12 col-6 align-self-center">
												<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
											</div>
											<div class="col-md-12 col-6 align-self-center">
												<p class="mb-2">
													<strong>KBO 팀코리아 중 아대1</strong><br>
												</p>
												<p>
													<strong>입찰가:</strong>
													<strong style="color: blue;">5,000원</strong>
												</p>
												<p>
													<strong>현재가:</strong>
													<strong style="color: red;">5,000원</strong>
												</p>
												<p class="mb-2">
												<strong>남은 시간:</strong>
												</p>
											</div>
										</div>
									</div>
									<div class="text-center col-md-4 box"
										style="background-color: white;">
										<div class="row px-2">
											<div class="col-md-12 col-6 align-self-center">
												<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
											</div>
											<div class="col-md-12 col-6 align-self-center">
												<p class="mb-2">
													<strong>KBO 팀코리아 중 아대2</strong><br> 
												</p>
												<p>
													<strong>입찰가:</strong>
													<strong style="color: blue;">5,000원</strong>
												</p>
												<p>
													<strong>현재가:</strong>
													<strong style="color: red;">5,000원</strong>
												</p>
												<p class="mb-2">
												<strong>남은 시간:</strong>
												</p>
											</div>
										</div>
									</div>
									<div class="text-center col-md-4 box"
										style="background-color: white;">
										<div class="row px-2">
											<div class="col-md-12 col-6 align-self-center">
												<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
											</div>
											<div class="col-md-12 col-6 align-self-center">
												<p class="mb-2">
													<strong>KBO 팀코리아 중 아대3</strong><br>
												</p>
												<p>
													<strong>입찰가:</strong>
													<strong style="color: blue;">100,000원</strong>
												</p>
												<p>
													<strong>현재가:</strong>
													<strong style="color: red;">100,000원</strong>
												</p>
												<p class="mb-2">
												<strong>남은 시간:</strong>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

      </div>
     <!-- --------------------------내가 입찰 경매---------------------------- -->     
      
      
</div>
 <!-- --------------------------Content-------------------------- -->    		   	
 
  <!--     -----------------------aside---------------------- -->
    <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>
<!--     -----------------------aside---------------------- -->
</div>
<%@ include file="/common/footer.jsp"%> 	 
    	 
    	 
    	 
    	      
      
      