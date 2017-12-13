<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.admin.model.NoticeDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp" %>

<%
List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("notilist");
int ntype = NullCheck.nullToZero(request.getParameter("ntype"));
%>

<script>

function noticelist(ntype,pg,key,word){
	document.location.href = "<%=root%>/admin?act=noticelist";
}
function noticeWrite(){
	document.location.href = "<%=root%>/admin?act=mvnowrite";
}
function viewnotice(no){
	document.location.href = "<%=root%>/admin?act=viewnotice&nno="+no;
}
</script>
<div id="notice" class="py-5">
	<div class="container py-5">

		<div class="row">
			<div class="col-md-12 px-5 mb-3">
				<h3>��������</h3>
			</div>
		</div>

		<div class="d-flex justify-content-center">
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist('0','1','','')">��ü����</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist('1','1','','')">�Ϲݰ���</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist('2','1','','')">��Ű���</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist('3','1','','')">1:1����</a></div>
		</div>
<%
if(memberDto != null){
	if("gksdjf".equals(memberDto.getId())){
	
%>
	<div align="right"><input type="button" value="�۾���" onclick="javascript:noticeWrite();"></div>	
<%
	}
%>
		
		<div class="row p-5">
			<div class="col-md-12">
				<table class="table table-sm">
					
						<tr>
							<td width="100"align="center">��ȣ</td>
							<td width="600" align="center">����</td>
							<td width="200" align="center">�����</td>
							<td width="150" align="center">��ȸ��</td>
						</tr>
					
					<tbody>
<%
	for(NoticeDto noticeDto:list){
%>
						<tr>
							<td align="center"><%= noticeDto.getNo()%></td>
							<td width="600" align="center"><a href="javascript:viewnotice('<%= noticeDto.getNo()%>');"><%= noticeDto.getSubject() %></a></td>
							<td width="200" align="center"><%= noticeDto.getWdate() %></td>
							<td width="150" align="center"><%=noticeDto.getCount() %></td>
						</tr>
					
<%
	}

}else{
%>
<script>
alert("�α����� �̿��� �ּ���");
document.location.href="<%=root%>/index.jsp";
</script>
<%
}
%>
					</tbody>
				</table>
			</div>
		</div>
		<form id="searchForm" name="searchForm" action="">
		<input type="hidden" id="act" name="act" value="listarticle">
		<input type="hidden" id="ntype" name="ntype" value="ntype">
		<input type="hidden" id="pg" name="pg" value="1">
			<div style="text-align:center;height:80px">
			<span>
			<select id="key" name="key">
				<option value="no">�۹�ȣ</option>
				<option value="subject">����</option>
			</select>
			<input type="text" id="word" name="word">
			<input type="button" name="" id="" value="�˻�" onclick="javascript:searchnotice()">
			</span>
			</div>
		</form>
		<div class="d-flex justify-content-center" name="" id="">

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
	<!-- container -->
</div>
<!-- notice -->

<!--footer ����-->
<%@ include file="/common/footer.jsp" %>