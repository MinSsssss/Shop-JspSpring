<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>





<div class="ltn__utilize-overlay"></div>

<!-- BREADCRUMB AREA START -->
<div
	class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image"
	data-bg="img/bg/4.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
					<div class="section-title-area">
						<h1 class="section-title white-color">Checkout</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="/">Home</a></li>
							<li>Checkout</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->

<!-- WISHLIST AREA START -->
<div class="ltn__checkout-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="ltn__checkout-inner">

					<div class="ltn__checkout-single-content mt-50">
						<h4 class="title-2">주문/결제</h4>
						<div class="ltn__checkout-single-content-info">

							<h5>구매자정보</h5>
							<div class="row">
								<sec:authorize access="isAuthenticated()">
									<div class="col-md-6">
										<label>이름</label>

										<div class="input-item">
											<input type="text" id="mem_name"  readonly="readonly"
												value="<sec:authentication property='principal.member.mem_name'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>이메일</label>
										<div class="input-item">
											<input type="text" id="mem_email" readonly="readonly"
												value="<sec:authentication property='principal.member.mem_email'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>휴대폰번호</label>
										<div class="input-item">
											<input type="text" id="mem_tel" readonly="readonly"
												value="<sec:authentication property='principal.member.mem_tel'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>주소</label>
										<div class="input-item">
											<input type="text" id="full_address"  readonly="readonly"
												value="<sec:authentication property='principal.member.full_address'/>">
										</div>
									</div>
								</sec:authorize>
							</div>
							<sec:authorize access="isAuthenticated()">
								<h5>받는사람정보</h5>
								<div class="row">
									<div class="col-md-6">
										<label>이름</label>
										<div class="input-item">
											<input type="text" id="receiver_name" name="receiver_name"
											value="<sec:authentication property='principal.member.mem_name'/>">
										</div>
									</div>

									<div class="col-md-6">
										<label>연락처</label>
										<div class="input-item">
											<input type="email" id="receiver_tel" name="receiver_tel"
											value="<sec:authentication property='principal.member.mem_tel'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>배송주소</label>
										<button type="button" data-toggle="modal"
												data-target="#addressModifyModal">주소 변경</button>
										<div class="input-item">
											<input type="text" id="receiver_addr" name="receiver_addr" readonly="readonly"
											value="<sec:authentication property='principal.member.full_address'/>">
											
										</div>
									</div>
								</div>
							</sec:authorize>
							<!--MemberDrop Modal -->
										<div class="modal fade" id="addressModifyModal" tabindex="-1"
											role="dialog" aria-labelledby="addressModifyCenterTitle"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="addressModifyModalTitle">주소 변경</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly">
														<input type="button" class="btn btn-warning btnCheck" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
														<input type="text" name="address" id="address" placeholder="주소" readonly="readonly"><br>
														<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
														<input type="hidden" id="extraAddress" placeholder="참고항목" >
													
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															id="addressModifyBtn" onclick="addressModify()">수정</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>

													</div>
												</div>
											</div>
										</div>
										<!--End MemberDrop Modal -->

								<h6>배송 요청 사항 (선택)</h6>
								<div class="input-item input-item-textarea">
									<textarea id="order_request_msg" name="order_request_msg"
										placeholder="배송 요청 사항을 입력해주세요."></textarea>
								</div>

							
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="ltn__checkout-payment-method mt-50">
					<h4 class="title-2">결제 수단</h4>
					<div id="checkout_accordion_1">
						<!-- card -->
						<div class="card">
							<h5 class="collapsed ltn__card-title" data-toggle="collapse"
								data-target="#faq-item-2-1" aria-expanded="false">Check
								payments</h5>
							<div id="faq-item-2-1" class="collapse"
								data-parent="#checkout_accordion_1">
								<div class="card-body">
									<p>Please send a check to Store Name, Store Street, Store
										Town, Store State / County, Store Postcode.</p>
								</div>
							</div>
						</div>
						<!-- card -->
						<div class="card">
							<h5 class="ltn__card-title" data-toggle="collapse"
								data-target="#faq-item-2-2" aria-expanded="true">Cash on
								delivery</h5>
							<div id="faq-item-2-2" class="collapse show"
								data-parent="#checkout_accordion_1">
								<div class="card-body">
									<p>Pay with cash upon delivery.</p>
								</div>
							</div>
						</div>
						<!-- card -->
						<div class="card">
							<h5 class="collapsed ltn__card-title" data-toggle="collapse"
								data-target="#faq-item-2-3" aria-expanded="false">
								PayPal <img src="img/icons/payment-3.png" alt="#">
							</h5>
							<div id="faq-item-2-3" class="collapse"
								data-parent="#checkout_accordion_1">
								<div class="card-body">
									<p>Pay via PayPal; you can pay with your credit card if you
										don’t have a PayPal account.</p>
								</div>
							</div>
						</div>
					</div>
					
					<button onclick="requestPay()" class="btn theme-btn-1 btn-effect-1 text-uppercase">결제하기</button>
					<!-- <button" class="btn theme-btn-1 btn-effect-1 text-uppercase"
						id="checkoutBtn">결제하기</button> -->
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping-cart-total mt-50">
					<h4 class="title-2">결제 하실 상품 내역</h4>
					<table class="table">
						<tbody>
							
							<c:forEach items="${orderList }" var="order">
								<form action="/order/orderDetail" id="orderDetailForm" method="post">
										
										
								</form>
								<tr>
								
									<td>${order.product_name }<strong>×
											${order.order_qty } </strong></td>
									<td class="sub_total_td">${order.sub_total }<input
										type="hidden" id="sub_total" value="${order.sub_total }">
										<div class="productDetail">
											<input type="hidden" id="product_name" value="${order.product_name }">
											<input type="hidden" id="sub_total" value="${order.sub_total }">
											<input type="hidden" id="order_qty" value="${order.order_qty }">
											<input type="hidden" id="product_no" value="${order.product_no }">
											<input type="hidden" id="mem_id" 
											value="<sec:authentication property='principal.member.mem_id'/>">
											
										</div>
									</td>
								</tr>
								
								
									
									
							</c:forEach>
							<tr>
								<td><strong>배송비</strong></td>
								<td><strong class="deliveryPrice"></strong></td>
							</tr>
							<tr>
								<td><strong>Total</strong></td>
								<td><strong id="total_price" class="finalTotalPrice"></strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- WISHLIST AREA START -->





