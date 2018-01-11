<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,
    java.text.*,java.io.*,java.util.*, com.baseball.auction.util.DetailPageNavigation"%>
<!-- ��ǰ�������� �ߴ� �� ������. -->
<!-- header���� -->
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
	gudanname = "KIA Ÿ�̰���";
else if(gudan == 2)
	gudanname = "DOOSAN ���";
else if(gudan == 3)
	gudanname = "LOTTE ���̾���";
else if(gudan == 4)
	gudanname = "NC ���̳뽺";
else if(gudan == 5)
	gudanname = "SK ���̹���";
else if(gudan == 6)
	gudanname = "LG Ʈ����";
else if(gudan == 7)
	gudanname = "NEXEN �������";
else if(gudan == 8)
	gudanname = "HANHWA �̱۽�";
else if(gudan == 9)
	gudanname = "SANSUNG ���̿���";
else if(gudan == 10)
	gudanname = "KT ����";
else
	gudanname = "���뱸��";

String bigSubject ="";  //��з� �̸�
String smallSubject ="";//�ߺз� �̸�
String category1 = auctionDetailDto.getCategory1();
String category2 = auctionDetailDto.getCategory2();
if(category1 != null)
{
   if(category1.equals("1")){
	   bigSubject = "������";
	   if(category2.equals("1")){
		   smallSubject = "����";
	   }else if(category2.equals("2")){
		   smallSubject = "����";
	   }else if(category2.equals("3")){
		   smallSubject = "����";
	   }else if(category2.equals("4")){
		   smallSubject = "��Ÿ";
	   }
	}
   else if(category1.equals("2")){
	   bigSubject = "����ǰ";
	   if(category2.equals("1")){
		   smallSubject = "�߱���";
	   }else if(category2.equals("2")){
		   smallSubject = "��Ʈ";
	   }else if(category2.equals("3")){
		   smallSubject = "��ȣ���";
	   }else if(category2.equals("4")){
		   smallSubject = "��Ÿ";
	   }
   	}
   else if(category1.equals("3")){
	   bigSubject = "������ǰ";
	   if(category2.equals("1")){
		   smallSubject = "����";
	   }else if(category2.equals("2")){
		   smallSubject = "LED����";
	   }else if(category2.equals("3")){
		   smallSubject = "��Ÿ";
	   }
   }
   else if(category1.equals("4")){
	   bigSubject = "��Ÿ��ȭ";
	   if(category2.equals("1")){
		   smallSubject = "����";
	   }else if(category2.equals("2")){
		   smallSubject = "Ƽ��";
	   }else if(category2.equals("3")){
		   smallSubject = "ī��";
	   }else if(category2.equals("4")){
		   smallSubject = "��Ÿ";
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
	
					dtime = "<%=endTime%>";	
					dtimearr = dtime.split(".");
					ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
					dsec = ddate.getTime();	
					result = dsec - csec;
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
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
								}
							else if(time >0)
								{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
								}
							else if(min > 0)
								{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
								}
							else{
								document.getElementById("detailtime").innerHTML 
		= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
							}
						}
					
					else{	//�����ð��� ���ٸ�
		            document.getElementById("detailtime").innerHTML 
		= "<font color=\"red\"size=\"4\"><b>����</b></font>";
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
// ���� ���� ����Ʈ
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
				<a class="nav-link" href="javascript:categoryList('','','','','','1','1','1');">��ü����</a>
				<a class="nav-link" href="javascript:categoryList('','','1','','','1','1','1');">������</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','1','1','','1','1','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','2','','1','1','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','3','','1','1','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','1','4','','1','1','1');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','2','','','1','1','1');">����ǰ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','2','1','','1','1','1');">�߱���</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','2','','1','1','1');">��Ʈ</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','3','','1','1','1');">�۷���</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','4','','1','1','1');">��ȣ�屸</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','2','5','','1','1','1');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','3','1','','1','1','1');">������ǰ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','3','1','','1','1','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','2','','1','1','1');">LED����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','3','3','','1','1','1');">��Ÿ</a>
				</nav>
				<a class="nav-link" href="javascript:categoryList('','','4','','','1','1','1');">��Ÿ��ȭ</a>
				<nav class="nav nav-pills flex-column">
					<a class="nav-link ml-3" href="javascript:categoryList('','','4','1','','1','1','1');">����</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','2','','1','1','1');">Ƽ��</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','3','','1','1','1');">ī��</a> <a
						class="nav-link ml-3" href="javascript:categoryList('','','4','4','','1','1','1');">��Ÿ</a>
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

		<div class="col-12 col-md-10 p-5">

			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end mb-0"
						style="background-color: white;">
						<li class="breadcrumb-item"><a href="#">��ü</a></li>
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
								<th scope="row">�����ð�</th>								
								<td style="color: red; font-weight: 700; font-size: 20px;">
								<div id="detailtime"></div>	
								</td>
							</tr>
							<tr>
								<th scope="row">��űⰣ</th>
								<td><%=startTimeArr[0]%>/<%=startTimeArr[1]%>/<%=startTimeArr[2]%> <%=startTimeArr[3]%>:<%=startTimeArr[4]%>:<%=startTimeArr[5]%> 	- 	<%=endTimeArr[0]%>/<%=endTimeArr[1]%>/<%=endTimeArr[2]%> <%=endTimeArr[3]%>:<%=endTimeArr[4]%>:<%=endTimeArr[5]%></td>
							</tr>
							<tr>
								<th scope="row">�����ڼ�</th>
								<td><%=auctionDetailDto.getBidNum() %> ��</td>
							</tr>
							<tr>
								<th scope="row">��ȸ��</th>
								<td><%=auctionDetailDto.getAcount() %> ȸ</td>
							</tr>
							<tr>
								<th scope="row">������</th>
								<td style="font-weight: 700;"><%=auctionDetailDto.getBidPrice()%> ��</td>
							</tr>
							<tr>
								<th scope="row">���۰�</th>
								<td><%=auctionDetailDto.getInitPrice()%> ��</td>
							</tr>
							<tr>
								<th scope="row">���ܺз�</th>
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
						data-toggle="modal" data-target="#enterbidModal">�����ϱ�</button>
				</div>
