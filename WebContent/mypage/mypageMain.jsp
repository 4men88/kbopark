<%@page import="com.baseball.member.dao.MemberDaoImpl"%>
<%@page import="com.baseball.mypage.dao.MypageDaoImpl"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>


    <div id="contentarea" class="col-sm-9" style="min-height:600px";>
    <div class="row">
 <!-- --------------------------�� ����------------------------------------------------------- -->
    	 <div class="col-sm-6">
    	 <h3 style="background-color:lavender;"align="center">�� ����</h3>
       
        	<div class="form-group">
              <label for="myname">�̸�</label>
              <input type="text" class="form-control" id="userid"  value="<%=memberDto.getName()%>" readonly>
            </div>
           	<div class="form-group">
              <label for="myid">���̵�</label>
              <input type="text" class="form-control" id="username" value="<%=memberDto.getId()%>" readonly>
            </div>
            
           <div class="form-group">
              <label for="myEmail">�̸���</label>
              <input type="text" class="form-control" id="useremail" value="<%=memberDto.getEmail1()%>@<%=memberDto.getEmail2()%>" readonly>
           </div>
           
           <div class="form-group">
              <label for="myname">��ȭ��ȣ</label>
              <input type="text" class="form-control" id="userid"  value="<%=memberDto.getTel1()%>-<%=memberDto.getTel2()%>-<%=memberDto.getTel3()%>" readonly>
            </div>

            
      
      

        

      	 <center><button type="button" class="btn btn-primary" onclick="javascript:moveModify();" style="height:30px;width:100%;margin:5px;max-width:300px;">�������� �ٷΰ���</button></center>
    	 </div>
 <!-- --------------------------�� ����------------------------------------------------------- -->
   
 <!-- --------------------------��������------------------------------------------------------- -->
   
   		 <div class="col-sm-6">
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
 <div class="col-sm-6">
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
  	 
  		 <div class="col-sm-6">
  		  <h3 style="background-color:lavender;"align="center">�Խù�</h3>
  		  <div> 		   
  		
  		
  		
  		
  		
  		 
   		 <div class="col-sm-6">
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
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">���� �� �� �ٷΰ���</button></center>
   		 </div>
   		 </div>
   		 </div>
	 <!-- --------------------------�� �� ���------------------------------------------------------- -->
  		
  
  		   <!-- --------------------------�� ��� ���------------------------------------------------------- -->
   
   		 <div class="col-sm-6">
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
     </div>
    
    <div id="rightarea" class="col-sm-1">
    
    </div>
</div>

<%@ include file="/common/footer.jsp"%>