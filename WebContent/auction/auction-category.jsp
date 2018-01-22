<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
   com.baseball.auction.util.AuctionPageNavigation,java.util.*, java.text.*,java.io.*"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>

<%!
//리스트 길이 담을 변수
int categoryConListLen;	
int categoryEndListLen;
%>
<%
	// 경매 진행중인 리스트
	List<AuctionDetailDto> categoryConList = (List<AuctionDetailDto>)request.getAttribute("categoryConList");
	AuctionPageNavigation conPageNavigation = (AuctionPageNavigation) request.getAttribute("conPageNavigation");
	// 경매 마감된 리스트
	List<AuctionDetailDto> categoryEndList = (List<AuctionDetailDto>)request.getAttribute("categoryEndList");
	AuctionPageNavigation endPageNavigation = (AuctionPageNavigation) request.getAttribute("endPageNavigation");
	

 	//endTime만 따로 리스트에 담을 리스트
   List<String> categoryConListTimeArr = new ArrayList<String>();	//진행중 경매 종료시간만 리스트로
   List<String> categoryEndListTimeArr = new ArrayList<String>();	//마감 경매 종료시간만 리스트로
   
   
   
   String bigSubject ="";  //대분류 이름
   String smallSubject ="";//중분류 이름
   
   String conpg = (String)request.getAttribute("conpg"); //진행중 경매 페이지
   String endpg = (String)request.getAttribute("endpg"); //종료된 경매 페이지
   
	//진행중/마감 경매 선택 구분할 변수
	String active1 = "active";
	String active2 = "";
	String choice = (String)request.getAttribute("choice");
if(choice != null){	
   if(choice.equals("1"))
  {
	   active1 = "active";   
	   active2 = "";
  }
   else if(choice.equals("2"))
   {
	   active1 = "";	   
	   active2 = "active";   
   }
}
   String category1 = (String)request.getAttribute("category1");	//대분류 번호
   String category2 = (String)request.getAttribute("category2");	//중분류 번호
if(category1 != null)
{
   if(category1.equals("1")){
	   bigSubject = "유니폼";
	   if(category2.equals("1")){
		   smallSubject = "상의";
	   }else if(category2.equals("2")){
		   smallSubject = "하의";
	   }else if(category2.equals("3")){
		   smallSubject = "모자";
	   }else if(category2.equals("4")){
		   smallSubject = "기타";
	   }
	}
   else if(category1.equals("2")){
	   bigSubject = "경기용품";
	   if(category2.equals("1")){
		   smallSubject = "야구공";
	   }else if(category2.equals("2")){
		   smallSubject = "배트";
	   }else if(category2.equals("3")){
		   smallSubject = "보호장비";
	   }else if(category2.equals("4")){
		   smallSubject = "기타";
	   }
   	}
   else if(category1.equals("3")){
	   bigSubject = "응원용품";
	   if(category2.equals("1")){
		   smallSubject = "피켓";
	   }else if(category2.equals("2")){
		   smallSubject = "LED피켓";
	   }else if(category2.equals("3")){
		   smallSubject = "기타";
	   }
   }
   else if(category1.equals("4")){
	   bigSubject = "기타잡화";
	   if(category2.equals("1")){
		   smallSubject = "사진";
	   }else if(category2.equals("2")){
		   smallSubject = "티켓";
	   }else if(category2.equals("3")){
		   smallSubject = "카드";
	   }else if(category2.equals("4")){
		   smallSubject = "기타";
	   }
   }
}  
   
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
function categoryList(key, word, category1, category2, gudan, conpg, endpg, choice)
{
	document.getElementById("aact").value = "categorylist";
	document.getElementById("achoice").value = choice;
	document.getElementById("aconpg").value = conpg;
	document.getElementById("aendpg").value = endpg;
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
	categoryList('','','<%=category1%>','<%=category2%>','','1','1','1');	
}

