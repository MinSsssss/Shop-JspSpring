$(document).ready(function() {
	
	


	$("#wishListBtn").on("click", function() {
		
		let mem_id = $("#chk_mem_id").val();

		if (mem_id == undefined) {
			let answer = confirm("로그인이 필요합니다." + "\r\n로그인 페이지로 이동하시겠습니까?");
			if (answer) {

				//window.location.replace('/login');
				location.href="/login";
				return false;
				
				
			}

		} else {
			let product_no = getParameter("product_no");

			let param = {
				"mem_id": mem_id,
				"product_no": product_no
			};

			$.ajax({
				url: "/wish/addWishList",
				async: true,
				type: "post",
				dataType: "json",
				data: JSON.stringify(param),
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					console.log(data);
					location.reload();
				}
			})
		}
	})


	let product_no = $("#product_no").val();
	let mem_id = $("#chk_mem_id").val();
	
	
	
	wishChk(product_no,mem_id);
})

function wishChk(product_no,mem_id) {
	let param = {
		"product_no": product_no,
		"mem_id" : mem_id

	}
	$.ajax({
		url: "/wish/wishChk",
		type: "post",
		dataType: "json",
		data: JSON.stringify(param),
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			if (data == 1) {

				$("#wishHeart").removeClass("far");
				$("#wishHeart").addClass("fas");
			}
		}
	})
}

function wishDelete(product_no) {

	let param = { "product_no": product_no.value };
	$.ajax({
		url: "/wish/wishDelete",
		type: "post",
		dataType: "json",
		data: JSON.stringify(param),
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			alert("삭제되었습니다.");
			location.reload();
		}
	})
}


