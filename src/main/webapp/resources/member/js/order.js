$(document).ready(function() {
	$("#checkoutBtn").on("click", function() {
		console.log("크크크")
		//$("#checkoutForm").submit();
		
		
	})
	
	
	/*let param = {
		"product_name": product_name,
		"sub_total": sub_total,
		"order_qty": order_qty
	};
	
	$.ajax({
		url: "/member/auth/addCart",
		async: true,
		type: "post",
		dataType: "json",
		data: JSON.stringify(param),
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			console.log(data);
			if (data == 1) {
				$("#add_to_cart_modal").modal('show');
			}
			else {
				alert("장바구니에 이미 상품이 있습니다.");

				$("#add_to_cart_modal").modal('hide');
				return false;

			}

		}
	})*/

});


function setTotalInfo() {

	let totalPrice = 0;				// 총 가격
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)


	$(".sub_total_td").each(function(index, element) {
		
		totalPrice += parseInt($(element).find("#sub_total").val());
		
	});

	/* 배송비 결정 */
	if (totalPrice >= 30000) {
		deliveryPrice = 0;
	} else if (totalPrice == 0) {
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;
	}

	finalTotalPrice = totalPrice + deliveryPrice;

	// 총 가격
	$(".totalPrice").text(totalPrice.toLocaleString());
	// 배송비
	$(".deliveryPrice").text(deliveryPrice);
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice").text(finalTotalPrice.toLocaleString());
}







