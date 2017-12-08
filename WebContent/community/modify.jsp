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
						<li class="breadcrumb-item active" aria-current="page">커뮤니티</li>
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

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<div class="">
					<h5>
						<strong>커뮤니티 수정하기</strong>
					</h5>
				</div>
				<div class="border-b-strong mb-5"></div>





				<form id="" class="">
					<div class="form-group row px-3">
						<label for="selectgudan" class="col-sm-2 col-4 col-form-label">구단</label>
						<div class="col-sm-4 col-8">
							<select id="selectgudan" class="form-control">
								<option selected>두산 베어스</option>
								<option>롯데 자이언츠</option>
								<option>KIA 타이거즈</option>
								<option>NC 다이노스</option>
								<option>SK 와이번스</option>
								<option>LG 트윈스</option>
								<option>넥센 히어로즈</option>
								<option>한화 이글스</option>
								<option>삼성 라이온즈</option>
								<option>KT 위즈</option>
							</select>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="writeName" class="col-sm-2 col-4 col-form-label">작성자</label>
						<div class="col-sm-4 col-8">
							<input type="text" class="form-control" id="writeName"
								placeholder="딩동댕" readonly>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="inputSubject" class="col-sm-2 col-12 col-form-label">제목</label>
						<div class="col-sm-10 col-12">
							<input type="text" class="form-control" id="inputSubject"
								placeholder="수정될글제목">
						</div>
					</div>

					<div class="form-group row px-3">
						<div class="col-md-12">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="20">수정될글내용</textarea>
						</div>
					</div>

					<!-- 첨부파일 -->
					<div class="form-group row px-3">
						<label for="inputfile" class="col-sm-2 col-form-label">첨부파일</label>
						<div class="col-sm-10">
							<input type="file" class="form-control-file mb-2"
								id="exampleFormControlFile1"> <label
								style="font-size: 14px;">이미지 크기는 3MB이하로 제한됩니다.(수정)</label>
								<br><label
								style="font-size: 14px; color: red;">글 수정시 이미지는 초기화 됩니다.(?)</label>
							<!-- 왜안먹히지..ㅠㅠ
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label> -->
						</div>
					</div>

					<!-- 캡챠 -->
				</form>

				<div class="border-b mb-3"></div>
				<div class="d-flex">
					<div class="mr-auto p-2">
						<a class="btn btn-primary btn-sm" href="#" role="button"
							style="color: white !important;">목록보기</a>
					</div>
					<div class="p-2">
						<a class="btn btn-secondary btn-sm" href="#" role="button"
							style="color: white !important;">취소</a>
					</div>
					<div class="p-2">
						<a class="btn btn-primary btn-sm" href="#" role="button"
							style="color: white !important;">수정</a>
					</div>
				</div>





			</div>
			<!-- col-md-8 -->

			<div class="col-md-4 py-5">
				<h5>
					<strong>실시간베스트</strong>
				</h5>
				<div class="border-b-strong"></div>
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> ㅇㅅㅇ들 일이 이렇게 커진...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> 하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> 하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> ㅇㅅㅇ들 일이 이렇게 커진... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						하하하하하 그러고보니 방... (65)</li>
				</ul>
			</div>

		</div>




	</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>