<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.admin.model.NoticeDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp" %>
<%
NoticeDto noticeDto = (NoticeDto)request.getAttribute("viewnotice");
if(noticeDto!=null){
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
</script>
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<!-- ����� ���� �ٽ� ��ƾ���!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<i class="" aria-hidden="true" font-size:"1">�ۼ��� : <%= noticeDto.getName() %></i>
						
					</div>
					
					<div class="px-2">
						<a href="javascript:noticelist('<%=ntype%>','<%=pg%>','<%=key%>','<%=word%>');">���</a>
					</div>
					
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3" >
					<div>�� �� : <%= noticeDto.getSubject() %></div>
					<div></div>
					<div></div>
					
				</div>

				<div class="border-b my-2"></div>
				<p class="p-3 my-0"><%= noticeDto.getContext() %></p>
				<div class="border-b my-2"></div>
			</div>
		</div>
	</div>
<%
}else{
%>
<script>
alert("�ش� �Խù��� �������� �ʽ��ϴ�");
document.location.href = "<%=root%>/admin?act=notice";
</script>
<%
}
%>

<!-- footer���� -->
<%@ include file="/common/footer.jsp" %>