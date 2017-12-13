<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
   java.util.*, java.text.*,java.io.*"%>
<!-- ��ǰ�������� �ߴ� �� ������. -->
<!-- header���� -->
<%@ include file="/common/header.jsp"%>

<%!
//����Ʈ ���� ���� ����
int categoryConListLen;	
int categoryEndListLen;
%>
<%
	List<AuctionDetailDto> categoryConList = (List<AuctionDetailDto>)request.getAttribute("categoryConList");
	List<AuctionDetailDto> categoryEndList = (List<AuctionDetailDto>)request.getAttribute("categoryEndList");
 	//endTime�� ���� ����Ʈ�� ���� ����Ʈ
   List<String> categoryConListTimeArr = new ArrayList<String>();	
   List<String> categoryEndListTimeArr = new ArrayList<String>();	
   String category1 = (String)request.getAttribute("category1");
   String category2 = (String)request.getAttribute("category2");
      
   if(categoryConList != null)	//����Ʈ�� ���� �ƴϸ�
   {
	   categoryConListLen = categoryConList.size();	//������ ���
   		for(int i=0; i<categoryConListLen; i++)	//�����ŭ
   		{
   			categoryConListTimeArr.add(i, categoryConList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
 		}
   }
   if(categoryEndList != null)
   {
	   categoryEndListLen = categoryEndList.size();
	   for(int i=0; i<categoryEndListLen; i++)
  		{
		   categoryEndListTimeArr.add(i, categoryEndList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
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
         var ctime = httpRequest.responseText;	//����ð�(2017.12.07.11.42.30) ����
         var ctimearr = ctime.split("."); 	// .���� �迭�� �����
         var cdate;		//����ð����� Date ��ü ���� ����
         var csec;		//����ð����ʷ� ��ȯ�� ����
         
         var dtime;	//db���� ���� �ð� ���� ����
         var dtimearr;	
         var ddate; //DB���� ���½ð����� ���� Date ��ü
         var dsec;	//DB���� ���½ð����ʷ� ��ȯ
         
         var sresult;	//�� �ð� �� ��
         var day = 0;
         var time = 0;
         var min = 0;
         var sec = 0;
         // �������� ������ ����ð����� Date��ü ����
			cdate = new Date(ctimearr[0]+"-"+ctimearr[1] +"-"+ctimearr[2]+"T"+ctimearr[3]+":"+ctimearr[4]+":"+ctimearr[5]+".323");
			csec = cdate.getTime();	//�и�Ŀ�� ������ ������ ��ȯ
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
			if(result >0)	//�����ð��� �ִٸ�
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
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
						}
					else if(time >0)
						{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
						}
					else if(min > 0)
						{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
						}
					else{
						document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
					}
				}
			
			else{	//�����ð��� ���ٸ�
            document.getElementById("categorycontime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";
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
	if(result >0)	//�����ð��� �ִٸ�
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
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
				}
			else{
				document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
			}
		}
	
	else{	//�����ð��� ���ٸ�
    document.getElementById("categoryendtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";
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
				<a class="nav-link" href="javascript:categoryList('','','','','','');">��ü����</a>
				<a class="nav-link" href="javascript:categoryList('','','1','','');">������</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','1','1','');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','2','');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','3','');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','4','');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','2','','');">����ǰ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','2','1','');">�߱���</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','2','');">��Ʈ</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','3','');">�۷���</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','4','');">��ȣ�屸</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','5');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','3','');">������ǰ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','3','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','2');">LED����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','3');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','4','');">��Ÿ��ȭ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','4','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','2');">Ƽ��</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','3');">ī��</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','4','');">��Ÿ</a>
				</nav>
			</div>
		</nav>

		<div>
			<p class="float-left d-md-none">
				<button type="button"
					class="align-self-center btn btn-primary btn-sm"
					data-toggle="offcanvas">
					ī�װ�&nbsp;<i class="fa fa-caret-right" aria-hidden="true"></i>
				</button>
			</p>
		</div>

		<div class="col-12 col-md-10 px-5 pt-2">

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end mb-0"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">��ü</a></li>
						<li class="breadcrumb-item"><a href="#">������</a></li>
						<li class="breadcrumb-item active" aria-current="page">����</li>
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
									data-toggle="tab" href="#menu1">������</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu2">������</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">							
							
								<div id="menu1" class="container tab-pane active">
								
									<div class="row p-2 text-right">
										<div class="dropdown show col-md-12 align-self-end">
											<a class="btn dropdown-toggle btn-sm" href="#"
												role="button" id="dropdownMenuLink" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false" style="width: 160px;"> ���ĺ��� </a>

											<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
												<a class="dropdown-item" href="javascript:auctionsort('1');">�α��ż�</a>
												<a class="dropdown-item" href="javascript:auctionsort('2');">�����ӹڼ�</a>
												<a class="dropdown-item" href="javascript:auctionsort('3');">�ű԰�ż�</a>
												<a class="dropdown-item" href="javascript:auctionsort('4');">��ȸ������</a>
												<a class="dropdown-item" href="javascript:auctionsort('5');">��ȸ������</a>
												<a class="dropdown-item" href="javascript:auctionsort('6');">�������ݼ�</a>
												<a class="dropdown-item" href="javascript:auctionsort('7');">�������ݼ�</a>
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
														<strong><%=auctionDetailDto.getAname()%></strong><br>�����ڼ� : 
														<%=auctionDetailDto.getBidNum()%>��<br>
														<div id="categorycontime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>���������� : <%=auctionDetailDto.getBidPrice()%></strong>
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
														<strong><%=auctionDetailDto.getAname()%></strong><br>�����ڼ� : <%=auctionDetailDto.getBidNum()%>��
														<br><div id="categoryendtime<%=i%>"></div>
													</p>
													<p style="color: red;">
														<strong>���������� : <%=auctionDetailDto.getBidPrice()%>��</strong>
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



			<!-- ���ܺ� �ΰ� >> ��ũ ������������ -->
			<div id="main-gudan-logo" class="py-5">
				<div class="container">
					<div class="row text-center">
						<div class="col-md-12">
							<h4 class="mb-3">���ܺ� ��ƺ���</h4>
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

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>