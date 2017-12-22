window.onload=function(){
	todaypl();
}
function todaypl(){
	//alert("todaypl");
	var params="act=todaypl";
	sendRequest("<%=root%>/admin", params, viewlist, "GET");
}

function viewlist(){
	//alert("viewlist");
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var listxml = httpRequest.responseXML;
			makelist(listxml);
		}	
	}
}
function makelist(listxml){
	//alert("makelist"+listxml);
	var len = listxml.getElementsByTagName("schedule").length;
	
		var carousel = document.getElementById("start");
		if(len!=0){
			for(var i=0;i<len;i++){
				var div1 = document.createElement("div");
				if(i==0){
					div1.setAttribute("class", "carousel-item active");
				}else{
					div1.setAttribute("class", "carousel-item");
				}
				var div2 = document.createElement("div");
				div2.setAttribute("class", "row text-white text-center");
				var div3 = document.createElement("div");
				div3.setAttribute("class","mx-auto rounded carousel-size-wrapper");
				div3.style.backgroundImage="url("+root+"/img/etc/grass.jpg)";
				var div4=maketime(listxml.getElementsByTagName("schedule")[i]);
				var div5=maketeam(listxml.getElementsByTagName("schedule")[i]);
				div3.appendChild(div4);
				div3.appendChild(div5);
				div2.appendChild(div3);
				div1.appendChild(div2);
				carousel.appendChild(div1);
				
			}
			
			var a1 = document.createElement("a");
			a1.setAttribute("class", "carousel-control-prev");
			a1.setAttribute("href", "#main-carousel");
			a1.setAttribute("role", "button");
			a1.setAttribute("data-slide", "prev");
			a1.innerHTML = "<span class='carousel-control-prev-icon' aria-hidden='true'></span> <span class='sr-only'>Previous</span>";
			//var span1 = document.createElement("span");
			//span1.setAttribute("","");
			var a2 = document.createElement("a");
			a2.setAttribute("class", "carousel-control-next");
			a2.setAttribute("href", "#main-carousel");
			a2.setAttribute("role", "button");
			a2.setAttribute("data-slide", "next");
			a2.innerHTML = "<span class='carousel-control-next-icon' aria-hidden='true'></span> <span class='sr-only'>Next</span>";
			
			carousel.appendChild(a1);
			carousel.appendChild(a2);
		}else{
			var nodiv1= document.createElement("div");
			var nodiv2 = document.createElement("div");
			var nodiv3 = document.createElement("div");
			var nodiv4 = document.createElement("div");
			nodiv1.setAttribute("class", "carousel-item active")
			nodiv2.setAttribute("class", "row text-white text-center")
			nodiv3.setAttribute("class", "mx-auto rounded carousel-size-wrapper")
			nodiv3.setAttribute("style", "background-image: url("+root+"/img/etc/grass.jpg)");
			nodiv3.style.textAlign = "center";
			nodiv4.setAttribute("style", "width:536px;height:140px;margin-top:50px");
			nodiv4.innerHTML="<font size='23px'>일정이 없습니다</font>";
			nodiv3.appendChild(nodiv4);
			nodiv2.appendChild(nodiv3);
			nodiv1.appendChild(nodiv2);
			carousel.appendChild(nodiv1);
			
		}
	}

function maketime(schedule){
	//alert("maketime");
	var sname = schedule.getElementsByTagName("sname")[0].firstChild.data;
	var playtime = schedule.getElementsByTagName("playtime")[0].firstChild.data;
	//alert(home+"   "+playtime)
	var timediv = document.createElement("div");
	timediv.setAttribute("class", "col-md-12 text-white p-2");
	timediv.style.backgroundColor = "rgba(50, 50, 50, 0.75)";
	timediv.innerHTML = "<span class='px-3 border-r'>"+sname+"</span><span class='px-3'>"+playtime+"</span>"
	
	return timediv;
	
}
function maketeam(schedule){
	//alert("maketeam");
	
	var homet = schedule.getElementsByTagName("home")[0].firstChild.data;
	var awayt = schedule.getElementsByTagName("away")[0].firstChild.data;
	var hemblem = schedule.getElementsByTagName("hemblem")[0].firstChild.data;
	var aemblem = schedule.getElementsByTagName("aemblem")[0].firstChild.data;
	//alert(home);
	var div1 = document.createElement("div");
	div1.setAttribute("class", "col-md-12 opaque-overlay py-2 px-3");
	var div2 = document.createElement("div");
	div2.setAttribute("class", "row");
	var home = document.createElement("div");
	home.setAttribute("class", "col-md-5 p-0 col-12");
	home.style.textAlign = "left";
	//home.setAttribute("style", "text-align:left");
	//var img = document.createElement("img");
	//img.setAttribute("src",root+hemblem);
	//img.setAttribute("class", "img-thumbnail");
	//var label = document.createElement("label");
	//label.innerHTML = home;
	//home.appendChild(img);
	//home.appendChild(label);
	
	home.innerHTML = "<img src='"+root+hemblem+"' class='img-thumbnail'><label>"+homet+"</label>";
	//str+="<img src='"+(root+hemblem)+"'class='img-thumbnail'>";
	//alert(root+hemblem);
	//str+="<label>"+home+"</label>";
	var vs = document.createElement("div");
	vs.setAttribute("class", "col-md-2 p-0 col-12 align-self-center");
	vs.innerHTML = "<h2 class='m-0'><strong>VS</strong></h2>";
	var away = document.createElement("div");
	away.setAttribute("class", "col-md-5 p-0 col-12");
	away.style.textAlign="right";
	//away.setAttribute("style", "text-align:right");
	
	away.innerHTML = "<label align='center'>"+awayt+"</label><img src='"+root+aemblem+"' class='img-thumbnail'>";
	
	
	div2.appendChild(home);
	div2.appendChild(vs);
	div2.appendChild(away);
	div1.appendChild(div2);
	return div1;
}  