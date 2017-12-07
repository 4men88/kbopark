<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
<%!
//����Ʈ ���� ���� ����
int bestListLen;	
int endListLen;
int hitListLen;
int newListLen;

%>

<%
 List<AuctionDetailDto> bestList = (List<AuctionDetailDto>)request.getAttribute("bestList");
 List<AuctionDetailDto> endList = (List<AuctionDetailDto>)request.getAttribute("endList");
 List<AuctionDetailDto> hitList = (List<AuctionDetailDto>)request.getAttribute("hitList");
 List<AuctionDetailDto> newList = (List<AuctionDetailDto>)request.getAttribute("newList");

 //endTime�� ���� ����Ʈ�� ���� ����Ʈ
 List<String> bestListTimeArr = new ArrayList<String>();	
 List<String> endListTimeArr = new ArrayList<String>();
 List<String> hitListTimeArr = new ArrayList<String>();
 List<String> newListTimeArr = new ArrayList<String>();
 if(bestList != null)	//����Ʈ�� ���� �ƴϸ�
 {
 		bestListLen = bestList.size();	//������ ���
 		for(int i=0; i<bestListLen; i++)	//�����ŭ
 		{
 			bestListTimeArr.add(i, bestList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
		}
 }
 if(endList != null)
 {
	   endListLen = endList.size();
	   for(int i=0; i<endListLen; i++)
		{
		   endListTimeArr.add(i, endList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
		}
 }
 if(hitList != null)
 {
	   hitListLen = hitList.size();
	   for(int i=0; i<hitListLen; i++)
		{
		   hitListTimeArr.add(i, hitList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
		}
 }
 if(newList != null)
 {
	   newListLen = newList.size();
	   for(int i=0; i<bestListLen; i++)
		{
		   newListTimeArr.add(i, newList.get(i).getEndTime());	//endTime�� ���� ���� ����Ʈ ����
		}
 }
%>

function startTime() {
//   httpRequest = getXMLHttpRequest();
//   httpRequest.onreadystatechange = getTime;
//   httpRequest.open("GET", "<%=root%>/auction/auction-time.jsp", true);
//   httpRequest.send(null);
   var params = "act=timelist";
   sendRequest("<%=root%>/auctionlist", params, getTime, "GET");   
}
function getTime() {
   if(httpRequest.readyState == 4) {
      if(httpRequest.status == 200) {
         var ctime = httpRequest.responseText;	//����ð�(2017.12.07.11.42.30) ����
         var ctimearr = ctime.split("."); 	// .���� �迭�� �����
         var cdate;		//����ð����� Date ��ü ���� ����
         var csec;		//����ð����ʷ� ��ȯ�� ����
         
         var dtime;	//db���� ���� �ð� ���� ����
         var dtimearr;	
         var ddate; //DB���� ���½ð����� ���� Date ��ü
         var dsec;	//DB���� ���½ð����ʷ� ��ȯ
         
         var sresult;	//�� �ð� �� ��
         var day = 0;
         var time = 0;
         var min = 0;
         var sec = 0;
         // �������� ������ ����ð����� Date��ü ����
			cdate = new Date(ctimearr[0]+"-"+ctimearr[1] +"-"+ctimearr[2]+"T"+ctimearr[3]+":"+ctimearr[4]+":"+ctimearr[5]+".323");
			csec = cdate.getTime();	//�и�Ŀ�� ������ ������ ��ȯ
<%
		for(int i=0; i<bestListLen; i++)
		{
%>			
			dtime = "<%=bestListTimeArr.get(i)%>";	
			dtimearr = dtime.split(".");
			ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
			dsec = ddate.getTime();
			
//			cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
			result = dsec - csec;
//					alert(dsec + "        " + csec + "         " + result);
			if(result >0)	//�����ð��� �ִٸ�
				{
					day = Math.floor(result/86400000);
					result -= day*86400000;
					
					time =Math.floor(result/3600000);
					result -= time*3600000;
					
					min = Math.floor(result/60000);
					result -= min*60000;
					
					sec = Math.floor(result/1000);					
					
					if(day>0)	
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
						}
					else if(time >0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
						}
					else if(min > 0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
						}
					else{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
					}
				}
			
			else{	//�����ð��� ���ٸ�
            document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";				
			}
			
<%            
         }
%>

<%
for(int i=0; i<endListLen; i++)
{
%>			
	dtime = "<%=endListTimeArr.get(i)%>";	
	dtimearr = dtime.split(".");
	ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
	dsec = ddate.getTime();
	
//	cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
	result = dsec - csec;
//			alert(dsec + "        " + csec + "         " + result);
	if(result >0)	//�����ð��� �ִٸ�
		{
			day = Math.floor(result/86400000);
			result -= day*86400000;
			
			time =Math.floor(result/3600000);
			result -= time*3600000;
			
			min = Math.floor(result/60000);
			result -= min*60000;
			
			sec = Math.floor(result/1000);					
			
			if(day>0)	
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
				}
			else{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
			}
		}
	
	else{	//�����ð��� ���ٸ�
    document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";				
	}
	
<%            
 }
%>

<%
for(int i=0; i<hitListLen; i++)
{
%>			
	dtime = "<%=hitListTimeArr.get(i)%>";	
	dtimearr = dtime.split(".");
	ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
	dsec = ddate.getTime();
	
//	cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
	result = dsec - csec;
//			alert(dsec + "        " + csec + "         " + result);
	if(result >0)	//�����ð��� �ִٸ�
		{
			day = Math.floor(result/86400000);
			result -= day*86400000;
			
			time =Math.floor(result/3600000);
			result -= time*3600000;
			
			min = Math.floor(result/60000);
			result -= min*60000;
			
			sec = Math.floor(result/1000);					
			
			if(day>0)	
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
				}
			else{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
			}
		}
	
	else{	//�����ð��� ���ٸ�
    document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";				
	}
	
<%            
 }
%>

<%
for(int i=0; i<newListLen; i++)
{
%>			
	dtime = "<%=newListTimeArr.get(i)%>";	
	dtimearr = dtime.split(".");
	ddate = new Date(dtimearr[0]+"-"+dtimearr[1] +"-"+dtimearr[2]+"T"+dtimearr[3]+":"+dtimearr[4]+":"+dtimearr[5]+".323");
	dsec = ddate.getTime();
	
//	cdate = new Date(ctimearr[0],ctimearr[1],ctimearr[2],ctimearr[3],ctimearr[4],ctimearr[5]);
	result = dsec - csec;
//			alert(dsec + "        " + csec + "         " + result);
	if(result >0)	//�����ð��� �ִٸ�
		{
			day = Math.floor(result/86400000);
			result -= day*86400000;
			
			time =Math.floor(result/3600000);
			result -= time*3600000;
			
			min = Math.floor(result/60000);
			result -= min*60000;
			
			sec = Math.floor(result/1000);					
			
			if(day>0)	
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+day+"�� "+time+"�ð� "+min+"�� "+sec+"��</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+time+"�ð� "+min+"�� "+sec+"��</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+min+"�� "+sec+"��</b></font>";
				}
			else{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>�����ð� : "+sec+"��</b></font>";
			}
		}
	
	else{	//�����ð��� ���ٸ�
    document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>����</b></font>";				
	}
	
<%            
 }
%>
         window.setTimeout("startTime();", 1000);
   //      alert(ctime);
      }
   }
}

window.onload=function() {
   startTime();
}
</script>