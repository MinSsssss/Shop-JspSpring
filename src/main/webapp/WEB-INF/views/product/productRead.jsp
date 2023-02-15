<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>

<div class="ltn__utilize-overlay"></div>

<!-- BREADCRUMB AREA START -->
<div class="ltn__breadcrumb-area">
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

									<c:forEach items="${product.origin_imgs}" var="images">
										<div class="single-large-img">
											<img src="<c:url value='/display?fileName=${images}'/>" alt="Image">
										</div>
									</c:forEach>
									
									
								</div>
								<div class="ltn__shop-details-small-img slick-arrow-2">
									
									<c:forEach items="${product.product_imgs}" var="images">
										<div class="single-small-img">
											<img src="<c:url value='/display?fileName=${images}'/>" alt="Image">
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="modal-product-info shop-details-info pl-0">
								<div class="product-ratting">
								
								<c:set var="avg" value="${product.reviewAvg}"/>
								
									<fmt:parseNumber var="avg2" integerOnly="true" value="${avg}"/>
									
									<ul>
										<c:forEach var="star" begin="0" end="4" varStatus="status">		
											<c:choose>
												<c:when test="${avg2 ge status.count}">
													<li><a><i class="fas fa-star"></i></a></li>
												</c:when>
												
												<c:when test="${avg-status.index lt 1 && avg-status.index gt 0}">
													<li><a href="#"><i class="fas fa-star-half-alt"></i></a></li>
												</c:when>
												
												<c:otherwise>
													<li><a><i class="far fa-star"></i></a></li>
												</c:otherwise>
											</c:choose>
											
										</c:forEach>
										<li class="review-total">
											<a>
											 <c:if test="${empty product.reviewCount}">( 0 )</c:if>
											 <c:if test="${not empty product.reviewCount }">( ${product.reviewCount} )</c:if>
											 </a>
										 </li>
										 
									</ul>
									<ul class="hit">
										<li><span>조회수 : <c:out value='${product.product_hit }'/></span></li>
									</ul>
									
								</div>

								<h3 id="product_name"><c:out value='${product.product_name}'/></h3>
								<div class="product-price">
									<span id="product_price">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.product_price}"/>
										
									</span>원

								</div>
								<p><c:out value='${product.product_detail}'/></p>

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
											<form action="<c:url value='/cart/cartSelectOrder'/>" id="orderForm" method="post">
												
												
											</form>
											<sec:authorize access="isAuthenticated()">
												<input type="hidden" id="chk_mem_id"  value="<sec:authentication property='principal.member.mem_id'/>">
											</sec:authorize>
										</li>
									</ul>
								</div>
								<div class="ltn__product-details-menu-3">
									<ul>
										<li><a href="#" class="" id="wishListBtn" title="Wishlist">
											 <!-- data-toggle="modal" data-target="#liton_wishlist_modal" -->
												<i id="wishHeart" class="far fa-heart" style="color:red;"></i> <span>찜 하기</span>
												<input type="hidden" id="product_no" value="<c:out value='${product.product_no}'/>">
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
							<a class="active show" data-toggle="tab" href="#liton_tab_details_1_1">상세설명</a> 
							<a data-toggle="tab" href="#liton_tab_details_1_2" class="">리뷰</a>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="liton_tab_details_1_1">
							<div class="ltn__shop-details-tab-content-inner">
							
								<pre><c:out value='${product.product_content}'/></pre>
							</div>
						</div>
						<div class="tab-pane fade" id="liton_tab_details_1_2">
							<div class="ltn__shop-details-tab-content-inner">
								
								<!-- comment-area -->
								<div class="ltn__comment-area mb-30">
									<div class="ltn__comment-inner">
										<ul>
											<c:if test="${empty product.reviewList }">
												<h4>작성된 리뷰가 없습니다.</h4>
											</c:if>
											<c:forEach items="${product.reviewList}" var="review">
												<li>
													<div class="ltn__comment-item clearfix">
														
														<div class="ltn__commenter-comment">
															<div>
																<h6>
																	<a href="#"><c:out value='${review.review_title}'/></a>
																	<small>작성자 : <c:out value='${review.mem_id}'/></small>
																</h6>
															
															</div>
															
															<div class="product-ratting">
																<ul>
																	<c:forEach var="star" begin="1" end="${review.review_star}">
																		<li><a><i class="fas fa-star" style=""></i></a></li>
																	</c:forEach>
																	<c:forEach var="star" begin="1" end="${5-review.review_star}">
																		<li><a><i class="far fa-star"></i></a></li>
																	</c:forEach>
																	
																</ul>
															</div>
															
															<p><c:out value='${review.review_content}'/></p>
															
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
										<img src="<c:url value='/display?fileName=${product.product_thumb_img}'/>" alt="Image">
									</div>
									<div class="modal-product-info">
										<h5>장바구니</h5>
										<p class="added-cart">
											<i class="fa fa-check-circle"></i> 상품이 장바구니에 담겼습니다.
										</p>
										<div class="btn-wrapper">
											<a href="<c:url value='/cart/cartView'/>"
												class="theme-btn-1 btn btn-effect-1">장바구니</a> 
											<!-- <a href="#" id="buyNowBtn" class="theme-btn-2 btn btn-effect-2">구매하기</a> -->
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


<!-- MODAL AREA END -->






<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<script src="/resources/member/js/cart.js"></script>
<script src="/resources/member/js/wishList.js"></script>
