$(document).ready(function(){
	$('#agreeAllChk').click(function(){
		let checked = $('#agreeAllChk').is(':checked');
		
		if(checked)
			$('input:checkbox').prop('checked',true);
	});
	
	$("#registerNextBtn").on("click",function(){
		let chk1 = $("#agreeChk1").is(':checked');
		let chk2 = $("#agreeChk2").is(':checked');
		
		
		if(!chk1){
			alert("이용약관(필수)을 체크해주세요.");
			return false;
		}
		if(!chk2){
			alert("개인정보 수집 및 이용 (필수)을 체크해주세요.");
			return false;
		}
		$("#registerNext").submit();
	})
	
	
	
	
	
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
	let mem_id = $("#mem_id").val();
	if(mem_id==""){
		alert("아이디를 입력해주세요.")
		return false;
	}
	
	$.ajax({
		url : "/idChk",
		type : "post",
		dataType : "json",
		data : {"mem_id" : mem_id},
		success : function(data){
			if(data){
				alert("중복된 아이디입니다.");
			}else{
				
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}





























