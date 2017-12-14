<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.admin.model.NoticeDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp" %>

<%

List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("notilist");
%>

<script>
function noticelist(){
	document.location.href = "<%=root%>/admin?act=noticelist";
}
function noticeWrite(){
	document.location.href = "<%=root%>/admin?act=mvnowrite";
}

</script>
<div id="notice" class="py-5">
	<div class="container py-5">

		<div class="row">
			<div class="col-md-12 px-5 mb-3">
				<h3>공지사항</h3>
			</div>
		</div>

		<div class="d-flex justify-content-center">
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=notice">전체공지</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist&ntype=1">일반공지</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist&ntype=2">경매공지</a></div>
			<div class="notice-inner p-3"><a href="<%=root%>/admin?act=noticelist&ntype=3">1:1문의</a></div>
		</div>
<%
if(memberDto != null){
	if("gksdjf".equals(memberDto.getId())){
	
%>
	<div align="right"><input type="button" value="글쓰기" onclick="javascript:noticeWrite();"></div>	
<%
	}
%>
		
		<div class="row p-5">
			<div class="col-md-12">
				<table class="table table-sm">
					
						<tr>
							<td width="100"align="center">번호</td>
							<td width="600" align="center">제목</td>
							<td width="200" align="center">등록일</td>
							<td width="150" align="center">조회수</td>
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
alert("로그인후 이용해 주세요");
document.location.href="<%=root%>/index.jsp";
</script>
<%
}
%>
					</tbody>
				</table>
			</div>
		</div>

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

<!--footer 영역-->
<%@ include file="/common/footer.jsp" %>