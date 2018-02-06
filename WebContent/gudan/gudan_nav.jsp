<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- include ���ؼ� root, gudanDto�� error���°� �¾ƿ�^^ ���� ǥ�ó��� �������˴ϴ� -->

<script type="text/javascript">
function goListArticle(tno, pg, key, word, seq) {
	control = "/board";
	listArticle(tno, pg, key, word, seq);
}

function getCategory(name) {
	var output = "";
	document.getElementById("gudan-tab1").classList.remove("active");
	document.getElementById("gudan-tab2").classList.remove("active");
	document.getElementById("gudan-tab3").classList.remove("active");
	document.getElementById("gudan-tab4").classList.remove("active");

	if(name == "home_jsp") {
		document.getElementById("gudan-tab1").classList.add("active");
		output = "����";
	} else if(name == "gujang_jsp") {
		document.getElementById("gudan-tab2").classList.add("active");
		output = "����ȳ�";
	} else if(name == "weekly_jsp") {
		document.getElementById("gudan-tab3").classList.add("active");
		output = "������";
	} else {
		document.getElementById("gudan-tab4").classList.add("active");
		output = "Ŀ�´�Ƽ";
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
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">����</a></li>
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
			<div id="gudan-tab1" class="p-3 gudan-nav-inner"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">����</a></div>
			<div id="gudan-tab2" class="p-3 gudan-nav-inner"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">����ȳ�</a></div>
			<div id="gudan-tab3" class="p-3 gudan-nav-inner"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">������</a></div>
			<div id="gudan-tab4" class="p-3 gudan-nav-inner"><a href="javascript:goListArticle('<%=gudanDto.getTno()%>','1','','','');">Ŀ�´�Ƽ</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>