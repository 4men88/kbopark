<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=root%>/js/httpRequest.js"></script>

      
  <script type="text/javascript">
   
   function modifyInfo(){

      if(document.getElementById("name").value==""){
         alert("이름을 입력하세요!!!");
         return;
      }else if(document.getElementById("pass").value==""){
         alert("비밀번호를 입력하세요!!!");
         return;
      }else if(document.getElementById("pass").value != document.getElementById("passok").value){
         alert("비밀번호가 일치하지 않습니다!!");
         return;
      }else if(document.getElementById("tno").value ==""){
         alert("선호구단을 선택해 주세요!!");
         return;
      }else if(document.getElementById("zip1").value ==""){
         alert("우편주소를 선택해주세요");
         return;
      }else if(document.getElementById("addr2").value ==""){
         alert("상세주소를 입력해주세요");
         return;
      }else{
         document.getElementById("modifyForm").action = "<%=root %>/mypage";
         document.getElementById("modifyForm").submit();
         }
      }
      
   function changemail(selectObj){
         //alert(selectObj.value)
         document.getElementById("email2").value = selectObj.value
   }
     
   function zipsearch() {
           new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var fullAddr = ''; // 최종 주소 변수
                   var extraAddr = ''; // 조합형 주소 변수

                   // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       fullAddr = data.roadAddress;

                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       fullAddr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                   if(data.userSelectedType === 'R'){
                       //법정동명이 있을 경우 추가한다.
                       if(data.bname !== ''){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있을 경우 추가한다.
                       if(data.buildingName !== ''){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                       fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('zip1').value = data.zonecode; //5자리 새우편번호 사용
                   document.getElementById('addr1').value = fullAddr;

                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById('addr2').focus();
               }
           }).open();
       }
   


