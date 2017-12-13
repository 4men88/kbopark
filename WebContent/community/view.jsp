<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.board.model.BoardDto,com.baseball.gudan.model.GudanDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
BoardDto boardDto = (BoardDto) request.getAttribute("article");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

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
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">����ȳ�</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=tno %>">������</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=tno%>');">Ŀ�´�Ƽ</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<!-- ����� ���� �ٽ� ��ƾ���!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="#"><i class="fa fa-pencil" aria-hidden="true"></i>
							���۾���</a> <a href="#">����</a> <a href="#">����</a>
					</div>
					<div class="px-2">
						<a href="#">�ֽŸ��</a>
					</div>
					<div class="px-2">
						<a href="#">���</a>
					</div>
					<div class="px-2">
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							������</a>
					</div>
					<div class="px-2">
						<a href="#">������ <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3">
					<h3><%=boardDto.getBname() %></h3>
					<h6><%=boardDto.getMid() %> <%=boardDto.getBdate() %></h6>
					<h6>��ȸ�� : <%=boardDto.getBcount() %></h6>
				</div>

				<div class="border-b my-2"></div>
				<p class="p-3 my-0"><%=boardDto.getBdetail() %></p>
				<div class="border-b my-2"></div>
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="javascript:moveWrite('<%=tno%>');"><i class="fa fa-pencil" aria-hidden="true"></i>
							���۾���</a> <a href="#">����</a> <a href="#">����</a>
					</div>
					<div class="px-2">
						<a href="#" style="color: #E64628 !important;"><i
							class="fa fa-bell" aria-hidden="true"></i> �Ű�</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','1','','');">�ֽŸ��</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');">���</a>
					</div>
					<div class="px-2">
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							������</a>
					</div>
					<div class="px-2">
						<a href="#">������ <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>



				<div class="pt-5">
					<h5>
						<strong>��۾���</strong>
					</h5>
				</div>

				<div class="border-b-strong"></div>
				<div class="p-3" style="background-color: #f0f0f0;">
					<form>
						<div class="form-group mb-1">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3"></textarea>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-sm btn-primary">���</button>
						</div>
					</form>
				</div>
				<div class="border-b p-0"></div>

				<table class="table table-sm">
					<tbody>
						<tr>
							<td>����ѹ�</td>
							<td nowrap colspan="3">Ottddddddddddddddddddddddddddddddddddd<br>ddddddddddddddddddddddddddddddddddddddddd<br>ddddddddddddddddddo</td>
							<td align="right">17.09.21</td>
						</tr>
						<tr>
							<td>�ź��̿�</td>
							<td colspan="3">Thornton</td>
							<td align="right">17.09.21</td>
						</tr>
						<tr>
							<td>�η��</td>
							<td colspan="3">Larry the Bird</td>
							<td align="right">17.09.21</td>
						</tr>
					</tbody>
				</table>


			</div>
			<!-- col-md-8 -->

			<div class="col-md-4 py-5">
				<h5>
					<strong>�ǽð�����Ʈ</strong>
				</h5>
				<div class="border-b-strong"></div>
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> �������� ���� �̷��� Ŀ��...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> ���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> ���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> �������� ���� �̷��� Ŀ��... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						���������� �׷������� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						���������� �׷������� ��... (65)</li>
				</ul>
			</div>

		</div>




	</div>
</div>


<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>