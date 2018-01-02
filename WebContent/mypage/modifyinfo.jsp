<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/mypage/mypageLeftside.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<%=root%>/js/httpRequest.js"></script>

      
  <script type="text/javascript">
   
   function modifyInfo(){

      if(document.getElementById("name").value==""){
         alert("�̸��� �Է��ϼ���!!!");
         return;
      }else if(document.getElementById("pass").value==""){
         alert("��й�ȣ�� �Է��ϼ���!!!");
         return;
      }else if(document.getElementById("pass").value != document.getElementById("passok").value){
         alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�!!");
         return;
      }else if(document.getElementById("tno").value ==""){
         alert("��ȣ������ ������ �ּ���!!");
         return;
      }else if(document.getElementById("zip1").value ==""){
         alert("�����ּҸ� �������ּ���");
         return;
      }else if(document.getElementById("addr2").value ==""){
         alert("���ּҸ� �Է����ּ���");
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
                   // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                   // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                   // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                   var fullAddr = ''; // ���� �ּ� ����
                   var extraAddr = ''; // ������ �ּ� ����

                   // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                   if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                       fullAddr = data.roadAddress;

                   } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                       fullAddr = data.jibunAddress;
                   }

                   // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                   if(data.userSelectedType === 'R'){
                       //���������� ���� ��� �߰��Ѵ�.
                       if(data.bname !== ''){
                           extraAddr += data.bname;
                       }
                       // �ǹ����� ���� ��� �߰��Ѵ�.
                       if(data.buildingName !== ''){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                       fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                   }

                   // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                   document.getElementById('zip1').value = data.zonecode; //5�ڸ� �������ȣ ���
                   document.getElementById('addr1').value = fullAddr;

                   // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                   document.getElementById('addr2').focus();
               }
           }).open();
       }
   


</script>
 <!-- --------------------------�� ����------------------------------------------------------- -->
    <div id="content" class="col-sm-9" style="min-height:600px";>
 
   <div class="row py-5">
      <div class="col-md-2"></div>
      <div class="col-md-9">
         <h2 class="text-dark mb-5 px-3">ȸ����������</h2>
         <form id="modifyForm" name="modifyForm" method="post">
         <input type="hidden" name="act" id="act" value="modifyInfo">
            <div class="form-group row px-3">
               <label for="inputName" class="col-sm-2 col-12 col-form-label">�̸�</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="name"
                     placeholder="" value="<%=memberDto.getName()%>" readonly>
               </div>
            </div>
            <div class="form-group row px-3">
               <label for="inputId" class="col-sm-2 col-12 col-form-label">���̵�</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="id" name="id"
                     placeholder="" value="<%=memberDto.getId()%>" readonly>
               </div>
                              
            </div>

            <div class="form-group row px-3">
               <label for="inputPassword1" class="col-sm-2 col-form-label">��й�ȣ</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="pass" name="pass"
                     placeholder="�ٲٽ� ��й�ȣ�� �Է����ּ���">
               </div>
            </div>
            <div class="form-group row px-3">
               <label for="inputPassword1" class="col-sm-2 col-form-label">��й�ȣ<br>Ȯ��</label>
               <div class="col-sm-10">
                  <input type="password" class="form-control" id="passok" name="passok"
                     placeholder="��й�ȣ�� �ѹ��� �Է����ּ���">
               </div>
            </div>


            <div class="form-group row align-items-center px-3">
               <label for="inputEmail1" class="col-sm-2 col-form-label">�̸���</label>
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
                     <option selected="selected">�����Է�</option>
                     <option>kitri.re.kr</option>
                     <option>naver.com</option>
                     <option>daum.net</option>
                     <option>hanmail.net</option>
                  </select>
               </div>
            </div>


            <div class="form-group row px-3">
               <label for="inputTel" class="col-sm-2 col-12 col-form-label">��ȭ��ȣ</label>
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
               <label for="inputAddress" class="col-sm-2 col-form-label">�����ּ�</label>
               <div class="col-sm-4 col-8">
                  <label class="sr-only" for="inputZipcode">zipcode</label>
                  <input type="text" class="form-control mb-2 mb-sm-0" id="zip1" name="zip1"
                     value="<%=NullCheck.isNotNull(memberDto.getZip1())%>" readonly>
               </div>
               <div class="col-sm-2 pl-0 col-4 align-self-center">
                  <input type="button" class="btn btn-primary" value="�ּҰ˻�" onclick="javascript:zipsearch();">
               </div>
            </div>

            <div class="form-group row px-3">
               <label for="inputAddress2" class="col-sm-2 col-form-label">���ּ�</label>
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
               <label for="inputTeam" class="col-sm-2 col-form-label">��ȣ����</label>
               <div class="col-sm-4">
                  <select id="tno" name="tno" class="form-control" onchange="javascript:tnochange(this);" style=min-height:36px;>
                     <option selected="<%=memberDto.getTno()%>" value="0">--�����ϼ���--</option>
                     <option value="2">�λ� ���</option>
                     <option value="3">�Ե� ���̾���</option>
                     <option value="1">KIA Ÿ�̰���</option>
                     <option value="4">NC ���̳뽺</option>
                     <option value="5">SK ���̹���</option>
                     <option value="6">LG Ʈ����</option>
                     <option value="7">�ؼ� �������</option>
                     <option value="8">��ȭ �̱۽�</option>
                     <option value="9">�Ｚ ���̿���</option>
                     <option value="10">KT ����</option>
                  </select>
                  <input type="text" name="tnowiew" id="tnowiew" value="<%=memberDto.getTno()%>">
               </div>
            </div>

            <div class="border-b mb-2 px-3"></div>

            <div class="px-3 py-3">
               <input type="button" class="btn btn-lg btn-block btn-primary" onclick="javascript:modifyInfo();" value="����">
            </div>
         </form>
      </div>
   </div>

        
       </div>
 <!-- --------------------------�� ����------------------------------------------------------- -->
     <div id="aside" class="col-sm-1">
       
    </div>
  </div>
</div>
 

<%@ include file="/common/footer.jsp"%>