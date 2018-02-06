<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

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

$(document).ready(function(){
	startTime();
});
</script>

<!-- 구단네비게이터 -->
<%@ include file="/gudan/gudan_nav.jsp"%>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5 text-center">
				
				<h5>글쓰기에 실패하였습니다.</h5>
				<div class="p-2">
					<a class="btn btn-primary" href="javascript:moveWrite();" role="button"
						style="color: white !important;">다시작성</a>
				</div>
				<div class="p-2">
					<a class="btn btn-secondary" href="javascript:listArticle('<%=pg%>','<%=key%>','<%=word%>');" role="button"
						style="color: white !important;">목록가기</a>
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


<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>