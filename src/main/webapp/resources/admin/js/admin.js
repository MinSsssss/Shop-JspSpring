$(document).ready(function() {
	$("#cateBtnSubmit").on("click",function(){
			
	})
	var actionForm = $("#actionForm");
	$(".move").on("click",function(e){
	e.preventDefault();
	actionForm.append("<input type = 'hidden' name = 'category_no' value='"+$(this).attr("href")+"'>");
	actionForm.attr("action","/admin/categoryRead");
	actionForm.submit();
	});
	
	
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