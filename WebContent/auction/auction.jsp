
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
   java.util.*, java.text.*,java.io.*"%>
<!--header 영역 -->
<%@ include file="/common/header.jsp"%>


<%!
//리스트 길이 담을 변수
int bestListLen;	
int endListLen;
int hitListLen;
int newListLen;

%>
<%
   List<AuctionDetailDto> bestList = (List<AuctionDetailDto>)request.getAttribute("bestList");
   List<AuctionDetailDto> endList = (List<AuctionDetailDto>)request.getAttribute("endList");
   List<AuctionDetailDto> hitList = (List<AuctionDetailDto>)request.getAttribute("hitList");
   List<AuctionDetailDto> newList = (List<AuctionDetailDto>)request.getAttribute("newList");
   List<Integer> newNumArray = (List<Integer>)request.getAttribute("newNumArray");
   
   int asort;
   //endTime만 따로 리스트에 담을 리스트
   List<String> bestListTimeArr = new ArrayList<String>();	
   List<String> endListTimeArr = new ArrayList<String>();
   List<String> hitListTimeArr = new ArrayList<String>();
   List<String> newListTimeArr = new ArrayList<String>();
   if(bestList != null)	//리스트가 널이 아니면
   {
   		bestListLen = bestList.size();	//사이즈 재고
   		for(int i=0; i<bestListLen; i++)	//사이즈만큼
   		{
   			bestListTimeArr.add(i, bestList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
 		}
   }
   if(endList != null)
   {
	   endListLen = endList.size();
	   for(int i=0; i<endListLen; i++)
  		{
		   endListTimeArr.add(i, endList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
  		}
   }
   if(hitList != null)
   {
	   hitListLen = hitList.size();
	   for(int i=0; i<hitListLen; i++)
  		{
		   hitListTimeArr.add(i, hitList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
  		}
   }
   if(newList != null)
   {
	   newListLen = newList.size();
	   for(int i=0; i<newListLen; i++)
  		{
		   newListTimeArr.add(i, newList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
  		}
   }
%>
<script type="text/javascript" src="/kbopark/js/httpRequest.js"></script>
<script type="text/javascript">

function startTime() {
//   httpRequest = getXMLHttpRequest();
//   httpRequest.onreadystatechange = getTime;
//   httpRequest.send(null);
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
<%
		for(int i=0; i<bestListLen; i++)
		{
%>			
			dtime = "<%=bestListTimeArr.get(i)%>";	
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
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
						}
					else if(time >0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
						}
					else if(min > 0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
						}
					else{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
					}
				}
			
			else{	//남은시간이 없다면
            document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";
				if(<%=bestList.get(i).getAstatus()%> == 1)
					{
						document.getElementById("aano").value = "<%=bestList.get(i).getAno()%>";
						document.getElementById("aact").value = "statuschange";
						document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
						document.getElementById("auctionForm").submit();
						
					}
				}
<%            
}
%>

<%
for(int i=0; i<endListLen; i++)
{
%>			
	dtime = "<%=endListTimeArr.get(i)%>";	
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
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";
			if(<%=endList.get(i).getAstatus()%> == 1)
			{
				document.getElementById("aano").value = "<%=endList.get(i).getAno()%>";
				document.getElementById("aact").value = "statuschange";
				document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
				document.getElementById("auctionForm").submit();
			
			}
		}
<%            
 }
%>

<%
for(int i=0; i<hitListLen; i++)
{
%>			
	dtime = "<%=hitListTimeArr.get(i)%>";	
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
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";	
		if(<%=hitList.get(i).getAstatus()%> == 1)
			{
			document.getElementById("aano").value = "<%=hitList.get(i).getAno()%>";
			document.getElementById("aact").value = "statuschange";
			document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
			document.getElementById("auctionForm").submit();
			
		//		document.location.href = "<%=root%>/auctionlist?act=statuschange";
			}
		}
	
<%            
 }
%>

<%
for(int i=0; i<newListLen; i++)
{
%>			
	dtime = "<%=newListTimeArr.get(i)%>";	
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
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";	
			if(<%=newList.get(i).getAstatus()%> == 1)
			{
				document.getElementById("aano").value = "<%=newList.get(i).getAno()%>";
				document.getElementById("aact").value = "statuschange";
				document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
				document.getElementById("auctionForm").submit();		
			}
		}
<%            
}
%>
         window.setTimeout("startTime();", 1000);
   //      alert(ctime);
      }
   }
}

