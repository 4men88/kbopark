<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- include 안해서 root, gudanDto에 error나는거 맞아요^^ 에러 표시나도 정상실행됩니다 -->

<script type="text/javascript">
function goListArticle(tno, pg, key, word, seq) {
	control = "/board";
	listArticle(tno, pg, key, word, seq);
}

function getCategory(name) {
	var output = "";
	if(name == "home_jsp") {
		output = "메인";
	} else if(name == "gujang_jsp") {
		output = "구장안내";
	} else if(name == "weekly_jsp") {
		output = "스케줄";
	} else {
		output = "커뮤니티";
	}
	document.getElementById("current-name").innerHTML = output;
}

window.onload = function() {
	var name = "<%=this.getClass().getSimpleName() %>";
	getCategory(name);
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
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>"><%=gudanDto.getTname() %></a></li>
						<li id="current-name" class="breadcrumb-item active" aria-current="page"></li>
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
			<div class="gudan-nav-inner p-3"><a href="javascript:goListArticle('<%=gudanDto.getTno()%>','1','','','');">커뮤니티</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>