<%@ page language="java" contentType="text/html; charset=EUC-KR"
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 386d1b8a23fbb77fe3828318b532cd8f241fafa1
    pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDetailDto,java.util.*"%>
<%@ include file="/admin/adcom/adheader.jsp" %>
<%
List<MemberDetailDto> list = (List<MemberDetailDto>)request.getAttribute("userList");
System.out.println("sdfsdf"+list.get(1).getId());
%>
<center>

<div style="height:50px; margin-top:20px; align-content:center"><h4>ȸ������</h4></div>
<table width="1000px">
<tr>
	<td>�� ��&nbsp;<input type="text" id="aname" name="aname" value=""></td>
	<td>���̵�&nbsp;<input type="text" id="aid" name="aid" value=""></td>
	<td>ȸ����ȣ&nbsp;<input type="text" id="ano" name="ano" value=""></td>
	<td>ȸ������&nbsp;
		<select name="">
		<option value="ing" selected="selected">ȸ��</option>
		<option value="stop">����</option>
		<option value="fire">Ż��</option>
		</select>
	</td>
	<td>
	<input type="button" id=""; name=""; onclick="javascript:" value="�˻�">
	</td>
</tr>
</table>
<div style="height:15px;  border-bottom: 1px solid black"> </div>
<form name="" id="" method="">
<table width="1000px">
<tr>
<td align="center">�̸�</td>
<td align="center">���̵�</td>
<td align="center">������Ű</td>
<td align="center">�г�Ƽ</td>
<td align="center">ȸ������</td>
</tr>
<%
int size = list.size();
if(size!=0){
	for(MemberDetailDto memberDetailDto : list){
%>
	<tr>
	<td align="center"><%= memberDetailDto.getName()%></td>
	<td align="center"><%= memberDetailDto.getId()%></td>
	<td align="center"><%= memberDetailDto.getRookie()%></td>
	<td align="center"><%= memberDetailDto.getPenalty()%></td>
	<td align="center"><%= memberDetailDto.getMstatus()%></td>
	<td align="center"><input type="button" name="<%= memberDetailDto.getId()%>" id="<%= memberDetailDto.getId()%>" value="����">
	</tr>
<%
	}
}else{
%>

<%
}
%>
</table>
</form>
</center>
<%@ include file="/admin/adcom/adfooter.jsp" %>
<<<<<<< HEAD

=======
=======
    pageEncoding="EUC-KR"%>
<%--<%@ include file="/admin/adcom/adheader.jsp" 
ȸ������

<%@ include file="/admin/adcom/adfooter.jsp" %>--%>
>>>>>>> e09b44669a89fcd0040fe31a2af7564cfbaa207e
>>>>>>> 386d1b8a23fbb77fe3828318b532cd8f241fafa1
