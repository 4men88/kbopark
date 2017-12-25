<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.board.model.BoardDto,com.baseball.gudan.model.GudanDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articlelist");
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
PageNavigation navigator = (PageNavigation) request.getAttribute("navigator");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

function searchArticle() {
	document.getElementById("searchForm").action = "<%=root%>/board";
	document.getElementById("searchForm").submit();
}

function startTime() {
	var params = "act=bestarticle&tno=<%=gudanDto.getTno()%>";
	sendRequest("<%=root%>/board", params, bestList, "GET");
}

function bestList() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
		 	makelist(listxml);
			window.setTimeout("startTime();", 5000);
		} 
	}
}

function makelist(data) {
	var output = "";
	var len = data.getElementsByTagName("board").length;
	
	if(len == 0) {
		output = "<div class=\"col-md-12 text-center py-3\"><h6>베스트글이 존재하지 않습니다.</h6></div>";
	} else {	
	for(var i=0;i<len;i++) {
		var bno = data.getElementsByTagName("bno")[i].firstChild.data;
		var bname = data.getElementsByTagName("bname")[i].firstChild.data;
		var replycnt = data.getElementsByTagName("replycnt")[i].firstChild.data;
		
		if(i%5==0) {
			output += "<div class=\"col-md-6\">";
			output += "<ul class=\"list-group\">";
		}
		output += "<li class=\"list-group-item over-subject\" style=\"border: none;\">";
		output += "<span class=\"bestnum\" ";
		if(i==0||i==1||i==2) {
			output += "style=\"color: red;\"";
		}
		output += ">";
		output += (i+1) + "</span>";
		output += "<span id=\"bestsubject\">";
		output += "<a href=\"javascript:viewArticle('<%=tno%>','1','','','" + bno + "');\">";
		output += bname + "...(" + replycnt + ")</a>";
		output += "</span>";
		output += "</li>";
		if(i%5==4) {
			output += "</ul>";
			output += "</div>";
		} 
	}
	}
	document.getElementById("bestboard").innerHTML = output;
}

$(document).ready(function(){
	startTime();
});

</script>

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best" class="py-5">
	<div class="container py-5">
		<h5>
			<strong>실시간베스트</strong>
		</h5>
		<div class="border-b-strong"></div>
		<div id="bestboard" class="row"></div> <!-- row -->
	</div>
</div>

<div id="communitylist">
	<div class="container">
	<div class="d-flex">
		<div class="mr-auto p-2">
			<a class="btn btn-primary btn-sm" href="javascript:moveWrite('<%=tno%>');" role="button"
				style="color: white !important;"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;새글쓰기</a>
		</div>
		<div class="p-2">
				<form id="searchForm" name="searchForm" method="get">
<input type="hidden" id="act" name="act" value="listarticle">
<input type="hidden" id="tno" name="tno" value="<%=gudanDto.getTno()%>">
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
				<div class="row" style="height: 140px;">
					<div class="col-md-2 col-4 text-center align-self-center">
						<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png" class="img-fluid">
					</div>
					<div class="col-md-10 col-8 align-self-center">
						<h5 class="mb-1"><%=boardDto.getBname() %>...(<%=boardDto.getTotalreply() %>)</h5>
						<small><%=boardDto.getMname() %> | <%=boardDto.getBdate() %> | 조회수: <%=boardDto.getBcount() %></small>
						<div class="over-detail" style="height: 65px;"><p class="mt-2 mb-0 over-detail"><%=boardDto.getBdetail().replaceAll("<div>", "<br>").replaceAll("</div>", "") %></p></div>
					</div>
				</div>
			</a>			
<%
	}
} else {
%>

<h6 class="text-center py-3">작성된 글이 없습니다.</h6>

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
				<a href="<%=root%>/gudan?act=mvhome&tno=2"> <img
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
				<a href="<%=root%>/gudan?act=mvhome&tno=2"> <img
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
				<a href="<%=root%>/gudan?act=mvhome&tno=8"> <img
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