<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.List,com.baseball.board.model.BoardDto"%>
<%@ include file="/common/header.jsp" %>
<%
List<BoardDto> list = (List<BoardDto>)request.getAttribute("clist");

%>
<script>
function deleteBoard(bno){
	document.location.href="/admin?act=deleteboard&bno="+bno;
}
</script>
<%
if("gksdjf".equals(memberDto.getId())){
%>
<center>
<h3>�Խù�����</h3>
<table border="1" width="1024px">
<tr>
	<td width="70px">�۹�ȣ</td>
	<td width="100px">�ۼ���</td>
	<td width="250px">����</td>
	<td width="350px">����</td>
	<td width="70px">��ȸ��</td>
	<td width="100px">�ۼ���</td>
	<td width="70px">�Ű�Ƚ��</td>
</tr>
<%
	for(BoardDto boardDto : list){
%>
	<tr>
		<td width="70px"><%=boardDto.getBno() %></td>
		<td width="100px"><%=boardDto.getMid() %></td>
		<td width="250px"><%=boardDto.getBname() %></td>
		<td width="350px"><%=boardDto.getBdetail() %></td>
		<td width="70px"><%=boardDto.getBcount() %></td>
		<td width="100px"><%=boardDto.getBdate()%></td>
		<td width="70px"><%=boardDto.getBstatus() %></td>
		<td>
		<input type="button" value="����" onclick="javascript:deleteBoard(<%=boardDto.getBno()%>);">
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
alert("������ ���� ������ �Դϴ�");
document.location.href="<%=root%>/index.jsp";
</script>
<%
}
%>
<%@ include file="/common/footer.jsp" %>