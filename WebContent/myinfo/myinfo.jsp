<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" 
	import="java.util.List,com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto,com.baseball.auction.model.AuctionDetailDto,java.text.DecimalFormat"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>

<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/myinfo";

</script>


<a href="<%=root%>/myinfo?act=chargerookie&value=3000">�����ϱ�</a>





<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>