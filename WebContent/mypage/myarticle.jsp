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
 
 
      
 <!-- --------------------------�� �� ����------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
      
     <div class="row">  
     <!--  ---------------------------------------���� �� ��------------------------------------------ -->  
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
          
         
    <div class="clearfix"></div>       </tbody>
   </table>
         
          <div align=center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">���� �� �� �ٷΰ���</button></div>
          </div>
          </div>
          
          <!--  ---------------------------------------���� �� ��------------------------------------------ -->
         
         
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
          
         
    <div class="clearfix"></div>       </tbody>
   </table>
         
          <div align=center><button type="button" class="btn btn-primary" onclick="" style="height:30px;width:100%;margin:5px;max-width:300px;">�� ��� �ٷΰ���</button>
          </div>
          </div>
          </div>
    <!-- --------------------------�� ��� ���------------------------------------------------------- -->
        
        
        
        
        </div>
  </div>     
  <!--     -----------------------aside---------------------- -->
    <div id="aside" class="col-sm-1">
       <h3></h3>
    </div>


<%@ include file="/common/footer.jsp"%>     
        
        
        
        