function mainDetail(ano,category1,category2,aname,starttime,endtime,bidprice,bidnum,aimage,astatus, acount,initprice,tno){
	document.getElementById("aact").value = "biddetail";
	document.getElementById("aano").value = ano;
	document.getElementById("acategory1").value = category1;
	document.getElementById("acategory2").value = category2;
	document.getElementById("aaname").value = aname;
	document.getElementById("astarttime").value = starttime;
	document.getElementById("aendtime").value = endtime;
	document.getElementById("abidprice").value = bidprice;
	document.getElementById("abidnum").value = bidnum;
	document.getElementById("aaimage").value = aimage;
	document.getElementById("aastatus").value = astatus;
	document.getElementById("aacount").value = acount;
	document.getElementById("ainitprice").value = initprice;
	document.getElementById("atno").value = tno;
	document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
	document.getElementById("auctionForm").submit();	
}
</script>
<div class="container-fluid auction-category">
	<div class="row row-offcanvas row-offcanvas-left">
		<nav class="col-6 col-md-2 bg-light sidebar-offcanvas pt-3 pb-5"
			id="sidebar">
			<div class="pb-5">
				<a class="nav-link" href="javascript:categoryList('','','','','','1','1','1');">전체보기</a>
				<a class="nav-link" href="javascript:categoryList('','','1','','','1','1','1');">유니폼</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','1','1','','1','1','1');">상의</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','2','','1','1','1');">하의</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','3','','1','1','1');">모자</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','4','','1','1','1');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','2','','','1','1','1');">경기용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','2','1','','1','1','1');">야구공</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','2','','1','1','1');">배트</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','3','','1','1','1');">글러브</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','4','','1','1','1');">보호장구</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','5','','1','1','1');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','3','1','','1','1','1');">응원용품</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','3','1','','1','1','1');">피켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','2','','1','1','1');">LED피켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','3','','1','1','1');">기타</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','4','','','1','1','1');">기타잡화</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','4','1','','1','1','1');">사진</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','2','','1','1','1');">티켓</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','3','','1','1','1');">카드</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','4','','1','1','1');">기타</a>
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
						<li class="breadcrumb-item"><a href="#"><%=bigSubject%></a></li>
						<li class="breadcrumb-item active" aria-current="page"><%=smallSubject%></li>
					</ol>
				</nav>
			</div>

			<!--/row-->
			<div class="row">
				<div class="jumbotron"
					style="min-height: 260px; width: 100%; background-image: url('<%=root%>/img/auction/category/uniform-cap.jpg'); background-size: cover;">
				</div>
				<div class="col-12">
					<div id="auc-recommended" class="pb-5 col-12">
						<div class="container py-5 col-12">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs nav-justified col-12" role="tablist">
								<li class="nav-item"><a class="nav-link <%=active1%>"
									data-toggle="tab" href="#menu1">진행경매</a></li>
								<li class="nav-item"><a class="nav-link <%=active2%>" 
									data-toggle="tab" href="#menu2">종료경매</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">													
								<div id="menu1" class="container tab-pane <%=active1%>">
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
												 <a href="javascript:mainDetail('<%=auctionDetailDto.getAno()%>','<%=auctionDetailDto.getCategory1()%>','<%=auctionDetailDto.getCategory2()%>',
							                  '<%=auctionDetailDto.getAname()%>','<%=auctionDetailDto.getStartTime()%>','<%=auctionDetailDto.getEndTime()%>',
							                  '<%=auctionDetailDto.getBidPrice()%>','<%=auctionDetailDto.getBidNum()%>','<%=auctionDetailDto.getAimage()%>','<%=auctionDetailDto.getAstatus()%>',
							                  '<%=auctionDetailDto.getAcount()%>','<%=auctionDetailDto.getInitPrice()%>','<%=auctionDetailDto.getTno()%>','1');">
													<img style="width:200px;height:250px;"class="img-fluid d-block mb-4 img-thumbnail"
													src="<%=root%>/<%=auctionDetailDto.getAimage()%>">
												 </a>	
												</div>
												<div class="col-md-12 col-8">
													<p class="mb-2">
														<strong><%=auctionDetailDto.getAname()%></strong><br>입찰자수 : 
														<%=auctionDetailDto.getBidNum()%>명<br>
														<div id="categorycontime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>현재입찰가 : <%=auctionDetailDto.getBidPrice()%></strong>
													</p>
													 <p>조회수 : <%=auctionDetailDto.getAcount()%></p>
												</div>
											</div>
										</div>
<%
	}
	if(conPageNavigation != null)
	{
%>
									<div class="col-12 py-3" width="100%" align="center">
									<%=conPageNavigation.getNavigator() %>
									</div>
<% 	
	}
}
%>
									</div>
								</div>	
								<div id="menu2" class="container tab-pane <%=active2%>">
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
													<img style="width:200px;height:250px;"class="img-fluid d-block mb-4 img-thumbnail"
													src="<%=root%>/<%=auctionDetailDto.getAimage()%>">
												</div>
												<div class="col-md-12 col-8 align-self-center">
													<p class="mb-2">
														<strong><%=auctionDetailDto.getAname()%></strong><br>입찰자수 : <%=auctionDetailDto.getBidNum()%>명
														<br><div id="categoryendtime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>최종입찰가 : <%=auctionDetailDto.getBidPrice()%>원</strong>
													</p>
												</div>
											</div>
										</div>	
<%
		}
		if(endPageNavigation != null)
		{
%>
									<div class="col-12 py-3" width="100%" align="center">
									<%=endPageNavigation.getNavigator() %>
									</div>
<% 	
	}
}
%>																		
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

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