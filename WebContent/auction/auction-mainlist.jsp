<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
<%!
//리스트 길이 담을 변수
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

 //endTime만 따로 리스트에 담을 리스트
 List<String> bestListTimeArr = new ArrayList<String>();	
 List<String> endListTimeArr = new ArrayList<String>();
 List<String> hitListTimeArr = new ArrayList<String>();
 List<String> newListTimeArr = new ArrayList<String>();
 if(bestList != null)	//리스트가 널이 아니면
 {
 		bestListLen = bestList.size();	//사이즈 재고
 		for(int i=0; i<bestListLen; i++)	//사이즈만큼
 		{
 			bestListTimeArr.add(i, bestList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
		}
 }
 if(endList != null)
 {
	   endListLen = endList.size();
	   for(int i=0; i<endListLen; i++)
		{
		   endListTimeArr.add(i, endList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
		}
 }
 if(hitList != null)
 {
	   hitListLen = hitList.size();
	   for(int i=0; i<hitListLen; i++)
		{
		   hitListTimeArr.add(i, hitList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
		}
 }
 if(newList != null)
 {
	   newListLen = newList.size();
	   for(int i=0; i<bestListLen; i++)
		{
		   newListTimeArr.add(i, newList.get(i).getEndTime());	//endTime만 빼서 따로 리스트 만듬
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
         var ctime = httpRequest.responseText;	//현재시간(2017.12.07.11.42.30) 포멧
         var ctimearr = ctime.split("."); 	// .빼고 배열로 만들고
         var cdate;		//현재시간으로 Date 객체 만들 변수
         var csec;		//현재시간을초로 변환할 변수
         
         var dtime;	//db에서 얻어온 시간 담을 변수
         var dtimearr;	
         var ddate; //DB에서 얻어온시간을로 만든 Date 객체
         var dsec;	//DB에서 얻어온시간을초로 변환
         
         var sresult;	//두 시간 차 초
         var day = 0;
         var time = 0;
         var min = 0;
         var sec = 0;
         // 서버에서 가져온 현재시간으로 Date객체 생성
			cdate = new Date(ctimearr[0]+"-"+ctimearr[1] +"-"+ctimearr[2]+"T"+ctimearr[3]+":"+ctimearr[4]+":"+ctimearr[5]+".323");
			csec = cdate.getTime();	//밀리커리 세컨드 단위로 변환
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
			if(result >0)	//남은시간이 있다면
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
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
						}
					else if(time >0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
						}
					else if(min > 0)
						{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
						}
					else{
						document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
					}
				}
			
			else{	//남은시간이 없다면
            document.getElementById("besttime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";				
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
	if(result >0)	//남은시간이 있다면
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
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("endtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";				
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
	if(result >0)	//남은시간이 있다면
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
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("hittime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";				
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
	if(result >0)	//남은시간이 있다면
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
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+day+"일 "+time+"시간 "+min+"분 "+sec+"초</b></font>";
				}
			else if(time >0)
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+time+"시간 "+min+"분 "+sec+"초</b></font>";						
				}
			else if(min > 0)
				{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+min+"분 "+sec+"초</b></font>";
				}
			else{
				document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"blue\"size=\"4\"><b>남은시간 : "+sec+"초</b></font>";
			}
		}
	
	else{	//남은시간이 없다면
    document.getElementById("newtime" + <%=i%>).innerHTML 
= "<font color=\"red\"size=\"4\"><b>마감</b></font>";				
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