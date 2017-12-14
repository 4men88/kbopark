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

function notifyReply() {
	alert("신고됨!");
	<%-- 	document.getElementById("cact").value = "mvreply";
	document.getElementById("ctno").value = "<%=tno%>";
	document.getElementById("cpg").value = "1";
	document.getElementById("ckey").value = "";
	document.getElementById("cword").value = "";
	document.getElementById("cseq").value = "<%=boardDto.getBno()%>";
	
	document.getElementById("commonForm").action = "<%=root%>/reboard";
	document.getElementById("commonForm").submit(); --%>
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
	var recontent = document.getElementById("recontent").value;
	document.getElementById("recontent").value = "";
	if(recontent != "") {
		var url = "<%=root%>/reply";
		var params = "act=writeReply&seq=" + seq + "&recontent=" + recontent;
		sendRequest(url, params, replyList, "POST");
	}
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

window.onload = function() {
	var url = "<%=root%>/reply";
	var params = "act=listReply&seq=<%=boardDto.getBno()%>";
	sendRequest(url, params, replyList, "GET");
}
</script>
<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root%>/img/etc/grass.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3"><%=gudanDto.getEnname() %></h1>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end"
						style="background-color: white;">
						<li class="breadcrumb-item"><i class="fa fa-home mr-2"
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">구단</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>"><%=gudanDto.getTname() %></a></li>
						<li class="breadcrumb-item active" aria-current="page">메인</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div id="gudan-nav">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=tno %>">메인</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">구장안내</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=tno %>">스케줄</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=tno%>');">커뮤니티</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>

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
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="#">다음글 <i class="fa fa-caret-right"
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
				<p class="p-3 my-0"><%=boardDto.getBdetail() %></p>
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
						<a href="#" style="color: #E64628 !important;"><i
							class="fa fa-bell" aria-hidden="true" data-toggle="modal" data-target="#notifyModal"></i> 신고</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','1','','');">최신목록</a>
					</div>
					<div class="px-2">
						<a href="javascript:listArticle('<%=gudanDto.getTno()%>','<%=pg%>','<%=key%>','<%=word%>');">목록</a>
					</div>
					<div class="px-2">
						<a href="#"><i class="fa fa-caret-left" aria-hidden="true"></i>
							이전글</a>
					</div>
					<div class="px-2">
						<a href="#">다음글 <i class="fa fa-caret-right"
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
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> ㅇㅅㅇ들 일이 이렇게 커진...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> 하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> 하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> ㅇㅅㅇ들 일이 이렇게 커진... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						하하하하하 그러고보니 방탄소... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						하하하하하 그러고보니 방... (65)</li>
				</ul>
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