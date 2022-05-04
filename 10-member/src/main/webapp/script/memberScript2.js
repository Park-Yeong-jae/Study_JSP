//로그인화면 입력검사

function checkLogin2() {
	//객체 생성 (form태그 name 불러옴)
	var frm = docutment.form;
	
	if(!frm.id.value) {
		alert("아이디를 입력하세요");
		frm.id.focus;
	} else if (!frm.pwd.value) {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus;
	} else {
		frm.submit();
	}
	
}