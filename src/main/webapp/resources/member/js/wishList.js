$(document).ready(function() {
	$("#wishListBtn").on("click", function() {
		console.log("하하하")
		let mem_id = $("#chk_mem_id").val();
		console.log(mem_id);

		if (mem_id == undefined) {
			let answer = confirm("로그인이 필요합니다." + "\r\n로그인 페이지로 이동하시겠습니까?");
			if (answer) {

				window.location.replace('/login');
				return false;
			}
		} else {
			let product_no = getParameter("product_no");
				
			let param = {
				"mem_id" : mem_id,
				"product_no" : product_no
			};

			$.ajax({
				url : "/member/auth/addWishList",
				async : true,
				type : "post",
				dataType : "json",
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						$("#liton_wishlist_modal").modal('show');
					} else {
						answer = confirm("이미 찜 목록에 포함되어있습니다." 
								+ "\r\n찜리스트로 이동하시겠습니까?");
						if(answer){
							window.location.replace('/member/auth/wishListView');
						}
						
						 
						return false;

					}
				}
			})
		}
	})



})



function wishDelete(product_no) {
	let answer = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
	if (answer) {
		console.log(product_no);
		let param = { "product_no": product_no.value };
		$.ajax({
			url: "/member/auth/wishDelete",
			type: "post",
			dataType : "json",
			data: JSON.stringify(param),
			contentType :"application/json; charset=UTF-8",
			success: function(data) {
				alert("삭제되었습니다.");
				location.reload();
			}
		})
	}
}

