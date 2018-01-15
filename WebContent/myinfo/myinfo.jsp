<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.List,com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto,com.baseball.auction.model.AuctionDetailDto,java.text.DecimalFormat"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
	String myemblem = (String) request.getAttribute("myemblem");
	DecimalFormat df = new DecimalFormat("#,##0");
	
List<BoardDto> hotboard = (List<BoardDto>) request.getAttribute("hotboard");
List<AuctionDetailDto> hotauction = (List<AuctionDetailDto>)request.getAttribute("hotauction");
int auctionLen = hotauction.size();
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/myinfo";

function openpay() {		
	window.open("<%=root%>/myinfo?act=mvpay",
						"pay",
						"width=360,height=545,top=100,left=100,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=yes");
	}

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

<div>
	<div class="container py-5">
		<div class="row py-5">

			<div class="col-md-4 text-white p-5"
				style="background-color: #00133E;">
				<h3><%=memberDto.getName()%>(<%=memberDto.getId()%>)님
				</h3>
				가입일 :
				<%=memberDto.getJoindate()%>
				<div class="border-b my-3"></div>
				<h3><%=memberDto.getTel1()%>-<%=memberDto.getTel2()%>-<%=memberDto.getTel3()%></h3>
				<br /> <a class="text-white" href="">정보수정<i
					class="fa fa-angle-right px-2" aria-hidden="true"></i></a>
			</div>

			<div class="col-md-4 p-5" style="background-color: #FAFAFA;">
				<h3>보유루키</h3>
				루키로 경매에 참여해보세요
				<div class="border-b my-3"></div>

				<div class="row justify-content-between">
					<div class="col-4">보유잔액</div>
					<div class="col-8 text-right">
						<h3><%=df.format(memberDto.getRookie())%>원
						</h3>
					</div>
				</div>
				<br /> <a href="javascript: openpay();"> 루키충전<i
					class="fa fa-angle-right px-2" aria-hidden="true"></i>
				</a>
			</div>

			<div class="col-md-4 p-5" style="background-color: #EEF3F7;">
				<h3><%=memberDto.getFavoriteteam()%></h3>
				선호구단은 회원정보에서 수정가능합니다
				<div class="border-b my-3"></div>
				<p class="text-center m-0">
					<img src="<%=root%><%=myemblem%>" style="height: 89px;"
						class="img-fluid">
				</p>
			</div>

		</div>
	</div>
</div>




<div id="comm-home">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-6 py-5">

				<h5>
					<strong><%=memberDto.getFavoriteteam().substring(0, memberDto.getFavoriteteam().indexOf(' '))%>&nbsp;HOT루키경매</strong>
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
					<strong><%=memberDto.getFavoriteteam().substring(0, memberDto.getFavoriteteam().indexOf(' '))%>&nbsp;HOT커뮤니티</strong>
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
								<a href="javascript:goBoardView('<%=tno%>','1','','','<%=boardDto.getBno()%>');"><img src="<%=root%><%=myemblem %>"
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







<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div id="main-gudan-logo" class="py-5">
	<div class="container">
		<div class="row">
			<div class="p-0 col-md-1 col-12"></div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-mobile">
				<a href=""> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=3"> <img
					src="<%=root%>/img/gudan/emblem/emblem-lotte.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=10"> <img
					src="<%=root%>/img/gudan/emblem/emblem-kt.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=7"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nexen.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=1"> <img
					src="<%=root%>/img/gudan/emblem/emblem-kia.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-pc">
				<a href="<%=root%>/gudan?act=mvhome&tno=2"> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=6"> <img
					src="<%=root%>/img/gudan/emblem/emblem-lg.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=8"> <img
					src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=5"> <img
					src="<%=root%>/img/gudan/emblem/emblem-sk.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=4"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nc.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="<%=root%>/gudan?act=mvhome&tno=9"> <img
					src="<%=root%>/img/gudan/emblem/emblem-samsung.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12"></div>
		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>