<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<script type="text/javascript">
control = "/board";

</script>

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
<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root%>/img/etc/grass.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3"><%=gudanDto.getEnname() %></h1>
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
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">구단</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>"><%=gudanDto.getTname() %></a></li>
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
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>">메인</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">구장안내</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=tno %>">스케줄</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=tno%>');">커뮤니티</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>
<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5 text-center">
				
				<h5>글쓰기에 실패하였습니다.</h5>
				<div class="p-2">
					<a class="btn btn-primary" href="javascript:moveWrite();" role="button"
						style="color: white !important;">다시작성</a>
				</div>
				<div class="p-2">
					<a class="btn btn-secondary" href="javascript:listArticle('<%=pg%>','<%=key%>','<%=word%>');" role="button"
						style="color: white !important;">목록가기</a>
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