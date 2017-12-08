<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/setting.jsp"%>
<script src="<%=root%>/js/httpRequest.js"></script>
<script>

function idfind(){
	var fname = document.getElementById("name").value;
	var email1 = document.getElementById("email1").value;
	var email2 = document.getElementById("email2").value;
	if(fname==""){
		alert("아이디를 입력해 주세요");
	}else if(email1==""||email2==""){
		alert("이메일을 정확히 입력해주세요");
	}else{
		idfdresult = document.getElementById("idfdresult");
		var params = "act=idfind&fname="+fname+"&email1="+email1+"&email2="+email2;
		sendRequest("<%=root%>/kbopark", params, idCheckResult, "GET");
	}
	
		
}
 
function idCheckResult(){
  if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var fid = httpRequest.responseText;
			var resulttxt="";
			if(fid!="null"){
				resulttxt="찾으시는 아이디는"+fid+"입니다";
			}else{
				
				resulttxt="해당 정보의 아이디가 존재하지 않습니다";
			}
			idfdresult.innerHTML = resulttxt;
		}	
	}
}

</script>
<div class="container py-5 px-3">
<div class="row">
<div class="col-md-12">
<h5>아이디찾기</h5>
</div>
<div class="border-b"></div>



	<form name="" id="" method="">
			<input type="hidden" name="act" id="act" value="idfind">
				<div class="form-group row px-3">
					<label for="inputName" class="col-sm-2 col-12 col-form-label">이름</label>
					<div class="col-sm-4 col-12">
						<input type="text" class="form-control form-control-sm" id="name" name="name"
							placeholder="">
					</div>
				</div>

				<div class="form-group row align-items-center px-3">
					<label for="inputEmail1" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-3">
						<input type="text" class="form-control form-control-sm mb-2 mb-sm-0"
							id="email1" name="email1" placeholder="">
					</div>
					<div class="col-sm-4">
						<div class="input-group mb-2 mb-sm-0">
							<div class="input-group-addon">@</div>
							<input type="text" class="form-control form-control-sm" id="email2" name="email2"
								placeholder="">
						</div>
					</div>
				</div>

				<div id="idfdresult" align="center"></div>
				<div class="border-b mb-2 px-3"></div>
				<p class="text-right">
					<input type="button" class="btn btn-primary" value="아이디찾기" onclick="javascript:idfind();">
				</p>
				
				
	
	</form>




</div> <!-- row -->
</div>
</body>
</html>