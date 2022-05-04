// 아이디중복검사 입력창 띄우기
function checkId() {
	var sId = document.form.id.value;
	
	if(sId == "") {
		alert("먼저 아이디를 입력하세요");
		document.frm.id.focus();
	} else {
		//브라우저 창 새로열기(window.open)	// get 방식
		window.open("checkId.jsp?id=" + sId, "", "width=550 height=100 left=500 top=200")
	}
}

// 로그인 화면에서 입력 검사
function checkLogin() {
	var frm = document.form;
	
	if(!frm.id.value) {
		alert("아이디를 입력하세요");
		frm.id.focus
	} else if(!frm.pwd.value) {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus
	} else {
		frm.submit();
	}
	// return false;  // submit 무효화 (loginForm submit에서 했으므로 여기선 안해도 됨)
}
// 로그인 화면에서 회원가입 페이지로 이동하는 함수
// function move_writeForm() {
//	 location.href = "../member/writeForm.jsp";
// }


// 입력 검사 방법1
function check(){
        let name = document.getElementById("name");
        let id = document.getElementById("id");
        let pwd = document.getElementById("pwd");
        let repwd = document.getElementById("repwd");
        let form = document.getElementById("form");

        if(name.value == ""){
            alert("이름을 입력하세요");
            name.focus();
            return false;
        } else if(id.value == ""){
            alert("아이디를 입력하세요.");
            id.focus();
            return false;
        } else if(pwd.value == ""){
            alert("비밀번호를 입력하세요.");
            pwd.focus();
            return false;
        } else if(repwd.value == ""){
            alert("비밀번호 재확인을 입력하세요.");
            repwd.focus();
            return false;
        } else if(pwd.value != repwd.value){
            alert("비밀번호를 재확인하세요");
            return false;
        } else {
         form.submit();
      }       
}
// 입력 검사 방법2
function doSubmit(){
      var frm = document.frm;

        if(!frm.name.value){
            alert("이름을 입력하세요");
            frm.name.focus();
            return false;
        } else if(!frm.id.value){
            alert("아이디를 입력하세요.");
            frm.id.focus();
            return false;
        } else if(!frm.pwd.value){
            alert("비밀번호를 입력하세요.");
            frm.pwd.focus();
            return false;
        } else if(!frm.repwd.value){
            alert("비밀번호 재확인을 입력하세요.");
            frm.repwd.focus();
            return false;
        } else if(frm.pwd.value != frm.repwd.value){
            alert("비밀번호를 재확인하세요");
            return false;
        } else {
         frm.submit();
      }        
}