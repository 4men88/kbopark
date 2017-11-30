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
				<a class="nav-link" href="#item-total">전체보기</a>
				<a class="nav-link" href="#item-gudan">구단별보기</a> <a class="nav-link"
					href="#item-1">유니폼</a>
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

		<div class="col-12 col-md-10 p-5">

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">전체</a></li>
						<li class="breadcrumb-item"><a href="#">경기용품</a></li>
						<li class="breadcrumb-item active" aria-current="page">글러브</li>
					</ol>
				</nav>
			</div>


			<!--/row-->
			<h2 class="text-primary mb-3">KBO 2017 공인구</h2>
			<div class="row">
				<div class="col-md-5 align-self-center">
					<img class="img-fluid d-block mb-4 img-thumbnail"
						src="<%=root%>/img/auction/auc1.jpg">
				</div>
				<div class="col-md-7 align-self-center">
					<table class="table table-responsive-md">
						<tbody>
							<tr style="background-color: #F5F5F5;">
								<th scope="row">남은시각</th>
								<td style="color: red; font-weight: 700; font-size: 20px;">10일
									17시간 30분 30초</td>
							</tr>
							<tr>
								<th scope="row">경매기간</th>
								<td>2017/11/05 05:30:30 - 2017/11/15 23:00:30</td>
							</tr>
							<tr>
								<th scope="row">입찰자수</th>
								<td>2</td>
							</tr>
							<tr>
								<th scope="row">조회수</th>
								<td>1300</td>
							</tr>
							<tr>
								<th scope="row">최고가</th>
								<td style="font-weight: 700;">40,000(루키)</td>
							</tr>
							<tr>
								<th scope="row">시작가</th>
								<td>100(루키)</td>
							</tr>
							<tr>
								<th scope="row">구단분류</th>
								<td>구단공통</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<button type="button" class="btn btn-block btn-primary btn-lg"
						data-toggle="modal" data-target="#enterbidModal">입찰하기</button>
				</div>
			</div>
			<div class="border-b py-3"></div>

			<div class="row py-5" style="height: 400px;">
				<div class="col-md-12">
					<p>상세정보</p>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<table class="table table-sm table-responsive-md">
						<thead>
							<tr>
								<th scope="col">입찰번호</th>
								<th scope="col">입찰자</th>
								<th scope="col">입찰루키</th>
								<th scope="col">입찰시각</th>
							</tr>
						</thead>
						<tbody>
							<tr style="font-weight: 700px;">
								<th scope="row">5</th>
								<td>boss**</td>
								<td>40,000</td>
								<td>2017.11.29</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>boss**</td>
								<td>38,000</td>
								<td>2017.11.29</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>boss**</td>
								<td>22,000</td>
								<td>2017.11.29</td>
							</tr>
							<tr class="table-active">
								<th scope="row">2</th>
								<td>kore**</td>
								<td>20,000</td>
								<td>2017.11.28</td>
							</tr>
							<tr>
								<th scope="row">1</th>
								<td>boss**</td>
								<td>5,000</td>
								<td>2017.11.29</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center;">입찰내역이 없습니다</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 개수가 정해져서 길이가 정해져야 대략적인 가운데 정렬을할수가 있음ㅠㅠ 가운데정렬안되면 수업시간에 했던걸로그냥쓰기..-->
				<div class="col-12 py-3">
					<ul class="pagination pagination-sm">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
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
</div>

<!-- 입찰하기 Modal >> 입찰하는곳으로 뺄것! -->
<div class="modal fade" id="enterbidModal" tabindex="-1" role="dialog"
	aria-labelledby="enterbidModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content text-center">
			<form>
				<div class="modal-header">
					<h5 class="modal-title" id="enterbidModalLabel">입찰하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body px-2 py-5">
					<label class="mb-3">한번 입찰하게 되면 재입찰은 가능하나, 입찰 취소는
						불가능합니다.<br>신중하게 입찰에 참여해주시기 바랍니다.
					</label>
					
					<table class="table table-sm table-responsive-md py-3">
						<tbody>
							<tr style="font-weight: 700px;">
								<th scope="row">사용가능루키</th>
								<td>80,000(루키)</td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">최소입찰루키</th>
								<td>40,000(루키)</td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">입찰루키</th>
								<td><input type="text" class="form-control"
								id="enterbidFormControlInput1" placeholder=""></td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer p-4" style="display: block;">
					<button type="button" class="btn btn-primary btn-lg">입찰하기</button>
					<button type="button" class="btn btn-secondary btn-lg"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>

	</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>