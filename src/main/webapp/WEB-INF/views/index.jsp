<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>

	<div class="ltn__utilize-overlay"></div>


	
    <!-- PRODUCT SLIDER AREA START -->
    
	    <div class="ltn__product-slider-area ltn__product-gutter pt-110 pb-70">
	    	<c:forEach items="${categoryList}" var="category" varStatus="status">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title-area text-center">
	                        <h1 class="section-title ">${category.category_name }</h1>
	                        <!-- <p>There are many variations of passages of Lorem Ipsum available.</p> -->
	                    </div>
	                </div>
	            </div>
	            <div class="row ltn__product-slider-item-four-active slick-arrow-1">
     <!-- ltn__product-item -->
	                <c:forEach items="${category.productList}" var="proList">
							
	                		<div class="col-lg-12">
			                    <div class="ltn__product-item ltn__product-item-3 text-center">
			                        <div class="product-img">
			                            <a href="/product/productRead?product_no=${proList.product_no}"><img src="/display?fileName=${proList.product_thumb_img }" alt="#"></a>
			                        </div>
			                        <div class="product-info">
			                            <h2 class="product-title"><a href="/product/productRead?product_no=${proList.product_no}">${proList.product_name }</a></h2>
			                            <div class="product-price">
			                                <span>${proList.product_price}</span>
			                            </div>
			                        </div>
			                    </div>
			                </div> 
	                	
	                </c:forEach>
	                
	            </div>
	        </div>
	        </c:forEach>
	    </div>
    
    
    
    <!-- PRODUCT SLIDER AREA END -->

   
    

    

    

    <!-- VIDEO AREA START -->
    <div class="ltn__video-area section-bg-1 pt-120 pb-120 d-none">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__video-img">
                        <img src="/resources/member/img/bg/8.jpg" alt="video popup bg image">
                        <a class="ltn__video-icon-2 ltn__video-icon-2-border" href="https://www.youtube.com/embed/X7R-q9rsrtU?autoplay=1&showinfo=0"  data-rel="lightcase:myCollection">
                            <i class="fa fa-play"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- VIDEO AREA END -->

    <!-- NEWSLETTER AREA START -->
    <div class="ltn__newsletter-area section-bg-1 bg-overlay-white-30 bg-image pt-110 pb-90 d-none" data-bg="img/bg/8.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="ltn__newsletter-inner text-center">
                        <h2>We make your inbox better</h2>
                        <p>Sign up to our newsletter to receive grooming tips, style inspiration, <br> exclusive access to pre-launch product pricing and more.</p>
                        <form action="#" class="ltn__form-box">
                            <input type="email" name="email" placeholder="Email*">
                            <div class="btn-wrapper">
                                <button class="theme-btn-1 btn btn-effect-1 text-uppercase" type="submit">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- NEWSLETTER AREA END -->

    <!-- BRAND LOGO AREA START -->
    <div class="ltn__brand-logo-area ltn__brand-logo-1 pt-110 pb-110 plr--9 d-none">
        <div class="container-fluid">
            <div class="row ltn__brand-logo-active">
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/1.png" alt="Brand Logo">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/2.png" alt="Brand Logo">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/3.png" alt="Brand Logo">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/4.png" alt="Brand Logo">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/5.png" alt="Brand Logo">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ltn__brand-logo-item">
                        <img src="/resources/member/img/brand-logo/3.png" alt="Brand Logo">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BRAND LOGO AREA END -->

<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<!-- <script src="/resources/member/js/index.js"></script> -->