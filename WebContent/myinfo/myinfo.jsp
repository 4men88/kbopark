<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" 
	import="java.util.List,com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto,com.baseball.auction.model.AuctionDetailDto,java.text.DecimalFormat"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>

<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/myinfo";

function openpay() {		
	window.open("<%=root%>/myinfo?act=mvpay", "pay", "width=360,height=545,top=100,left=100,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=yes");
}
</script>

<center>

<div class="py-5">
<a href="javascript: openpay();">충전하기</a>
</div>

</center>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>