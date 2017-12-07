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

				<!-- 모바일 라인 다시 잡아야함!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="#"><i class="fa fa-pencil" aria-hidden="true"></i>
							새글쓰기</a> <a href="#">수정</a> <a href="#">삭제</a>
					</div>
					<div class="px-2">
						<a href="#">최신목록</a>
					</div>
					<div class="px-2">
						<a href="#">목록</a>
					</div>
					<div class="px-2">
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="#">다음글 <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3">
					<h3>어쩌구저쩌구 제목입니당 숄라숄라라라</h3>
					<h6>작성자이름 2017.05.03 02:30</h6>
					<h6>조회수 : 3,000</h6>
				</div>

				<div class="border-b my-2"></div>
				<p class="p-3 my-0">안녕하세요. 저는 길고양이 집지어주기 프로젝트 -해비캣의 팀원 입니다. 한달 전
					자주 들락날락하던 카페에 어떤 분이 개인 사정으로 더이상 고양이를 키우기 힘들다고 올려주신 글을 보고, 묘연처럼 이끌려
					'타코'를 입양하게 되었어요!! 나중 알게된 사실이지만 아이가 예쁘게 생겼고 아직 중성화를 하지 않아 업자들이 순식간에
					달려들어 입양하겠다고 나섰다네요.. 책임비가 있었는데 다 큰애 공짜로 달라, 한달 키워보고 돈 주던가 돌려보내던가
					해도되냐.. 등등 말도 안되는 연락들이 많이 왔었대요. 정말 업자들, 한 생명을 돈으로만 보는 사람들 많은 것
					같아요...</p>
				<div class="border-b my-2"></div>
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="#"><i class="fa fa-pencil" aria-hidden="true"></i>
							새글쓰기</a> <a href="#">수정</a> <a href="#">삭제</a>
					</div>
					<div class="px-2">
						<a href="#" style="color: #E64628 !important;"><i
							class="fa fa-bell" aria-hidden="true"></i> 신고</a>
					</div>
					<div class="px-2">
						<a href="#">최신목록</a>
					</div>
					<div class="px-2">
						<a href="#">목록</a>
					</div>
					<div class="px-2">
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="#">다음글 <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>



				<div class="pt-5">
					<h5>
						<strong>댓글쓰기</strong>
					</h5>
				</div>

				<div class="border-b-strong"></div>
				<div class="p-3" style="background-color: #f0f0f0;">
					<form>
						<div class="form-group mb-1">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3"></textarea>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-sm btn-primary">등록</button>
						</div>
					</form>
				</div>
				<div class="border-b p-0"></div>

				<table class="table table-sm">
					<tbody>
						<tr>
							<td>김수한무</td>
							<td nowrap colspan="3">Ottddddddddddddddddddddddddddddddddddd<br>ddddddddddddddddddddddddddddddddddddddddd<br>ddddddddddddddddddo</td>
							<td align="right">17.09.21</td>
						</tr>
						<tr>
							<td>거북이와</td>
							<td colspan="3">Thornton</td>
							<td align="right">17.09.21</td>
						</tr>
						<tr>
							<td>두루미</td>
							<td colspan="3">Larry the Bird</td>
							<td align="right">17.09.21</td>
						</tr>
					</tbody>
				</table>


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