<%@page import="com.baseball.member.dao.MemberDaoImpl"%>
<%@page import="com.baseball.mypage.dao.MypageDaoImpl"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>


    <div id="contentarea" class="col-sm-9" style="min-height:600px";>
    <div class="row">
 <!-- --------------------------내 정보------------------------------------------------------- -->
    	 <div class="col-sm-6">
    	 <h3 style="background-color:lavender;"align="center">내 정보</h3>
       
        	<div class="form-group">
              <label for="myname">이름</label>
              <input type="text" class="form-control" id="userid"  value="<%=memberDto.getName()%>" readonly>
            </div>
           	<div class="form-group">
              <label for="myid">아이디</label>
              <input type="text" class="form-control" id="username" value="<%=memberDto.getId()%>" readonly>
            </div>
            
           <div class="form-group">
              <label for="myEmail">이메일</label>
              <input type="text" class="form-control" id="useremail" value="<%=memberDto.getEmail1()%>@<%=memberDto.getEmail2()%>" readonly>
           </div>
           
           <div class="form-group">
              <label for="myname">전화번호</label>
              <input type="text" class="form-control" id="userid"  value="<%=memberDto.getTel1()%>-<%=memberDto.getTel2()%>-<%=memberDto.getTel3()%>" readonly>
            </div>

            
      
      

        

      	 <center><button type="button" class="btn btn-primary" onclick="javascript:moveModify();" style="height:30px;width:100%;margin:5px;max-width:300px;">정보수정 바로가기</button></center>
    	 </div>
 <!-- --------------------------내 정보------------------------------------------------------- -->
   
 <!-- --------------------------공지사항------------------------------------------------------- -->
   
   		 <div class="col-sm-6">
   		 <h3 style="background-color:lavender;" align="center">공지사항</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--카테고리-->
		<!--카테고리-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >제목</th>
		    <th class="col-xs-2 col-md-2 writer" >작성자</th>
		    <th class="col-xs-2 col-md-2 regdate" >시간</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>    
        <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>공지사항dto가 필요합니다 1입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>공지사항2입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>공지사항 3입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>공지사항 4입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>공지사항 5입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>공지사항 6입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
    
    
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">공지사항 바로가기</button></center>
   		 </div>
   		 </div>
	 <!-- --------------------------공지사항------------------------------------------------------- -->
    <!-- --------------------------내 경매------------------------------------------------------- -->
 <div class="col-sm-6">
 	<h3 style="background-color:lavender;"align="center">내 경매</h3>
 		<div>
	 		 내가 올린 경매
	 		  <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내 경매 바로가기</button></center>
 			 
 		</div>
 		 
 		 
 		 
 		<div>
 		  입찰한 경매
 		 
 		 
 		   <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">입찰 바로가기</button></center>
 		 
 	 	</div>
 		 
 </div>
		 
		 
		 
		 
		 
	<!-- --------------------------내 경매------------------------------------------------------- -->	 
	
	
	
	
	<!-- --------------------------내 글 목록------------------------------------------------------- -->
  	 
  		 <div class="col-sm-6">
  		  <h3 style="background-color:lavender;"align="center">게시물</h3>
  		  <div> 		   
  		
  		
  		
  		
  		
  		 
   		 <div class="col-sm-6">
   		 <h3 style="background-color:lavender;" align="center">내가 쓴 게시물</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--카테고리-->
		<!--카테고리-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >제목</th>
		    <th class="col-xs-2 col-md-2 writer" >작성자</th>
		    <th class="col-xs-2 col-md-2 regdate" >시간</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>   
         <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글1입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>내 댓글 원글2입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글3입니다.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글4입니다.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
   	   
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내가 쓴 글 바로가기</button></center>
   		 </div>
   		 </div>
   		 </div>
	 <!-- --------------------------내 글 목록------------------------------------------------------- -->
  		
  
  		   <!-- --------------------------내 댓글 목록------------------------------------------------------- -->
   
   		 <div class="col-sm-6">
   		 <h3 style="background-color:lavender;" align="center">내가 쓴 댓글</h3>
   
   	<!--?require_once $footer?--><div class="dh-board">
	<!--카테고리-->
		<!--카테고리-->
	
    	<table class="table table-hover">
	<thead class="text-center">
	    <tr>
						<th class="col-xs-6 col-md-6 subject" >제목</th>
		    <th class="col-xs-2 col-md-2 writer" >작성자</th>
		    <th class="col-xs-2 col-md-2 regdate" >시간</th>
				    </tr>
	</thead>
	<tbody>
        <div class="clearfix"></div>    
        <tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글1입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
		
    	</tr>    
    	<tr class="">
		
			<td class="subject"><strong><a src='#' class='btnRead' value='44'>내 댓글 원글2입니다. </a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2015-02-22</td>
		
   		</tr>
  	    <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글3입니다.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	     <tr class="">
			
			<td class="subject"><strong><a src='#' class='btnRead' value='47'>내 댓글 원글4입니다.</a></strong><small></small></td>
			<td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
			<td class="text-center regdate">2016-02-28</td>
			
   	    </tr> 
   	    
   	   
    <div class="clearfix"></div>    	</tbody>
	</table>
   		
   		 <center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내 댓글 바로가기</button></center>
   		 </div>
   		 </div>
	 <!-- --------------------------내 댓글 목록------------------------------------------------------- -->
   		 </div>
  		
  		   	
    </div>
     </div>
    
    <div id="rightarea" class="col-sm-1">
    
    </div>
</div>

<%@ include file="/common/footer.jsp"%>