<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

<!-- Gallery area start -->
<div class="ltn__gallery-area mb-120  mt--10">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title-area text-center">
					<h1 class="section-title ">
						<c:if test="${empty category}">
							검색결과
						</c:if>
						<c:out value='${category.category_name}'/>	
					</h1>
					<p><c:out value='${searchNull}'/></p>
				</div>

			</div>
		</div>
		<!-- Portfolio Wrapper Start -->
		<!-- (ltn__gallery-info-hide) Class for 'ltn__gallery-item-info' not showing -->
		
		
		<div
			class="ltn__gallery-active row ltn__gallery-style-2 ltn__gallery-info-hide---">
			<div class="ltn__gallery-sizer col-1"></div>
			
			<!-- gallery-item -->
			
			<c:forEach items="${productList }" var="product">
				<div
					class="ltn__gallery-item filter_category_3 col-lg-3 col-md-4 col-sm-6 col-12">
					<div class="ltn__product-item ltn__product-item-3 text-center">
						<div class="product-img">
							<a href="<c:url value='/product/productRead?product_no=${product.product_no}'/>">
								<img src="<c:url value='/display?fileName=${product.product_thumb_img}'/>">
							</a>
						</div>
						
						<div class="product-info">
							<h2 class="product-title">
								<a href="<c:url value='/product/productRead?product_no=${product.product_no}'/>">
									<c:out value='${product.product_name}'/>
								</a>
							</h2>
							<div class="product-price">
								<span>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.product_price}"/>
								</span>
								
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
			
		</div>

		<div class="btn-wrapper text-center">
			<a href="#" class="btn btn-transparent btn-effect-3 btn-border">
				더보기</a>
		</div>


	</div>
</div>
<!-- Gallery area end -->

<!-- FEATURE AREA START ( Feature - 3) -->





<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/index.js"></script>