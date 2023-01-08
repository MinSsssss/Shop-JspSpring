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
<div class="liton__shoping-cart-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="csCenterNav">
					<a data-toggle="tab" href="#" id="noticeList">공지사항 </a> 
					<a data-toggle="tab" href="#" id="faqList">자주묻는질문</a> 
					<a data-toggle="tab" href="#" id="inquiry">1:1 문의하기 </a> 
				
				</div>
				<div class="shoping-cart-inner">
					<h2>1:1 문의하기</h2>
					<div class="table-responsive">
						<form>
							<table class="inquiryTable">
	
								<tbody>
									<tr>
										<th>말머리</th>
										<td>
											<select class="inquirySelect tableMargin">
												<option>문의내용1</option>
												<option>문의내용2</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>
											<div class="tableMargin">크리링</div>
										</td>
									</tr>
									<tr>
										<th>주문내역</th>
										<td>
											<div class="tableMargin">선택된 주문이 없습니다. <button>주문내역</button></div>
										</td>
									</tr>
									<tr>
										<th>휴대폰</th>
										<td>
											<input type="text" value="010-3501-7065">
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input type="email" value="cda09@naver.com">
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>
											<input type="text">
										</td>
									</tr>
									<tr>
										<th>본문</th>
										<td>
											<textarea rows="" cols=""></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="inquiryBtns">
								<button class="btn btn-warning">제출</button>
								<button class="btn btn-outline-dark">취소</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>

<script src="/resources/member/js/csCenter.js"></script>