window.onload=function() {
   startTime();
}

function categoryList(key, word, category1, category2, conpg, endpg, choice)
{
	document.getElementById("aact").value = "categorylist";
	document.getElementById("achoice").value = choice;
	document.getElementById("aconpg").value = conpg;
	document.getElementById("aendpg").value = endpg;
	document.getElementById("akey").value = "";
	document.getElementById("aword").value = "";
	document.getElementById("acategory1").value = category1; 
	document.getElementById("acategory2").value = category2; 
	document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
	document.getElementById("auctionForm").submit();		
}	

function mainDetail(ano,category1,category2,aname,starttime,endtime,bidprice,bidnum,aimage,astatus, acount,initprice,tno,pg){
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
	document.getElementById("dpg").value = pg;
	document.getElementById("auctionForm").action = "<%=root%>/auctioncontroller";
	document.getElementById("auctionForm").submit();	
}

function moveWrite(){
	if(<%=memberDto == null%>){
		alert("로그인후 다시 시도해 주세요.");	
	}else{	
		location.href = "<%=root%>/auction/auction-add.jsp";
	}
}
</script>

<div id="auction-maincarousel">
   <div class="container-fluid">
      <div class="row p-5">
         <div class="align-self-center p-0 col-md-3">

            <ul class="list-group">
               <a href="javascript:categoryList('','','','','1','1','1');">
            	   <li class="list-group-item d-flex justify-content-between align-items-center">
                   전체보기<span class="badge badge-primary badge-pill">
<%
if(newNumArray != null)                  
                  out.print(newNumArray.get(0).toString());
%> 
               			  </span>
            	   </li></a>
               <a href="javascript:categoryList('','','1','','1','1','1');">
               		<li class="list-group-item d-flex justify-content-between align-items-center">
                  	유니폼<span class="badge badge-primary badge-pill">
<%
if(newNumArray != null)                  
                  out.print(newNumArray.get(1).toString());
%> 
                  		  </span>
               		</li></a>
               <a href="javascript:categoryList('','','2','','1','1','1');">
               		<li class="list-group-item d-flex justify-content-between align-items-center">
                  	경기용품<span class="badge badge-primary badge-pill">
<%
if(newNumArray != null)                  
                  out.print(newNumArray.get(2).toString());
%>                   
		                    </span>
		             </li></a>
               <a href="javascript:categoryList('','','3','','1','1','1');">
               		<li class="list-group-item d-flex justify-content-between align-items-center">
                  	응원용품<span class="badge badge-primary badge-pill">
<%
if(newNumArray != null)                  
                  out.print(newNumArray.get(3).toString());
%>                  
		         		</span>
		            </li></a>
               <a href="javascript:categoryList('','','4','','1','1','1');">
               		<li class="list-group-item d-flex justify-content-between align-items-center">
                  	기타잡화<span class="badge badge-primary badge-pill">
<%
if(newNumArray != null)                  
                  out.print(newNumArray.get(4).toString());
%>                  
		                  	</span>
		             </li></a>
		     	<a href="javascript:moveWrite();">        
               		<li class="bg-pingendo list-group-item d-flex justify-content-between align-items-center">
                  		<span class="text-center" style="color: white; width:100%;">
                 		 내물품 등록하기</span>
               		</li></a>
           		 </ul>
         	</div>
         
         <!-- 이미지크기 꽉차게 맞춰야함..ㅠㅠㅠㅠ atl노란오류는 무시ㄱㄱ-->
         <div class="col-md-9 p-0">
            <div id="carousel1" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner" role="listbox">
                  <div class="carousel-item">
                     <img src="<%=root%>/img/auction/carousel/auction-carousel1.jpg" atl="first slide" style="max-height: 391px;" class="d-block img-fluid w-100">
                  </div>
                  <div class="carousel-item">
                     <img class="d-block img-fluid w-100"
                        src="<%=root%>/img/auction/carousel/auction-carousel1.jpg"
                        data-holder-rendered="true"
                        style="max-height: 391px;">
                  </div>
                  <div class="carousel-item active">
                     <img class="d-block img-fluid w-100"
                        src="<%=root%>/img/auction/carousel/auction-carousel2.jpg"
                        style="max-height: 391px;" data-holder-rendered="true">
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carousel1" role="button"
                  data-slide="prev"> <span class="carousel-control-prev-icon"
                  aria-hidden="true"></span> <span class="sr-only">Previous</span>
               </a> <a class="carousel-control-next" href="#carousel1" role="button"
                  data-slide="next"> <span class="carousel-control-next-icon"
                  aria-hidden="true"></span> <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
      </div>
   </div>
