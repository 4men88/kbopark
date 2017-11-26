<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header 영역-->
<%@ include file="/common/header.jsp"%>
<body>
<script type="text/javascript">
<style>
.col-sm-6{
	min-height: 100vh;
}

</style>

</script>


<div class="container-fluid">
   <div class="row">
    <div id="navibar" class="col-sm-2" style="background-color:#F8F8FF;">
    	<h3>navigator</h3>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">마이페이지</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">정보수정</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">경매 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">루키 관리</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">게시물 관리</button></div>
       	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">로그아웃</button></div>
      </div>
    <div id="content" class="col-sm-9" style="min-height:600px";>
    	 <div class="col-sm-6" style="float:left;">
    	 <h3 style="background-color:lavender;"align="center">내 정보</h3>
    	 아이디<br>
    	 이름<br>
    	 생년월일<br>
    	 전화번호<br>
    	 이메일<br>
      	 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">정보수정 바로가기</button></center>
    	 </div>
   		 <div class="col-sm-6" style="float:left;">
   		 <h3 style="background-color:lavender;" align="center">공지사항</h3>
   		 공지사항 글1 출력 부분<br>
   		 공지사항 글2 출력 부분<br>
   		 공지사항 글3 출력 부분<br>
   		 공지사항 글4 출력 부분<br>
   		 공지사항 글5 출력 부분<br>
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">공지사항 바로가기</button></center>
   		 </div>
  		 <div class="col-sm-6" style="clear:both;float:left;">
 		 <h3 style="background-color:lavender;"align="center">내 경매</h3>
 		 <div>내가 올린 경매</div>
 		 
 		 
 		 
 		 <div>입찰한 경매</div>
 		 
 		  <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">경매 바로가기</button></center>
		 </div>
  		 <div class="col-sm-6" style="float:left;">
  		  <h3 style="background-color:lavender;"align="center">게시물</h3>
  		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내 글 바로가기</button></center>
  		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내 댓글 바로가기</button></center>
  		 </div>
  
    	
    </div>
    <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>
  </div>
</div>
<%@ include file="/common/footer.jsp"%>