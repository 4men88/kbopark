<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
    java.text.*,java.io.*,java.util.*, com.baseball.auction.util.DetailPageNavigation"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>

<%
List<AuctionDetailDto> list = (List<AuctionDetailDto>)request.getAttribute("list");
AuctionDetailDto auctionDetailDto = (AuctionDetailDto)request.getAttribute("auctionDetailDto");
DetailPageNavigation detailPageNavigation = (DetailPageNavigation) request.getAttribute("detailPageNavigation");

int gudan = auctionDetailDto.getTno();

String endTime = auctionDetailDto.getEndTime();
String startTimeArr[] = auctionDetailDto.getStartTime().split("\\.");
String endTimeArr[] = auctionDetailDto.getEndTime().split("\\.");


String gudanname ="";

if(gudan == 1)
	gudanname = "KIA 타이거즈";
else if(gudan == 2)
	gudanname = "DOOSAN 베어스";
else if(gudan == 3)
	gudanname = "LOTTE 자이언츠";
else if(gudan == 4)
	gudanname = "NC 다이노스";
else if(gudan == 5)
	gudanname = "SK 와이번스";
else if(gudan == 6)
	gudanname = "LG 트윈스";
else if(gudan == 7)
	gudanname = "NEXEN 히어로즈";
else if(gudan == 8)
	gudanname = "HANHWA 이글스";
else if(gudan == 9)
	gudanname = "SANSUNG 라이온즈";
else if(gudan == 10)
	gudanname = "KT 위즈";
else
	gudanname = "공통구단";

String bigSubject ="";  //대분류 이름
String smallSubject ="";//중분류 이름
String category1 = auctionDetailDto.getCategory1();
String category2 = auctionDetailDto.getCategory2();
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
%>
<script type="text/javascript" src="/kbopark/js/httpRequest.js"></script>
<script type="text/javascript">
	$(function() {
		'use strict'

		$('[data-toggle="offcanvas"]').on('click', function() {
			$('.row-offcanvas').toggleClass('active')
		})
	})
	
	window.onload=function() {
	   startTime();	   
	}
	
	function startTime() {
   var params = "act=timelist";
   sendRequest("<%=root%>/auctioncontroller", params, getTime, "POST");   
}
	
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
	
					dtime = "<%=endTime%>";	
					dtimearr = dtime.split(".");
					ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
					dsec = ddate.getTime();	
					result = dsec - csec;
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
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
								}
							else if(time >0)
								{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
								}
							else if(min > 0)
								{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
								}
							else{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
							}
						}
					
					else{	//남은시간이 없다면
		            document.getElementById("detailtime").innerHTML 
		= "<font color=\"red\"size=\"4\"><b>마감</b></font>";
						if(<%=auctionDetailDto.getAstatus()%> == 1)
							{
								document.getElementById("aano").value = "<%=auctionDetailDto.getAno()%>";
								document.getElementById("aact").value = "statuschange";
								document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
								document.getElementById("auctionForm").submit();						
							}
						}
				window.setTimeout("startTime();", 1000);			  
	
		      }
		}
}
	
function mainDetail(category1,category2,aname,starttime,endtime,bidprice,bidnum,aimage,astatus, acount,initprice,tno){
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
	}
