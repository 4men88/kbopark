<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/admin/adcom/adheader.jsp"%>
<script>
function writeNotice(){
	document.getElementById("noticeForm").onclick = "<%=root%>/admin";
	document.getElementById("noticeForm").submit();
}
</script>

<div class="col-md-8 py-5">
	<div class="">
		<h5>
			<strong>Ŀ�´�Ƽ �۾���</strong>
		</h5>
	</div>
	<div class="border-b-strong mb-5"></div>





	<form id="noticeForm" name="noticeForm" method="post" action="">
	<input type="hidden" name="act" id="act" value="writeno" >
		<div class="form-group row px-3">
			<label for="selectgudan" class="col-sm-2 col-4 col-form-label">����</label>
			<div class="col-sm-4 col-8">
				<select id="notitype" class="form-control">
					<option value="normal">�Ϲݰ���</option>
					<option value="auction">��Ű���<option>
				</select>
			</div>
		</div>

		<div class="form-group row px-3">
			<label for="writeName" class="col-sm-2 col-4 col-form-label">�ۼ���</label>
			<div class="col-sm-4 col-8">
				<input type="text" class="form-control" id="writer" value="admin" readonly="readonly">
			</div>
		</div>

		<div class="form-group row px-3">
			<label for="inputSubject" class="col-sm-2 col-12 col-form-label">����</label>
			<div class="col-sm-10 col-12">
				<input type="text" class="form-control" id="subject"
					placeholder="">
			</div>
		</div>

		<div class="form-group row px-3">
			<div class="col-md-12">
				<textarea class="form-control" id="context"
					rows="20"></textarea>
			</div>
		</div>

		<!-- ÷������ -->
		<div class="form-group row px-3">
			<label for="file" class="col-sm-2 col-form-label">÷������</label>
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
			<a class="btn btn-primary btn-sm" href="#" role="button"
				style="color: white !important;">��Ϻ���</a>
		</div>
		<div class="p-2">
			<a class="btn btn-secondary btn-sm" href="" role="button"
				style="color: white !important;">���</a>
		</div>
		<div class="p-2">
			<input class="btn btn-secondary btn-sm" type="button" value="���" onclick="javascript:writeNotice();">
		</div>
	</div>
</div>
	<%@ include file="/admin/adcom/adfooter.jsp"%>