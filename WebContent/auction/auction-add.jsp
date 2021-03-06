<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 상품눌렀을때 뜨는 상세 페이지. -->
<!-- header영역 -->
<%@ include file="/common/header.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/css/alice.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/css/oz.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=root%>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=root%>/js/prototype.js"></script>
<script type="text/javascript" src="<%=root%>/js/extprototype.js"></script>	
<script type="text/javascript" src="<%=root%>/js/oz.js"></script>	
<script type="text/javascript" src="<%=root%>/js/alice.js"></script>
<script type="text/javascript">
var j = jQuery.noConflict();
j.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
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

var alice;
Event.observe(window, "load", function() {
	alice = Web.EditorManager.instance("editor",{type:'detail',width:600,height:600,limit:1000,family:'돋움',size:'13px'});
	alice.showAlice();
});	

function selectedchange(){
	var selectcategory1 = document.getElementById("selectcategory1").selectedIndex;
	var selectcategory2 = document.getElementById("selectcategory2");
	if(selectcategory1 == 1){
		selectcategory2.innerHTML = "<option>상의</option><option>하의</option><option>모자</option><option>기타</option>";
	}else if(selectcategory1 == 2){
		selectcategory2.innerHTML = "<option>야구공</option><option>배트</option><option>글러브</option><option>보호장비</option><option>기타</option>";
	}else if(selectcategory1 == 3){
		selectcategory2.innerHTML = "<option>피켓</option><option>LED 피켓</option><option>기타</option>";
	}else if(selectcategory1 == 4){
		selectcategory2.innerHTML = "<option>사진</option><option>티켓</option><option>카드</option><option>기타</option>";
	}else{
		alert("에러");
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
function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
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

		<div class="col-12 col-md-10 px-5 pt-2 pb-5">
			<form id="writeForm" name="writeForm" method="post" action=""
			  enctype="multipart/form-data" style="margin: 0px">
				<div class="">
					<h5 class="border-b mb-5 p-3">기본물품정보</h5>
				</div>

				<div class="row">
					<div class="col-md-3">
						<img src="<%=root%>/img/auction/auc1.jpg" class="img-fluid">
					</div>
					<div class="col-md-9">
						<div class="form-group row px-3">
							<label for="selectcategory" class="col-sm-2 col-form-label">물품분류</label>
							<div class="col-sm-3">
								<select id="selectcategory1" name="selectcategory1"class="form-control" onchange="javascript:selectedchange();">
									<option selected>1차카테고리</option>
									<option>유니폼</option>
									<option>경기용품</option>
									<option>응원용품</option>
									<option>기타잡화</option>
								</select>
							</div>
							<div class="col-sm-3">
								<select id="selectcategory2" class="form-control">
								<option selected>2차카테고리</option>
								</select>
							</div>
						</div>
						<div class="form-group row px-3">
							<label for="inputName" class="col-sm-2 col-12 col-form-label">물품명</label>
							<div class="col-sm-6 col-12">
								<input type="text" class="form-control" id="inputName"
									placeholder="">
							</div>
						</div>
						<div class="form-group row px-3">
							<label class="col-sm-2 col-12 col-form-label">경매시작일</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="mdatepicker1" 
									placeholder="" readonly>
							</div>
							<label class="col-sm-2 col-12 col-form-label">경매종료일</label>
							<div class="col-sm-4 col-8">
								<input type="text" class="form-control" id="mdatepicker2"
									placeholder="" readonly>
							</div>
						</div>

						<!-- 이미지 -->
						<div class="form-group row px-3">
							<label class="col-sm-2 col-form-label">사진등록</label>
							<div class="col-sm-10">
								<input multiple="multiple" type="file" name="filename[]" 
								class="form-control-file" id="exampleFormControlFile1"
								/>
							</div>
						</div>
						<!-- 이미지 -->
						<div class="form-group row px-3">
							<label for="bidprice" class="col-sm-2 col-form-label">입찰시작가</label>
							<div class="col-sm-4 input-group">
								<input type="text" class="form-control" id="bidprice"
								onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' 
								style='ime-mode:disabled;'>루키(원)</span>
							</div>
						</div>						
						<div class="form-group row px-3">
							<label for="inputTeam" class="col-sm-2 col-form-label">구단선택</label>
							<div class="col-sm-4">
								<select id="inputTeamState" class="form-control">
									<option selected>두산 베어스</option>
									<option>롯데 자이언츠</option>
									<option>KIA 타이거즈</option>
									<option>NC 다이노스</option>
									<option>SK 와이번스</option>
									<option>LG 트윈스</option>
									<option>넥센 히어로즈</option>
									<option>한화 이글스</option>
									<option>삼성 라이온즈</option>
									<option>KT 위즈</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<h5 class="border-b mb-5 p-3 pt-5">상세물품정보</h5>
				</div>
				<div class="form-group">
					<textarea class="form-control" id="editor" name="editor"></textarea>
				</div>
				<div class="px-3 py-5 text-center">
					<button type="button" class="btn btn-lg btn-primary"
						data-dismiss="modal">물품등록</button>
				</div>
			</form>

		</div>
	</div>
</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>