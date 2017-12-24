<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto,com.baseball.auction.model.AuctionDetailDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
List<BoardDto> hotboard = (List<BoardDto>) request.getAttribute("hotboard");
List<AuctionDetailDto> hotauction = (List<AuctionDetailDto>)request.getAttribute("hotauction");

System.out.println("home.jsp >>> " + hotboard.size() + " >>> " + hotauction.size());
System.out.println("home.jsp gudandto >>> " + gudanDto);
System.out.println("home.jsp tno >>> "+NullCheck.nullToZero(request.getParameter("tno")));
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/gudan";

function listArticle(tno) {
	document.getElementById("cact").value = "listarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = 1;
	
	document.getElementById("commonForm").action = root + "/board";
	document.getElementById("commonForm").submit();
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
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">메인</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">구장안내</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">스케줄</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=gudanDto.getTno()%>');">커뮤니티</a></div>
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
<%
	for(AuctionDetailDto adto : hotauction) {
%>				
				
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper align-self-center text-center col-4">
								<img src="<%=root%><%=adto.getAimage() %>" class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b><%=adto.getAname() %></b>
								</h5>
								<p class="my-1">현재입찰가 : <strong><%=adto.getBidPrice() %></strong>&nbsp;원</p>
								<h6>남은시간 : <%=adto.getEndTime() %></h6>
							</div>
						</div>
					</li>
<%
	}
%>		
				</ul>
				
				<p class="text-dark text-right py-1" style="font-size: 14px;"><a href="#">+ 전체보기</a></p>
			</div>
			<div class="col-md-6 py-5">

				<h5>
					<strong>HOT커뮤니티</strong>
				</h5>
				<div class="border-b-strong mb-3"></div>
				
				<ul class="list-group">
<%
//여기서 이제 보드디티오도렬야함!!!!
	for(BoardDto boardDto : hotboard) {
%>				
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">
								<img src="<%=root%><%=gudanDto.getEmblem() %>"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b><%=boardDto.getBname() %></b>
								</h5>
								<p class="my-1"><%=boardDto.getBdetail() %></p>
							</div>
						</div>
					</li>
<%
	}
%>					
				</ul>
				<p class="text-dark text-right py-1" style="font-size: 14px;"><a href="javascript:listArticle('<%=tno%>');">+ 전체보기</a></p>
			</div>
		</div>
	</div>
</div>


<a class="py-4 btn btn-primary btn-lg btn-block" href="<%=gudanDto.getWeb1()%>" role="button" style="border-radius: 0; color: white !important;" target="_blank">구단 공식 홈페이지 바로가기</a>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>