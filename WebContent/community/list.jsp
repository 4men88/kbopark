<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.board.model.BoardDto,com.baseball.gudan.model.GudanDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articlelist");
List<BoardDto> bestlist = (List<BoardDto>) request.getAttribute("bestlist");
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
PageNavigation navigator = (PageNavigation) request.getAttribute("navigator");
%>
<script type="text/javascript">
control = "/board";

function searchArticle() {
	document.getElementById("searchForm").action = "<%=root%>/board";
	document.getElementById("searchForm").submit();
}
</script>

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
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">메인</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">구장안내</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">스케줄</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=gudanDto.getTno()%>','1','','');">커뮤니티</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>


<div id="comm-best" class="py-5">
	<div class="container py-5">
		<h5>
			<strong>실시간베스트</strong>
		</h5>
		<div class="border-b-strong"></div>
		<div class="row">
<%
int len = bestlist.size();
for(int i=0;i<len;i++) {
	BoardDto bestBoardDto = bestlist.get(i);
	if(i%5==0) {
%>		
			<div class="col-md-6 py-3">
				<ul class="list-group">
<%
	} 
%>
				<li class="list-group-item" style="border: none;">
				<span class="bestnum" 
				<%if(i==0||i==1||i==2) {%>
					style="color: red;"
				<%} %>
				><%=i+1%></span>
				 <a href="javascript:viewArticle('<%=tno%>','<%=pg%>','','','<%=bestBoardDto.getBno()%>');"><%=bestBoardDto.getBname()%>...(<%=bestBoardDto.getTotalreply()%>)</a></li>
<%
	if(i%5==4) {
%>		
				</ul>
			</div>
<%
	} 
}
%>		
		</div> <!-- row -->
	</div>
</div>

<div id="communitylist" class="pt-5">
	<div class="container">
	<div class="d-flex">
		<div class="mr-auto p-2">
			<a class="btn btn-primary btn-sm" href="javascript:moveWrite('<%=tno%>');" role="button"
				style="color: white !important;"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;새글쓰기</a>
		</div>
		<div class="p-2">
				<form id="searchForm" name="searchForm" method="get">
<input type="hidden" id="act" name="act" value="listarticle">
<input type="hidden" id="tno" name="tno" value="<%=tno%>">
<input type="hidden" id="pg" name="pg" value="1">
					<div class="form-row">
						<div class="form-group col-md-4">
							<select class="form-control form-control-sm" id="key" name="key">
								<option value="mname">글쓴이</option>
								<option value="bname">글제목</option>
								<option value="bdetail">글내용</option>
							</select>
						</div>
						<div class="form-group col-md-8">
							<div class="input-group input-group-sm">
								<input type="text" id="word" name="word" class="form-control form-control-sm"
									placeholder="" aria-label=""> <span
									class="input-group-btn">
									<button class="btn btn-primary" type="button" onclick="javascript:searchArticle();">검색</button>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
	</div>
	</div>

	<div class="container">
	<div class="border-b-strong"></div>
		<div class="list-group">
<%
int size = list.size();
if(size != 0) {
	for(BoardDto boardDto : list) {		
%>	
			<a href="javascript:viewArticle('<%=tno%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');"
				class="list-group-item list-group-item-action flex-column align-items-start">
				<div class="row">
					<div class="col-md-2 text-center align-self-center">
						<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
							width="100%" style="min-height: 100px; max-height: 100px;">
					</div>
					<div class="col-md-10">
						<h5 class="mb-1"><%=boardDto.getBname() %>...(<%=boardDto.getTotalreply() %>)</h5>
						<small><%=boardDto.getMname() %> | <%=boardDto.getBdate() %> | 조회수: <%=boardDto.getBcount() %></small>
						<p class="mt-2 mb-0"><%=boardDto.getBdetail() %></p>
					</div>
				</div>
			</a>			
<%
	}
} else {
%>

<h6>작성된 글이 없습니다.</h6>

<%
}
%>
		</div>
	</div>
</div>



<div id="listnav" class="container py-5">

	<div class="d-flex justify-content-center">
<!-- 		<div>
			<ul class="pagination pagination-sm">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div> -->
		<%=navigator.getBoardnavigator() %>
	</div>
</div>



<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div id="main-gudan-logo" class="py-5">
	<div class="container">
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
					src="<%=root%>/img/gudan/emblem/emblem-lotte.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-kt.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nexen.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-kia.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-pc">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-lg.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-nc.png"
					class="img-fluid">
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