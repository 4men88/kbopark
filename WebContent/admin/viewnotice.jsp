<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.board.model.BoardDto"%>
<!--header 영역-->
<%@ include file="/common/header.jsp" %>

<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
control = "/board";

</script>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<!-- 모바일 라인 다시 잡아야함!!!! -->
				<div class="d-flex">
					<div class="mr-auto px-2">
						<i class="" aria-hidden="true" font-size:"1">작성자:</i>
					</div>
					<div class="px-2">
						<a href="#">목록</a>
					</div>
					
				</div>
				<div class="border-b-strong my-2"></div>

				<div class="px-3" >
					<div>제목</div>
					<div></div>
					<div></div>
					
				</div>

				<div class="border-b my-2"></div>
				<p class="p-3 my-0">aaaa</p>
				<div class="border-b my-2"></div>
				
			
			

		</div>




	</div>
</div>


<!-- footer영역 -->
<%@ include file="/common/footer.jsp" %>