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



<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>

<%
   List<NoticeDto> noticeList = (List<NoticeDto>) request.getAttribute("noticeList");
   List<BoardDto> boardList = (List<BoardDto>) request.getAttribute("boardList");
   List<ReplyDto> replyList = (List<ReplyDto>) request.getAttribute("replyList");
%>

<div id="contentarea" class="col-sm-9" style="min-height: 600px";>
   <div class="row">
      <!-- --------------------------�� ����------------------------------------------------------- -->
      <div class="col-sm-6">
         <h3 style="background-color: lavender;" align="center">�� ����</h3>

         <div class="form-group">
            <label for="myname">�̸�</label> <input type="text"
               class="form-control" id="userid" value="<%=memberDto.getName()%>"
               readonly>
         </div>
         <div class="form-group">
            <label for="myid">���̵�</label> <input type="text"
               class="form-control" id="username" value="<%=memberDto.getId()%>"
               readonly>
         </div>

         <div class="form-group">
            <label for="myEmail">�̸���</label> <input type="text"
               class="form-control" id="useremail"
               value="<%=memberDto.getEmail1()%>@<%=memberDto.getEmail2()%>"
               readonly>
         </div>

         <div class="form-group">
            <label for="myname">��ȭ��ȣ</label> <input type="text"
               class="form-control" id="userid"
               value="<%=memberDto.getTel1()%>-<%=memberDto.getTel2()%>-<%=memberDto.getTel3()%>"
               readonly>
         </div>







         <div align="center">
            <button type="button" class="btn btn-primary"
               onclick="javascript:moveModify();"
               style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">��������
               �ٷΰ���</button>
         </div>
      </div>
      <!-- --------------------------�� ����------------------------------------------------------- -->

      <!-- --------------------------��������------------------------------------------------------- -->

      <div class="col-sm-6">
         <h3 style="background-color: lavender;" align="center">��������</h3>

         <!--?require_once $footer?-->
         <div class="dh-board">
            <!--ī�װ�-->
            <!--ī�װ�-->

            <table class="table table-hover">
               <thead class="text-center">
                  <tr>
                     <th class="col-xs-6 col-md-6 subject">����</th>
                     <th class="col-xs-2 col-md-2 writer">�ۼ���</th>
                     <th class="col-xs-2 col-md-2 regdate">�ð�</th>
                  </tr>
               </thead>
               <tbody>
                  <div class="clearfix"></div>

                  <%
                     for (int i = 0; i < 6; i++) {
                        NoticeDto noticeDto = noticeList.get(i);
                  %>
                  <tr class="">

                     <td class="subject"><strong><a src='#'
                           class='btnRead' value='47'><%=noticeDto.getSubject()%> </a></strong><small></small></td>
                     <td class="text-center writer"><span title=admin
                        data-toggle="tooltip" data-placement="right auto">������</span></td>
                     <td class="text-center regdate"><%=noticeDto.getWdate()%></td>

                  </tr>
                  <%
                     }
                  %>



                  <div class="clearfix"></div>
               </tbody>
            </table>

            <div align="center">
            <a href="<%=request.getContextPath() %>/admin?act=notice">
               <button type="button" class="btn btn-primary" onclick=""
                  style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">��������
                  �ٷΰ���</button>
                  </a>
                  
            </div>
         </div>
      </div>
      <!-- --------------------------��������------------------------------------------------------- -->
      <!-- --------------------------�� ���------------------------------------------------------- -->
      <div class="col-sm-6">
         <h3 style="background-color: lavender;" align="center">�� ���</h3>
         <div>
            
            <div align="center">
               <button type="button" class="btn btn-primary" onclick=""
                  style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">��
                  ��� �ٷΰ���</button>
            </div>

         </div>



         <div>
         

            <div align="center">
               <button type="button" class="btn btn-primary" onclick=""
                  style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">�� ����
                  �ٷΰ���</button>
            </div>

         </div>

      </div>





      <!-- --------------------------�� ���------------------------------------------------------- -->




      <!-- --------------------------�� �� ���------------------------------------------------------- -->

      <div class="col-sm-6">
         <h3 style="background-color: lavender;" align="center">�Խù�</h3>
         <div>






            <div class="col-sm-6">
               <h3 style="background-color: lavender;" align="center">���� ��
                  �Խù�</h3>

               <!--?require_once $footer?-->
            <div class="dh-board">
               <!--ī�װ�-->
               <!--ī�װ�-->

               <table class="table table-hover">
                                    <thead class="text-center">
                     <tr>
                        <th class="col-xs-6 col-md-6 subject" style=min-width:65px;max-width:65px;>����</th>
                        <th class="col-xs-2 col-md-2 writer" style=min-width:65px;max-width:65px;>�ۼ���</th>
                        <th class="col-xs-2 col-md-2 regdate">�ð�</th>
                     </tr>
                  </thead>      
                  <tbody>

