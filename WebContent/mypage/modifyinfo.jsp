<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--header ����-->
<%@ include file="/common/header.jsp"%>
<!-- stylesheet -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600italic,600' rel='stylesheet' type='text/css'>
<!-- bootstrap Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="/css/flexslider.css" type="text/css">
<!-- Favicon -->

<link type="text/css" media="all" rel="stylesheet" href="/css/jquery.tosrus.all.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/slick.css" />
<link type="text/css" media="all" rel="stylesheet" href="/css/owl.carousel.css" />
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/css/plugins/slide-in-panel/style.css" />
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="/css/custom.css">
<link rel="stylesheet" href="/theme/a/custom.css">
<link rel="stylesheet" href="/skin/custom.css">





<body>
<script type="text/javascript">

<!-- Bootstrap -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom style -->
<link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">



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