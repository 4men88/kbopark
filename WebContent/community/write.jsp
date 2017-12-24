<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");

if(memberDto != null) {
%>
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/alice.css">
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/oz.css">
<script type="text/javascript" src="<%=root %>/js/prototype.js"></script>
<script type="text/javascript" src="<%=root %>/js/extprototype.js"></script>	
<script type="text/javascript" src="<%=root %>/js/oz.js"></script>	
<script type="text/javascript" src="<%=root %>/js/alice.js"></script>
<script type="text/javascript">
control = "/board";

var alice;
Event.observe(window, "load", function() {
	alice = Web.EditorManager.instance("editor",{type:'detail',width:'96%',height:'100%',limit:20,family:'����',size:'13px'});

});	

function writeArticle(){
	if(document.getElementById("subject").value == "") {
		alert("������ �Է��ϼ���");
		return;
	}else if(alice.getContent() == ""){
		alert("������ �Է��ϼ���");
		return;
	}else{
		document.getElementById("content").value = alice.getContent();
		document.getElementById("boardtno").value = document.getElementById("selectgudan").value;
		document.getElementById("writeForm").action = "<%=root%>/board";
		document.getElementById("writeForm").submit();
	}
}

window.onload=function(){
	
}
</script>

<!-- ���ܳ׺������ -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<div class="">
					<h5>
						<strong>Ŀ�´�Ƽ �۾���</strong>
					</h5>
				</div>
				<div class="border-b-strong mb-5"></div>





				<form id="writeForm" name="writeForm" class="">
<input type="hidden" name="act" value="newarticle">
<%-- <input type="hidden" name="bcode" value="<%=bcode%>">
<input type="hidden" name="pg" value="<%=pg%>"> --%>
<input type="hidden" id="content" name="content" value="">
<input type="hidden" id="boardtno" name="boardtno" value="">		
				
					<div class="form-group row px-3">
						<label for="selectgudan" class="col-sm-2 col-4 col-form-label">����</label>
						<div class="col-sm-4 col-8">
							<select id="selectgudan" name="selectgudan" class="form-control">
								<option value="2" selected>�λ� ���</option>
								<option value="3">�Ե� ���̾���</option>
								<option value="1">KIA Ÿ�̰���</option>
								<option value="4">NC ���̳뽺</option>
								<option value="5">SK ���̹���</option>
								<option value="6">LG Ʈ����</option>
								<option value="7">�ؼ� �������</option>
								<option value="8">��ȭ �̱۽�</option>
								<option value="9">�Ｚ ���̿���</option>
								<option value="10">KT ����</option>
							</select>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="writeName" class="col-sm-2 col-4 col-form-label">�ۼ���</label>
						<div class="col-sm-4 col-8">
							<input type="text" class="form-control" id="writer" name="writer"
								placeholder="<%=memberDto.getName()%>" readonly>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="inputSubject" class="col-sm-2 col-12 col-form-label">����</label>
						<div class="col-sm-10 col-12">
							<input type="text" class="form-control" id="subject" name="subject"
								placeholder="" size="76" maxlength="150">
						</div>
					</div>

					<div class="form-group row px-3">
						<div class="col-md-12">
							<textarea class="form-control" rows="20" id="editor" name="editor"></textarea>
						</div>
					</div>

					<!-- ÷������ -->
					<div class="form-group row px-3">
						<label for="inputfile" class="col-sm-2 col-form-label">÷������</label>
						<div class="col-sm-10">
							<input type="file" class="form-control-file mb-2"
								id="exampleFormControlFile1"> <label
								style="font-size: 14px;">�̹��� ũ��� 3MB���Ϸ� ���ѵ˴ϴ�.(����)</label>
							<!-- �־ȸ�����..�Ф�
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label> -->
						</div>
					</div>

					<!-- ĸí -->
				</form>

				<div class="border-b mb-3"></div>
				<div class="d-flex">
					<div class="mr-auto p-2">
						<a class="btn btn-primary btn-sm" href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');" role="button"
							style="color: white !important;">��Ϻ���</a>
					</div>
					<div class="p-2">
						<a class="btn btn-secondary btn-sm" href="javascript:history.back();" role="button"
							style="color: white !important;">���</a>
					</div>
					<div class="p-2">
						<a class="btn btn-primary btn-sm" href="javascript: writeArticle();" role="button"
							style="color: white !important;">���</a>
					</div>
				</div>





			</div>
			<!-- col-md-8 -->

			<div class="col-md-4 py-5">
				<h5>
					<strong>�ǽð�����Ʈ</strong>
				</h5>
				<div class="border-b-strong"></div>
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> �������� ���� �̷��� Ŀ��...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> ���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> ���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> �������� ���� �̷��� Ŀ��... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						���������� �׷����� ��ź��... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						���������� �׷����� ��... (65)</li>
				</ul>
			</div>

		</div>

	</div>
</div>
<%
} else {
%>
<script>
alert("�α����� �ʿ��� �������Դϴ�.");
document.location.href = "<%=root%>/login/login.jsp";
</script>
<%
}
%>


<!-- alice�� footer���� -->
<%@ include file="/community/boardfooter.jsp"%>