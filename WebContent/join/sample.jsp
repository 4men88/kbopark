<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language= "javascript" >
// opener���� ������ �߻��ϴ� ��� �Ʒ� �ּ��� �����ϰ�, ������� ������������ �Է��մϴ�.
// (���˾� API ȣ�� �ҽ�"�� �����ϰ� ������Ѿ� �մϴ�.)
//document.domain = "abc.go.kr";
function goPopup(){
//��δ� �ý��ۿ� �°� �����Ͽ� ���
//ȣ��� ������(jusopopup.jsp)���� ���� �ּҰ˻�URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)��
//ȣ���ϰ� �˴ϴ�.
var pop = window.open("<%=root%>/member?act=juso","pop","width=570,height=420, scrollbars=yes, resizable=yes");
//** 2017�� 5�� ����Ͽ� �˾� API ��� �߰����� **/
// ����� ���� ���, ȣ��� ������(jusopopup.jsp)����
// ���� �ּҰ˻� URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd,
rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm,
buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
// 2017�� 2�� �����׸��� �߰��Ǿ����ϴ�. ���Ͻô� �׸��� �߰��Ͽ� ����Ͻø� �˴ϴ�.
document.form.roadFullAddr.value = roadFullAddr;
document.form.roadAddrPart1.value = roadAddrPart1;
document.form.roadAddrPart2.value = roadAddrPart2;
documentform.addrDetail.value = addrDetail;
document.form.zipNo.value = zipNo;
}
</script>
</head>
<body>
<form name= "form" id= "form" method= "post" >
<input type= "button" onClick="goPopup();" value= "�˾�" />
���θ��ּ� ��ü(����)<input type= "text" id= "roadFullAddr" name= "roadFullAddr" /><br>
���θ��ּ� <input type= "text" id= "roadAddrPart1" name= "roadAddrPart1" /><br>
���Է� ���ּ�<input type= "text" id= "addrDetail" name= "addrDetail" /><br>
�����ּ�<input type= "text" id= "roadAddrPart2" name= "roadAddrPart2" /><br>
�����ȣ<input type= "text" id= "zipNo" name= "zipNo" />
</form>
</body>
</html>