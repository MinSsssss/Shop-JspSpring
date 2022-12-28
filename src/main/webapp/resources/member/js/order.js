$(document).ready(function() {
	$("#checkoutBtn").on("click", function() {
		$("#checkoutForm").submit();
		let chkAmount = $(".sub_total_td").length
		console.log(chkAmount);
		let count = 0;
		let orderDetailArr = [];

		let chkNameArr = new Array(chkAmount);
		let chkQtyArr = new Array(chkAmount);
		let chkTotalArr = new Array(chkAmount);
		let form_content = ''
		$(".productDetail").each(function(index, element) {

			let chkProductName = $(element).find("#product_name").val();
			let chkProductQty = $(element).find("#order_qty").val();
			let chkSubTotal = $(element).find("#sub_total").val();

			chkNameArr[count] = chkProductName;
			chkQtyArr[count] = chkProductQty;
			chkTotalArr[count] = chkSubTotal;
			let data = {
				"product_name" : chkProductName,
				"order_qty" : chkProductQty,
				"sub_total" : chkSubTotal
			}

			orderDetailArr.push(data);
			count++;

		})
		let paramList = {
			"paramList" : JSON.stringify(orderDetailArr)
		}
		$.ajax({

			type : "POST",
			url : "/member/auth/orderDetails",
			data : paramList,
			success : function(data) {
			},
			error : function(e) {
			}
		})
		console.log(orderArr);
	})

});

function setTotalInfo() {

	let totalPrice = 0; // 총 가격
	let deliveryPrice = 0; // 배송비
	let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

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
