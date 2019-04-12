function checkAll() {
	var checkAll = document.getElementById("0");
	var checkbox = document.getElementsByName("genreName");
	if (checkAll.checked == true) {
		for (var i = 0; i < checkbox.length; i++) {
			checkbox[i].checked = true;
		}
	} else {
		for (var i = 0; i < checkbox.length; i++) {
			checkbox[i].checked = false;
		}
	}
}

function checkAllch(chk) {
	var checkAll = document.getElementById("0");
	if (chk.checked == false) {
		checkAll.checked = false;
	}
}

var rateXhr=null;
var listRateXhr=null;
var delRateXhr=null;

function rateInsert(movieNum,cp) {
	var rate=document.getElementsByName("rate")[0].value;
	var rateComm=document.getElementById("rateComm").value;
	rateXhr=new XMLHttpRequest();
	rateXhr.onreadystatechange=function(){
		if (rateXhr.readyState == 4 && rateXhr.status == 200) {
			var data=rateXhr.responseText;
			var insertJson=JSON.parse(data);
			if (insertJson.code=='success') {
				rateList(movieNum,cp)
				document.getElementById("rateComm").value="";
			}else{
				alert("등록실패!");
			}
		}
	};
	rateXhr.open('post',cp+'/Movie/rate/insertRate.do', true);
	rateXhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	var insertparam = "rate=" + rate + "&rateComm=" + rateComm + "&movieNum="+movieNum;
	rateXhr.send(insertparam);
}
function rateList(movieNum,cp) {
	listRateXhr=new XMLHttpRequest();
	listRateXhr.onreadystatechange=function(){
		if (listRateXhr.readyState==4&&listRateXhr.status==200) {
			var data=listRateXhr.responseText;
			var rateList=document.getElementById("rateList");
			delRateComm();
			var comm=eval("("+data+")");
			for (var i = 0; i < comm.length; i++) {
				var div=document.createElement("div");
				var div1=document.createElement("div");
				var div2=document.createElement("div");
				var rate="";
				if (comm[i].rate==1) {
					rate="☆☆☆☆★ (1) ";
				}else if (comm[i].rate==2) {
					rate="☆☆☆★★ (2) ";
				}else if (comm[i].rate==3) {
					rate="☆☆★★★ (3) ";
				}else if (comm[i].rate==4) {
					rate="☆★★★★ (4) ";
				}else if (comm[i].rate==5) {
					rate="★★★★★ (5) ";
				}
				div1.innerHTML=rate+"<br>"+comm[i].userId;
				div2.innerHTML=comm[i].rateComm+"<a href='javascript:removeComm("+movieNum+",\""+cp+"\")'>삭제</a>";
				div1.className="rate1Div";
				div2.className="rate2Div";
				div.appendChild(div1);
				div.appendChild(div2);
				div.className="rateComm";
				rateList.appendChild(div);
			}
		}
	};
	listRateXhr.open('get', cp+'/Movie/rate/listRate.do?movieNum='+movieNum, true);
	listRateXhr.send();
}

function delRateComm() {
	var rateList=document.getElementById("rateList");
	var childs=rateList.childNodes;
	for (var i = childs.length-1; i >= 0; i--) {
		var child=childs.item(i);
		rateList.removeChild(child);
	}
}

function removeComm(movieNum,cp){
	var delRateXhr=new XMLHttpRequest();
	delRateXhr.onreadystatechange=function(){
		if (delRateXhr.readyState==4&&delRateXhr.status==200) {
			var data=delRateXhr.responseText;
			var json=eval("("+data+")");
			if (json.code=='success') {
				rateList(movieNum,cp);
			}else{
				alert('삭제실패!');
			}
		}
	};
	delRateXhr.open('get', cp+'/Movie/rate/deleteRate.do?movieNum='+movieNum, true);
	delRateXhr.send();
}
var listXhr = null;
var cp = null;
var pageCnt=1;
function getList(cp1) {
	cp = cp1;
	listXhr = new XMLHttpRequest();
	listXhr.onreadystatechange = listOk;
	listXhr.open('get', cp + '/Movie/getList.do', true);
	listXhr.send();
}

function listOk() {
	if (listXhr.readyState == 4 && listXhr.status == 200) {
		var data = listXhr.responseText;
		var mainlist = document.getElementById("mainlist");
		delComm();
		var tempgenreName = [];
		var a = 0;
		var comm = eval("(" + data + ")");
		var html = "";

		// 장르명 받아오기
		for (var i = 0; i < comm.length; i++) {
			tempgenreName.push(comm[i].genreName);
		}
		var genreNames=tempgenreName.filter( (item, idx, array) =>{
			return array.indexOf(item)===idx;
		});
		
		
		// 화면구성
		for (var i = 0; i < comm.length; i++) {
			if (comm[i].genreName == genreNames[a]) {
				var subdiv = document.createElement("div");
				subdiv.innerHTML = "<h2>" + genreNames[a] + "</h2><span><a href="+cp+"/Movie/moviesearch.do?genreName="+comm[i].genreNum+">더보기</a></span>";
				var ul = document.createElement("ul");
				a++;
			}
			var li=document.createElement("li");
			var clickdiv=document.createElement("div");
			clickdiv.className="MovieInfoClassDiv";
			clickdiv.innerHTML="<a href='"+cp+"/Movie/review.do?movieNum="+comm[i].movieNum+"'><img src='"+cp+"/Movie/images/photo/"+comm[i].imageSavName+"' alt='이미지'></a>"
			+"<br><a href='"+cp+"/Movie/review.do?movieNum="+comm[i].movieNum+"'><label>"+comm[i].movieName+"</label></a>";
			
			li.appendChild(clickdiv);
			ul.appendChild(li);
			subdiv.appendChild(ul);
			mainlist.appendChild(subdiv);

		}
	}
}

function delItem() {
	var childs=clickdiv.childNodes;
	for (var i = 0; childs.length-1>=0; i--) {
		var child = childs.item(i);
		clickdiv.removeChild(child);
	}
	
}

function delComm() {
	var mainlist = document.getElementById("mainlist");
	var childs = mainlist.childNodes;
	for (var i = 0; childs.length - 1 >= 0; i--) {
		var child = childs.item(i);
		mainlist.removeChild(child);
	}
}

function getActionList(e) {
	if(e.target.className=='leftbutton'){
		alert("a");
	}
	
}
