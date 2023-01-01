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
						<button id="seleteDeleteBtn">선택삭제</button>

						<table class="allTable">
							<thead>

								<tr>
									<th><input type="checkbox" class="all_check_input" checked="checked"><span class="all_chcek_span"></span></th>
									<th></th>
									<th>이름</th>
									<th>가격</th>
									<th>수량</th>
									<th>총금액</th>
									<th></th>
								</tr>
							</thead>
							
							<tbody>
							
								<c:forEach items="${cartList }" var="cart" varStatus="status">
									<form action="/member/auth/cartSelectOrder" id="orderForm" method="post">
											
									</form>
									<tr>

										<td class="cart_info_td">
											<input type="checkbox" name="checkedCount" class="individual_cart_checkbox" checked="checked"  >
											<input type="hidden" id="chkProductName" value="${cart.product_name }">
											<input type="hidden" id="chkProductQty" value="${cart.cart_qty }">
											<input type="hidden" id="chkSubTotal" value="${cart.sub_total }">
										</td>
										

										<td class="cart-product-image"><a
											href="product-details.html"><img
												src="/resources/member/img/${cart.product_image1 }" alt="#"></a></td>
										<td class="cart-product-info"><a
											href="product-details.html">${cart.product_name }</a></td>
										<td class="cart-product-price">${cart.product_price }</td>
										<td class="cart-product-quantity">
											<form action="/member/auth/cartModify" id="cartModifyForm"
												method="post">
												<div class="cart-plus-minus">
													<input type="text" value="${cart.cart_qty }"
														name="cart_qty" class="cart-plus-minus-box">

												</div>

												<input type="hidden" name="product_name"
													value="${cart.product_name }"> <input type="hidden"
													name="product_price" value="${cart.product_price }">

												<button id="cartModifyBtn" class="cartModifyBtn">수정</button>
											</form>

										</td>
										<td class="cart-product-subtotal" id="subTotal">${cart.sub_total }</td>
										<td class="cart-product-remove">
											<form>
												<input type="hidden" name="thisProduct_no${status.index}" id="product_no" value="${cart.product_no }">
													<button type="button" id="cartDeleteBtn" onclick="cartDelete(thisProduct_no${status.index})">삭제</button>
											</form>
										</td>
									</tr>


								</c:forEach>

							</tbody>
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="../includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/cart.js"></script>