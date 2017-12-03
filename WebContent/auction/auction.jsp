<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,java.util.List"%>
<!--header 영역 -->
<%@ include file="/common/header.jsp"%>


유니폼, 경기용품, 응원용품, 기타잡화 유니폼 -> 상의, 하의, 모자,기타 응원용품 -> 피켓, LED피켓, 기타 경기용품 ->
야구공, 배트, 벨트, 헬멧, 글러브, 배팅장갑, 수비장갑, 팔보호대, 안면보호대, 무릎보호대, 발목보호대 야구화, 기타 잡화용품
-> 사진, 티켓, 카드, 기타
작업중 ㅠㅠ


<%
	List<AuctionDetailDto> auctionDetailDto = (List<AuctionDetailDto>)request.getAttribute("auctionDetailDto");
	String list = request.getParameter("list");
 	
	String active1 = "active";
	String active2 = "";
	String active3 = "";
	String active4 = "";
	if("end".equals(list))
	{
		active1 = "";
		active2 = "active";
		active3 = "";
		active4 = "";
	}
%>

<div class="container py-5 my-5">

	<div class="navbar-template text-center"></div>
</div>

<!-- 추천별 경매물품 섹션: best pick: 관리자가 초이스한 상품들 -->
<div id="auc-recommended" class="py-5">
<script type="text/javascript">
function bestList(){
	document.location.href = "<%=root%>/auctionlist?act=bestlist";
}
function endList(){
<%--	document.location.href = "<%=root%>/auctionlist?act=endlist";
	document.getElementById("commonForm").submit();   --%>
	document.getElementById("auctionListForm").action = "<%=root%>/AuctionController?act=endlist";
	

}
function hitList(){
	document.location.href = "<%=root%>/auctionlist?act=hitlist";
}
function newList(){
	document.location.href = "<%=root%>/auctionlist?act=newlist";
}


</script>
  <form action="" name="auctionListForm" >
<div class="container py-5">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs nav-justified" role="tablist">
		<li class="nav-item"><a class="nav-link <%=active1%>" data-toggle="tab"
			href="#menu1">BEST PICK</a></li>
		<li class="nav-item"><a class="nav-link <%=active2%>"  data-toggle="tab"
			href="#menu2" onclick="javascript:endList();">마감임박</a></li>
		<li class="nav-item"><a class="nav-link <%=active3%>"  data-toggle="tab"
			href="#menu3" onclick="javascript:hitList();">인기물품</a></li>
		<li class="nav-item"><a class="nav-link <%=active4%>" data-toggle="tab"
			href="#menu4">신규물품</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="menu1" class="container tab-pane active">
			<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 22명<br>남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 70,000원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 31명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 100,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
<!--  -->
		<div id="menu2" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
int size = 0;
if(auctionDetailDto != null)
{
	size = auctionDetailDto.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">				
							<img src="<%=root%>/<%=auctionDetailDto.get(i).getAimage()%>" class="img-fluid">												
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=auctionDetailDto.get(i).getAname()%></strong><br>입찰자수 :<%=auctionDetailDto.get(i).getBidNum()%>명<br>
								남은시간 : 3일 2시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=auctionDetailDto.get(i).getBidPrice()%></strong>
							</p>
						</div>
					</div>
				</div>
<%
	}
}
%>
			</div>
		</div>
<!--  				
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 21명<br>남은시간 : 2일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 4,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 97명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 120,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
-->		

		<div id="menu3" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
size = 0;
if(auctionDetailDto != null)
{
	size = auctionDetailDto.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=auctionDetailDto.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=auctionDetailDto.get(i).getAname()%></strong><br>입찰자수 :<%=auctionDetailDto.get(i).getBidNum()%>명<br>
								남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=auctionDetailDto.get(i).getBidPrice()%></strong>
							</p>
						</div>
					</div>
				</div>
<%
	}
}
%>
			</div>
		</div>
<!--  			<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 21명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 9,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 212명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 8,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 91명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 150,000원</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
-->		

		<div id="menu4" class="container tab-pane fade">
			<div class="row p-2 text-center">

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 공인구</strong><br>입찰자수 : 12명<br>남은시간 : 4일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : 70,300원</strong>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대1</strong><br>입찰자수 : 32명<br>남은시간 : 1일 2시간 15분
							</p>
							<p>
								<strong>현재입찰가 : 5,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대2</strong><br>입찰자수 : 202명<br>남은시간 : 3일 3시간 20분
							</p>
							<p>
								<strong>현재입찰가 : 9,000원</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong>KBO 팀코리아 중 아대3</strong><br>입찰자수 : 98명<br>남은시간 : 1일 1시간 12분
							</p>
							<p>
								<strong>현재입찰가 : 111,000원</strong>
							</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
</div>

<div class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-6 p-0">
				<div id="image-overlay"></div>
				<div>
					<img src="<%=root%>/img/auction/auction-hanwha.jpg" class="img-fluid">
				</div>
			</div>
			<div class="p-0 col-md-3 col-6" style="">
				<img src="<%=root%>/img/auction/auction-doosan.jpg" class="img-fluid">
				<div class="carousel-caption">두산 베어스</div>
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-kia.jpg" class="img-fluid"
					style="overflow: hidden">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-lotte.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="p-0 col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-samsung.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-kt.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-nexen.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-nc.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-sk.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-lg.jpg" class="img-fluid">
			</div>
		</div>
	</div>
</div>

<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div class="py-5" style="background-color: #3452FF;">
	<div class="container text-center">
		<div class="row">
			<div class="col-md-12 col-12">
				<a class="text-white" href="#">한화 이글스</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">두산 베어스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KIA
					타이거즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">롯데 자이언츠</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">삼성 라이온즈</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KT
					위즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">넥센 히어로즈</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">NC 다이노스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">SK
					와이번스</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">LG 트윈스</a>
			</div>
		</div>
	</div>
</div>
</form>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>