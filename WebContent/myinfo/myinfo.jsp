<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
	String myemblem = (String) request.getAttribute("myemblem");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/myinfo";

function openpay() {		
	window.open("<%=root%>/myinfo?act=mvpay", "pay", "width=360,height=545,top=100,left=100,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=yes");
}

</script>

<div>
<div class="container py-5">
<div class="row py-5">

<div class="col-md-4 text-white p-5" style="background-color: #00133E;">
<h3><%=memberDto.getName() %>(<%=memberDto.getId() %>)��</h3>
������ : <%=memberDto.getJoindate() %>
<div class="border-b my-3"></div>
<h3><%=memberDto.getTel1() %>-<%=memberDto.getTel2() %>-<%=memberDto.getTel3() %></h3>
<br/>
<a class="text-white" href="">��������<i class="fa fa-angle-right px-2" aria-hidden="true"></i></a>
</div>

<div class="col-md-4 p-5" style="background-color: #FAFAFA;">
<h3>������Ű</h3>
��Ű�� ��ſ� �����غ�����
<div class="border-b my-3"></div>

<div class="row justify-content-between">
	<div class="col-4">�����ܾ�</div>
	<div class="col-8 text-right"><h3><%=memberDto.getRookie() %>��</h3></div>
</div>
<br/>
<a href="javascript: openpay();">
��Ű����<i class="fa fa-angle-right px-2" aria-hidden="true"></i>
</a>
</div>

<div class="col-md-4 p-5" style="background-color: #EEF3F7;">
<h3><%=memberDto.getFavoriteteam() %></h3>
��ȣ������ ȸ���������� ���������մϴ�
<div class="border-b my-3"></div>
<p class="text-center m-0">
<img src="<%=root%><%=myemblem %>" style="height: 89px;" class="img-fluid">
</p>
</div>

</div>
</div>
</div>


<!-- ���ܺ� �ΰ� >> ��ũ ������������ -->
<div id="main-gudan-logo" class="py-5">
	<div class="container">
		<div class="row">
			<div class="p-0 col-md-1 col-12"></div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-mobile">
				<a href="">
				<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=3">
				<img src="<%=root%>/img/gudan/emblem/emblem-lotte.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=10">
				<img src="<%=root%>/img/gudan/emblem/emblem-kt.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=7"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nexen.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=1"> <img
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
				<a href="<%=root%>/gudan?act=mvhome&tno=6">
				<img src="<%=root%>/img/gudan/emblem/emblem-lg.png"
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
				<a href="<%=root%>/gudan?act=mvhome&tno=5">
				<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=4">
				<img src="<%=root%>/img/gudan/emblem/emblem-nc.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=9"> <img
					src="<%=root%>/img/gudan/emblem/emblem-samsung.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12"></div>
		</div>
	</div>
</div>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>