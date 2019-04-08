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

function rateInsert() {

}