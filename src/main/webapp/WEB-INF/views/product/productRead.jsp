<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
						<h1 class="section-title white-color">Product Details</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="/">Home</a></li>
							<li>Product Details</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->

<!-- SHOP DETAILS AREA START -->
<div class="ltn__shop-details-area pb-85">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="ltn__shop-details-inner mb-60">
					<div class="row">
						<div class="col-md-6">
							<div class="ltn__shop-details-img-gallery">
								<div class="ltn__shop-details-large-img">
								
									
									
									
									<div class="single-large-img">
										<a href="/display?fileName=${product.product_thumb_img}" data-rel="lightcase:myCollection">
											<img src="/display?fileName=${product.product_thumb_img}"
											alt="Image">
										</a>
									</div>
									<c:forEach items="${product.product_imgs}" var="images">
										<div class="single-large-img">
											<a href="/display?fileName=${images}" data-rel="lightcase:myCollection">
												<img src="/display?fileName=${images}" alt="Image">
											</a>
										</div>
									</c:forEach>
									
									
								</div>
								<div class="ltn__shop-details-small-img slick-arrow-2">
									<div class="single-small-img">
										<img src="/display?fileName=${product.product_thumb_img}" alt="Image">
									</div>
									<c:forEach items="${product.product_imgs}" var="images">
										<div class="single-small-img">
											<img src="/display?fileName=${images}" alt="Image">
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="modal-product-info shop-details-info pl-0">
								<div class="product-ratting">
									<ul>
										<li><a href="#"><i class="fas fa-star"></i></a></li>
										<li><a href="#"><i class="fas fa-star"></i></a></li>
										<li><a href="#"><i class="fas fa-star"></i></a></li>
										<li><a href="#"><i class="fas fa-star-half-alt"></i></a></li>
										<li><a href="#"><i class="far fa-star"></i></a></li>
										<li class="review-total"><a href="#"> ( 95 Reviews )</a></li>
									</ul>
								</div>

								<h3 id="product_name">${product.product_name }</h3>
								<div class="product-price">
									<span id="product_price">${product.product_price }</span>

								</div>
								<p>${product.product_detail }</p>

								<div class="ltn__product-details-menu-2">
									<ul>
										<li>
											<div class="cart-plus-minus">
												<input type="text" id="cart_qty" value="1" name="cart_qty"
													class="cart-plus-minus-box">
											</div>
										</li>
										<li>
											<button id="addCartBtn" class="theme-btn-1 btn btn-effect-1">
												 <span>장바구니 담기</span>
											</button>
											
											<button id="buyNowBtn" class="theme-btn-1 btn btn-effect-1">
												 	<span>바로구매 하기</span>
											</button>
											<form action="/cart/cartSelectOrder" id="orderForm" method="post">
												
												
											</form>
											
										</li>
									</ul>
								</div>
								<div class="ltn__product-details-menu-3">
									<ul>
										<li><a href="#" class="" id="wishListBtn" title="Wishlist">
											 <!-- data-toggle="modal" data-target="#liton_wishlist_modal" -->
												<i class="far fa-heart"></i> <span>찜 하기</span>
												<sec:authorize access="isAuthenticated()">
												<input type="hidden" id="chk_mem_id" 
												value="<sec:authentication property='principal.member.mem_id'/>">
												</sec:authorize>
										</a></li>

									</ul>
								</div>
								<hr>


							</div>
						</div>
					</div>
				</div>
				<!-- Shop Tab Start -->
				<div
					class="ltn__shop-details-tab-inner ltn__shop-details-tab-inner-2">
					<div class="ltn__shop-details-tab-menu">
						<div class="nav">
							<a class="active show" data-toggle="tab"
								href="#liton_tab_details_1_1">Description</a> <a
								data-toggle="tab" href="#liton_tab_details_1_2" class="">Reviews</a>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="liton_tab_details_1_1">
							<div class="ltn__shop-details-tab-content-inner">
								<h4 class="title-2">Lorem ipsum dolor sit amet elit.</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									riatur. Excepteur sint occaecat
									cupidatat non proident.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									quia consequuntur magni
									dolores eos qui ratione voluptatem sequi nesciunt. Neque porro
									quisquam est, qui dolorem ipsum quia dolor sit amet,
									consectetur, adipisci velit, sed quia non numquam eius modi
									tempora incidunt ut labore et dolore magnam aliquam quaerat
									voluptatem.</p>
							</div>
						</div>
						<div class="tab-pane fade" id="liton_tab_details_1_2">
							<div class="ltn__shop-details-tab-content-inner">
								<h4 class="title-2">Customer Reviews</h4>
								<div class="product-ratting">
									<ul>
										<li><a href="#"><i class="far fa-star">avg/10</i></a></li>
										<li class="review-total"><a href="#"> ( 95 Reviews )</a></li>
									</ul>
								</div>
								<hr>
								<!-- comment-area -->
								<div class="ltn__comment-area mb-30">
									<div class="ltn__comment-inner">
										<ul>
											<c:forEach items="${reviewList }" var="review">
												<li>
													<div class="ltn__comment-item clearfix">
														
														<div class="ltn__commenter-comment">
															<div>
																<h6>
																	<a href="#">${review.review_title }</a>
																	<small>작성자 : 1234</small>
																</h6>
																
															
															</div>
															<a href="#"><i class="far fa-star">${review.review_star }</i></a>
															<p>${review.review_content }</p>
															
															<span class="ltn__comment-reply-btn"><fmt:formatDate pattern="yyyy.MM.dd" value="${review.review_date}" /></span>
														</div>
													</div>
												</li>
											</c:forEach>
											
										</ul>
									</div>
								</div>

								
								
							</div>
						</div>
					</div>
				</div>
				<!-- Shop Tab End -->
			</div>
		</div>
	</div>
</div>
<!-- SHOP DETAILS AREA END -->



<div class="ltn__modal-area ltn__add-to-cart-modal-area">
	<div class="modal fade" id="add_to_cart_modal" tabindex="-1">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="ltn__quick-view-modal-inner">
						<div class="modal-product-item">
							<div class="row">
								<div class="col-12">
									<div class="modal-product-img">
										<img src="/resources/member/img/product/1.png" alt="#">
									</div>
									<div class="modal-product-info">
										<h5>장바구니</h5>
										<p class="added-cart">
											<i class="fa fa-check-circle"></i> 상품이 장바구니에 담겼습니다.
										</p>
										<div class="btn-wrapper">
											<a href="/cart/cartView"
												class="theme-btn-1 btn btn-effect-1">장바구니</a> <a
												href="checkout.html" class="theme-btn-2 btn btn-effect-2">구매하기</a>
										</div>
									</div>
									<!-- additional-info -->
									<div class="additional-info d-none">
										<p>
											We want to give you <b>10% discount</b> for your first order,
											<br> Use discount code at checkout
										</p>
										<div class="payment-method">
											<img src="/resources/member/img/icons/payment.png" alt="#">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>







<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<script src="/resources/member/js/cart.js"></script>
<script src="/resources/member/js/wishList.js"></script>
