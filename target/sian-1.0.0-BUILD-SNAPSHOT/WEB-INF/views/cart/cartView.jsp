<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>





<div class="ltn__utilize-overlay"></div>

<!-- BREADCRUMB AREA START -->
<div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
					<div class="section-title-area">
						
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
									<form action="<c:url value='/cart/cartSelectOrder'/>" id="orderForm" method="post">
											
									</form>
									<tr>

										<td class="cart_info_td">
										
											<input type="checkbox" name="checkedCount" class="individual_cart_checkbox" checked="checked"  >
											
											<input type="hidden" id="chkProductName" value="<c:out value='${cart.product_name}'/>">
											<input type="hidden" id="chkProductQty" value="<c:out value='${cart.cart_qty}'/>">
											<input type="hidden" id="chkSubTotal" value="<c:out value='${cart.sub_total }'/>">
										</td>
										

										<td class="cart-product-image">
											<a href="<u:url value='/product/productRead?product_no=${cart.product_no}'/>">
											<img src="<c:url value='/display?fileName=${cart.product_thumb_img}'/>"></a>
										</td>
										
										<td class="cart-product-info">
											<a href="<c:url value='/product/productRead?product_no=${cart.product_no}'/>">
												<c:out value='${cart.product_name}'/>
											</a>
										</td>
										
										<td class="cart-product-price">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.product_price}"/>
										</td>
										<td class="cart-product-quantity">
										
											<form action="<c:url value='/cart/cartModify'/>" id="cartModifyForm" method="post">
												<div class="cart-plus-minus">
													<input type="text" value="<c:out value='${cart.cart_qty}'/>" name="cart_qty" class="cart-plus-minus-box">

												</div>

												<input type="hidden" name="product_name" value="<c:out value='${cart.product_name}'/>">
												<input type="hidden" name="product_price" value="<c:out value='${cart.product_price}'/>">
												
												<button id="cartModifyBtn" class="cartModifyBtn">수정</button>
											</form>

										</td>
										<td class="cart-product-subtotal" id="subTotal">
											<fmt:formatNumber type="number" maxFractionDigits="3" value='${cart.sub_total}'/>
										</td>
										<td class="cart-product-remove">
											<form>
												<input type="hidden" name="thisProduct_no${status.index}" id="product_no" 
												value="<c:out value='${cart.product_no}'/>">
												<button type="button" id="cartDeleteBtn" onclick="cartDelete(thisProduct_no${status.index})">삭제</button>
											</form>
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
									<td>상품가격</td>
									<td class="totalPrice"></td>
								</tr>
								<tr>
									<td>배송비</td>
									<td class="deliveryPrice"></td>
								</tr>

								<tr>
									<td><strong>주문 총 금액</strong></td>
									<td class="finalTotalPrice"></td>
								</tr>
							</tbody>
						</table>
						<div class="btn-wrapper text-right">
							<button class="theme-btn-1 btn btn-effect-1"
							id="selectOrderBtn">구매하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/cart.js"></script>