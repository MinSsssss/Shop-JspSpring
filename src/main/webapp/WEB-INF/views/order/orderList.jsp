<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
									<c:forEach items="${orderList}" var="orderList" varStatus="status">
										 <div class="orderFor">

											<div class="orderForDisplay">
												<div>
													<h3 class="orderDate">
														<fmt:formatDate pattern="yyyy. MM. dd 주문" value="${orderList.order_date}" />
													</h3>
													<h5><c:out value='${orderList.order_status}'/></h5>
												</div>
												<div>
													<p>
														
														<a class="btn btn-link" href="/order/orderDetailView/${orderList.order_no}">
															주문상세보기</a>
													</p>
													



													<form>
														<input type="hidden" name="thisOrder_no${status.count}" id="order_no" 
														value="<c:out value='${orderList.order_no}'/>">
														 
														<input type="hidden" name="thisStatus${status.count}" id="order_status" 
														value="<c:out value='${orderList.order_status}'/>">
														
														<button type="button" id="orderDeleteBtns" class="btn btn-link"
															onclick="orderDeleteFun(thisStatus${status.count},thisOrder_no${status.count})">주문내역삭제</button>
													</form>
												</div>


											</div>
											
												<c:forEach items="${orderList.orderDetailList}"
													var="orderDetailList" varStatus="nextStatus">
													<div class="orderProductFor">
														<div class="orderInfo">
															<div class="orderDisplay">
																<a href="<c:url value='/product/productRead/${orderDetailList.product_no}'/>">
																	<img class="product_img" src="<c:url value='/display?fileName=${orderDetailList.product_thumb_img}'/>">
																</a>
																<div class="productInfo">
																	<p>
																		<a href="<c:url value='/product/productRead/${orderDetailList.product_no}'/>">
																			<c:out value='${orderDetailList.product_name}'/> 
																		</a>
																	</p>

																	<span class="productPrice"><c:out value='${orderDetailList.product_price}'/>원 x</span> 
																	<span class="orderQty"><c:out value='${orderDetailList.order_qty}'/> = </span> 
																	<span><c:out value='${orderDetailList.sub_total}'/></span>
																</div>
															</div>
														</div>
														<div class="orderBtns">
															<button class="btn btn-outline-warning">교환,반품</button>


															<button type="button" class="btn btn-outline-info" id="reviewWriteFormBtn"
																onclick="reviewWriteFun('${orderList.order_status}',${status.count}${nextStatus.count})">
																리뷰작성
															</button>
																
															<form action="<c:url value='/review/reviewWriteView'/>" method="post" 
																id="reviewWriteForm${status.count}${nextStatus.count}">
																<input type="hidden" name="order_detail_no" value="<c:out value='${orderDetailList.order_detail_no}'/>">
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
<script>
var result = "<c:out value='${msg}'/>";
if(result === 'already'){
	console.log(result);
	alert('이미 리뷰를 작성하셨습니다.');
	location.href="<c:url value='/order/orderList'/>";
}
</script>


<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<script src="/resources/member/js/review.js"></script>


