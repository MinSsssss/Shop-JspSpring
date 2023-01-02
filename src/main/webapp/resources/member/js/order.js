$(document).ready(function() {

	$("#checkoutBtn").on("click", function() {
		// $("#checkoutForm").submit();
		let receiver_name = $("#receiver_name").val();
		let receiver_tel = $("#receiver_tel").val();
		let receiver_addr1 = $("#receiver_addr1").val();
		let order_request_msg = $("#order_request_msg").val();
		let param = {
			"receiver_name": receiver_name,
			"receiver_tel": receiver_tel,
			"receiver_addr1": receiver_addr1,
			"order_request_msg": order_request_msg
		}
		$.ajax({
			url: "/member/auth/checkout",
			async: true,
			type: "post",
			dataType: "json",
			data: JSON.stringify(param),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				alert(data);
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
					let params = {
						"order_no": data,
						"product_name": chkProductName,
						"order_qty": chkProductQty,
						"sub_total": chkSubTotal
					}

					orderDetailArr.push(params);
					count++;

				})
				let paramList = {
					"paramList": JSON.stringify(orderDetailArr)
				}
				$.ajax({

					type: "POST",
					url: "/member/auth/orderDetails",
					data: paramList,
					success: window.location.replace('/member')

				})
			}
		})




	})

	$("#buyNowBtn").on("click", function() {
		let product_name = $("#product_name").text();
		let order_qty = $("#cart_qty").val();
		let product_price = $("#product_price").text();
		let sub_total = parseInt(order_qty) * parseInt(product_price);
		console.log("order_qty : " + order_qty);
		console.log("product_name : " + product_name);
		console.log("product_price : " + product_price);
		console.log("sub_total : " + sub_total);
		let form_content = '';
		let productName_input =
			"<input name='orderDetailList[0].product_name' type='hidden' value='" + product_name + "'> ";
		form_content += productName_input;
		let productQty_input =
			"<input name='orderDetailList[0].order_qty' type='hidden' value='" + order_qty + "'> ";
		form_content += productQty_input;
		let subTotal_input =
			" <input name='orderDetailList[0].sub_total' type='hidden' value='" + sub_total + "'> ";
		form_content += subTotal_input;
		$("#orderForm").html(form_content);
		$("#orderForm").submit();

	});
	

});
setTotalInfo()

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
function orderDeleteFun(order_status, order_no) {

	let answer = confirm("선택하신 주문내역을 삭제하시겠습니까?");
	if (answer) {
		if (order_status.value == "배송 완료") {
			let param = { "order_no": order_no.value }
			$.ajax({
				url: "/member/auth/orderDelete",
				type: "POST",
				data: param,
				success: function(data) {
					alert("주문내역이 삭제되었습니다.");
					location.reload();
				}
			})
		}
		else {
			alert("배송이 완료되지 않은 주문내역은 삭제하실수 없습니다.");
			return false;
		}


	}
}

function reviewWriteFun(order_detail_no, order_status) {
	console.log(order_status.value);
	if(order_status.value!='배송 완료'){
		alert("배송이 완료된 제품만 리뷰를 작성할 수 있습니다.");
		return false;
	}
	else{
		location.href="/member/auth/reviewWriteForm?order_detail_no="+order_detail_no.value;
		/*let param = { "order_detail_no": order_detail_no.value }
		console.log(param)*/
		/*$.ajax({
			url: "/member/auth/reviewWriteForm",
			type: "GET",
			data: param,
			success: window.location.replace('/member/auth/reviewWriteForm')
			
		})*/
	}
	
	
	/*let answer = confirm("선택하신 주문내역을 삭제하시겠습니까?");
	if (answer) {
		if (order_status.value == "배송 완료") {
			let param = { "order_no": order_no.value }
			$.ajax({
				url: "/member/auth/orderDelete",
				type: "post",
				data: param,
				success: function(data) {
					alert("주문내역이 삭제되었습니다.");
					location.reload();
				}
			})
		}
		else {
			alert("배송이 완료되지 않은 주문내역은 삭제하실수 없습니다.");
			return false;
		}


	}*/
}

