<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();	
String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 확인</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
function idcheck(){
	var id = document.idckform.id.value
	
	if(id==""){
		alert("아이디를 입력해");
		return;
	}else if(id.length<4 || id.length>16){
		alert("아이디는 4자이상 16자 이하여야 합니다");
		return;
		
	}else{
		document.idckform.action="<%=root%>/member";
		document.idckform.submit();
	}
	
}
function useid(uid){
	opener.document.memberform.id.value=uid;
	self.close();
}
</script>

</head>

<body>
	<form name="idckform" method="get" action="" onsubmit="return false">
	<input type="hidden" id="act" name="act" value="idcheck">
		<div class="container" align="center">
			<div align="center"
				style="width: 500px; border: 1px solid #cccccc; padding: 20px; margin-top: 30px">
				<h4>아이디 중복검사</h4>
				<hr />
				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 80px">아이디</label> 
					<input id="id" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요." onkeypress="javascript:if(event.keyCode==13){idcheck();}"/> 
					<input type="button" class="btn btn-success" value="중복확인" onclick="javascript:idcheck();">
				</div>
				<hr />
				
				<%
				if(id==null){
				%>
				<div align="center">검색할 아이디를 입력해주세요.</div>
				
				<%
				}else {
					int cnt = Integer.parseInt(request.getParameter("cnt"));
					if(cnt==0){
				
				%>
				<div align="center">
				<%=id %>는 사용할수 있습니다.<br>
				<input type="button" class="btn btn-success" value="사용하기" onclick="javascript:useid('<%=id%>');">
				</div>
				<%	}else{ %>
				<div align="center"><%=id %>는 사용할수 없습니다.<br>
				다른 아이디를 검색하세요</div>
				<%	}
				}%>
				
				
			</div>
		</div>
	</form>
</body>
</html>