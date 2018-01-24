<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<script type="text/javascript" src="<%=root %>/js/httpRequest.js"></script>

<script type="text/javascript">
window.onload=function(){
	todaypl();
}
function todaypl(){
	//alert("todaypl");
	var params="act=todaypl";
	sendRequest("<%=root%>/admin", params, viewlist, "GET");
}

function viewlist(){	
	//alert("viewlist");
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
			makelist(listxml);
		}	
	}
}
function makelist(listxml){
	//alert("makelist"+listxml);
	var len = listxml.getElementsByTagName("schedule").length;
	
		var carousel = document.getElementById("start");
		if(len!=0){
			for(var i=0;i<len;i++){
				var div1 = document.createElement("div");
				if(i==0){
					div1.setAttribute("class", "carousel-item active");
				}else{
					div1.setAttribute("class", "carousel-item");
				}
				var div2 = document.createElement("div");
				div2.setAttribute("class", "row text-white text-center");
				var div3 = document.createElement("div");
				div3.setAttribute("class","mx-auto rounded carousel-size-wrapper");
				div3.style.backgroundImage="url("+root+"/img/etc/grass.jpg)";
				var div4=maketime(listxml.getElementsByTagName("schedule")[i]);
				var div5=maketeam(listxml.getElementsByTagName("schedule")[i]);
				div3.appendChild(div4);
				div3.appendChild(div5);
				div2.appendChild(div3);
				div1.appendChild(div2);
				carousel.appendChild(div1);
				
			}
			
			var a1 = document.createElement("a");
			a1.setAttribute("class", "carousel-control-prev");
			a1.setAttribute("href", "#main-carousel");
			a1.setAttribute("role", "button");
			a1.setAttribute("data-slide", "prev");
			a1.innerHTML = "<span class='carousel-control-prev-icon' aria-hidden='true'></span> <span class='sr-only'>Previous</span>";
			//var span1 = document.createElement("span");
			//span1.setAttribute("","");
			var a2 = document.createElement("a");
			a2.setAttribute("class", "carousel-control-next");
			a2.setAttribute("href", "#main-carousel");
			a2.setAttribute("role", "button");
			a2.setAttribute("data-slide", "next");
			a2.innerHTML = "<span class='carousel-control-next-icon' aria-hidden='true'></span> <span class='sr-only'>Next</span>";
			
			carousel.appendChild(a1);
			carousel.appendChild(a2);
		}else{
			var nodiv1= document.createElement("div");
			var nodiv2 = document.createElement("div");
			var nodiv3 = document.createElement("div");
			var nodiv4 = document.createElement("div");
			nodiv1.setAttribute("class", "carousel-item active")
			nodiv2.setAttribute("class", "row text-white text-center")
			nodiv3.setAttribute("class", "mx-auto rounded carousel-size-wrapper")
			nodiv3.setAttribute("style", "background-image: url("+root+"/img/etc/grass.jpg)");
			nodiv3.style.textAlign = "center";
			nodiv4.setAttribute("style", "width:536px;height:140px;margin-top:50px");
			nodiv4.innerHTML="<font size='23px'>������ �����ϴ�</font>";
			nodiv3.appendChild(nodiv4);
			nodiv2.appendChild(nodiv3);
			nodiv1.appendChild(nodiv2);
			carousel.appendChild(nodiv1);
			
		}
	}

function maketime(schedule){
	//alert("maketime");
	var sname = schedule.getElementsByTagName("sname")[0].firstChild.data;
	var playtime = schedule.getElementsByTagName("playtime")[0].firstChild.data;
	//alert(home+"   "+playtime)
	var timediv = document.createElement("div");
	timediv.setAttribute("class", "col-md-12 text-white p-2");
	timediv.style.backgroundColor = "rgba(50, 50, 50, 0.75)";
	timediv.innerHTML = "<span class='px-3 border-r'>"+sname+"</span><span class='px-3'>"+playtime+"</span>"
	
	return timediv;
	
}
function maketeam(schedule){
	//alert("maketeam");
	
	var homet = schedule.getElementsByTagName("home")[0].firstChild.data;
	var awayt = schedule.getElementsByTagName("away")[0].firstChild.data;
	var hemblem = schedule.getElementsByTagName("hemblem")[0].firstChild.data;
	var aemblem = schedule.getElementsByTagName("aemblem")[0].firstChild.data;
	//alert(home);
	var div1 = document.createElement("div");
	div1.setAttribute("class", "col-md-12 opaque-overlay py-2 px-3");
	var div2 = document.createElement("div");
	div2.setAttribute("class", "row");
	var home = document.createElement("div");
	home.setAttribute("class", "col-md-5 p-0 col-12");
	home.style.textAlign = "left";
	//home.setAttribute("style", "text-align:left");
	//var img = document.createElement("img");
	//img.setAttribute("src",root+hemblem);
	//img.setAttribute("class", "img-thumbnail");
	//var label = document.createElement("label");
	//label.innerHTML = home;
	//home.appendChild(img);
	//home.appendChild(label);
	
	home.innerHTML = "<img src='"+root+hemblem+"' class='img-thumbnail'><label>"+homet+"</label>";
	//str+="<img src='"+(root+hemblem)+"'class='img-thumbnail'>";
	//alert(root+hemblem);
	//str+="<label>"+home+"</label>";
	var vs = document.createElement("div");
	vs.setAttribute("class", "col-md-2 p-0 col-12 align-self-center");
	vs.innerHTML = "<h2 class='m-0'><strong>VS</strong></h2>";
	var away = document.createElement("div");
	away.setAttribute("class", "col-md-5 p-0 col-12");
	away.style.textAlign="right";
	//away.setAttribute("style", "text-align:right");
	
	away.innerHTML = "<label align='center'>"+awayt+"</label><img src='"+root+aemblem+"' class='img-thumbnail'>";
	
	
	div2.appendChild(home);
	div2.appendChild(vs);
	div2.appendChild(away);
	div1.appendChild(div2);
	return div1;
}  
</script>
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