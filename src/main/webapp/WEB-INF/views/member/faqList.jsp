<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<div class="liton__shoping-cart-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="csCenterNav">
					<a data-toggle="tab" href="#" id="noticeList">공지사항 </a> 
					<a data-toggle="tab" href="#" id="faqList">자주묻는질문</a> 
					<a data-toggle="tab" href="#" id="inquiry">1:1문의하기 </a> 
	 
				</div>
				<div class="shoping-cart-inner">
					<h2>자주묻는질문</h2>
					<div class="table-responsive">
						
						<table class="allTable boardTable">
							<thead>
				
								<tr>
									<th class="thSize">번호</th>
									<th>분류</th>
									<th>내용</th>
									
								</tr>
							</thead>
								
							<tbody>
								<tr>
									<td>1</td>
									<td>주문/결제</td>
									<td>내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
									
								</tr>
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="./includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/csCenter.js"></script>