$(document).ready(function(){
	$("#cencleBtn").on("click", function(){
		location.href = "/login";
	})
	
	$("#joinBtn").on("click", function(){
		if($("#mem_id").val()==""){
			alert("아이디를 입력해주세요.");
			$("#mem_id").focus();
			return false;
		}
		if($("#mem_pwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#mem_pwd").focus();
			return false;
		}
		if($("#mem_pwd").val()!=$("#mem_pwd_re").val()){
			alert("비밀번호를 확인해주세요.");
			$("#mem_pwd_re").focus();
			return false;
		}
		if($("#mem_name").val()==""){
			alert("성명을 입력해주세요.");
			$("#mem_name").focus();
			return false;
		}
		if($("#mem_email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#mem_email").focus();
			return false;
		}
		if($("#mem_tel").val()==""){
			alert("전화번호를 입력해주세요.");
			$("#mem_tel").focus();
			return false;
		}
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}
		else if(idChkVal == "Y"){
			$("#regForm").submit();
			alert("회원가입이 성공적으로 처리되었습니다. 로그인 해주세요.")
		}
	});
})

function fn_idChk(){
	if($("#mem_id").val()==""){
		alert("아이디를 입력해주세요.")
		return false;
	}
	
	$.ajax({
		url : "/idChk",
		type : "post",
		dataType : "json",
		data : {"mem_id" : $("#mem_id").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}





