<%--
}
--%>				
			</div>
			<div class="border-b py-3"></div>

			<div class="row py-5" style="height: 400px;">
				<div class="col-md-12">
					<p>������</p>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<table class="table table-sm table-responsive-md">			
						<thead>
							<tr>
								<th scope="col">������ȣ</th>
								<th scope="col">������</th>
								<th scope="col">������Ű</th>
								<th scope="col">�����ð�</th>
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
								<td colspan="4" style="text-align: center;">���������� �����ϴ�</td>
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

<!-- �����ϱ� Modal >> �����ϴ°����� ����! -->
<div class="modal fade" id="enterbidModal" tabindex="-1" role="dialog"
	aria-labelledby="enterbidModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content text-center">
			<form>
				<div class="modal-header">
					<h5 class="modal-title" id="enterbidModalLabel">�����ϱ�</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body px-2 py-5">
					<label class="mb-3">�ѹ� �����ϰ� �Ǹ� �������� �����ϳ�, ���� ��Ҵ�
						�Ұ����մϴ�.<br>�����ϰ� ������ �������ֽñ� �ٶ��ϴ�.
					</label>
					
					<table class="table table-sm table-responsive-md py-3">
						<tbody>
							<tr style="font-weight: 700px;">
								<th scope="row">�����ݾ�(��Ű)</th>
								<td><%=memberDto.getRookie()%></td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">����������(��Ű)</th>
								<td><%=auctionDetailDto.getBidPrice()%></td>
							</tr>
							<tr style="font-weight: 700px;">
								<th scope="row">������Ű</th>
								<td><input type="text" class="form-control"
								id="enterbidFormControlInput1" placeholder=""></td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer p-4" style="display: block;">
				<a href="javascript:doBid();">
					<button type="button" class="btn btn-primary btn-lg">
					�����ϱ�</button>
				</a>
					<button type="button" class="btn btn-secondary btn-lg"
						data-dismiss="modal">�ݱ�</button>
				</div>
			</form>
		</div>

	</div>
</div>


<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>

