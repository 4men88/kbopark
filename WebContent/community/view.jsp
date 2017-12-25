<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.board.model.BoardDto,com.baseball.gudan.model.GudanDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
BoardDto boardDto = (BoardDto) request.getAttribute("article");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

function notifyArticle() {
	document.getElementById("cact").value = "notifyarticle";
	document.getElementById("ctno").value = "<%=tno%>";
	document.getElementById("cpg").value = "<%=pg%>";
	document.getElementById("ckey").value = "<%=key%>";
	document.getElementById("cword").value = "<%=word%>";
	document.getElementById("cseq").value = "<%=boardDto.getBno()%>";
	
	document.getElementById("commonForm").action = "<%=root%>/board";
	document.getElementById("commonForm").submit();
	$('#notifyModal').modal('hide');
}

function moveReply() {
	document.getElementById("cact").value = "mvreply";
	document.getElementById("ctno").value = "<%=tno%>";
	document.getElementById("cpg").value = "1";
	document.getElementById("ckey").value = "";
	document.getElementById("cword").value = "";
	document.getElementById("cseq").value = "<%=boardDto.getBno()%>";
	
	document.getElementById("commonForm").action = "<%=root%>/reboard";
	document.getElementById("commonForm").submit();
}

function replyWrite(seq) {
<%	
	if(memberDto != null) {
%>
	var recontent = document.getElementById("recontent").value;
	document.getElementById("recontent").value = "";
	if(recontent != "") {
		var url = "<%=root%>/reply";
		var params = "act=writeReply&seq=" + seq + "&recontent=" + recontent;
		sendRequest(url, params, replyList, "POST");
	}
<%
	} else {
%>
		alert("로그인이 필요합니다");
		document.location.href = "<%=root%>/login/login.jsp";
<%
	}
%>
}

function replyDelete(reno, seq) {
	var url = "<%=root%>/reply";
	var params = "act=deleteReply&seq=" + seq + "&reno=" + reno;
	sendRequest(url, params, replyList, "GET");
}

function replyList() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
			makelist(listxml);
		} else {
			alert("error: " + httpRequest.status);
		}
	}
}

function makelist(data) {
	var output = "";
	var len = data.getElementsByTagName("reply").length;
	for(var i=0;i<len;i++) {
		
		var reno = data.getElementsByTagName("reno")[i].firstChild.data;
		var seq = data.getElementsByTagName("bno")[i].firstChild.data;
		var id = data.getElementsByTagName("id")[i].firstChild.data;
		
		output += "<tr>";
		output += "<td>" + data.getElementsByTagName("name")[i].firstChild.data + "</td>";
		output += "<td nowrap colspan=\"3\">" + data.getElementsByTagName("recontent")[i].firstChild.data;
<%
	if(memberDto != null) {
%>		
		if(id == "<%=memberDto.getId()%>") {
			output += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:replyDelete('" + reno + "', '" + seq + "');\">x</a>";
		}
<%
	}
%>	
		output += "</td>";
		output += "<td align=\"right\">" + data.getElementsByTagName("retime")[i].firstChild.data + "</td>";
		output += "</tr>";
	}

	document.getElementById("replylist").innerHTML = output;
}

$(document).ready(function(){
	var params = "act=listReply&seq=<%=boardDto.getBno()%>";
	sendRequest("<%=root%>/reply", params, replyList, "GET");
});

<%-- 
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
} --%>

</script>

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<!-- 모바일 라인 다시 잡아야함!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="javascript:moveWrite('<%=tno%>');"><i class="fa fa-pencil" aria-hidden="true"></i>
							새글쓰기</a>
<%
if(memberDto != null && memberDto.getId().equals(boardDto.getMid())) {
%>									
							
							<a href="javascript:movemodify('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');">수정</a>
							<a href="javascript:deletearticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=boardDto.getBno()%>');">삭제</a>							
<%
}
%>					
					
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','1','','');">최신목록</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');">목록</a>
					</div>
					<div class="px-2">
						<a href="javascript:prevArticle('<%=tno%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="javascript:nextArticle('<%=tno%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');">다음글 <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3">
					<h3><%=boardDto.getBname() %></h3>
					<h6><%=boardDto.getMid() %> <%=boardDto.getBdate() %></h6>
					<h6>조회수 : <%=boardDto.getBcount() %></h6>
				</div>

				<div class="border-b my-2"></div>
				<div class="px-3"><p class="my-0"><%=boardDto.getBdetail() %></p></div>
				<div class="border-b my-2"></div>
				<div class="d-flex">
					<div class="mr-auto px-2">
						<a href="javascript:moveWrite('<%=tno%>');"><i class="fa fa-pencil" aria-hidden="true"></i>
							새글쓰기</a>
							
<%
if(memberDto != null && memberDto.getId().equals(boardDto.getMid())) {
%>									
							
							<a href="javascript:movemodify('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');">수정</a>
							<a href="javascript:deletearticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=boardDto.getBno()%>');">삭제</a>							
<%
}
%>	
							
					</div>
					<div class="px-2">
						<a href="#" style="color: #E64628 !important;" data-toggle="modal" data-target="#notifyModal"><i
							class="fa fa-bell" aria-hidden="true"></i> 신고</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','1','','');">최신목록</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');">목록</a>
					</div>
					<div class="px-2">
						<a href="javascript:prevArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="javascript:nextArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>','<%=boardDto.getBno()%>');">다음글 <i class="fa fa-caret-right"
							aria-hidden="true"></i></a>
					</div>
				</div>



				<div class="pt-5">
					<h5>
						<strong>댓글쓰기</strong>
					</h5>
				</div>

				<div class="border-b-strong"></div>
				<div class="p-3" style="background-color: #f0f0f0;">
					<form>
						<div class="form-group mb-1">
							<textarea class="form-control" id="recontent" name="recontent" rows="3"></textarea>
						</div>
						<div class="text-right">
							<a class="btn btn-sm btn-primary text-white" href="javascript:replyWrite('<%=boardDto.getBno()%>');">등록</a>
						</div>
					</form>
				</div>
				<div class="border-b p-0"></div>

				<table class="table table-sm">
					<tbody id="replylist">
					
					</tbody>
				</table>


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

<div class="modal" id="notifyModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시물 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>게시물을 정말 신고하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <a class="btn btn-primary text-white" href="javascript:notifyArticle();">신고</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>




<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>