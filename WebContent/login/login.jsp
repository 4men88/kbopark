<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ���� -->
<%@ include file="/common/header.jsp"%>

<%-- <script>
function login(){
	if(document.getElementById("id").value==""){
		alert("���̵� �Է��ϼ���");
	}else if(document.getElementById("pass").value==""){
		alert("�н����带 �Է��ϼ���");
	}else{
		document.loginform.action="<%=root%>/kbopark";
		document.loginform.submit();
	}
}
</script>

<form name="loginform" mathod="post" action="">
<input type="hidden" name="act" id="act" value="login">
���̵�<input type="text" name="id" id="id" value="">
��й�ȣ<input type="password" name="pass" id="pass" value="">
<input type="button" name="" id="" value="�α��ι�ư" onclick="javascript:login();">
<a href="">ȸ������</a>
<a href="">���̵�ã��</a>
<a href="">��й�ȣ ã��</a>
</form> --%>

<div class="py-5 mx-auto" style="max-width: 1140px;">

	<div class="row py-5 px-3">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h2 class="text-dark mb-5">�α���</h2>

			<form class="" method="post" action="">
				<div class="form-group">
					<input type="text" name="id" class="form-control" placeholder="���̵�">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control"
						placeholder="��й�ȣ">
				</div>

				<button type="submit" class="btn btn-block btn-lg btn-primary mb-3">�α���</button>

				<div class="d-flex mb-3">
					<div class="mr-auto px-2 my-0">
						<div class="form-check my-0">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input">ID����
							</label>
						</div>
					</div>
					<div class="px-2 border-r">
						<span>IDã��</span>
					</div>
					<div class="px-2">��й�ȣã��</div>
				</div>

			</form>

			<div class="border-b mb-2"></div>

			<div class="row text-center">
				<div class="col-md-6 col-12 p-3">
					<a href="#"> <span style="color: #3b5998 !important;"> <i
							class="fa fa-facebook" aria-hidden="true"></i>&nbsp;���̽��� �α���
					</span>
					</a>
				</div>
				<div class="col-md-6 col-12 p-3">
					<a href="#"> <span style="color: #23a4f2 !important;"> <i
							class="fa fa-twitter" aria-hidden="true"></i>&nbsp;Ʈ���� �α���
					</span>
					</a>
				</div>

			</div>
		</div>

	</div>

</div>

<!-- footer���� -->
<%@ include file="/common/footer.jsp"%>    
