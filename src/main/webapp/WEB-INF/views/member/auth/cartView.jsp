<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="../includes/memberHeader.jsp"></jsp:include>





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
						<h1 class="section-title white-color">Cart</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->

<!-- SHOPING CART AREA START -->
<div class="liton__shoping-cart-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping-cart-inner">
					<div class="shoping-cart-table table-responsive">
						<table class="table">

							<tbody>
								<c:forEach items="${cartList }" var="cart">
									
										<tr>
											<td class="cart-product-remove">x</td>
											<td class="cart-product-image"><a
												href="product-details.html"><img
													src="/resources/member/img/product/1.png" alt="#"></a></td>
											<td class="cart-product-info">
												<h4>
													<a href="product-details.html">${cart.product_name }</a>
												</h4>
											</td>
											<td class="cart-product-price" >${cart.product_price }</td>
											<td class="cart-product-quantity">
												<form action="/member/auth/cartModify" id="cartModifyForm" method="post">
												<div class="cart-plus-minus">
													<input type="text"  value="${cart.cart_qty }"
														 name="cart_qty" class="cart-plus-minus-box">
														
												</div>
												
													<input type="hidden" name="product_name" id="product_name" value="${cart.product_name }">
													<input type="hidden" name="product_price" id="product_price" value="${cart.product_price }">
													
													<%-- <input type="hidden" name="sub_total" id="sub_total" value="${cart.sub_total }"> --%>
													<button id="cartModifyBtn" class="cartModifyBtn">수정</button>	
												</form>
												
											</td>
											<td class="cart-product-subtotal" id="subTotal">${cart.sub_total }</td>
											<td>
												
												
											</td>
										</tr>
									
									
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="shoping-cart-total mt-50">
						<h4>Cart Totals</h4>
						<table class="table">
							<tbody>
								<tr>
									<td>Cart Subtotal</td>
									<td>$618.00</td>
								</tr>
								<tr>
									<td>Shipping and Handing</td>
									<td>$15.00</td>
								</tr>
								<tr>
									<td>Vat</td>
									<td>$00.00</td>
								</tr>
								<tr>
									<td><strong>Order Total</strong></td>
									<td><strong>$633.00</strong></td>
								</tr>
							</tbody>
						</table>
						<div class="btn-wrapper text-right">
							<a href="checkout.html" class="theme-btn-1 btn btn-effect-1">Proceed
								to checkout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->

<!-- FEATURE AREA START ( Feature - 3) -->
<div
	class="ltn__feature-area before-bg-bottom before-bg-bottom-2 plr--5">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__feature-item-box-wrap ltn__border-between-column white-bg">
					<div class="row">
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/4-track.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Free home delivery</h4>
									<p>Provide free home delivery for all product over $100</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/5-madel.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Quality Products</h4>
									<p>We ensure the product quality that is our main goal</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/6-return.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>3 Days Return</h4>
									<p>Return product within 3 days for any product you buy</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/7-support.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Online Support</h4>
									<p>We ensure the product quality that you can trust easily</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- FEATURE AREA END -->






<jsp:include page="../includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/myPage.js"></script>
<script src="/resources/member/js/cart.js"></script>