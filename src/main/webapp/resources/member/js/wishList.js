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

	$("#seleteDeleteBtn").on("click", function() {
		let eachLength = $(".cart_info_td").length;
		let chkAmount = $("input:checkbox[name=checkedCount]:checked").length;
		console.log(chkAmount);
		if (chkAmount == 0) {
			alert("삭제할 항목을 선택해주세요.");
			return false;
		}
		let count = 0;
		let selectArr = new Array(chkAmount);
		$(".cart_info_td").each(function(index, element) {

			if ($(element).find(".individual_cart_checkbox").is(":checked") == true) {	//체크여부


				let chkProductName = $(element).find("#chkProductName").val();

				selectArr[count] = chkProductName;
				count++;

				console.log(selectArr);

				const form = document.createElement('form');
				form.setAttribute('method', 'post');        //Post 메소드 적용
				form.setAttribute('action', '/member/auth/wishSelectDelete');

				var input1 = document.createElement('input');
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "cartIds");
				input1.setAttribute("value", selectArr);
				form.appendChild(input1);
				console.log(selectArr.length);
				document.body.appendChild(form);
				form.submit();

			}
		});

	})
	
	
	$("#selectOrderBtn").on("click", function() {
		let eachLength = $(".cart_info_td").length;
		let chkAmount = $("input:checkbox[name=checkedCount]:checked").length;
		console.log(chkAmount);
		if (chkAmount == 0) {
			alert("구매할 항목을 선택해주세요.");
			return false;
		}
		let count = 0;
		let chkNameArr = new Array(chkAmount);
		let chkQtyArr = new Array(chkAmount);
		let chkTotalArr = new Array(chkAmount);
		let form_content = ''
		$(".cart_info_td").each(function(index, element) {

			if ($(element).find(".individual_cart_checkbox").is(":checked") == true) {	//체크여부


				let chkProductName = $(element).find("#chkProductName").val();
				let chkProductQty = $(element).find("#chkProductQty").val();
				let chkSubTotal = $(element).find("#chkSubTotal").val();

				chkNameArr[count] = chkProductName;
				chkQtyArr[count] = chkProductQty;
				chkTotalArr[count] = chkSubTotal;

				let productName_input =
					" <input name='orderDetailList[" + count + "].product_name' type='hidden' value='" + chkProductName + "'> ";
				form_content += productName_input;
				let productQty_input =
					" <input name='orderDetailList[" + count + "].order_qty' type='hidden' value='" + chkProductQty + "'> ";
				form_content += productQty_input;
				let subTotal_input =
					" <input name='orderDetailList[" + count + "].sub_total' type='hidden' value='" + chkSubTotal + "'> ";
				form_content += subTotal_input;
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