</div>



<!--
<!-- 추천별 경매물품 섹션: best pick: 관리자가 초이스한 상품들 -->
<div id="auc-recommended" class="py-5">
<div class="container py-5">
   <!-- Nav tabs -->
   <ul class="nav nav-tabs nav-justified" role="tablist">
      <li class="nav-item"><a class="nav-link active" data-toggle="tab"
         href="#menu1">BEST PICK</a></li>
      <li class="nav-item"><a class="nav-link"  data-toggle="tab"
         href="#menu2"">마감임박</a></li>
      <li class="nav-item"><a class="nav-link"  data-toggle="tab"
         href="#menu3">인기물품</a></li>
      <li class="nav-item"><a class="nav-link" data-toggle="tab"
         href="#menu4"">신규물품</a></li>
   </ul>

   <!-- Tab panes -->
   <div class="tab-content">
      <div id="menu1" class="container tab-pane active">
      <div class="row p-2 text-center">
<% 
if(bestList != null)
{
   for(int i=0; i<bestListLen; i++)
   {
%>                        
            <div class="col-md-3" >
               <div class="row p-2" >
                  <div class="col-md-12 col-4 align-self-center" >
                  <a href="javascript:mainDetail('<%=bestList.get(i).getAno()%>','<%=bestList.get(i).getCategory1()%>','<%=bestList.get(i).getCategory2()%>',
                  '<%=bestList.get(i).getAname()%>','<%=bestList.get(i).getStartTime()%>','<%=bestList.get(i).getEndTime()%>',
                  '<%=bestList.get(i).getBidPrice()%>','<%=bestList.get(i).getBidNum()%>','<%=bestList.get(i).getAimage()%>','<%=bestList.get(i).getAstatus()%>',
                  '<%=bestList.get(i).getAcount()%>','<%=bestList.get(i).getInitPrice()%>','<%=bestList.get(i).getTno()%>');">
                     <img style="width:200px;height:250px;" class="img-fluid d-block mb-4 img-thumbnail"
                      src="<%=root%>/<%=bestList.get(i).getAimage()%>" class="img-fluid">
                      </a>
                  </div>
                  <div class="col-md-12 col-8 align-self-center">
                     <p class="mb-2">
                        <strong><%=bestList.get(i).getAname()%></strong><br>
                        입찰자수 : <%=bestList.get(i).getBidNum()%>명<br>
                        <div id="besttime<%=i%>"></div>
                     </p>
                     <p style="color: red;">
                        <strong>현재입찰가 : <%=bestList.get(i).getBidPrice()%>원</strong>
                     </p>
                     <p>조회수 : <%=bestList.get(i).getAcount()%></p>
                  </div>
               </div>
            </div>
<%
   }
}
%>

         </div>
      </div>
<!--  -->
      <div id="menu2" class="container tab-pane fade">
                  <div class="row p-2 text-center">
<% 
if(endList != null)
{
   for(int i=0; i<endListLen; i++)
   {
%>      
            <div class="col-md-3">
               <div class="row p-2">
                  <div class="col-md-12 col-4 align-self-center">     
                  <a href="javascript:mainDetail('<%=endList.get(i).getAno()%>','<%=endList.get(i).getCategory1()%>','<%=endList.get(i).getCategory2()%>',
                  '<%=endList.get(i).getAname()%>','<%=endList.get(i).getStartTime()%>','<%=endList.get(i).getEndTime()%>',
                  '<%=endList.get(i).getBidPrice()%>','<%=endList.get(i).getBidNum()%>','<%=endList.get(i).getAimage()%>','<%=endList.get(i).getAstatus()%>',
                  '<%=endList.get(i).getAcount()%>','<%=endList.get(i).getInitPrice()%>','<%=endList.get(i).getTno()%>','1');">       
                     <img style="width:200px;height:250px;" class="img-fluid d-block mb-4 img-thumbnail"
                     src="<%=root%>/<%=endList.get(i).getAimage()%>" class="img-fluid">   
                     </a>                                 
                  </div>
                  <div class="col-md-12 col-8 align-self-center">
                     <p class="mb-2">
                        <strong><%=endList.get(i).getAname()%></strong><br>
                        입찰자수 :<%=endList.get(i).getBidNum()%>명<br>
                        <div id="endtime<%=i%>"></div>
                     </p>
                     <p style="color: red;">
                        <strong>현재입찰가 : <%=endList.get(i).getBidPrice()%>원</strong>
                     </p>
                     <p>조회수 : <%=endList.get(i).getAcount()%></p>
                  </div>
               </div>
            </div>
<%
   }
}
%>
         </div>
      </div>

      <div id="menu3" class="container tab-pane fade">
                  <div class="row p-2 text-center">
