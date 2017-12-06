<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>
      
 <!-- --------------------------내 정보------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
    	  <h3 style="background-color:lavender;"align="center">내 회원 정보 변경하기</h3>
    	 
    	<div class="col-sm-6" style="float:left;">
    	
         <form role="form">
        	<div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="userid" placeholder="memberDto.getId">
            </div>
           	<div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">패스워드</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">패스워드 확인</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            
            <div class="form-group">
	              <label for="InputEmail">이메일</label>
	              <input type="email" class="form-control" id="useremail" placeholder="memberDto.getEmail">
            </div>
            <div class="form-group">
              <label for="username">휴대폰</label>
	              <div class="input-group">
	               	 <input type="tel" class="form-control" id="userphone" placeholder="memberDto.getPhone">
	              </div>
            </div>
         
      </div>
    	<div class="col-sm-6" style="float:left;">
    	
    
        	<div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="userid" placeholder="memberDto.getId">
            </div>
           	<div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">패스워드</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">패스워드 확인</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            
            <div class="form-group">
	              <label for="InputEmail">이메일</label>
	              <input type="email" class="form-control" id="useremail" placeholder="memberDto.getEmail">
            </div>
            <div class="form-group">
              <label for="username">휴대폰</label>
	              <div class="input-group">
	               	 <input type="tel" class="form-control" id="userphone" placeholder="memberDto.getPhone">
	              </div>
            </div>
         
      </div>
     <div>
    	 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">저장</button>
 		<button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">취소</button></center>
	 </div>
    	 
    	 
    	</div>
 <!-- --------------------------내 정보------------------------------------------------------- -->
     <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>
  </div>
</div>
 

<%@ include file="/common/footer.jsp"%>