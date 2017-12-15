<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.baseball.member.dao.MemberDaoImpl"%>
<%@page import="com.baseball.mypage.dao.MypageDaoImpl"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@page import="com.baseball.member.model.MemberDetailDto"%>
<%@page import="com.baseball.admin.model.NoticeDto"%>
<%@page import="com.baseball.board.model.BoardDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.baseball.board.model.ReplyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>
 
<%
   List<BoardDto> boardList = (List<BoardDto>) request.getAttribute("boardList");
   List<ReplyDto> replyList = (List<ReplyDto>) request.getAttribute("replyList");
%> 
 
 
      
 <!-- --------------------------내 글 정보------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
      
     <div class="row">  
     <!--  ---------------------------------------내가 쓴 글------------------------------------------ -->  
      <div class="col-sm-6" style="float:left;">
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
      
         <td class="subject"><strong><a src='#' class='btnRead' value='47'>내 글 목록1입니다. </a></strong><small></small></td>
         <td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
         <td class="text-center regdate">2016-02-28</td>
      
       </tr>    
       <tr class="">
      
         <td class="subject"><strong><a src='#' class='btnRead' value='44'>내 글 목록2입니다. </a></strong><small></small></td>
         <td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
         <td class="text-center regdate">2015-02-22</td>
      
         </tr>
         <tr class="">
         
         <td class="subject"><strong><a src='#' class='btnRead' value='47'>내 글 목록3입니다.</a></strong><small></small></td>
         <td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
         <td class="text-center regdate">2016-02-28</td>
         
          </tr> 
           <tr class="">
         
         <td class="subject"><strong><a src='#' class='btnRead' value='47'>내 글 목록4입니다.</a></strong><small></small></td>
         <td class="text-center writer"><span title=admin data-toggle="tooltip" data-placement="right auto">Admin</span></td>
         <td class="text-center regdate">2016-02-28</td>
         
          </tr> 
          
         
    <div class="clearfix"></div>       </tbody>
   </table>
         
          <div align=center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내가 쓴 글 바로가기</button></div>
          </div>
          </div>
          
          <!--  ---------------------------------------내가 쓴 글------------------------------------------ -->
         
         
             <!-- --------------------------내 댓글 목록------------------------------------------------------- -->
   
          <div class="col-sm-6" style="float:left;">
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
          
         
    <div class="clearfix"></div>       </tbody>
   </table>
         
          <div align=center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">내 댓글 바로가기</button>
          </div>
          </div>
          </div>
    <!-- --------------------------내 댓글 목록------------------------------------------------------- -->
        
        
        
        
        </div>
  </div>     
  <!--     -----------------------aside---------------------- -->
    <div id="aside" class="col-sm-1">
       <h3></h3>
    </div>


<%@ include file="/common/footer.jsp"%>     
        
        
        
        