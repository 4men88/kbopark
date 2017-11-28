<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역 -->
<%@ include file="/common/header.jsp"%>

<script>
function login(){
	if(document.getElementById("id").value==""){
		alert("아이디를 입력하세요");
	}else if(document.getElementById("pass").value==""){
		alert("패스워드를 입력하세요");
	}else{
		document.getElementById("loginform").action="<%=root%>/kbopark";
		document.getElementById("loginform").submit();
	}
}
</script>

<div class="py-5 mx-auto" style="max-width: 1140px;">

	<div class="row py-5 px-3">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h2 class="text-dark mb-5">로그인</h2>

			<form class="" id="loginform" name="loginform" method="post" action="">
			<input type="hidden" name="act" id="act" value="login">
				<div class="form-group">
					<input type="text" id="id" name="id" class="form-control" placeholder="아이디">
				</div>
				<div class="form-group">
					<input type="password" id="pass" name="pass" class="form-control"
						placeholder="비밀번호">
				</div>

				<input type="button" class="btn btn-block btn-lg btn-primary mb-3" value="로그인" onclick="javascript:login();">

				<div class="d-flex mb-3">
					<div class="mr-auto px-2 my-0">
						<div class="form-check my-0">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input">ID저장
							</label>
						</div>
					</div>
					<div class="px-2 border-r">
						<span><a href="">ID찾기</a></span>
					</div>
					<div class="px-2"><a href="">비밀번호찾기</a></div>
				</div>

			</form>

			<div class="border-b mb-2"></div>

			<div class="row text-center">
				<div class="col-md-6 col-12 p-3">
					<a href="#"> <span style="color: #3b5998 !important;"> <i
							class="fa fa-facebook" aria-hidden="true"></i>&nbsp;페이스북 로그인
					</span>
					</a>
				</div>
				<div class="col-md-6 col-12 p-3">
					<a href="#"> <span style="color: #23a4f2 !important;"> <i
							class="fa fa-twitter" aria-hidden="true"></i>&nbsp;트위터 로그인
					</span>
					</a>
				</div>

			</div>
		</div>

	</div>

</div>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>    
