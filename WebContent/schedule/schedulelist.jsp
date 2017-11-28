<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/common/header.jsp"%>

<!-- header -->
<script type="text/javascript">

function viewSchedule(){
	
}

</script>


<center>


<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr valign="bottom">
		<td nowrap><a href="javascript:viewSchedule()"><img
				src="<%=root%>/img/board/btn_write_01.gif" width="64" height="22"
				border="0" align="absmiddle" alt="글쓰기"></a></td>

		<td width="100%" style="padding-left: 6px" valign="bottom">새글 <b><font
				class="text_acc_02"></font></b> / 전체 <font
			class="text_acc_02"></font></td>
		<td width="300" nowrap>
			<div align="right"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="5" style="padding: 0px"></td>
	</tr>
</table>

</center>

<!-- footer -->

<%@ include file="/common/footer.jsp"%>