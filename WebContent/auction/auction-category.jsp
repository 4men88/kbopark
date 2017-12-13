<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
   java.util.*, java.text.*,java.io.*"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>

<%!
//리스트 길이 담을 변수
int categoryConListLen;	
int categoryEndListLen;
%>
<%
	List<AuctionDetailDto> categoryConList = (List<AuctionDetailDto>)request.getAttribute("categoryConList");
	List<AuctionDetailDto> categoryEndList = (List<AuctionDetailDto>)request.getAttribute("categoryEndList");
 	//endTime만 따로 리스트에 담을 리스트
   List<String> categoryConListTimeArr = new ArrayList<String>();	
   List<String> categoryEndListTimeArr = new ArrayList<String>();	
   String category1 = (String)request.getAttribute("category1");
   String category2 = (String)request.getAttribute("category2");
      
   if(categoryConList != null)	//리스트가 널이 아니면
   {
	   categoryConListLen = categoryConList.size();	//사이즈 재고
   		for(int i=0; i<categoryConListLen; i++)	//사이즈만큼
   		{
   			categoryConListTimeArr.add(i, categoryConList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
 		}
   }
   if(categoryEndList != null)
   {
	   categoryEndListLen = categoryEndList.size();
	   for(int i=0; i<categoryEndListLen; i++)
  		{
		   categoryEndListTimeArr.add(i, categoryEndList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
  		}
   }
%>
<script type="text/javascript" src="/kbopark/js/httpRequest.js"></script>
<script type="text/javascript">
	$(function() {
		'use strict'

		$('[data-toggle="offcanvas"]').on('click', function() {
			$('.row-offcanvas').toggleClass('active')
		})
	})
	
function getTime() {
   if(httpRequest.readyState == 4) {
      if(httpRequest.status == 200) {
         var ctime = httpRequest.responseText;	//현재시간(2017.12.07.11.42.30) 포멧
         var ctimearr = ctime.split("."); 	// .빼고 배열로 만들고
         var cdate;		//현재시간으로 Date 객체 만들 변수
         var csec;		//현재시간을초로 변환할 변수
         
         var dtime;	//db에서 얻어온 시간 담을 변수
         var dtimearr;	
         var ddate; //DB에서 얻어온시간을로 만든 Date 객체
         var dsec;	//DB에서 얻어온시간을초로 변환
         
         var sresult;	//두 시간 차 초
         var day = 0;
         var time = 0;
         var min = 0;
         var sec = 0;
         // 서버에서 가져온 현재시간으로 Date객체 생성
			cdate = new Date(ctimearr[0]+"-"+ctimearr[1] +"-"+ctimearr[2]+"T"+ctimearr[3]+":"+ctimearr[4]+":"+ctimearr[5]+".323");
			csec = cdate.getTime();	//밀리커리 세컨드 단위로 변환
<%
		
		for(int i=0; i<categoryConListLen; i++)
		{
%>			
			dtime = "<%=categoryConListTimeArr.get(i)%>";	
			dtimearr = dtime.split(".");
			ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
			dsec = ddate.getTime();
			
//			cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
			result = dsec - csec;
//					alert(dsec + "        " + csec + "         " + result);
			if(result >0)	//남은시간이 있다면
				{
					day = Math.floor(result/86400000);
					result -= day*86400000;
					
					time =Math.floor(result/3600000);
					result -= time*3600000;
					
					min = Math.floor(result/60000);
					result -= min*60000;
					
					sec = Math.floor(result/1000);					
					
					if(day>0)	
						{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
						}
					else if(time >0)
						{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
						}
					else if(min > 0)
						{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
						}
					else{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
					}
				}
			
			else{	//남은시간이 없다면
            document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";
				if(<%=categoryConList.get(i).getAstatus()%> == 1)
					{
						document.getElementById("aano").value = "<%=categoryConList.get(i).getAno()%>";
						document.getElementById("aact").value = "statuschange";
						document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
						document.getElementById("auctionForm").submit();						
					}
				}
<%  
}
%>

<%
for(int i=0; i<categoryEndListLen; i++)
{
%>			
	dtime = "<%=categoryEndListTimeArr.get(i)%>";	
	dtimearr = dtime.split(".");
	ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
	dsec = ddate.getTime();
	
//	cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
	result = dsec - csec;
//			alert(dsec + "        " + csec + "         " + result);
	if(result >0)	//남은시간이 있다면
		{
			day = Math.floor(result/86400000);
			result -= day*86400000;
			
			time =Math.floor(result/3600000);
			result -= time*3600000;
			
			min = Math.floor(result/60000);
			result -= min*60000;
			
			sec = Math.floor(result/1000);					
			
			if(day>0)	
				{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";
		if(<%=categoryEndList.get(i).getAstatus()%> == 1)
			{
				document.getElementById("aano").value = "<%=categoryEndList.get(i).getAno()%>";
				document.getElementById("aact").value = "statuschange";
				document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
				document.getElementById("auctionForm").submit();						
			}
		}
<%  
}
%>	
			window.setTimeout("startTime();", 1000);
      }
   }
}
window.onload=function() {
	   startTime();
	}
	
	function startTime() {
   var params = "act=timelist";
   sendRequest("<%=root%>/auctioncontroller", params, getTime, "POST");   
}
	
	document.getElementById("asort").value = 4;
function categoryList(key, word, category1, category2, gudan)
{
	document.getElementById("aact").value = "categorylist";
	document.getElementById("apg").value = "1";
	document.getElementById("akey").value = "";
	document.getElementById("aword").value = "";
	document.getElementById("acategory1").value = category1; 
	document.getElementById("acategory2").value = category2; 
	document.getElementById("agudan").value = gudan; 
	document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
	document.getElementById("auctionForm").submit();		
}	
function auctionsort(sort)
{
	document.getElementById("asort").value = sort;
	categoryList('','','<%=category1%>','<%=category2%>','');	
}
</script>
<div class="container-fluid auction-category">
	<div class="row row-offcanvas row-offcanvas-left">
		<nav class="col-6 col-md-2 bg-light sidebar-offcanvas pt-3 pb-5"
			id="sidebar">
			<div class="pb-5">
				<a class="nav-link" href="javascript:categoryList('','','','','','');">전체보기</a>
				<a class="nav-link" href="javascript:categoryList('','','1','','');">유니폼</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','1','1','');">상의</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','2','');">하의</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','3','');">모자</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','4','');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','2','','');">경기용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','2','1','');">야구공</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','2','');">배트</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','3','');">글러브</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','4','');">보호장구</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','5');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','3','');">응원용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','3','1');">피켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','2');">LED피켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','3');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','4','');">기타잡화</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','4','1');">사진</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','2');">티켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','3');">카드</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','4','');">기타</a>
				</nav>
			</div>
		</nav>

		<div>
			<p class="float-left d-md-none">
				<button type="button"
					class="align-self-center btn btn-primary btn-sm"
					data-toggle="offcanvas">
					카테고리&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i>
				</button>
			</p>
		</div>

		<div class="col-12 col-md-10 px-5 pt-2">

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end mb-0"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">전체</a></li>
						<li class="breadcrumb-item"><a href="#">유니폼</a></li>
						<li class="breadcrumb-item active" aria-current="page">모자</li>
					</ol>
				</nav>
			</div>

			<!--/row-->
			<div class="row">
				<div class="jumbotron"
					style="min-height: 260px; width: 100%; background-image: url('<%=root%>/img/auction/category/uniform-cap.jpg'); background-size: cover;">

				</div>
				<div class="row">

					<div id="auc-recommended" class="pb-5">
						<div class="container py-5">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs nav-justified" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#menu1">진행경매</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu2">종료경매</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">							
							
								<div id="menu1" class="container tab-pane active">
								
									<div class="row p-2 text-right">
										<div class="dropdown show col-md-12 align-self-end">
											<a class="btn dropdown-toggle btn-sm" href="#"
												role="button" id="dropdownMenuLink" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false" style="width: 160px;"> 정렬보기 </a>

											<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
												<a class="dropdown-item" href="javascript:auctionsort('1');">인기경매순</a>
												<a class="dropdown-item" href="javascript:auctionsort('2');">마감임박순</a>
												<a class="dropdown-item" href="javascript:auctionsort('3');">신규경매순</a>
												<a class="dropdown-item" href="javascript:auctionsort('4');">조회많은순</a>
												<a class="dropdown-item" href="javascript:auctionsort('5');">조회적은순</a>
												<a class="dropdown-item" href="javascript:auctionsort('6');">높은가격순</a>
												<a class="dropdown-item" href="javascript:auctionsort('7');">낮은가격순</a>
											</div>
										</div>
									</div>
									
									<div class="row p-2 text-center">									
