<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
String seq = (String) request.getAttribute("seq");
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<script type="text/javascript">
control = "/board";
</script>

<!-- ���ܳ׺������ -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5 text-center">
				
				<h5>�۾��⿡ �����Ͽ����ϴ�.</h5>
				<div class="p-2">
					<a class="btn btn-primary" href="javascript:viewArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=seq%>');" role="button"
						style="color: white !important;">Ȯ���ϱ�</a>
				</div>
				<div class="p-2">
					<a class="btn btn-secondary" href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');" role="button"
						style="color: white !important;">��ϰ���</a>
				</div>
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
						style="color: red;">2</span> ���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> ���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> �������� ���� �̷��� Ŀ��... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						���������� �׷����� ��... (65)</li>
				</ul>
			</div>

		</div>




	</div>
</div>


<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>