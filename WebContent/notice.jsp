<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<div id="notice" class="py-5">
	<div class="container py-5">

		<div class="row">
			<div class="col-md-12 px-5 mb-3">
				<h3>공지사항</h3>
			</div>
		</div>

		<div class="d-flex justify-content-center">
			<div class="notice-inner p-3">전체공지</div>
			<div class="notice-inner p-3">경매안내</div>
			<div class="notice-inner p-3">1:1문의</div>
		</div>
		<div class="border-b p-0"></div>

		<div class="row p-5">
			<div class="col-md-12">
				<table class="table table-sm">
					<thead class="thead-light">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">공지</th>
							<td>첫공지사항입니다</td>
							<td>17.12.02</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>또공지사항이지롱</td>
							<td>17.12.02</td>
							<td>0</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>첫공지사항입니다</td>
							<td>17.12.02</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="d-flex justify-content-center">
			<div>
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
	<!-- container -->
</div>
<!-- notice -->

<!--footer 영역-->
<%@ include file="/common/footer.jsp"%>