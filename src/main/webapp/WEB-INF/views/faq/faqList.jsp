<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
						<h1 class="section-title white-color">Cart</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->

<!-- SHOPING CART AREA START -->
<div class="ltn__faq-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="csCenterNav">
					<a data-toggle="tab" href="#" id="noticeList">공지사항 </a> 
					<a data-toggle="tab" href="#" id="faqList">자주묻는질문</a> 
					<a data-toggle="tab" href="#" id="qnaBoard">1:1 문의</a>

				</div>
				<div class="ltn__faq-inner ltn__faq-inner-2">
					<h2 class="csTitle">자주묻는질문</h2>

					<div class="categoryNav">
						<span><a href="/faq/faqList?category_no=0">전체</a></span>
						<c:forEach items="${category}" var="cate">
							<span> <a
								href="/faq/faqList?category_no=${cate.category_no}">
									${cate.category_name} </a>
							</span>
						</c:forEach>
					</div>
					<div id="accordion_2">
						<!-- card -->
						<c:forEach items="${faqList }" var="faq" varStatus="status">
							<div class="card">
								<div class="collapsed ltn__card-title" data-toggle="collapse"
									data-target="#faq-item-2-${status.count}" aria-expanded="false"><h6>${faq.faq_title }</h6></div>
								<div id="faq-item-2-${status.count}" class="collapse"
									data-parent="#accordion_2">
									<div class="card-body">
										<p>${faq.faq_content}</p>
									</div>
								</div>
							</div>
						</c:forEach>
						
						<!-- card -->

					</div>
				</div>
				<div class="need-support text-center mt-100">
					<h2>Still need help? Reach out to support 24/7:</h2>
					<div class="btn-wrapper mb-30">
						<a href="contact.html" class="theme-btn-1 btn">Contact Us</a>
					</div>
					<h3>
						<i class="fas fa-phone"></i> +0123-456-789
					</h3>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/csCenter.js"></script>