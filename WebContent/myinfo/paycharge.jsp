<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
<%@ include file="/common/setting.jsp"%>
<script type="text/javascript">
control = "/myinfo";

function charge() { 
	if(document.chargeForm.value.value == "") {
		alert("�����ݾ��� �����ϼ���!");
		return;
	} else {
 		document.chargeForm.action = "<%=root%>/myinfo";
		document.chargeForm.submit();
	}
}

function mvnotice() {
	window.opener.location.href = "<%=root%>/admin?act=notice";
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

<div style="background-color: #fAfAfA;">
<div class="container py-5" style="background-color: #fAfAfA;">
	<form name="chargeForm" method="POST" action="">
		<input type="hidden" id="act" name="act" value="chargerookie">	
	<h6><b>��Ű����</b></h6>
	<label>�����Ͻ� �ݾ��� �������ּ���.</label>
	<div class="border-b mb-2"></div>

		<div class="form-group row px-2 mx-0 mb-0" style="font-size: 14px;">
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value1" value="1000" checked>
						<label for="radio1">1000��</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value2" value="3000">
						<label for="radio2">3000��</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value3" value="5000"> <label for="radio3">5000��</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value1" value="10000"> <label for="radio4">10000��</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value2" value="30000"> <label for="radio5">30000��</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value3" value="50000"> <label for="radio6">50000��</label>
					</div>
		</div>
		
	<div class="pt-5"></div>
	
	<h6><b>�������</b></h6>
	<label>��������� �������ּ���.</label>
	<div class="border-b mb-2"></div>
	
	<div class="text-center">
	<a href="javascript: charge();"><img src="<%=root%>/img/kpay.png" class="img-fluid"></a>
	</div>
	</form>
</div>
</div>

<div id="footer" class="text-white fixed-bottom" style="background-color: #3C3C3C;">
	<div class="container py-2">
		<div class="row">
			<div class="col-md-12 align-self-center text-center">
				<a href="javascript: mvnotice();"
					style="font-size: 14px; color: #AAAAAA !important; background-color: inherit;">������</a>
			</div>
		</div>
	</div>
</div>