<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.member.model.MemberDetailDto,com.baseball.util.*"%>
<%
String root = request.getContextPath();//root 얻기
MemberDetailDto memberDto = (MemberDetailDto)session.getAttribute("userInfo");

int pg = NullCheck.nullToOne(request.getParameter("pg"));
String key = StringEncoder.isoToMain(request.getParameter("key"));
String word = StringEncoder.isoToMain(request.getParameter("word"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta charset="utf-8">-->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KBO PARK 야구 커뮤니티 - 경매, 뉴스, 일정, 구단안내</title>
<!-- 부트스트랩 및 폰트 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	type="text/css">
<!-- 브라우저 상단 favicon -->
<link rel="icon" type="image/png" href="<%=root%>/img/fabicon.png" />
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 선민 적용 css -->
<link rel="stylesheet" href="<%=root%>/style.css" type="text/css">

<!-- 17.11.17 스크립트 파일은 현재 body 하단, footer.jsp에 있습니다. -->
</head>

<body>
<form id="commonForm" name="commonForm" method="get" action="">
	<input type="hidden" id="cact" name="act" value="">
	<input type="hidden" id="cpg" name="pg" value="">
	<input type="hidden" id="ckey" name="key" value="">
	<input type="hidden" id="cword" name="word" value="">
	<input type="hidden" id="cseq" name="seq" value="">
</form>