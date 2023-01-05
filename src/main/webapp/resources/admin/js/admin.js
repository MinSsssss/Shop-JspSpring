$(document).ready(function() {
	$("#cateBtnSubmit").on("click",function(){
			
	})
	$("#faqRegBtn").on("click",function(){
		if($("#faq_title").val()==""){
			alert("제목을 입력해주세요");
			$("#faq_title").focus();
			return false;
		}
		if($("#faq_content").val()==""){
			alert("내용을 입력해주세요");
			$("#faq_content").focus();
			return false;
		}
	})
	
	
	$("#regModalBtn").on("click",function(){
		$("#registerForm").submit();
	})
	
	$("#deleteBtn").on("click",function(){
		
		$("#deleteForm").submit();
	})
	
	$("#noticeRegModalBtn").on("click",function(){
		$("#noticeRegisterForm").submit();
	})
	
	
	
	
	$("#productRegBtn").on("click",function(){
		
		if($("#product_name").val()==""){
			alert("상품 이름을 입력해주세요.");
			$("#product_name").focus();
			return false;
		}
		if($("#product_detail").val()==""){
			alert("상품 설명을 입력해주세요.");
			$("#product_detail").focus();
			return false;
		}
		if($("#product_price").val()==""){
			alert("상품 가격을 입력해주세요.");
			$("#product_price").focus();
			return false;
		}
		$("#productRegModal").modal();
		$("#productRegModalBtn").on("click",function(){
			
			
			$("#productRegisterForm").submit();	
			alert("상품등록이 완료되었습니다.")
		})
		
		
	})
	
	
	
	
	
})

function successFun(result){
	
	if(result == 'successModify'){
		alert("수정이 완료되었습니다.")
	} 
	if(result == 'failModify'){
		alert("수정에 실패하였습니다.")
	}
	if(result == 'successRegister'){
		alert("등록이 완료되었습니다.")
	} 
	if(result == 'failRegister'){
		alert("등록에 실패하였습니다.")
	}
	if(result == 'successDelete'){
		alert("삭제에 성공하셨습니다.")
	} 
	if(result == 'failDelete'){
		alert("삭제에 실패하였습니다.")
	}
}