$(document).ready(function() {
	$("#checkoutBtn").on("click", function() {
		// $("#checkoutForm").submit();
		let receiver_name = $("#receiver_name").val();
		let receiver_tel = $("#receiver_tel").val();
		let receiver_addr1 = $("#receiver_addr1").val();
		let order_request_msg = $("#order_request_msg").val();
		let param = {
			"receiver_name" : receiver_name,
			"receiver_tel" : receiver_tel,
			"receiver_addr1" : receiver_addr1,
			"order_request_msg" : order_request_msg
		}
		console.log(receiver_name)
		console.log(receiver_tel)
		console.log(receiver_addr1)
		$.ajax({
			url : "/member/auth/checkout",
			async : true,
			type : "post",
			dataType : "json",
			data : JSON.stringify(param),
			contentType : "application/json; charset=UTF-8",
			success : function(data) {

			}
		})

		$("#buyNowBtn").on("click", function() {
			let cart_qty = $("#cart_qty").val();
			let product_no = getParameter("product_no");

			let param = {
				"cart_qty" : cart_qty,
				"product_no" : product_no
			};
			console.log("카트수량" + cart_qty);

			console.log("제품번호" + product_no);
			$.ajax({
				url : "/member/auth/addCart",
				async : true,
				type : "post",
				dataType : "json",
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						$("#add_to_cart_modal").modal('show');
					} else {
						alert("장바구니에 이미 상품이 있습니다.");

						$("#add_to_cart_modal").modal('hide');
						return false;

					}

				}
			})
		})

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
			success : window.location.replace('/member')

		})

		console.log(orderArr);
	})
	
	$("#buyNowBtn").on("click", function() {
		let product_name= $("#product_name").text();
		let order_qty = $("#cart_qty").val();
		let product_price = $("#product_price").text();
		let sub_total = parseInt(order_qty) * parseInt(product_price);
		console.log("order_qty : " + order_qty);
		console.log("product_name : " + product_name);
		console.log("product_price : " + product_price);
		console.log("sub_total : " + sub_total);
		let form_content = '';
		let productName_input = 
			" <input name='orderDetailList[0].product_name' type='hidden' value='"+product_name+"'> ";
			form_content+= productName_input;
			let productQty_input = 
			" <input name='orderDetailList[0].order_qty' type='hidden' value='"+order_qty+"'> ";
			form_content+= productQty_input;
			let subTotal_input = 
			" <input name='orderDetailList[0].sub_total' type='hidden' value='"+sub_total+"'> ";
			form_content+= subTotal_input;
		$("#orderForm").html(form_content);
		$("#orderForm").submit();
			
	});
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
