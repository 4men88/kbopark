<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,java.util.List"%>
<!--header ���� -->
<%@ include file="/common/header.jsp"%>


<%
	List<AuctionDetailDto> bestList = (List<AuctionDetailDto>)request.getAttribute("bestList");
	List<AuctionDetailDto> endList = (List<AuctionDetailDto>)request.getAttribute("endList");
	List<AuctionDetailDto> hitList = (List<AuctionDetailDto>)request.getAttribute("hitList");
	List<AuctionDetailDto> newList = (List<AuctionDetailDto>)request.getAttribute("newList");
	String list = request.getParameter("list");
%>
<script type="text/javascript">
function mainList(){
	document.location.href = "<%=root%>/auctionlist?act=mainlist";
}

if(<%=bestList%> == null && <%=endList%> == null && <%=hitList%> == null && <%=newList%> == null)
{
	window.onload = function() {
		mainList();
	}
}
</script>

<form action="" name="auctionListForm" method="get" >
<div class="container py-5 my-5">
	<div class="navbar-template text-center"></div>
</div>

<!-- ��õ�� ��Ź�ǰ ����: best pick: �����ڰ� ���̽��� ��ǰ�� -->
<div id="auc-recommended" class="py-5">


<div class="container py-5">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs nav-justified" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#menu1">BEST PICK</a></li>
		<li class="nav-item"><a class="nav-link"  data-toggle="tab"
			href="#menu2"">�����ӹ�</a></li>
		<li class="nav-item"><a class="nav-link"  data-toggle="tab"
			href="#menu3">�α⹰ǰ</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu4"">�űԹ�ǰ</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="menu1" class="container tab-pane active">
		<div class="row p-2 text-center">
<% 
int size = 0;
if(bestList != null)
{
	size = bestList.size();
	for(int i=0; i<size; i++)
	{
%>				
			
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=bestList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=bestList.get(i).getAname()%></strong><br>
								�����ڼ� : <%=bestList.get(i).getBidNum()%>��<br>�����ð� : 5�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=bestList.get(i).getBidPrice()%></strong>
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
<!--  -->
		<div id="menu2" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
size = 0;
if(endList != null)
{
	size = endList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">				
							<img src="<%=root%>/<%=endList.get(i).getAimage()%>" class="img-fluid">												
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=endList.get(i).getAname()%></strong><br>
								�����ڼ� :<%=endList.get(i).getBidNum()%>��<br>
								�����ð� : 3�� 2�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=endList.get(i).getBidPrice()%></strong>
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

		<div id="menu3" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
size = 0;
if(hitList != null)
{
	size = hitList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=hitList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=hitList.get(i).getAname()%></strong><br>�����ڼ� :<%=hitList.get(i).getBidNum()%>��<br>
								�����ð� : 5�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=hitList.get(i).getBidPrice()%></strong>
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

		<div id="menu4" class="container tab-pane fade">
			<div class="row p-2 text-center">
<% 
size = 0;
if(newList != null)
{
	size = newList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=newList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=newList.get(i).getAname()%></strong><br>�����ڼ� : <%=newList.get(i).getBidNum()%>��<br>�����ð� : 4�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=newList.get(i).getBidPrice()%>��</strong>
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
				<div class="carousel-caption">�λ� ���</div>
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

<!-- ���ܺ� �ΰ� >> ��ũ ������������ -->
<div class="py-5" style="background-color: #3452FF;">
	<div class="container text-center">
		<div class="row">
			<div class="col-md-12 col-12">
				<a class="text-white" href="#">��ȭ �̱۽�</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">�λ� ���</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KIA
					Ÿ�̰���</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">�Ե� ���̾���</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">�Ｚ ���̿���</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KT
					����</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">�ؼ� �������</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">NC ���̳뽺</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">SK
					���̹���</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">LG Ʈ����</a>
			</div>
		</div>
	</div>
</div>
</form>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>