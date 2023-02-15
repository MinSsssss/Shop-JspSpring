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
									<form class="mb-3" action="/review/reviewModifyProc" id="reviewForm" method="post">
										<input type="hidden" name="review_no" value="<c:out value='${review.review_no}'/>">
										<div class="reviewWrap">
											<div class="reviewHeader">
												<h3>리뷰 수정</h3>
												<p>수정하실 내용을 입력해주세요.</p>
											</div>
											<div class="reviewInfo">
												<div class="reviewImg">
													<img src="<c:url value='/display?fileName=${review.product_thumb_img}'/>">
												</div>
												<div>
													<p class="product_name"><c:out value='${review.product_name}'/></p>
													<div>

														<fieldset>
															<input type="hidden" id="review_star" value="<c:out value='${review.review_star}'/>">
															<span class="text-bold"></span>
															<input type="radio" name="review_star" value="5" id="rate5"><label
																for="rate5">★</label>
															<input type="radio" name="review_star" value="4" id="rate4"><label
																for="rate4">★</label>
															<input type="radio" name="review_star" value="3" id="rate3"><label
																for="rate3">★</label>
															<input type="radio" name="review_star" value="2" id="rate2"><label
																for="rate2">★</label>
															<input type="radio" name="review_star" value="1" id="rate1"><label
																for="rate1">★</label>
														</fieldset>
													</div>
												</div>
											</div>
											<div>
												<p>리뷰제목 *</p>
												<input type="text" id="review_title" name="review_title" value="<c:out value='${review.review_title}'/>">
												<textarea class="col-auto form-control" id="review_content" 
												name="review_content" ><c:out value='${review.review_content}'/></textarea>
											</div>

											<div>
												<input class="fileUpload" type="file">
											</div>
											<div class="reviewBtns">
												<button class="btn btn-outline-warning">등록</button>
												<button class="btn btn-outline-info">취소</button>
											</div>


										</div>
									</form>
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
<script src="/resources/member/js/order.js"></script>
<script src="/resources/member/js/review.js"></script>

