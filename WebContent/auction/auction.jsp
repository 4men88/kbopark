<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,java.util.List"%>
<!--header ���� -->
<%@ include file="/common/header.jsp"%>


������, ����ǰ, ������ǰ, ��Ÿ��ȭ ������ -> ����, ����, ����,��Ÿ ������ǰ -> ����, LED����, ��Ÿ ����ǰ ->
�߱���, ��Ʈ, ��Ʈ, ���, �۷���, �����尩, �����尩, �Ⱥ�ȣ��, �ȸ麸ȣ��, ������ȣ��, �߸�ȣ�� �߱�ȭ, ��Ÿ ��ȭ��ǰ
-> ����, Ƽ��, ī��, ��Ÿ
�۾��� �Ф�


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

<!-- ��õ�� ��Ź�ǰ ����: best pick: �����ڰ� ���̽��� ��ǰ�� -->
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
			href="#menu2" onclick="javascript:endList();">�����ӹ�</a></li>
		<li class="nav-item"><a class="nav-link <%=active3%>"  data-toggle="tab"
			href="#menu3" onclick="javascript:hitList();">�α⹰ǰ</a></li>
		<li class="nav-item"><a class="nav-link <%=active4%>" data-toggle="tab"
			href="#menu4">�űԹ�ǰ</a></li>
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
								<strong>KBO 2017 ���α�</strong><br>�����ڼ� : 22��<br>�����ð� : 5�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : 70,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�1</strong><br>�����ڼ� : 31��<br>�����ð� : 1�� 2�ð� 15��
							</p>
							<p>
								<strong>���������� : 5,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�2</strong><br>�����ڼ� : 202��<br>�����ð� : 3�� 3�ð� 20��
							</p>
							<p>
								<strong>���������� : 5,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�3</strong><br>�����ڼ� : 98��<br>�����ð� : 1�� 1�ð� 12��
							</p>
							<p>
								<strong>���������� : 100,000��</strong>
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
								<strong><%=auctionDetailDto.get(i).getAname()%></strong><br>�����ڼ� :<%=auctionDetailDto.get(i).getBidNum()%>��<br>
								�����ð� : 3�� 2�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=auctionDetailDto.get(i).getBidPrice()%></strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�1</strong><br>�����ڼ� : 21��<br>�����ð� : 2�� 2�ð� 15��
							</p>
							<p>
								<strong>���������� : 4,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�2</strong><br>�����ڼ� : 202��<br>�����ð� : 3�� 3�ð� 20��
							</p>
							<p>
								<strong>���������� : 5,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�3</strong><br>�����ڼ� : 97��<br>�����ð� : 1�� 1�ð� 12��
							</p>
							<p>
								<strong>���������� : 120,000��</strong>
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
								<strong><%=auctionDetailDto.get(i).getAname()%></strong><br>�����ڼ� :<%=auctionDetailDto.get(i).getBidNum()%>��<br>
								�����ð� : 5�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : <%=auctionDetailDto.get(i).getBidPrice()%></strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�1</strong><br>�����ڼ� : 21��<br>�����ð� : 1�� 2�ð� 15��
							</p>
							<p>
								<strong>���������� : 9,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�2</strong><br>�����ڼ� : 212��<br>�����ð� : 3�� 3�ð� 20��
							</p>
							<p>
								<strong>���������� : 8,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�3</strong><br>�����ڼ� : 91��<br>�����ð� : 1�� 1�ð� 12��
							</p>
							<p>
								<strong>���������� : 150,000��</strong>
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
								<strong>KBO 2017 ���α�</strong><br>�����ڼ� : 12��<br>�����ð� : 4�� 3�ð� 20��
							</p>
							<p style="color: red;">
								<strong>���������� : 70,300��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�1</strong><br>�����ڼ� : 32��<br>�����ð� : 1�� 2�ð� 15��
							</p>
							<p>
								<strong>���������� : 5,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�2</strong><br>�����ڼ� : 202��<br>�����ð� : 3�� 3�ð� 20��
							</p>
							<p>
								<strong>���������� : 9,000��</strong>
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
								<strong>KBO ���ڸ��� �� �ƴ�3</strong><br>�����ڼ� : 98��<br>�����ð� : 1�� 1�ð� 12��
							</p>
							<p>
								<strong>���������� : 111,000��</strong>
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