<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/member/js/address.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	
 	
	let buyer_name = $("#mem_name").val();
 	
 	let buyer_tel = $("#mem_tel").val();
 	let buyer_addr = $("#full_address").val();
 	let product_name = $("#product_name").val(); 
 	
 	let totalPrice = $("#total_price").text().replace(",","")
	// let form = document.getElementById("payment");
	let uid = '';
	let IMP = window.IMP;
	IMP.init('imp18760134');
	
	function requestPay() {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: createOrderNum(),
            name : $("#product_name").val(),
            amount : totalPrice,
            buyer_email : $("#mem_email").val(),
            buyer_name : $("#mem_name").val(),
            buyer_tel : $("#mem_tel").val(),
            //buyer_addr : $("#full_address").val()
            
        }, function(rsp) {
        	if(rsp.success){
        		
        		uid = rsp.imp_uid;
            	alert(rsp.imp_uid)
    			
    			// 결제검증
    			$.ajax({
    	        	type : "POST",
    	        	url : "/order/verify_iamport/" + uid, 
    	        })
    	        .done(function(data) {
    	    		console.log("totalprice :  "+totalPrice);
    	    		console.log("amount : " + data.response.amount)
    	        	
    	        	if(totalPrice == data.response.amount){
    	        		console.log("rsp.paidamount" + rsp.paid_amount);
    	        		data = JSON.stringify({
    		        		"order_no" : rsp.merchant_uid,
    		        		"mem_id" : $("#mem_id").val(),
    		        		"receiver_name" : $("#receiver_name").val(),
    		        		"receiver_tel" : $("#receiver_tel").val(),
    		        		"receiver_addr" : $("#receiver_addr").val(),
    		        		"order_date" : new Date().getTime(),
    		        		"order_request_msg" : $("#order_request_msg").val(),
    		        		"total_price" : rsp.paid_amount,
    		        		"imp_uid" : rsp.imp_uid
    		        	});
    	        		
    	        		jQuery.ajax({
    						url: "/order/complete",
    						type: "POST",
    						dataType: "json",
    						contentType: "application/json",
    						data: data
    					})
    					.done(function(res){
    						console.log("res",res)
    						if(res>0){
    							swal("주문정보 저장 성공");
    							console.log("rsp.merchant_uid : "+rsp.merchant_uid)
    							
    							
    							
    							createOrderDetails(rsp.merchant_uid);
    							
    							createPayInfo(uid);
    							
    						}
    						else{
    							swal("주문정보 저장 실패");
    							
    						}
    					});
    		        	
    		        	} 
    	        		else {
    	        			alert("결제 실패");
    	        		}
    	        });
        	}
        	else{
        		swal("결제에 실패하였습니다.","에러 내용 : " + rsp.error_msg,"error");
        	}
        	
		});
	}
	
	
	function createPayInfo(uid) {
	    // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
	    console.log(uid);
	    $.ajax({
	        type: 'get',
	        url: '/order/pay_info',
	        data: {
	            'imp_uid': uid,
	        },
	        success: function(pay_no) {
	            console.log("pay_no" + pay_no);
	        	
	        	location.replace('/order/orderList');
	           /*  swal('결제 성공 !',"결제완료 페이지로 이동합니다.","success").then(function(){
	                
	                결제완료 페이지로 이동
	                
	                

	            }) */
	        },
	        error: function() {
	            swal('결제정보 저장 통신 실패');
	        }
	    });
	}
	

    function createOrderDetails(order_no){
    	let chkAmount = $(".sub_total_td").length
    	let count = 0;
		let orderDetailArr = [];
		
		let chkNameArr = new Array(chkAmount);
		let chkQtyArr = new Array(chkAmount);
		let chkTotalArr = new Array(chkAmount);
		let form_content = ''
		
		console.log("order_no : " + order_no);
		$(".productDetail").each(function(index, element) {
			
			let chkProductName = $(element).find("#product_name").val();
			let chkProductQty = $(element).find("#order_qty").val();
			let chkSubTotal = $(element).find("#sub_total").val();

			chkNameArr[count] = chkProductName;
			chkQtyArr[count] = chkProductQty;
			chkTotalArr[count] = chkSubTotal;
			
			
			
			let params = {
				"order_no" : order_no,
				"product_name" : chkProductName,
				"order_qty" : chkProductQty,
				"sub_total" : chkSubTotal
			}

			orderDetailArr.push(params);
			count++;

		})
		let paramList = {
			"paramList": JSON.stringify(orderDetailArr)
		}
		$.ajax({

			type: "POST",
			url: "/order/orderDetails",
			data: paramList

		})
    }
    function createOrderNum(){
    	const date = new Date();
    	const year = date.getFullYear();
    	const month = String(date.getMonth() + 1).padStart(2, "0");
    	const day = String(date.getDate()).padStart(2, "0");
    	
    	let orderNum = year + month + day;
    	for(let i=0;i<10;i++) {
    		orderNum += Math.floor(Math.random() * 8);	
    	}
    	return orderNum;
    }
    
	
</script>
