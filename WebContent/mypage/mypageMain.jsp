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
 <!-- --------------------------�� ����------------------------------------------------------- -->
    	 <div class="col-sm-6" style="float:left;">
    	 <h3 style="background-color:lavender;"align="center">�� ����</h3>
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
              <label for="InputEmail">�̸���</label>
              <input type="email" class="form-control" id="useremail" placeholder="memberDto.getEmail">
            </div>
            <div class="form-group">
              <label for="username">�޴���</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="userphone" placeholder="memberDto.getPhone">
            </div>
            </div>
         

          </form>

      	 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�������� �ٷΰ���</button></center>
    	 </div>
 <!-- --------------------------�� ����------------------------------------------------------- -->
   
 <!-- --------------------------��������------------------------------------------------------- -->
   
   		 <div class="col-sm-6" style="float:left;">
   		 <h3 style="background-color:lavender;" align="center">��������</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--ī�װ�-->
		<!--ī�װ�-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >����</th>
		    <th class="col-xs-2 col-md-2 writer" >�ۼ���</th>
		    <th class="col-xs-2 col-md-2 regdate" >�ð�</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>    
        <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>��������dto�� �ʿ��մϴ� 1�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>��������2�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�������� 3�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�������� 4�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�������� 5�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�������� 6�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
    
    
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�������� �ٷΰ���</button></center>
   		 </div>
   		 </div>
	 <!-- --------------------------��������------------------------------------------------------- -->
    <!-- --------------------------�� ���------------------------------------------------------- -->
 <div class="col-sm-6" style="clear:both;float:left;">
 	<h3 style="background-color:lavender;"align="center">�� ���</h3>
 		<div>
	 		 ���� �ø� ���
	 		  <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�� ��� �ٷΰ���</button></center>
 			 
 		</div>
 		 
 		 
 		 
 		<div>
 		  ������ ���
 		 
 		 
 		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">���� �ٷΰ���</button></center>
 		 
 	 	</div>
 		 
 </div>
		 
		 
		 
		 
		 
	<!-- --------------------------�� ���------------------------------------------------------- -->	 
	
	
	
	
	<!-- --------------------------�� �� ���------------------------------------------------------- -->
  	 
  		 <div class="col-sm-6" style="float:left;">
  		  <h3 style="background-color:lavender;"align="center">�Խù�</h3>
  		  <div> 		   
  		
  		
  		
  		
  		
  		 
   		 <div class="col-sm-6" style="float:left;">
   		 <h3 style="background-color:lavender;" align="center">���� �� �Խù�</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--ī�װ�-->
		<!--ī�װ�-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >����</th>
		    <th class="col-xs-2 col-md-2 writer" >�ۼ���</th>
		    <th class="col-xs-2 col-md-2 regdate" >�ð�</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>    
        <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� �� ���1�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>�� �� ���2�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� �� ���3�Դϴ�.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� �� ���4�Դϴ�.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
   	   
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">���� �� �� �ٷΰ���</button></center>
   		 </div>
   		 </div>
   		 </div>
	 <!-- --------------------------�� �� ���------------------------------------------------------- -->
  		
  
  		   <!-- --------------------------�� ��� ���------------------------------------------------------- -->
   
   		 <div class="col-sm-6" style="float:left;">
   		 <h3 style="background-color:lavender;" align="center">���� �� ���</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--ī�װ�-->
		<!--ī�װ�-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >����</th>
		    <th class="col-xs-2 col-md-2 writer" >�ۼ���</th>
		    <th class="col-xs-2 col-md-2 regdate" >�ð�</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>    
        <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� ��� ����1�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>�� ��� ����2�Դϴ�. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� ��� ����3�Դϴ�.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>�� ��� ����4�Դϴ�.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
   	   
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�� ��� �ٷΰ���</button></center>
   		 </div>
   		 </div>
	 <!-- --------------------------�� ��� ���------------------------------------------------------- -->
   		 </div>
  		
  		   	
    </div>
    <div id="aside" class="col-sm-1" style="background-color:lavender;">
    	<h3>Aside</h3>
    </div>

</div>
<%@ include file="/common/footer.jsp"%>