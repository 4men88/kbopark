<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/admin/adcom/adheader.jsp"%>


<div class="col-md-8 py-5">
	<div class="">
		<h5>
			<strong>커뮤니티 글쓰기</strong>
		</h5>
	</div>
	<div class="border-b-strong mb-5"></div>





	<form id="" class="">
		<div class="form-group row px-3">
			<label for="selectgudan" class="col-sm-2 col-4 col-form-label">구단</label>
			<div class="col-sm-4 col-8">
				<select id="selectgudan" class="form-control">
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

		<div class="form-group row px-3">
			<label for="writeName" class="col-sm-2 col-4 col-form-label">작성자</label>
			<div class="col-sm-4 col-8">
				<input type="text" class="form-control" id="writeName"
					placeholder="딩동댕" readonly>
			</div>
		</div>

		<div class="form-group row px-3">
			<label for="inputSubject" class="col-sm-2 col-12 col-form-label">제목</label>
			<div class="col-sm-10 col-12">
				<input type="text" class="form-control" id="inputSubject"
					placeholder="">
			</div>
		</div>

		<div class="form-group row px-3">
			<div class="col-md-12">
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="20"></textarea>
			</div>
		</div>

		<!-- 첨부파일 -->
		<div class="form-group row px-3">
			<label for="inputfile" class="col-sm-2 col-form-label">첨부파일</label>
			<div class="col-sm-10">
				<input type="file" class="form-control-file mb-2"
					id="exampleFormControlFile1"> <label
					style="font-size: 14px;">이미지 크기는 3MB이하로 제한됩니다.(수정)</label>
				<!-- 왜안먹히지..ㅠㅠ
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label> -->
			</div>
		</div>

		<!-- 캡챠 -->
	</form>

	<div class="border-b mb-3"></div>
	<div class="d-flex">
		<div class="mr-auto p-2">
			<a class="btn btn-primary btn-sm" href="#" role="button"
				style="color: white !important;">목록보기</a>
		</div>
		<div class="p-2">
			<a class="btn btn-secondary btn-sm" href="#" role="button"
				style="color: white !important;">취소</a>
		</div>
		<div class="p-2">
			<a class="btn btn-primary btn-sm" href="#" role="button"
				style="color: white !important;">등록</a>
		</div>
	</div>
</div>
	<%@ include file="/admin/adcom/adfooter.jsp"%>