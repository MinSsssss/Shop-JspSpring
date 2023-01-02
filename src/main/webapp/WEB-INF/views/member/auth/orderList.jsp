<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h1 class="section-title white-color">마이페이지</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>My Account</li>
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
								<jsp:include page="./myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="tab-content">
									<c:forEach items="${orderList}" var="orderList" varStatus="status">
										<div class="orderFor">
											
											<div class="orderForDisplay">
												<div>
													<h3 class="orderDate">
														<fmt:formatDate pattern="yyyy. MM. dd 주문"
															value="${orderList.order_date}" />
													</h3>
													<h5>${orderList.order_status }</h5>
												</div>
												<div>
													<p>
														<a class="btn btn-link"
															href="/member/auth/orderDetailView?order_no=${orderList.order_no }">주문상세보기</a>
													</p>
													
														

													<form>
														<input type="hidden" name ="thisOrder_no${status.index}" id="order_no" value="${orderList.order_no}">
														<input type="hidden" name="thisStatus${status.index}" id="order_status" value="${orderList.order_status }">
														<button type="button" id="orderDeleteBtns" onclick="orderDeleteFun(thisStatus${status.index},thisOrder_no${status.index})">주문내역삭제</button>
													</form>
												</div>


											</div>
											<c:forEach items="${orderList.orderDetailList}"
												var="orderDetailList" varStatus="nextStatus">
												<div class="orderProductFor">
													<div class="orderInfo">
														<div class="orderDisplay">
															<a
																href='/member/productRead?product_no=${orderDetailList.product_no}'>
																<img class="product_img"
																src="/resources/member/img/${orderDetailList.product_image1 }"
																alt="">
															</a>
															<div class="productInfo">

																 <p>
																	<a href='/member/productRead?product_no=${orderDetailList.product_no}'> 
																	${orderDetailList.product_name } </a>
																</p> 

																<span class="productPrice">${orderDetailList.product_price }원
																	x</span> <span class="orderQty">${orderDetailList.order_qty }
																	= </span> <span>${orderDetailList.sub_total }</span>
															</div>
														</div>
													</div>
													<div class="orderBtns">
														<button class="btn btn-outline-warning">교환,반품</button>
														
														<form 
															id="reviewWriteForm" >
															<input type="hidden" name ="thisOrder_detail_no${nextStatus.index}" id="order_detail_no" value="${orderDetailList.order_detail_no}">
															<input type="hidden" name="thisStatus${status.index}" id="order_status" value="${orderList.order_status }">
															<button type="button" class="btn btn-outline-info" id="reviewWriteForm" 
															onclick="reviewWriteFun(thisOrder_detail_no${nextStatus.index},thisStatus${status.index})">리뷰작성</button>
														</form>
													</div>
												</div>
											</c:forEach>
										</div>
									</c:forEach>

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





<jsp:include page="../includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<!-- <script src="/resources/member/js/review.js"></script> -->

