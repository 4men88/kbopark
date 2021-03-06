<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" 
	import="java.util.List,com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto,com.baseball.auction.model.AuctionDetailDto,java.text.DecimalFormat"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
List<BoardDto> hotboard = (List<BoardDto>) request.getAttribute("hotboard");
List<AuctionDetailDto> hotauction = (List<AuctionDetailDto>)request.getAttribute("hotauction");

DecimalFormat df = new DecimalFormat("#,##0");
int auctionLen = hotauction.size();
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/gudan";

function goBoardView(tno, pg, key, word, seq) {
	control = "/board";
	viewArticle(tno, pg, key, word, seq);
}

function startTime() {
 	var alen = <%=auctionLen%>;
	var params = "act=timer&alen="+alen;
<%
	String param = "";
	for (int i=0;i<auctionLen;i++) {
		param += "&curtime" + i + "=" + hotauction.get(i).getEndTime();
		System.out.println(param);
	}
%>
	params += "<%=param%>";
	sendRequest("<%=root%>/gudan", params, getTime, "GET");    
}

function getTime() {
	   if(httpRequest.readyState == 4) {
	      if(httpRequest.status == 200) {
	    	  var txt = httpRequest.responseText;
	    	  var result = txt.split(",");
	    	  for (i=0;i<result.length;i++) {
	    		  var idname = 'auctime' + i;
	  		  	  document.getElementById(idname).innerHTML = result[i];
	    	  }
	    	  window.setTimeout("startTime();", 1000);
	      }
	   }   
}

$(document).ready(function(){
	startTime();
});
</script>

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-home">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-6 py-5">

				<h5>
					<strong>HOT루키경매</strong>
				</h5>
				<div class="border-b-strong mb-3"></div>
				
				<ul class="list-group">
<%
int alen = hotauction.size();
for(int i=0;i<alen;i++) {
	AuctionDetailDto adto = hotauction.get(i);
%>					
					<li class="list-group-item">
						<div class="row px-2" style="height: 120px;">
							<div class="img-wrapper align-self-center text-center col-4" style="max-height: 100%; overflow: hidden;">
								<a href="javascript:alert('연결필요');"><img src="<%=root%><%=adto.getAimage() %>" class="img-fluid"></a>
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<a href="javascript:alert('연결필요');"><b><%=adto.getAname() %></b></a>
								</h5>
								<p class="my-1">현재입찰가 : <strong><%=df.format(adto.getBidPrice()) %> 원</strong></p>
								<h6 style="color: #2e8de5;">남은시간 : 
								<strong id="auctime<%=i%>"></strong>
								</h6>
							</div>
						</div>
					</li>
<%
}
for(int i=0;i<3-alen;i++) {
%>		
					<li class="list-group-item">
						<div class="row px-2" style="height: 120px;">
							<div class="col-12 align-self-center text-center">
								HOT물품이 없습니다
							</div>
						</div>
					</li>
<%
	}
%>	
				</ul>
				<p class="text-dark text-right py-1" style="font-size: 14px;"><a href="#">+ 전체보기</a></p>
			</div>
			
			<div class="col-md-6 py-5">
				<h5>
					<strong>HOT커뮤니티</strong>
				</h5>
				<div class="border-b-strong mb-3"></div>
				<ul class="list-group">
<%
int blen = hotboard.size();
for(BoardDto boardDto : hotboard) {
%>				
					<li class="list-group-item">
						<div class="row px-2" style="height: 120px;">
							<div class="img-wrapper-c text-center col-4 align-self-center">
								<a href="javascript:goBoardView('<%=tno%>','1','','','<%=boardDto.getBno()%>');"><img src="<%=root%><%=gudanDto.getEmblem() %>"
									class="img-fluid"></a>
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<a href="javascript:goBoardView('<%=tno%>','1','','','<%=boardDto.getBno()%>');"><b><%=boardDto.getBname() %></b></a>
								</h5>
								<a href="javascript:goBoardView('<%=tno%>','1','','','<%=boardDto.getBno()%>');"><p class="my-1 over-detail"><%=boardDto.getBdetail() %></p></a>
							</div>
						</div>
					</li>
<%
}
for(int i=0;i<3-blen;i++) {
%>		
					<li class="list-group-item">
						<div class="row px-2" style="height: 120px;">
							<div class="col-12 align-self-center text-center">
								HOT게시물이 없습니다
							</div>
						</div>
					</li>
<%
	}
%>						
				</ul>
				<p class="text-dark text-right py-1" style="font-size: 14px;"><a href="javascript:listArticle('<%=tno%>');">+ 전체보기</a></p>
			</div>
		</div>
	</div>
</div>


<a class="py-4 btn btn-primary btn-lg btn-block" href="<%=gudanDto.getWeb1()%>" role="button" style="border-radius: 0; color: white !important;" target="_blank">구단 공식 홈페이지 바로가기</a>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>