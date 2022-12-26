//$("#subTotal").text()=$("#cart_qty").val()*$("#product_price").val();

$(document).ready(function() {



	$("#addCart").on("click", function() {
		let cart_qty = $("#cart_qty").val();
		let product_no = getParameter("product_no");

		let param = {
			"cart_qty": cart_qty,
			"product_no": product_no
		};
		console.log("카트수량" + cart_qty);

		console.log("제품번호" + product_no);
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
		})
	})

	$("#cartDeleteBtn").on("click", function() {
		$("#cartDeleteForm").submit();
	})

	$("#seleteDeleteBtn").on("click", function() {
		let eachLength = $(".cart_info_td").length;
		let chkAmount = $("input:checkbox[name=checkedCount]:checked").length;
		console.log(chkAmount);
		if(chkAmount==0){
			alert("삭제할 항목을 선택해주세요.");
			return false;
		}
		let count=0;
		let selectArr = new Array(chkAmount);
		$(".cart_info_td").each(function(index, element) {

			if ($(element).find(".individual_cart_checkbox").is(":checked") == true) {	//체크여부
				
				
				let chkProductName = $(element).find("#chkProductName").val();
				
				selectArr[count] = chkProductName;
				count++;
				
				console.log(selectArr);
				
				const form = document.createElement('form');
				form.setAttribute('method', 'post');        //Post 메소드 적용
				form.setAttribute('action', '/member/auth/cartSelectDelete');
				
				var input1 = document.createElement('input');
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "cartIds");
				input1.setAttribute("value", selectArr);
				form.appendChild(input1);
				console.log(selectArr.length);
				document.body.appendChild(form);
				//form.submit();

			} 



		});

	})
	$("#selectOrderBtn").on("click", function() {
		let eachLength = $(".cart_info_td").length;
		let chkAmount = $("input:checkbox[name=checkedCount]:checked").length;
		console.log(chkAmount);
		if(chkAmount==0){
			alert("구매할 항목을 선택해주세요.");
			return false;
		}
		let count=0;
		let chkNameArr = new Array(chkAmount);
		let chkQtyArr = new Array(chkAmount);
		let chkTotalArr = new Array(chkAmount);
		let form_content =''
		$(".cart_info_td").each(function(index, element) {

			if ($(element).find(".individual_cart_checkbox").is(":checked") == true) {	//체크여부
				
				
				let chkProductName = $(element).find("#chkProductName").val();
				let chkProductQty = $(element).find("#chkProductQty").val();
				let chkSubTotal = $(element).find("#chkSubTotal").val();
				
				chkNameArr[count] = chkProductName;
				chkQtyArr[count] = chkProductQty;
				chkTotalArr[count] = chkSubTotal;
				
				let productName_input = 
				" <input name='orderDetailList["+ count + "].product_name' type='hidden' value='"+chkProductName+"'> ";
				form_content+= productName_input;
				let productQty_input = 
				" <input name='orderDetailList["+ count + "].order_qty' type='hidden' value='"+chkProductQty+"'> ";
				form_content+= productQty_input;
				let subTotal_input = 
				" <input name='orderDetailList["+ count + "].sub_total' type='hidden' value='"+chkSubTotal+"'> ";
				form_content+= subTotal_input;
				count++;		

			} 

		});
		$("#orderForm").html(form_content);
		$("#orderForm").submit();

	})




	setTotalInfo();

	$(".individual_cart_checkbox").on("change", function() {
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo();
	});
	$(".all_check_input").on("click", function() {

		/* 체크박스 체크/해제 */
		if ($(".all_check_input").prop("checked")) {
			$(".individual_cart_checkbox").prop("checked", true);
		} else {
			$(".individual_cart_checkbox").prop("checked", false);
		}
		setTotalInfo();

	});



})


function getParameter(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function setTotalInfo() {

	let totalPrice = 0;				// 총 가격
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)


	$(".cart_info_td").each(function(index, element) {

		if ($(element).find(".individual_cart_checkbox").is(":checked") == true) {	//체크여부
			totalPrice += parseInt($(element).find("#chkSubTotal").val());
		}

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




/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

	// 총 가격

// 총 마일리지


