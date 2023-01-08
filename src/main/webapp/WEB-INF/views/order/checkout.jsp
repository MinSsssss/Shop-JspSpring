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
											<input type="text" name="ltn__name" readonly="readonly"
												value="<sec:authentication property='principal.member.mem_name'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>이메일</label>
										<div class="input-item">
											<input type="text" name="ltn__name" readonly="readonly"
												value="<sec:authentication property='principal.member.mem_email'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>휴대폰번호</label>
										<div class="input-item">
											<input type="text" name="ltn__name" readonly="readonly"
												value="<sec:authentication property='principal.member.mem_tel'/>">
										</div>
									</div>
									<div class="col-md-6">
										<label>주소</label>
										<div class="input-item">
											<input type="text" name="ltn__name" readonly="readonly"
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
											<input type="text" id="receiver_addr1" name="receiver_addr1" readonly="readonly"
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

							<!-- </form> -->
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
					
					<button class="btn theme-btn-1 btn-effect-1 text-uppercase"
						id="checkoutBtn">결제하기</button>
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
								<td><strong class="finalTotalPrice"></strong></td>
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