// 입찰 정보 리스트
function bidInfoList(ano, pg, key, word){
	mainDetail('<%=auctionDetailDto.getCategory1()%>','<%=auctionDetailDto.getCategory2()%>','<%=auctionDetailDto.getAname()%>','<%=auctionDetailDto.getStartTime()%>',
			'<%=auctionDetailDto.getEndTime()%>','<%=auctionDetailDto.getBidPrice()%>', '<%=auctionDetailDto.getBidNum()%>', '<%=auctionDetailDto.getAimage()%>', 
			'<%=auctionDetailDto.getAstatus()%>','<%=auctionDetailDto.getAcount()%>','<%=auctionDetailDto.getInitPrice()%>','<%=auctionDetailDto.getTno()%>');
	document.getElementById("aact").value = "biddetail";
	document.getElementById("aano").value = ano;
//	document.getElementById("achoice").value = choice;
//	document.getElementById("aconpg").value = conpg;
//	document.getElementById("aendpg").value = endpg;
	document.getElementById("dpg").value = pg;
	document.getElementById("akey").value = "";
	document.getElementById("aword").value = "";
//	document.getElementById("acategory1").value = category1; 
//	document.getElementById("acategory2").value = category2; 
//	document.getElementById("agudan").value = gudan; 
	document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
	document.getElementById("auctionForm").submit();
}
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
function doBid() {
	
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

		<div class="col-12 col-md-10 p-5">

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
			<h2 class="text-primary mb-3"><%=auctionDetailDto.getAname()%></h2>
			<div class="row">
				<div class="col-md-5 align-self-center">
					<img class="img-fluid d-block mb-4 img-thumbnail"
						src="<%=root%>/<%=auctionDetailDto.getAimage()%>">
				</div>
				<div class="col-md-7 align-self-center">
					<table class="table table-responsive-md">
						<tbody>
							<tr style="background-color: #F5F5F5;">
								<th scope="row">남은시각</th>								
								<td style="color: red; font-weight: 700; font-size: 20px;">
								<div id="detailtime"></div>	
								</td>
							</tr>
							<tr>
								<th scope="row">경매기간</th>
								<td><%=startTimeArr[0]%>/<%=startTimeArr[1]%>/<%=startTimeArr[2]%> <%=startTimeArr[3]%>:<%=startTimeArr[4]%>:<%=startTimeArr[5]%> 	- 	<%=endTimeArr[0]%>/<%=endTimeArr[1]%>/<%=endTimeArr[2]%> <%=endTimeArr[3]%>:<%=endTimeArr[4]%>:<%=endTimeArr[5]%></td>
							</tr>
							<tr>
								<th scope="row">입찰자수</th>
								<td><%=auctionDetailDto.getBidNum() %> 명</td>
							</tr>
							<tr>
								<th scope="row">조회수</th>
								<td><%=auctionDetailDto.getAcount() %> 회</td>
							</tr>
							<tr>
								<th scope="row">입찰가</th>
								<td style="font-weight: 700;"><%=auctionDetailDto.getBidPrice()%> 원</td>
							</tr>
							<tr>
								<th scope="row">시작가</th>
								<td><%=auctionDetailDto.getInitPrice()%> 원</td>
							</tr>
							<tr>
								<th scope="row">구단분류</th>
								<td><%=gudanname%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8"></div>
<%--<%
if(memberDto != null)
{	
--%>				
				<div class="col-md-4">
					<button type="button" class="btn btn-block btn-primary btn-lg"
						data-toggle="modal" data-target="#enterbidModal">입찰하기</button>
				</div>
<%--
}
--%>				
			</div>
			<div class="border-b py-3"></div>

			<div class="row py-5" style="height: 400px;">
				<div class="col-md-12">
					<p>상세정보</p>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<table class="table table-sm table-responsive-md">			
						<thead>
							<tr>
								<th scope="col">입찰번호</th>
								<th scope="col">입찰자</th>
								<th scope="col">입찰루키</th>
								<th scope="col">입찰시각</th>
							</tr>
						</thead>
<%
int len = list.size();
if( len != 0){
	for(int i=0; i<len; i++)
	{
		String bidTime[] = list.get(i).getBidDate().split("\\.");
%>								
						<tbody>
							<tr style="font-weight: 700px;">
								<th scope="row"><%=list.get(i).getBno()%></th>
								<td><%=list.get(i).getMid()%></td>
								<td><%=list.get(i).getBidPrice()%></td>
								<td><%=bidTime[0]%>/<%=bidTime[1]%>/<%=bidTime[2]%> <%=bidTime[3]%>:<%=bidTime[4]%>:<%=bidTime[5]%> </td>
							</tr>
<% 
	}
}
else
{
%>							
							<tr>
								<td colspan="4" style="text-align: center;">입찰내역이 없습니다</td>
							</tr>
<% 
}
%>							
						</tbody>
					</table>
				</div>
<%
	if(detailPageNavigation != null)
	{
%>
									<div class="col-12 py-3" width="100%" align="center">
									<%=detailPageNavigation.getNavigator() %>
									</div>
<% 	
}
%>						
			</div>
			
		</div>
		<!--right section-->
	</div>
	<!--/row-->
</div>

<!-- 입찰하기 Modal >> 입찰하는곳으로 뺄것! -->
<div class="modal fade" id="enterbidModal" tabindex="-1" role="dialog"
	aria-labelledby="enterbidModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content text-center">
			<form>
				<div class="modal-header">
					<h5 class="modal-title" id="enterbidModalLabel">입찰하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body px-2 py-5">
					<label class="mb-3">한번 입찰하게 되면 재입찰은 가능하나, 입찰 취소는
						불가능합니다.<br>신중하게 입찰에 참여해주시기 바랍니다.
					</label>
					
					<table class="table table-sm table-responsive-md py-3">
						<tbody>
							<tr style="font-weight: 700px;">
								<th scope="row">보유금액(루키)</th>
								<td><%=memberDto.getRookie()%></td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">현재입찰가(루키)</th>
								<td><%=auctionDetailDto.getBidPrice()%></td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">입찰루키</th>
								<td><input type="text" class="form-control"
								id="enterbidFormControlInput1" placeholder=""></td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer p-4" style="display: block;">
				<a href="javascript:doBid();">
					<button type="button" class="btn btn-primary btn-lg">
					입찰하기</button>
				</a>
					<button type="button" class="btn btn-secondary btn-lg"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>

	</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>

