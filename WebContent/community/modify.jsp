<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto,com.baseball.board.model.BoardDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
BoardDto boardDto = (BoardDto) request.getAttribute("parentarticle");

if(memberDto != null) {
%>
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/alice.css">
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/oz.css">
<script type="text/javascript" src="<%=root %>/js/prototype.js"></script>
<script type="text/javascript" src="<%=root %>/js/extprototype.js"></script>	
<script type="text/javascript" src="<%=root %>/js/oz.js"></script>	
<script type="text/javascript" src="<%=root %>/js/alice.js"></script>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

var alice;
Event.observe(window, "load", function() {
	startTime();
	alice = Web.EditorManager.instance("editor",{type:'detail',width:'96%',height:'100%',limit:20,family:'돋움',size:'13px'});
});	

function writeArticle(){
	if(document.getElementById("subject").value == "") {
		alert("제목을 입력하세요");
		return;
	}else if(alice.getContent() == ""){
		alert("내용을 입력하세요");
		return;
	}else{
		document.getElementById("content").value = alice.getContent();
		document.getElementById("writeForm").action = "<%=root%>/board";
		document.getElementById("writeForm").submit();
	}
}

function startTime() {
	var params = "act=bestarticle&tno=<%=gudanDto.getTno()%>";
	sendRequest("<%=root%>/board", params, bestList, "GET");
}

function bestList() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
		 	makelist(listxml);
			window.setTimeout("startTime();", 5000);
		} 
	}
}

function makelist(data) {
	var output = "";
	var len = data.getElementsByTagName("board").length;
	
	if(len == 0) {
		output = "<div class=\"col-md-12 text-center py-3\"><h6>베스트글이 존재하지 않습니다.</h6></div>";
	} else {	
		output += "<ul class=\"list-group\">";
		for(var i=0;i<len;i++) {
			var bno = data.getElementsByTagName("bno")[i].firstChild.data;
			var bname = data.getElementsByTagName("bname")[i].firstChild.data;
			var replycnt = data.getElementsByTagName("replycnt")[i].firstChild.data;
			
			output += "<li class=\"list-group-item over-subject\" style=\"border: none;\">";
			output += "<span class=\"bestnum\" ";
			if(i==0||i==1||i==2) {
				output += "style=\"color: red;\"";
			}
			output += ">";
			output += (i+1) + "</span>";
			output += "<span id=\"bestsubject\">";
			output += "<a href=\"javascript:viewArticle('<%=tno%>','1','','','" + bno + "');\">";
			output += bname + "...(" + replycnt + ")</a>";
			output += "</span>";
			output += "</li>";
		}
		output += "</ul>";
	}
	document.getElementById("bestboard").innerHTML = output;
}

</script>

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<div class="">
					<h5>
						<strong>커뮤니티 수정하기</strong>
					</h5>
				</div>
				<div class="border-b-strong mb-5"></div>


<form id="writeForm" name="writeForm" class="">

<input type="hidden" name="act" value="modifyarticle">
<input type="hidden" name="tno" value="<%=tno%>">
<input type="hidden" name="pg" value="1">
<input type="hidden" name="seq" value="<%=boardDto.getBno()%>">
<input type="hidden" id="content" name="content" value=""> <!-- 앨리스때문에 필요함 -->
				
					<div class="form-group row px-3">
						<label for="selectgudan" class="col-sm-2 col-4 col-form-label">구단</label>
						<div class="col-sm-4 col-8">
							<input type="text" class="form-control" id="gudanName" name="gudanName"
								placeholder="<%=gudanDto.getTname()%>" readonly>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="writeName" class="col-sm-2 col-4 col-form-label">작성자</label>
						<div class="col-sm-4 col-8">
							<input type="text" class="form-control" id="writer" name="writer"
								placeholder="<%=memberDto.getName()%>" readonly>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="inputSubject" class="col-sm-2 col-12 col-form-label">제목</label>
						<div class="col-sm-10 col-12">
							<input type="text" class="form-control" id="subject" name="subject"
								placeholder="" size="76" maxlength="150" value="<%=boardDto.getBname()%>">
						</div>
					</div>

					<div class="form-group row px-3">
						<div class="col-md-12">
							<textarea class="form-control" rows="20" id="editor" name="editor"><%=boardDto.getBdetail()%></textarea>
						</div>
					</div>

					<!-- 첨부파일 -->
<!-- 					<div class="form-group row px-3">
						<label for="inputfile" class="col-sm-2 col-form-label">첨부파일</label>
						<div class="col-sm-10">
							<input type="file" class="form-control-file mb-2"
								id="exampleFormControlFile1"> <label
								style="font-size: 14px;">이미지 크기는 3MB이하로 제한됩니다.(수정)</label>
							왜안먹히지..ㅠㅠ
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label>
						</div>
					</div> -->

					<!-- 캡챠 -->
				</form>

				<div class="border-b mb-3"></div>
				<div class="d-flex">
					<div class="mr-auto p-2">
						<a class="btn btn-primary btn-sm" href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');" role="button"
							style="color: white !important;">목록보기</a>
					</div>
					<div class="p-2">
						<a class="btn btn-secondary btn-sm" href="javascript:history.back();" role="button"
							style="color: white !important;">취소</a>
					</div>
					<div class="p-2">
						<a class="btn btn-primary btn-sm" href="javascript: writeArticle();" role="button"
							style="color: white !important;">수정</a>
					</div>
				</div>
			</div>
			<!-- col-md-8 -->

			<div class="col-md-4 py-5">
				<h5>
					<strong>실시간베스트</strong>
				</h5>
				<div class="border-b-strong"></div>
				<div id="bestboard"></div>
			</div>
		</div>

	</div>
</div>
<%
} else {
%>
<script>
alert("로그인이 필요한 페이지입니다.");
document.location.href = "<%=root%>/login/login.jsp";
</script>
<%
}
%>


<!-- alice용 footer영역 -->
<%@ include file="/community/boardfooter.jsp"%>