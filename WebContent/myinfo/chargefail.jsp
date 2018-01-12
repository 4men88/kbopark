<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/setting.jsp"%>
<script type="text/javascript">
control = "/myinfo";

function mvnotice() {
	window.opener.location.href = "<%=root%>/admin?act=notice";
	self.close();
}

function mvmyinfo() {
	opener.location.reload();
	self.close();
}

window.onload=function(){
	document.getElementsByTagName("body")[0].setAttribute("style", "background-color: #fafafa"); 
}
</script>


<header class="sticky-top" style="background-color: white;">
	<nav id="main-header" class="navbar navbar-expand-md border-b">
		<div class="container py-1">
			<img class="" src="<%=root%>/img/logo.png" style="height: 28px;">
		</div>
	</nav>
</header>

<div style="background-color: #fafafa;">
<div class="container py-5 text-center" style="background-color: #fafafa;">

<div class="row py-5">
<div class="col-md-12 align-self-center">
	<h5><b>충전실패</b></h5>
	<label>루키 충전에 실패하였습니다.</label>
	<div class="border-b"></div>
	<div class="py-5">
	<a role="button" aria-pressed="true" class="btn btn-primary btn-lg" href="javascript: mvmyinfo();" 
		style="font-size: 16px; color: white !important;">확인</a>
	</div>
</div>
</div>

</div>
</div>

<div id="footer" class="text-white fixed-bottom" style="background-color: #3C3C3C;">
	<div class="container py-2">
		<div class="row">
			<div class="col-md-12 align-self-center text-center">
				<a href="javascript: mvnotice();"
					style="font-size: 14px; color: #AAAAAA !important; background-color: inherit;">고객문의</a>
			</div>
		</div>
	</div>
</div>