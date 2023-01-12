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


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	let data = {
			totalPrice : $('#total_price').text(),
			buyer_name : $("#mem_name").val(),
			buyer_email : $("#mem_email").val(),
			buyer_tel : $("#mem_tel").val(),
			delevery_addr : $("#receiver_addr").val(),
			product_name : $("#product_name").val(),
	}
 	let totalPrice = $('#total_price').text();
	let buyer_name = $("#mem_name").val();
 	let buyer_email = $("#mem_email").val();
 	let buyer_tel = $("#mem_tel").val();
 	let buyer_addr = $("#full_address").val();
 	let product_name = $("#product_name").val(); 
	// let form = document.getElementById("payment");

	let IMP = window.IMP;
	IMP.init('imp18760134');
	
	function requestPay() {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name : data.product_name,
            amount : data.totalPrice,
            buyer_email : data.buyer_email,
            buyer_name : data.buyer_name,
            buyer_tel : data.buyer_tel,
            buyer_addr : data.delevery_addr
            
        }, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	console.log("data.response.amount : " + data.response.amount);
	        	console.log("rsp.paid_amount : " + rsp.paid_amount);
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
	        		

		        	alert("결제 및 결제검증완료");
		        	
		        	
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}
	
	
	
	/* function requestPay() {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name : data.product_name,
            amount : data.totalPrice,
            buyer_email : data.buyer_email,
            buyer_name : data.buyer_name,
            buyer_tel : data.buyer_tel,
            buyer_addr : data.delevery_addr
            
        }, function(rsp) {
			console.log(rsp);
			 if (rsp.success) {
			      // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			      // jQuery로 HTTP 요청
			 	data.impUid = rsp.imp_uid;
	        	data.merchant_uid = rsp.merchant_uid;
	        	paymentComplete(data); 
			      
			    } else {
			      alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			    }
		});
    } */
	
	
	
	
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
	
	function paymentComplete(data){
		alert(data)
		$.ajax({
			url: "/order/payment/complete",
			method: "POST",
			data: data
			
		})
		.done(function(result){
			messageSend();
			swal({
				text: result,
				closeOnClickOutside : false
			})
			.then(function(){
				location.replace("/order/orderList");
			})
		})
		.fail(function(){
			alert("에러!");
			location.replace("/")
		})
		
		
		
		
		
	} 
</script>