<%
int len=boardList.size();
   if(len==0){
   
%>   

                     
                     <div class="clearfix"></div>
                        <tr class="">

                           <td class="subject"><strong><a src='#'
                                 class='btnRead' value='47'>���� �����ϴ�.</a></strong><small></small></td>
                        </tr>
<%
   }else{
      if(len>5){
         
         for (int i = 0; i < 6; i++) {
            BoardDto boardDto = boardList.get(i);
      
   
%>                     

                     
                     <div class="clearfix"></div>
                        <tr class="">

                           <td class="subject"><strong><a src='#'
                                 class='btnRead' value='47'><%=boardDto.getBname() %></a></strong><small></small></td>
                           <td class="text-center writer"><span title=admin
                              data-toggle="tooltip" data-placement="right auto"><%=boardDto.getMid()%></span></td>
                           <td class="text-center regdate"><%=boardDto.getBdate()%></td>

                        </tr>
                        
<%
         }
      }else{
         for(int i=0; i<len;i++){
            BoardDto boardDto = boardList.get(i);
            
            
%>

                     
                     <div class="clearfix"></div>
                        <tr class="">
                           
                           <td class="subject"><strong><a src='<%=root%>/board?act=listarticle&tno=<%=boardDto.getTno()%>&pg=1&key=mname&word=<%=memberDto.getName()%>'
                                 class='btnRead' value='47'><%=boardDto.getBname() %></a></strong><small></small></td>
                           <td class="text-center writer"><span title=admin
                              data-toggle="tooltip" data-placement="right auto"><%=memberDto.getId()%></span></td>
                           <td class="text-center regdate"><%=boardDto.getBdate()%></td>
                           
                        </tr>
<%
         }
      }
   }
%>




                        <div class="clearfix"></div>
                     </tbody>
                  </table>
<%
if(len==0){
%>
                  <div align="center">
                        <a href="<%=root %>/gudan?act=viewgudan">
                     <button type="button" class="btn btn-primary" onclick="" 
                        style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">����Ŀ�´�Ƽ �ٷΰ���</button>
                  </a>
                  </div>
<%
}else{
%>
                  <div align="center">
                     
                     <button type="button" class="btn btn-primary" onclick=""
                        style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">���� �� �� �ٷΰ���</button>
                  
                  </div>
<%
}
%>


               </div>
            </div>
         </div>

         <!-- --------------------------�� �� ���------------------------------------------------------- -->


         <!-- --------------------------�� ��� ���------------------------------------------------------- -->

         
            <div class="col-sm-6">
               <h3 style="background-color: lavender;" align="center">���� �� ���</h3>

               <!--?require_once $footer?-->
            <div class="dh-board">
               <!--ī�װ�-->
               <!--ī�װ�-->

               <table class="table table-hover">
                                    <thead class="text-center">
                     <tr>
                        <th class="col-xs-6 col-md-6 subject" style=min-width:65px;max-width:65px;>����</th>
                        <th class="col-xs-2 col-md-2 writer" style=min-width:65px;max-width:65px;>�ۼ���</th>
                        <th class="col-xs-2 col-md-2 regdate" >�ð�</th>
                     </tr>
                  </thead>      
                  <tbody>

<%
int len2=replyList.size();
   if(len2==0){
   
%>   
                  
                     
                     <div class="clearfix"></div>
                        <tr class="">

                           <td class="subject"><strong><a src='#'
                                 class='btnRead' value='47'>����� �����ϴ�.</a></strong><small></small></td>
                        </tr>
<%
   }else{
      if(len2>5){
         for (int i = 0; i < 6; i++) {
            ReplyDto replyDto = replyList.get(i);
      
   
%>                     

                     
                     <div class="clearfix"></div>
                        <tr class="">

                           <td class="subject"><strong><a src='#'
                                 class='btnRead' value='47'><%=replyDto.getRecontent()%></a></strong><small></small></td>
                           <td class="text-center writer"><span title=admin
                              data-toggle="tooltip" data-placement="right auto"><%=memberDto.getId()%></span></td>
                           <td class="text-center regdate"><%=replyDto.getRetime()%></td>

                        </tr>
                        
<%
         }
      }else{
         for(int i=0; i<len;i++){
            ReplyDto replyDto = replyList.get(i);
            
%>

                     
                     <div class="clearfix"></div>
                        <tr class="">

                           <td class="subject"><strong><a src='#'
                                 class='btnRead' value='47'><%=replyDto.getRecontent()%></a></strong><small></small></td>
                           <td class="text-center writer"><span title=admin
                              data-toggle="tooltip" data-placement="right auto"><%=memberDto.getId()%></span></td>
                           <td class="text-center regdate"><%=replyDto.getRetime()%></td>

                        </tr>
<%
         }
      }
   }
%>




                        <div class="clearfix"></div>
                     </tbody>
                  </table>
<%
if(len2==0){
%>
                  <div align="center">
                  <a href="<%=root %>/gudan?act=viewgudan">
                     <button type="button" class="btn btn-primary" onclick="" 
                        style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">����Ŀ�´�Ƽ �ٷΰ���</button>
                  </a>
                  </div>
<%
}else{
%>
                  <div align="center">
                     <button type="button" class="btn btn-primary" onclick=""
                        style="height: 30px; width: 100%; margin: 5px; max-width: 300px;">���� �� �� �ٷΰ���</button>
                  </div>
<%
}
%>


               </div>
            </div>
         </div>
         <!-- --------------------------�� ��� ���------------------------------------------------------- -->
      </div>


   </div>


<div id="rightarea" class="col-sm-1"></div>

