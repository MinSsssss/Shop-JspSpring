

function fnMoveCategory(category_no){
		
		let moveCategoryForm = $("#moveCategoryForm");
		let categoryAction = moveCategoryForm.attr('action');
		
		moveCategoryForm.attr('action',categoryAction+"/"+category_no);
		
		moveCategoryForm.submit();

}

$.urlParam = function(name) {
    let results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
        return null;
    } else {
        return results[1] || 0;
    }
}
$(document).ready(function() {
	let moveForm = $("#moveForm");
	let pageId = $("#pageId").val();

	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();

		moveForm.find("input[name='pageNum']").val($(this).attr("href"));

		if (pageId == "notice") {
			moveForm.attr("action", "/admin/notice/noticeList");

		}
		else if (pageId == "product") {
			let category_no = $.urlParam('category_no');
			let categoryInput = '<input type="hidden" name="category_no" value="'+category_no+'">'
			moveForm.append(categoryInput);
			moveForm.attr("action", "/admin/product/productList");

		}
		else if (pageId == "adminFaqList") {
			let category_no = $("#category_no").val();
			
			moveForm.attr('action',"/admin/faq/faqList/"+category_no);

		}
		moveForm.submit();

	});
	

/*	let moveCategoryForm = $("#moveCategoryForm");
	$(".moveCategory a").on("click",function(e){
		e.preventDefault();
		moveCategoryForm.submit();
	})*/
	
	
	
	$("#qnaAnswerBtn").on("click",function(){

		let qna_no = $("#qna_no").val();
		let qna_answer = $("#qna_answer").val();

		if(qna_answer==''){
			alert("답변을 입력해주세요.");
			return false;
		}
		
		let param = {
				"qna_no" : qna_no,
				"qna_answer" : qna_answer
		}
		
		$.ajax({
			
	         type:"POST",
	         dataType : "json",
	         url:"/admin/qna/qnaAnswerRegister",
	         data: JSON.stringify(param),
	         contentType: "application/json; charset=UTF-8",
	         success:function(data){
	                if(data){
	                	alert("답변이 등록되었습니다.")
	                	location.reload();
	                }
	                else{
	                	alert("답변 등록에 실패하였습니다.")
	                }
	         }
	     });
	})
	
	
	$("#cateBtnSubmit").on("click", function() {

	})
	$("#cateBtnSubmit").on("click", function() {
		if ($("#category_name").val() == '') {
			alert("카테고리 이름을 입력해주세요");
			return false;
		}

	})

	$("#faqRegBtn").on("click", function() {
		if ($("#faq_title").val() == "") {
			alert("제목을 입력해주세요");
			$("#faq_title").focus();
			return false;
		}
		if ($("#faq_content").val() == "") {
			alert("내용을 입력해주세요");
			$("#faq_content").focus();
			return false;
		}
	})


	$("#regModalBtn").on("click", function() {
		$("#registerForm").submit();
	})

	$("#deleteBtn").on("click", function() {

		$("#deleteForm").submit();
	})

	$("#noticeRegModalBtn").on("click", function() {
		$("#noticeRegisterForm").submit();
	})




	$("#productRegBtn").on("click", function() {

		if ($("#product_name").val() == "") {
			alert("상품 이름을 입력해주세요.");
			$("#product_name").focus();
			return false;
		}
		if ($("#product_detail").val() == "") {
			alert("상품 설명을 입력해주세요.");
			$("#product_detail").focus();
			return false;
		}
		if ($("#product_price").val() == "") {
			alert("상품 가격을 입력해주세요.");
			$("#product_price").focus();
			return false;
		}
		$("#productRegModal").modal();
		
		
	
		
		
		
		let formObj = $("form[role='form']");
		$("#productRegModalBtn").on("click", function(e) {
			
			e.preventDefault();
		    
		    
		    
		    let str = "";
		    
		    $(".uploadResult ul li").each(function(i, obj){
		      
	    	
		      let jobj = $(obj);
      
		      
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		      
		    });
		    
		    formObj.append(str).submit();
			
		})


	})
	
	$("#productModifyBtn").on("click", function() {

		if ($("#product_name").val() == "") {
			alert("상품 이름을 입력해주세요.");
			$("#product_name").focus();
			return false;
		}
		if ($("#product_detail").val() == "") {
			alert("상품 설명을 입력해주세요.");
			$("#product_detail").focus();
			return false;
		}
		if ($("#product_price").val() == "") {
			alert("상품 가격을 입력해주세요.");
			$("#product_price").focus();
			return false;
		}
		$("#productModifyModal").modal();
		

		let formObj = $("#productModifyForm");
		$("#productModifyModalBtn").on("click", function() {  
		    
		    let str = "";
		    
		    $(".uploadResult ul li").each(function(i, obj){
	
		      let jobj = $(obj);
 
		      
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		      
		    });  
		    
		    formObj.append(str).submit();
	
		})


	})
	
	
	
	
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function() {
		
		let formData = new FormData();

		let inputFile = $("input[name='uploadFile']");

		let files = inputFile[0].files;

		for (let i = 0; i < files.length; i++) {

			if (!fileCheck(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);	
		}	
		$.ajax({
			url: '/admin/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				showUploadResult(result); 			
			}
		}); //$.ajax
	});
	
	
	


	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	

	function fileCheck(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		return true;

	}
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0 ){
			return;
		}
		let uploadUL = $(".uploadResult ul");
		let str ="";
		
		$(uploadResultArr).each(function(i,obj){
			
			if(obj.image){
				let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +=" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<input type='radio' name='product_thumb_img' value='"+fileCallPath+ "'>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +="</li>";
			
			}else{
				let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +="</li>";
			}
		});
		uploadUL.append(str);
	}
	$(".uploadResult").on("click", "button", function(e){
	    
	    
	      
	    let targetFile = $(this).data("file");
	    let type = $(this).data("type");
	    
	    let targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	           
	           
	           targetLi.remove();
	         }
	    }); //$.ajax
	   });





})
$("#regModal").modal('hide');


function successFun(result) {

	if (result == 'successModify') {
		alert("수정이 완료되었습니다.")
	}
	if (result == 'failModify') {
		alert("수정에 실패하였습니다.")
	}
	if (result == 'successRegister') {
		alert("등록이 완료되었습니다.")
	}
	if (result == 'failRegister') {
		alert("등록에 실패하였습니다.")
	}
	if (result == 'successDelete') {
		alert("삭제에 성공하셨습니다.")
	}
	if (result == 'failDelete') {
		alert("삭제에 실패하였습니다.")
	}
	if (result == 'uniqueRegister') {

		alert("중복된 이름입니다.");
	}
}