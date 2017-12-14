<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.admin.model.NoticeDto"%>
<!--header 영역-->
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

				<!-- 모바일 라인 다시 잡아야함!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<i class="" aria-hidden="true" font-size:"1">작성자 : <%= noticeDto.getName() %></i>
						
					</div>
					
					<div class="px-2">
						<a href="javascript:noticelist('<%=ntype%>','<%=pg%>','<%=key%>','<%=word%>');">목록</a>
					</div>
					
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3" >
					<div>제 목 : <%= noticeDto.getSubject() %></div>
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
alert("해당 게시물은 존재하지 않습니다");
document.location.href = "<%=root%>/admin?act=notice";
</script>
<%
}
%>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp" %>