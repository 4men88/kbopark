<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- ��ǰ�������� �ߴ� �� ������. -->
<!-- header���� -->
<%@ include file="/common/header.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/css/alice.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/css/oz.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=root%>/js/prototype.js"></script>
<script type="text/javascript" src="<%=root%>/js/extprototype.js"></script>	
<script type="text/javascript" src="<%=root%>/js/oz.js"></script>	
<script type="text/javascript" src="<%=root%>/js/alice.js"></script>
<script type="text/javascript">
var j = jQuery.noConflict();
j.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '���� ��',
    nextText: '���� ��',
    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
    showMonthAfterYear: true,
    yearSuffix: 'Year'
});
j( function() {
	  j( "#mdatepicker1").datepicker({dateFormat: 'yy.mm.dd', minDate: 0,
		  onSelect: function(selected) {
			  j("#mdatepicker2").datepicker("option","minDate", selected)
			  }});
	    });
j( function() {
	  j( "#mdatepicker2").datepicker({dateFormat: 'yy.mm.dd',
		  onSelect: function(selected) {
			  j("#mdatepicker1").datepicker("option","maxDate", selected)
			  }});
	   });	      
	   
function selectedchange(){
	var selectcategory1 = document.getElementById("selectcategory1").selectedIndex;
	var selectcategory2 = document.getElementById("selectcategory2");
	if(selectcategory1 == 1){
		selectcategory2.innerHTML = "<option>����</option><option>����</option><option>����</option><option>��Ÿ</option>";
	}else if(selectcategory1 == 2){
		selectcategory2.innerHTML = "<option>�߱���</option><option>��Ʈ</option><option>�۷���</option><option>��ȣ���</option><option>��Ÿ</option>";
	}else if(selectcategory1 == 3){
		selectcategory2.innerHTML = "<option>����</option><option>LED ����</option><option>��Ÿ</option>";
	}else if(selectcategory1 == 4){
		selectcategory2.innerHTML = "<option>����</option><option>Ƽ��</option><option>ī��</option><option>��Ÿ</option>";
	}else{
		alert("����");
	}
}

$(function() {
	'use strict'
	$('[data-toggle="offcanvas"]').on('click', function() {
		$('.row-offcanvas').toggleClass('active')
	})
});
	
function categoryList(key, word, category1, category2, gudan, conpg, endpg, choice){
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
//���ڸ� �Է� <input type="text" style="IME-MODE:disabled;" onKeyDown="onOnlyNumber(this);"
function onOnlyNumber(obj) {
 for (var i = 0; i < obj.value.length ; i++){
  chr = obj.value.substr(i,1);  
  chr = escape(chr);
  key_eg = chr.charAt(1);
  if (key_eg == "u"){
   key_num = chr.substr(i,(chr.length-1));   
   if((key_num < "AC00") || (key_num > "D7A3")) { 
    event.returnValue = false;
   }    
  }
 }
 if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || event.keyCode == 9) {
 } else {
  event.returnValue = false;
 }
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

		<div class="col-12 col-md-10 px-5 pt-2 pb-5">
			<form id="writeForm" name="writeForm" method="post" action=""
			  enctype="multipart/form-data" style="margin: 0px">
				<div class="">
					<h5 class="border-b mb-5 p-3">�⺻��ǰ����</h5>
				</div>

				<div class="row">
					<div class="col-md-3">
						<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
					</div>
					<div class="col-md-9">
						<div class="form-group row px-3">
							<label for="selectcategory" class="col-sm-2 col-form-label">��ǰ�з�</label>
							<div class="col-sm-3">
								<select id="selectcategory1" name="selectcategory1"class="form-control" onchange="javascript:selectedchange();">
									<option selected>1��ī�װ�</option>
									<option>������</option>
									<option>����ǰ</option>
									<option>������ǰ</option>
									<option>��Ÿ��ȭ</option>
								</select>
							</div>
							<div class="col-sm-3">
								<select id="selectcategory2" class="form-control">
								<option selected>2��ī�װ�</option>
								</select>
							</div>
						</div>
						<div class="form-group row px-3">
							<label for="inputName" class="col-sm-2 col-12 col-form-label">��ǰ��</label>
							<div class="col-sm-6 col-12">
								<input type="text" class="form-control" id="inputName"
									placeholder="">
							</div>
						</div>
						<div class="form-group row px-3">
							<label class="col-sm-2 col-12 col-form-label">��Ž�����</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="mdatepicker1" 
									placeholder="" readonly>
							</div>
							<label class="col-sm-2 col-12 col-form-label">���������</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="mdatepicker2"
									placeholder="" readonly>
							</div>
						</div>

						<!-- �̹��� -->
						<div class="form-group row px-3">
							<label for="inputPassword1" class="col-sm-2 col-form-label">��й�ȣ</label>
							<div class="col-sm-10">

								<input type="file" class="form-control-file mb-2"
									id="exampleFormControlFile1">
									 <label>��ǥ�̹���
									300*300 ����� ����ȭ�Ǿ��ֽ��ϴ�.(����)</label> 
									<label>�̹����� �ִ� 3������ ���ε�
									�����մϴ�.</label>
									 <input type="file" class="form-control-file mb-2"
									id="exampleFormControlFile1"> 
									<input type="file"
									class="form-control-file" id="exampleFormControlFile1">
<!-- �־ȸ�����..�Ф�
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label>

 -->
							</div>
						</div>
						<!-- �̹��� -->

						<div class="form-group row px-3">
							<label for="bidprice" class="col-sm-2 col-form-label">�������۰�</label>
							<div class="col-sm-4 input-group">
								<input type="text" class="form-control" id="bidprice"
								onKeyDown="onOnlyNumber(this);">��Ű(��)</span>
							</div>
						</div>

						<div class="form-group row px-3">
							<label for="inputTeam" class="col-sm-2 col-form-label">���ܼ���</label>
							<div class="col-sm-4">
								<select id="inputTeamState" class="form-control">
									<option selected>�λ� ���</option>
									<option>�Ե� ���̾���</option>
									<option>KIA Ÿ�̰���</option>
									<option>NC ���̳뽺</option>
									<option>SK ���̹���</option>
									<option>LG Ʈ����</option>
									<option>�ؼ� �������</option>
									<option>��ȭ �̱۽�</option>
									<option>�Ｚ ���̿���</option>
									<option>KT ����</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<h5 class="border-b mb-5 p-3 pt-5">�󼼹�ǰ����</h5>
				</div>
				<div class="form-group">
					<textarea class="form-control" id="editor" name="editor"
						rows="10"></textarea>
				</div>
				<div class="px-3 py-5 text-center">
					<button type="button" class="btn btn-lg btn-primary"
						data-dismiss="modal">��ǰ���</button>
				</div>
			</form>

		</div>
	</div>
</div>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>