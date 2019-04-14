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
