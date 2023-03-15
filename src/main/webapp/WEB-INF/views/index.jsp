<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>

	<div class="ltn__utilize-overlay"></div>

	 <!-- BREADCRUMB AREA START -->
    <!-- <div class="ltn__breadcrumb-area">
        
    </div> -->
    <!-- BREADCRUMB AREA END -->
	
    <!-- PRODUCT SLIDER AREA START -->
    
	    <div class="ltn__product-slider-area ltn__product-gutter pt-110 pb-70">
	    	<c:forEach items="${categoryList}" var="category" varStatus="status">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title-area text-center">
	                        <h1 class="section-title"><c:out value='${category.category_name}'/></h1>
	                      
	                    </div>
	                </div>
	            </div>
	            <div class="row ltn__product-slider-item-four-active slick-arrow-1">
     <!-- ltn__product-item -->
	                <c:forEach items="${category.productList}" var="proList">
							
	                		<div class="col-lg-12">
			                    <div class="ltn__product-item ltn__product-item-3 text-center">
			                        <div class="product-img">
			                            <a href="<c:url value='/product/productRead/${proList.product_no}'/>">
			                            	<img src="<c:url value='/display?fileName=${proList.product_thumb_img}'/>">
			                            </a>
			                        </div>
			                        <div class="product-info">
			                            <h2 class="product-title">
			                            	<a href="<c:url value='/product/productRead/${proList.product_no}'/>">
			                            		<c:out value='${proList.product_name}'/>
			                            	</a>
			                            </h2>
			                            <div class="product-price">
			                            	<span>
			                            		<fmt:formatNumber type="number" maxFractionDigits="3" value="${proList.product_price}"/>
			                            	</span>
			                                
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

   
    

    

    

    

    

    

<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<!-- <script src="/resources/member/js/index.js"></script> -->