<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) request.getAttribute("gudandto");
System.out.println("gujang.jsp gudandto >>> " + gudanDto);
System.out.println("gujang.jsp tno >>> "+NullCheck.nullToZero(request.getParameter("tno")));
%>
<script type="text/javascript">
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
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">����</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>"><%=gudanDto.getTname() %></a></li>
						<li class="breadcrumb-item active" aria-current="page">����</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div id="gudan-nav">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>">����</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&tno=<%=tno %>">����ȳ�</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=tno %>">������</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=tno%>');">Ŀ�´�Ƽ</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>


<div class="container py-5">
	<div class="row">
		<div class="col-md-12 py-5">
			<h4 class="mb-4">
				<strong>SK �ູ �帲 ����</strong>
			</h4>
            <img class="d-block mb-3 w-100 img-fluid mx-auto" src="<%=root%>/img/community/gujang/gujang-sk.jpg">
		</div>
		
		<!-- �ð��̵Ǹ� ĳ���� ����� �̹��� �ڵ� ����! -->
		
		<div class="col-md-12 py-5">
			<h4 class="mb-4">
				<strong>ã�ƿ��ô±�(����ǥ���Ұ�)</strong>
			</h4>
            <img class="d-block mb-3 w-100 img-fluid mx-auto" src="<%=root%>/img/community/gujang/gujang-sk.jpg">
		</div>
	</div>
</div>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>