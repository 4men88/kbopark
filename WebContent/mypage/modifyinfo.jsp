<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>
      
 <!-- --------------------------�� ����------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
    	  <h3 style="background-color:lavender;"align="center">�� ȸ�� ���� �����ϱ�</h3>
    	 
    	<div class="col-sm-6" style="float:left;">
    	
         <form role="form">
        	<div class="form-group">
              <label for="username">�̸�</label>
              <input type="text" class="form-control" id="userid" placeholder="memberDto.getId">
            </div>
           	<div class="form-group">
              <label for="username">���̵�</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">�н�����</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">�н����� Ȯ��</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            
            <div class="form-group">
	              <label for="InputEmail">�̸���</label>
	              <input type="email" class="form-control" id="useremail" placeholder="memberDto.getEmail">
            </div>
            <div class="form-group">
              <label for="username">�޴���</label>
	              <div class="input-group">
	               	 <input type="tel" class="form-control" id="userphone" placeholder="memberDto.getPhone">
	              </div>
            </div>
         
      </div>
    	<div class="col-sm-6" style="float:left;">
    	
    
        	<div class="form-group">
              <label for="username">�̸�</label>
              <input type="text" class="form-control" id="userid" placeholder="memberDto.getId">
            </div>
           	<div class="form-group">
              <label for="username">���̵�</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">�н�����</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            <div class="form-group">
              <label for="username">�н����� Ȯ��</label>
              <input type="text" class="form-control" id="username" placeholder="memberDto.getName">
            </div>
            
            <div class="form-group">
	              <label for="InputEmail">�̸���</label>
	              <input type="email" class="form-control" id="useremail" placeholder="memberDto.getEmail">
            </div>
            <div class="form-group">
              <label for="username">�޴���</label>
	              <div class="input-group">
	               	 <input type="tel" class="form-control" id="userphone" placeholder="memberDto.getPhone">
	              </div>
            </div>
         
      </div>
     <div>
    	 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">����</button>
 		<button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">���</button></center>
	 </div>
    	 
    	 
    	</div>
 <!-- --------------------------�� ����------------------------------------------------------- -->
     <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>
  </div>
</div>
 

<%@ include file="/common/footer.jsp"%>