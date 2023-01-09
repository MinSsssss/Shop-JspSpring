$(document).ready(function() {
	$("#cateBtnSubmit").on("click",function(){
			
	})
	$("#cateBtnSubmit").on("click",function(){
		if($("#category_name").val()==''){
			alert("카테고리 이름을 입력해주세요");
			return false;
		}
		
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
	
	let moveForm = $("#moveForm");
	let pageId = $("#pageId").val();
	
	$(".pageInfo a").on("click",function(e){
		e.preventDefault();
		
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        
        if(pageId=="notice"){
        	moveForm.attr("action", "/admin/notice/noticeList");
        	
        }
        else if(pageId=="product"){
        	moveForm.attr("action", "/admin/product/productList");
        	
        }
        moveForm.submit();
        
        
		
	});
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	$("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!fileCheck(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    

	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      
	      data: formData,
	      type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  //showUploadResult(result); //업로드 결과 처리 함수 

	      },
	      error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	},
	    	beforeSend: function( xhr ) {
	    		//ajax가 서버에 요청하기 전에 실행하는 로직
	    		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	    	}
	      
	    }); //$.ajax
	    
	  });  
		
		
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
	
	
	
	
	
	
})
$("#regModal").modal('hide');


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
	if(result == 'uniqueRegister'){
		
		alert("중복된 이름입니다.");
	
		window.location = document.referrer;
		history.back();
	}
}