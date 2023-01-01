<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./includes/memberHeader.jsp"></jsp:include>




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
						<h1 class="section-title white-color">Shop</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>Shop</li>
						</ul>
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
						<c:out value="${category.category_name }" />
						
					</h1>
					
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
							<a href="product-details.html"><img src="/resources/member/img/${product.product_image1 }"
								alt="#"></a>
						</div>
						<div class="product-info">
							<h2 class="product-title">
								<a href='/member/productRead?product_no=${product.product_no}'>
								${product.product_name}</a>
							</h2>
							<div class="product-price">
								<span>${product.product_price}</span>
								
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
			
		</div>

		<div class="btn-wrapper text-center">
			<a href="#" class="btn btn-transparent btn-effect-3 btn-border">LOAD
				MORE +</a>
		</div>


	</div>
</div>
<!-- Gallery area end -->

<!-- FEATURE AREA START ( Feature - 3) -->
<div
	class="ltn__feature-area before-bg-bottom before-bg-bottom-2 plr--5">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__feature-item-box-wrap ltn__border-between-column white-bg">
					<div class="row">
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/4-track.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Free home delivery</h4>
									<p>Provide free home delivery for all product over $100</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/5-madel.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Quality Products</h4>
									<p>We ensure the product quality that is our main goal</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/6-return.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>3 Days Return</h4>
									<p>Return product within 3 days for any product you buy</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-12">
							<div class="ltn__feature-item ltn__feature-item-8">
								<div class="ltn__feature-icon">
									<img src="img/icons/svg/7-support.svg" alt="#">
								</div>
								<div class="ltn__feature-info">
									<h4>Online Support</h4>
									<p>We ensure the product quality that you can trust easily</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- FEATURE AREA END -->




<jsp:include page="./includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/index.js"></script>