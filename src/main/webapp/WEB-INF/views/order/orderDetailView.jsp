<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h1 class="section-title white-color">마이페이지</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="/">Home</a></li>
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
								<jsp:include page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="tab-content">
									<div class="orderProductInfo">

										<div class="orderForDisplay">
											<div>
												<h3 class="orderDate">
													<fmt:formatDate pattern="yyyy. MM. dd 주문"
														value="${orderList.order_date}" />
												</h3>
												
												<h5>${orderList.order_status }</h5>
											</div>
										</div>

										<c:forEach items="${orderList.orderDetailList}"
											var="orderDetailList">
											<div class="orderProductFor">
												<div class="orderInfo">
													<div class="orderDisplay">
														<a
															href='/product/productRead?product_no=${orderDetailList.product_no}'>
															<img class="product_img"
															src="/resources/member/img/${orderDetailList.product_image1 }"
															alt="">
														</a>
														<div class="productInfo">
															<p>
																<a
																	href='/product/productRead?product_no=${orderDetailList.product_no}'>
																	${orderDetailList.product_name } 
																</a>
															</p>
															<span class="productPrice">${orderDetailList.product_price }원
																x</span> <span class="orderQty">${orderDetailList.order_qty }
																= </span> <span>${orderDetailList.sub_total}</span>
														</div>
													</div>
												</div>
												<div class="orderBtns">
													<button class="btn btn-outline-warning">교환,반품</button>
													<button class="btn btn-outline-info">리뷰작성</button>

												</div>
											</div>
										</c:forEach>

									</div>
									<div class="receiverInfo">
										<h5>받는 사람 정보</h5>
										<table>
											<tr>
												<td class="tableInfoFtd">받는사람</td>
												<td>${orderList.receiver_name }</td>
											</tr>
											<tr>
												<td>연락처</td>
												<td>${orderList.receiver_tel }</td>
											</tr>
											<tr>
												<td>받는 주소</td>
												<td>${orderList.receiver_addr1 }</td>
											</tr>
											<tr>
												<td>배송요청사항</td>
												<td>${orderList.order_request_msg}</td>
											</tr>
										</table>

									</div>
									<div class="receiverInfo">
										<h5>결제정보</h5>

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

