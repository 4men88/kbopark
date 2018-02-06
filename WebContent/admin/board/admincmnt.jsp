<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List,com.baseball.board.model.BoardDto"%>
<%@ include file="/common/header.jsp" %>
<%
List<BoardDto> list = (List<BoardDto>)request.getAttribute("clist");

%>
<script>
control = "/board";
function deleteBoard(bno){
	document.location.href="<%=root%>/admin?act=deleteboard&bno="+bno;
}
</script>
<%
if("gksdjf".equals(memberDto.getId())){
%>
<center>
<h3>게시물관리</h3>
<table border="1" width="800px">
<tr>
	<td width="70px">글번호</td>
	<td width="100px">작성자</td>
	<td width="250px">제목</td>
	<td width="70px">조회수</td>
	<td width="100px">작성일</td>
	<td width="70px">신고횟수</td>
</tr>
<%
	for(BoardDto boardDto : list){
%>
	<tr>
		<td width="70px"><%=boardDto.getBno() %></td>
		<td width="100px"><%=boardDto.getMid() %></td>
		<td width="250px">
		<a href="javascript:viewArticle('<%=boardDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');">
		<%=boardDto.getBname()%></a>
		</td>
		<td width="70px"><%=boardDto.getBcount() %></td>
		<td width="100px"><%=boardDto.getBdate()%></td>
		<td width="70px"><%=boardDto.getBstatus()%></td>
		<td width="50px">
		<input type="button" value="삭제" onclick="javascript:deleteBoard(<%=boardDto.getBno()%>);">
		</td>
	</tr>
<%
	}
%>


</table>
</center>
<%
}else{
%>
<script>
alert("관리자 전용 페이지 입니다");
document.location.href="<%=root%>/index.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp" %>