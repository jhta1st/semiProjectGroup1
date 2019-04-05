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
	console.log("checkAll.checked:" + chk.checked)
	var checkAll = document.getElementById("0");
	if (chk.checked == false) {
		console.log("mmm")
		checkAll.checked = false;
	}
}