</script>
 <!-- --------------------------내 정보------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
 
   <div class="row py-5">
      <div class="col-md-2"></div>
      <div class="col-md-9">
         <h2 class="text-dark mb-5 px-3">회원정보수정</h2>
         <form id="modifyForm" name="modifyForm" method="post">
         <input type="hidden" name="act" id="act" value="modifyInfo">
            <div class="form-group row px-3">
               <label for="inputName" class="col-sm-2 col-12 col-form-label">이름</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="name"
                     placeholder="" value="<%=memberDto.getName()%>" readonly>
               </div>
            </div>
            <div class="form-group row px-3">
               <label for="inputId" class="col-sm-2 col-12 col-form-label">아이디</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="id" name="id"
                     placeholder="" value="<%=memberDto.getId()%>" readonly>
               </div>
                              
            </div>

            <div class="form-group row px-3">
               <label for="inputPassword1" class="col-sm-2 col-form-label">비밀번호</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="pass" name="pass"
                     placeholder="바꾸실 비밀번호를 입력해주세요">
               </div>
            </div>
            <div class="form-group row px-3">
               <label for="inputPassword1" class="col-sm-2 col-form-label">비밀번호<br>확인</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="passok" name="passok"
                     placeholder="비밀번호를 한번더 입력해주세요">
               </div>
            </div>


            <div class="form-group row align-items-center px-3">
               <label for="inputEmail1" class="col-sm-2 col-form-label">이메일</label>
               <div class="col-sm-3">
                  <input type="text" class="form-control mb-2 mb-sm-0"
                     id="email1" name="email1" placeholder="" value="<%=memberDto.getEmail1()%>">
               </div>
               <div class="col-sm-4">
                  <div class="input-group mb-2 mb-sm-0">
                     <div class="input-group-addon">@</div>
                     <input type="text" class="form-control" id="email2" name="email2"
                        placeholder="" value="<%=memberDto.getEmail2()%>">
                  </div>
               </div>
               <div class="col-sm-3">
                  <select id="inputEmailAddress" class="form-control" style=min-height:37px; onchange="javascript:changemail(this);">
                     <option selected="selected">직접입력</option>
                     <option>kitri.re.kr</option>
                     <option>naver.com</option>
                     <option>daum.net</option>
                     <option>hanmail.net</option>
                  </select>
               </div>
            </div>


            <div class="form-group row px-3">
               <label for="inputTel" class="col-sm-2 col-12 col-form-label">전화번호</label>
               <div class="col-sm-3 col-4">
                  <select id="tel1" name="tel1" class="form-control" style=min-height:37px;>
                     <option selected>010</option>
                     <option>011</option>
                     <option>02</option>
                     <option>031</option>
                     <option>033</option>
                  </select>
               </div>
               <label class="tellabel text-center px-0 mb-0 align-self-center">-</label>
               <div class="col-sm-3 col-4">
                  <input type="text" class="form-control mb-2 mb-sm-0"
                     id="tel2" name="tel2" value="<%=memberDto.getTel2()%>">
               </div>
               <label class="tellabel text-center px-0 mb-0 align-self-center">-</label>
               <div class="col-sm-3 col-4">
                  <input type="text" class="form-control mb-2 mb-sm-0"
                     id="tel3" name="tel3" value="<%=memberDto.getTel3()%>">
               </div>
            </div>


            <div class="form-group row align-items-center px-3">
               <label for="inputAddress" class="col-sm-2 col-form-label">우편주소</label>
               <div class="col-sm-4 col-8">
                  <label class="sr-only" for="inputZipcode">zipcode</label>
                  <input type="text" class="form-control mb-2 mb-sm-0" id="zip1" name="zip1"
                     value="<%=NullCheck.isNotNull(memberDto.getZip1())%>" readonly>
               </div>
               <div class="col-sm-2 pl-0 col-4 align-self-center">
                  <input type="button" class="btn btn-primary" value="주소검색" onclick="javascript:zipsearch();">
               </div>
            </div>

            <div class="form-group row px-3">
               <label for="inputAddress2" class="col-sm-2 col-form-label">상세주소</label>
               <div class="col-sm-4">
                  <div class="input-group mb-2 mb-sm-0">
                     <input type="text" class="form-control" id="addr1" name="addr1"
                        value="<%=NullCheck.isNotNull(memberDto.getAddr1())%>" readonly>
                  </div>
               </div>
               <div class="col-sm-6">
                  <input type="text" class="form-control" id="addr2" name="addr2"
                     value="<%=NullCheck.isNotNull(memberDto.getAddr2())%>">
               </div>
            </div>


            <div class="form-group row px-3">
               <label for="inputTeam" class="col-sm-2 col-form-label">선호구단</label>
               <div class="col-sm-4">
                  <select id="tno" name="tno" class="form-control" onchange="javascript:tnochange(this);" style=min-height:36px;>
                     <option selected="<%=memberDto.getTno()%>" value="0">--선택하세요--</option>
                     <option value="2">두산 베어스</option>
                     <option value="3">롯데 자이언츠</option>
                     <option value="1">KIA 타이거즈</option>
                     <option value="4">NC 다이노스</option>
                     <option value="5">SK 와이번스</option>
                     <option value="6">LG 트윈스</option>
                     <option value="7">넥센 히어로즈</option>
                     <option value="8">한화 이글스</option>
                     <option value="9">삼성 라이온즈</option>
                     <option value="10">KT 위즈</option>
                  </select>
                  <input type="text" name="tnowiew" id="tnowiew" value="<%=memberDto.getTno()%>">
               </div>
            </div>

            <div class="border-b mb-2 px-3"></div>

            <div class="px-3 py-3">
               <input type="button" class="btn btn-lg btn-block btn-primary" onclick="javascript:modifyInfo();" value="저장">
            </div>
         </form>
      </div>
   </div>

        
       </div>
 <!-- --------------------------내 정보------------------------------------------------------- -->
     <div id="aside" class="col-sm-1">
       
    </div>
  </div>
</div>
 

<%@ include file="/common/footer.jsp"%>