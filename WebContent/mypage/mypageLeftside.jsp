<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<script>
function mypage(){
	alert()
	
}

function modifyinfo(){
	
}

function moveModify() {
	document.location.href = "<%=root%>/mypage?act=movemodify";
}


function myauction(){
	
}

function lookie(){
	
}

function myarticle(){
	document.getElementById("cact").value = "listarticle";
	document.getElementById("cbcode").value = bcode;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function logout(){
	document.location.href = "<%=root %>/kbopark?act=logout";
}





</script>


<!-- stylesheet -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600italic,600' rel='stylesheet' type='text/css'>
<!-- bootstrap Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="/css/flexslider.css" type="text/css">
<!-- Favicon -->

<link type="text/css" media="all" rel="stylesheet" href="/css/jquery.tosrus.all.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/slick.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/owl.carousel.css" />
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/css/plugins/slide-in-panel/style.css" />
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="/css/custom.css">
<link rel="stylesheet" href="/theme/a/custom.css">
<link rel="stylesheet" href="/skin/custom.css">

<div class="container-fluid">

    <div id="menuarea" class="col-sm-2" style="background-color:#F8F8FF;">
    				
    	<div><button type="button" class="btn btn-primary" onclick="location.href='<%=root%>/mypage?act=mvmypage'" style="height:50px;width:100%;margin:5px;">마이페이지</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="location.href = '<%=root%>/mypage?act=movemodify'" style="height:50px;width:100%;margin:5px;">정보수정</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="location.href='<%=root%>/mypage/myauction.jsp'" style="height:50px;width:100%;margin:5px;">경매 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="location.href='<%=root%>/mypage/lookie.jsp'" style="height:50px;width:100%;margin:5px;">루키 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="location.href='<%=root%>/mypage/myarticle.jsp'" style="height:50px;width:100%;margin:5px;">게시물 관리</button></div>
       	<div><button type="button" class="btn btn-primary" onclick="javascript:logout();" style="height:50px;width:100%;margin:5px;">로그아웃</button></div>
      </div>
      





</body>
</html>