<%
if(categoryConList != null)
{
	for(int i=0; i<categoryConListLen; i++) {
		AuctionDetailDto auctionDetailDto = categoryConList.get(i);
%>								
										<div class="col-md-3">
											<div class="row p-2">
												<div class="col-md-12 col-4 align-self-center">
													<img src="<%=root%>/<%=auctionDetailDto.getAimage()%>" class="img-fluid">
												</div>
												<div class="col-md-12 col-8 align-self-center">
													<p class="mb-2">
														<strong><%=auctionDetailDto.getAname()%></strong><br>입찰자수 : 
														<%=auctionDetailDto.getBidNum()%>명<br>
														<div id="categorycontime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>현재입찰가 : <%=auctionDetailDto.getBidPrice()%></strong>
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
								<div id="menu2" class="container tab-pane fade">
									<div class="row p-2 text-center">
<%
if(categoryEndList != null)
{
	for(int i=0; i<categoryEndListLen; i++) {
		AuctionDetailDto auctionDetailDto = categoryEndList.get(i);
%>											
										<div class="col-md-3">
											<div class="row p-2">
												<div class="col-md-12 col-4 align-self-center">
													<img src="<%=root%>/<%=auctionDetailDto.getAimage()%>" class="img-fluid">
												</div>
												<div class="col-md-12 col-8 align-self-center">
													<p class="mb-2">
														<strong><%=auctionDetailDto.getAname()%></strong><br>입찰자수 : <%=auctionDetailDto.getBidNum()%>명
														<br><div id="categoryendtime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>현재입찰가 : <%=auctionDetailDto.getBidPrice()%>원</strong>
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
								
							</div>
						</div>

						<div class="col-12 py-3" >
							<ul class="pagination pagination-sm">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--right section-->
			</div>
			<!--/row-->



			<!-- 구단별 로고 >> 링크 구단페이지로 -->
			<div id="main-gudan-logo" class="py-5">
				<div class="container">
					<div class="row text-center">
						<div class="col-md-12">
							<h4 class="mb-3">구단별 모아보기</h4>
						</div>
					</div>
					<div class="row">
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','3');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-lotte.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','10');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-kt.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','7');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-nexen.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','1');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-kia.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center main-doosan-pc">
							<a href="javascript:categoryList('','','','','2');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','6');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-lg.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','8');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','5');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-sk.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','4');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-nc.png" class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12 text-center">
							<a href="javascript:categoryList('','','','','9');"> <img
								src="<%=root%>/img/gudan/emblem/emblem-samsung.png"
								class="img-fluid">
							</a>
						</div>
						<div class="p-0 col-md-1 col-12"></div>
					</div>
				</div>
			</div>


		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>