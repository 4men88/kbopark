<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.admin.model.NoticeDto,com.baseball.admin.util.PageNavi"%>
<!--header ����-->
<%@ include file="/common/header.jsp" %>

<%
List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("notilist");
PageNavi pageNavigation = (PageNavi)request.getAttribute("navigator");
%>
<script>

function noticelist(ntype,pg,key,word){
	document.getElementById("nact").value = "notice";
	document.getElementById("ntype").value = ntype;
	document.getElementById("npg").value = pg;
	document.getElementById("nkey").value = key;
	document.getElementById("nword").value = word;
	
	document.getElementById("notiform").action="<%=root%>/admin";
	document.getElementById("notiform").submit();
}
function noticeWrite(){
	document.location.href = "<%=root%>/admin?act=mvnowrite";
}
function viewnotice(ntype,pg,key,word,nno){
	document.getElementById("nact").value = "viewnotice";
	document.getElementById("ntype").value = ntype;
	document.getElementById("npg").value = pg;
	document.getElementById("nkey").value = key;
	document.getElementById("nword").value = word;
	document.getElementById("nno").value = nno;
	
	document.getElementById("notiform").action="<%=root%>/admin";
	document.getElementById("notiform").submit();
}
function searchnotice(){
	document.getElementById("searchForm").action="<%=root%>/admin";
	document.getElementById("searchForm").submit();
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
			<div class="notice-inner p-3"><a href="javascript:noticelist('0','1','','');">��ü����</a></div>
			<div class="notice-inner p-3"><a href="javascript:noticelist('1','1','','')">�Ϲݰ���</a></div>
			<div class="notice-inner p-3"><a href="javascript:noticelist('2','1','','')">��Ű���</a></div>
			<div class="notice-inner p-3"><a href="javascript:noticelist('3','1','','')">1:1����</a></div>
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
							<td width="600" align="center"><a href="javascript:viewnotice('<%= noticeDto.getNtype()%>','<%=pg%>','','','<%=noticeDto.getNo()%>');"><%= noticeDto.getSubject() %></a></td>
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
		<input type="hidden" id="nact" name="act" value="notice">
		<input type="hidden" id="ntype" name="ntype" value=<%=ntype %>>
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
				<%= pageNavigation.getNavigator() %>
			</div>
		</div>

	</div>
	<!-- container -->
</div>
<!-- notice -->

<!--footer ����-->
<%@ include file="/common/footer.jsp" %>