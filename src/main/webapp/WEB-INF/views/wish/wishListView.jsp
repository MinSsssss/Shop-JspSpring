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
						<h1 class="section-title white-color">Cart</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>WishList</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->


<!-- WISHLIST AREA START -->
<div class="liton__wishlist-area pb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- PRODUCT TAB AREA START -->
				<div class="ltn__product-tab-area">
					<div class="container">
						<div class="row">
							<div class="col-lg-4">

								<!-- myPageListInclude.jsp -->
								<jsp:include page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="shoping-cart-inner">
									<div class="shoping-cart-table table-responsive">
										<button id="seleteDeleteBtn">선택삭제</button>

										<table class="allTable">
											<thead>

												<tr>
													<th><input type="checkbox" class="all_check_input"
														checked="checked"><span class="all_chcek_span"></span></th>
													<th>이미지</th>
													<th>이름</th>
													<th>버튼</th>


												</tr>
											</thead>

											<tbody>

												<c:forEach items="${wishList}" var="wish" varStatus="status">
													<form action="/member/auth/cartSelectOrder" id="orderForm"
														method="post"></form>
													<tr>

														<td class="cart_info_td"><input type="checkbox"
															name="checkedCount" class="individual_cart_checkbox"
															checked="checked"> <input type="hidden"
															id="chkProductName" value="${wish.product_name }">
														</td>


														<td class="cart-product-image">
															<a href="/product/productRead?product_no=${wish.product_no}">
																<img src="/display?fileName=${wish.product_s_thumb_img}" alt="#">
															</a>
														</td>
														<td class="cart-product-info">
															<a href="/product/productRead?product_no=${wish.product_no}">${wish.product_name }</a>
														</td>



														<td class="cart-product-remove">
															<form>
																<input type="hidden"
																	name="thisProduct_no${status.index}" id="product_no"
																	value="${wish.product_no }">
																<button type="button" id="cartDeleteBtn"
																	onclick="wishDelete(thisProduct_no${status.index})">삭제</button>
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
				<!-- PRODUCT TAB AREA END -->
			</div>
		</div>
	</div>
</div>
<!-- WISHLIST AREA START -->











<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/wishList.js"></script>