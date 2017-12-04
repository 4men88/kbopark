<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>

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

		<div class="col-12 col-md-10 px-5 pt-2 pb-5">

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end mb-0"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">전체</a></li>
						<li class="breadcrumb-item active" aria-current="page">내 물품등록</li>
					</ol>
				</nav>
			</div>

			<form id="addProductForm" class="">
				<div class="">
					<h5 class="border-b mb-5 p-3">기본물품정보</h5>
				</div>

				<div class="row">
					<div class="col-md-3">
						<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
					</div>
					<div class="col-md-9">
						<div class="form-group row px-3">
							<label for="selectcategory" class="col-sm-2 col-form-label">물품분류</label>
							<div class="col-sm-3">
								<select id="selectcategory1" class="form-control">
									<option selected>1차카테고리</option>
									<option>유니폼</option>
									<option>경기용품</option>
									<option>응원용품</option>
									<option>기타잡화</option>
								</select>
							</div>
							<div class="col-sm-3">
								<select id="selectcategory2" class="form-control">
									<option selected>2차카테고리</option>
									<option>상의</option>
									<option>하의</option>
									<option>모자</option>
									<option>기타</option>
								</select>
							</div>
						</div>
						<div class="form-group row px-3">
							<label for="inputName" class="col-sm-2 col-12 col-form-label">물품명</label>
							<div class="col-sm-6 col-12">
								<input type="text" class="form-control" id="inputName"
									placeholder="">
							</div>
						</div>
						<div class="form-group row px-3">
							<label for="startdate" class="col-sm-2 col-12 col-form-label">경매시작일</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="startdate"
									placeholder="2017.11.31" readonly>
							</div>
							<label for="enddate" class="col-sm-2 col-12 col-form-label">경매종료일</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="enddate"
									placeholder="">
							</div>
						</div>

						<!-- 이미지 -->
						<div class="form-group row px-3">
							<label for="inputPassword1" class="col-sm-2 col-form-label">비밀번호</label>
							<div class="col-sm-10">

								<input type="file" class="form-control-file mb-2"
									id="exampleFormControlFile1">
									 <label>대표이미지
									300*300 사이즈에 최적화되어있습니다.(수정)</label> 
									<label>이미지는 최대 3개까지 업로드
									가능합니다.</label>
									 <input type="file" class="form-control-file mb-2"
									id="exampleFormControlFile1"> 
									<input type="file"
									class="form-control-file" id="exampleFormControlFile1">
<!-- 왜안먹히지..ㅠㅠ
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label>

 -->

							</div>
						</div>
						<!-- 이미지 -->

						<div class="form-group row px-3">
							<label for="bidprice" class="col-sm-2 col-form-label">입찰시작가</label>
							<div class="col-sm-4 input-group">
								<input type="text" class="form-control" id="bidprice"
									aria-label="Amount (to the nearest dollar)"> <span
									class="input-group-addon">루키</span>
							</div>
						</div>

						<div class="form-group row px-3">
							<label for="inputTeam" class="col-sm-2 col-form-label">선호구단</label>
							<div class="col-sm-4">
								<select id="inputTeamState" class="form-control">
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


					</div>
				</div>

				<div class="">
					<h5 class="border-b mb-5 p-3 pt-5">상세물품정보</h5>
				</div>

				<div class="form-group">
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="10"></textarea>
				</div>

				<div class="px-3 py-5 text-center">
					<button type="button" class="btn btn-lg btn-primary"
						data-dismiss="modal">물품등록</button>
				</div>
			</form>

		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>