<% 
if(hitList != null)
{
   for(int i=0; i<hitListLen; i++)
   {
%>      
            <div class="col-md-3">
               <div class="row p-2">
                  <div class="col-md-12 col-4 align-self-center">
                  <a href="javascript:mainDetail('<%=hitList.get(i).getAno()%>','<%=hitList.get(i).getCategory1()%>','<%=hitList.get(i).getCategory2()%>',
                  '<%=hitList.get(i).getAname()%>','<%=hitList.get(i).getStartTime()%>','<%=hitList.get(i).getEndTime()%>',
                  '<%=hitList.get(i).getBidPrice()%>','<%=hitList.get(i).getBidNum()%>','<%=hitList.get(i).getAimage()%>','<%=hitList.get(i).getAstatus()%>',
                  '<%=hitList.get(i).getAcount()%>','<%=hitList.get(i).getInitPrice()%>','<%=hitList.get(i).getTno()%>');">
                     <img style="width:200px;height:250px;"class="img-fluid d-block mb-4 img-thumbnail"
                      src="<%=root%>/<%=hitList.get(i).getAimage()%>" class="img-fluid">
                     </a>
                  </div>
                  <div class="col-md-12 col-8 align-self-center">
                     <p class="mb-2">
                        <strong><%=hitList.get(i).getAname()%></strong><br>입찰자수 :<%=hitList.get(i).getBidNum()%>명<br>
                       <div id="hittime<%=i%>"></div>
                     </p>
                     <p style="color: red;">
                        <strong>현재입찰가 : <%=hitList.get(i).getBidPrice()%>원</strong>
                     </p>
                      <p>조회수 : <%=hitList.get(i).getAcount()%></p>
                  </div>
               </div>
            </div>
<%
   }
}
%>
         </div>
      </div>

      <div id="menu4" class="container tab-pane fade">
         <div class="row p-2 text-center">
<% 
if(newList != null)
{
   for(int i=0; i<newListLen; i++)
   {
%>      
            <div class="col-md-3">
               <div class="row p-2">
                  <div class="col-md-12 col-4 align-self-center">
                  <a href="javascript:mainDetail('<%=newList.get(i).getAno()%>','<%=newList.get(i).getCategory1()%>','<%=newList.get(i).getCategory2()%>',
                  '<%=newList.get(i).getAname()%>','<%=newList.get(i).getStartTime()%>','<%=newList.get(i).getEndTime()%>',
                  '<%=newList.get(i).getBidPrice()%>','<%=newList.get(i).getBidNum()%>','<%=newList.get(i).getAimage()%>','<%=newList.get(i).getAstatus()%>',
                  '<%=newList.get(i).getAcount()%>','<%=newList.get(i).getInitPrice()%>','<%=newList.get(i).getTno()%>');">
                     <img style="width:200px;height:250px;"class="img-fluid d-block mb-4 img-thumbnail"
                      src="<%=root%>/<%=newList.get(i).getAimage()%>" class="img-fluid">
                     </a>
                  </div>
                  <div class="col-md-12 col-8 align-self-center">
                     <p class="mb-2">
                        <strong><%=newList.get(i).getAname()%></strong><br>입찰자수 : <%=newList.get(i).getBidNum()%>명<br>
                        <div id="newtime<%=i%>"></div>
                     </p>
                     <p style="color: red;">
                        <strong>현재입찰가 : <%=newList.get(i).getBidPrice()%>원</strong>
                     </p>
                      <p>조회수 : <%=newList.get(i).getAcount()%></p>
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
<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>