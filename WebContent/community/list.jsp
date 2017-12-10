<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.board.model.BoardDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articlelist");
System.out.println("list.jsp size >>> " + list.size());
%>

<script type="text/javascript">
control = "/board";

</script>


>>>>>>>>>>>>>>>>>>>>>>><%=tno %>
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

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end"
						style="background-color: white;">
						<li class="breadcrumb-item"><i class="fa fa-home mr-2"
							aria-hidden="true"></i><a href="#">����</a></li>
						<li class="breadcrumb-item"><a href="#">���Ÿ�̰���</a></li>
						<li class="breadcrumb-item active" aria-current="page">Ŀ�´�Ƽ</li>
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
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=tno%>', '<%=pg%>', '<%=key%>', '<%=word%>');">Ŀ�´�Ƽ</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>

<div id="comm-best" class="py-5">
	<div class="container py-5">
		<h5>
			<strong>�ǽð�����Ʈ</strong>
		</h5>
		<div class="border-b-strong"></div>
		<div class="row">
			<div class="col-md-6 py-3">
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> �������� ���� �̷��� Ŀ��...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> ���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> ���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
				</ul>
			</div>
			<div class="col-md-6 py-3">
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> �������� ���� �̷��� Ŀ��... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						���������� �׷����� �ϼ��� ��ź��... (65)</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="communitylist" class="pt-5">
	<div class="container">
	<div class="d-flex">
		<div class="mr-auto p-2">
			<a class="btn btn-primary btn-sm" href="" role="button"
				style="color: white !important;"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;���۾���</a>
		</div>
		<div class="p-2">
				<form>
					<div class="form-row">
						<div class="form-group col-md-4">
							<select class="form-control form-control-sm" id="">
								<option>���̵�</option>
								<option>����</option>
								<option>����</option>
							</select>
						</div>
						<div class="form-group col-md-8">
							<div class="input-group input-group-sm">
								<input type="text" class="form-control form-control-sm"
									placeholder="" aria-label=""> <span
									class="input-group-btn">
									<button class="btn btn-primary" type="button">�˻�</button>
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
			<a href="#"
				class="list-group-item list-group-item-action flex-column align-items-start">
				<div class="row">
					<div class="col-md-2 text-center align-self-center">
						<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
							width="100%" style="min-height: 100px; max-height: 100px;">
					</div>
					<div class="col-md-10">
						<h5 class="mb-1"><%=boardDto.getBname() %>(30)</h5>
						<small><%=boardDto.getMid() %> | <%=boardDto.getBdate() %> | ��ȸ��: <%=boardDto.getBcount() %></small>
						<p class="mt-2 mb-0"><%=boardDto.getBdetail() %></p>
					</div>
				</div>
			</a>			
<%
	}
} else {
%>

<h6>�ۼ��� ���� �����ϴ�.</h6>

<%
}
%>
		</div>
	</div>
</div>



<div class="container py-5">

	<div class="d-flex justify-content-center">
		<div>
			<ul class="pagination pagination-sm">
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
</div>



<!-- ���ܺ� �ΰ� >> ��ũ ������������ -->
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

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>