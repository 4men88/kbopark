<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.List" %>
<%@ page import="org.xml.sax.InputSource" %>
<%@ page import="org.jdom2.Document" %>
<%@ page import="org.jdom2.Element" %>
<%@ page import="org.jdom2.input.SAXBuilder" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<script type="text/javascript" src="<%=root %>/js/httpRequest.js"></script>
<script type="text/javascript" src="<%=root %>/js/mainschedule.js"></script>
<%
    List list = null;
 
    try{
        SAXBuilder parser = new SAXBuilder();
        parser.setValidation(false);
        parser.setIgnoringElementContentWhitespace(true);
        //URL url = new URL("http://jsp.hooni.net/rss/sample.xml");
        URL url = new URL("http://rss.hankooki.com/sports/sp_baseball.xml");
        InputSource is = new InputSource(url.openStream());
        Document doc = parser.build(is);
 
        Element basic = doc.getRootElement();
        Element channel = basic.getChild("channel");
        list = channel.getChildren("item");
    }catch(Exception e){
        e.getStackTrace();
    }
%>
<!-- �����̹���>> �����ڰ� �����Ҽ��־�����.. -->
<div id="main-section">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="img-wrapper">
					<img src="<%=root%>/img/main-201707mvp.png" class="img-fluid">
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ������ ��� > > ������� �����̴��� -->

<div class="py-5 text-center">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12">
				<h4>������ ���</h4>
				<div class="border-b mb-5 mx-auto"
					style="width: 138px; border-bottom: 3px solid #1496C8;"></div>
			</div>
		</div>

		<div id="main-carousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div id="start" width="800px"></div>
			</div>
		</div>
	</div>
</div>


<!-- ��ż���  >> �����ڰ� �����⿡ �ְ��� ��ǰ 1��, �����ڼ����� ���3�� -->
<div id="main-auction" class="py-5" style="background-color: #FAFAFA;">
	<div class="container">
		<div class="row">
			<div class="col-md-3 py-5">
				<div class="px-3">
					<div class="row">
						<div class="col-md-12 px-2">
							<h3 class="mb-4 text-secondary">HOT��Ű���</h3>
						</div>
					</div>
					<div class="row box px-2 text-center"
						style="background-color: white;">
						<div class="col-md-12 col-6 align-self-center">
							<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
						</div>
						<div class="col-md-12 col-6 align-self-center">
							<p class="mb-2">
								<strong>KBO 2017 ���α�</strong><br> �����ڼ� : 22��
							</p>
							<p style="color: red;">
								<strong>70,000��</strong>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 py-5">
				<div class="px-3">
					<div class="row">
						<div class="col-md-12 px-2">
							<h3 class="mb-4 text-secondary">BEST��ǰ</h3>
						</div>
					</div>
					<div class="row">
						<div class="text-center col-md-4 box"
							style="background-color: white;">
							<div class="row px-2">
								<div class="col-md-12 col-6 align-self-center">
									<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
								</div>
								<div class="col-md-12 col-6 align-self-center">
									<p class="mb-2">
										<strong>KBO ���ڸ��� �� �ƴ�1</strong><br> �����ڼ� : 31��
									</p>
									<p>
										<strong>5,000��</strong>
									</p>
								</div>
							</div>
						</div>
						<div class="text-center col-md-4 box"
							style="background-color: white;">
							<div class="row px-2">
								<div class="col-md-12 col-6 align-self-center">
									<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
								</div>
								<div class="col-md-12 col-6 align-self-center">
									<p class="mb-2">
										<strong>KBO ���ڸ��� �� �ƴ�2</strong><br> �����ڼ� : 202��
									</p>
									<p>
										<strong>5,000��</strong>
									</p>
								</div>
							</div>
						</div>
						<div class="text-center col-md-4 box"
							style="background-color: white;">
							<div class="row px-2">
								<div class="col-md-12 col-6 align-self-center">
									<img src="<%=root%>/img/auction/auc2.jpg" class="img-fluid">
								</div>
								<div class="col-md-12 col-6 align-self-center">
									<p class="mb-2">
										<strong>KBO ���ڸ��� �� �ƴ�3</strong><br> �����ڼ� : 98��
									</p>
									<p>
										<strong>100,000��</strong>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- ����/Ŀ�´�Ƽ ���� -->
<!-- ����/Ŀ�´�Ƽ ���� >> ���� �ֽŴ���3��-->
<div id="main-ncsection" class="py-5" style="background-color: #F1F1F1;">
	<div class="container">
		<div class="row">
			<div class="col-md-6 px-3 py-5">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-secondary mb-0">NEWS</h3>
					</div>
					<div class="col-md-12 text-right">
						<p class="text-dark mb-1" style="font-size: 14px;">+ ��ü����</p>
					</div>
				</div>
				<ul class="list-group">
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper align-self-center text-center col-4">
								<img src="<%=root%>/img/news/news3.jpg" class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>�λ� �ܱ��� ���� ��� ��ħ '�켱 ����Ʈ ����'</b>
								</h5>
								<p class="my-1">�λ� ����� 2018�� ������ �غ��ϸ鼭 �ܱ��� ���� ������ �Ű��� ���
									�մ�. ���� ���̽��� 7���� ���� �Բ�...</p>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<!-- ����/Ŀ�´�Ƽ ���� >> Ŀ�´�Ƽ ��ȸ������Ŀ�´�Ƽ Ȥ�� �ֽ�Ŀ�´�Ƽ 3�� -->
			<div class="col-md-6 px-3 py-5">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-secondary mb-0">COMMUNITY</h3>
					</div>
					<div class="col-md-12 text-right">
						<p class="text-dark mb-1" style="font-size: 14px;">+ ��ü����</p>
					</div>
				</div>
				<ul class="list-group">
					<li class="list-group-item">

						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>�����ϰ� ������ �ʿ䰡 ������.</b>
								</h5>
								<p class="my-1">�ÿ� 1�������� ��ũ�������� ����Ȩ�� ������, �ڽ� 5�������� �̹�ȣ����
									����Ȩ�� �������� ��� �� �����̴�����.</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">
								<img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>������</b>
								</h5>
								<p class="my-1">������ �����̱��� ��Ƴ��� ���� �θ� �ѵ��� �赿�� ������ �ֽ��� ��������
									���������ϴ�</p>
							</div>
						</div>
					</li>
					<li class="list-group-item">

						<div class="row px-2">
							<div class="img-wrapper-c text-center col-4">

								<img src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
									class="img-fluid">
							</div>
							<div class="col-8 align-self-center pr-0">
								<h5 class="mb-3 text-dark">
									<b>����� 10���� �Ҽ� �ִ� �����̴�</b>
								</h5>
								<p class="my-1">�������⿡�� ����Ʈ�� ���̻� ���̽����� �ƴ϶� ��2�뺴������ ������ ������ �׿�
									�°� å������� �Ѵ�...</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- ���ܺ� �ΰ� >> ��ũ ������������ -->
<div id="main-gudan-logo" class="py-5">
	<div class="container">
		<div class="row">
			<div class="p-0 col-md-1 col-12"></div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-mobile">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-lotte.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-kt.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-nexen.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-kia.png" class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center main-doosan-pc">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-doosan.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-lg.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-hanwha.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-sk.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img src="<%=root%>/img/gudan/emblem/emblem-nc.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12 text-center">
				<a href="#"> <img
					src="<%=root%>/img/gudan/emblem/emblem-samsung.png"
					class="img-fluid">
				</a>
			</div>
			<div class="p-0 col-md-1 col-12"></div>
		</div>
	</div>
</div>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>