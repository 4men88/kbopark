<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
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
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">����������</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">��������</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">��� ����</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">��Ű ����</button></div>
    	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">�Խù� ����</button></div>
       	<div><button type="button" class="btn btn-primary" onclick="" style="height:50px;width:100%;margin:5px;">�α׾ƿ�</button></div>
      </div>
    <div id="content" class="col-sm-9" style="min-height:600px";>
    	 <div class="col-sm-6" style="float:left;">
    	 <h3 style="background-color:lavender;"align="center">�� ����</h3>
    	 ���̵�<br>
    	 �̸�<br>
    	 �������<br>
    	 ��ȭ��ȣ<br>
    	 �̸���<br>
      	 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�������� �ٷΰ���</button></center>
    	 </div>
   		 <div class="col-sm-6" style="float:left;">
   		 <h3 style="background-color:lavender;" align="center">��������</h3>
   		 �������� ��1 ��� �κ�<br>
   		 �������� ��2 ��� �κ�<br>
   		 �������� ��3 ��� �κ�<br>
   		 �������� ��4 ��� �κ�<br>
   		 �������� ��5 ��� �κ�<br>
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�������� �ٷΰ���</button></center>
   		 </div>
  		 <div class="col-sm-6" style="clear:both;float:left;">
 		 <h3 style="background-color:lavender;"align="center">�� ���</h3>
 		 <div>���� �ø� ���</div>
 		 
 		 
 		 
 		 <div>������ ���</div>
 		 
 		  <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">��� �ٷΰ���</button></center>
		 </div>
  		 <div class="col-sm-6" style="float:left;">
  		  <h3 style="background-color:lavender;"align="center">�Խù�</h3>
  		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�� �� �ٷΰ���</button></center>
  		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�� ��� �ٷΰ���</button></center>
  		 </div>
  
    	
    </div>
    <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>
  </div>
</div>
<%@ include file="/common/footer.jsp"%>