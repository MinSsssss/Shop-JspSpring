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
								<jsp:include page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="tab-content">
									<c:forEach items="${reviewList }"
									var="review" varStatus="status">

										<div class="reviewWrap">
											<h4>		
												<fmt:formatDate pattern="yyyy. MM. dd " value="${review.review_date}" />작성
											</h4>
											<div class="reviewWrapTop">
												<div class="productInfo">
													<div><img  class="product_image" alt="" src="/resources/member/img/${review.product_image1 }"></div>
													
													<div class="productName">${review.product_name }
														
													</div>
													
												</div>
												<div class="reviewModifyBtns">
													<form action="/review/reviewModifyView" method="post" id="reviewModifyViewForm${status.count}">
														<input type="hidden" name="review_no" value="${review.review_no}">
														<button class="btn btn-link" onclick="reviewModifyViewFun(${status.count})">수정</button><br>
													</form>
													<button class="btn btn-link" onclick="reviewDeleteFun(${status.count})">삭제</button>
													<input type="hidden" value="${review.review_no}" id="review_no${status.count}">
													<%-- <form action="/member/auth/reviewDelete" method="post" id="reviewDeleteForm${status.count}">
														
														
													</form> --%>
													
												</div>
											</div>
											<div>
												<div>
													<div class="mb-3 myform"  id="reviewStars">
														<fieldset>
															<input type="hidden" id="review_star" name="review_star" value="${review.review_star}">
															<span class="text-bold"></span>
															<input type="radio" name="reviewStar${status.index}" value="5" id="rate5${status.index}"><label
																for="rate5">★</label>
															<input type="radio" name="reviewStar${status.index}" value="4" id="rate4${status.index}"><label
																for="rate4">★</label>
															<input type="radio" name="reviewStar${status.index}" value="3" id="rate3${status.index}"><label
																for="rate3">★</label>
															<input type="radio" name="reviewStar${status.index}" value="2" id="rate2${status.index}"><label
																for="rate2">★</label>
															<input type="radio" name="reviewStar${status.index}" value="1" id="rate1${status.index}"><label
																for="rate1">★</label>
														</fieldset>
													</div>
													
												</div>
												<div>
													${review.review_title }
												</div>
												<div>
													${review.review_content }
												</div>
											</div>
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

var result = '${msg}';
if(result === 'success'){
	
	alert('수정이 완료되었습니다.');
}else if(result === 'success'){
	alert('수정에 실패하였습니다.');
}
</script>




<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/order.js"></script>
<script src="/resources/member/js/review.js"></script>
<!-- <script src="/resources/member/js/review.js"></script> -->

