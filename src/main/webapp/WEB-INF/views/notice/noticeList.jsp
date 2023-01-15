<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<a data-toggle="tab" href="#" id="inquiry">1:1문의하기 </a> 
		 
				</div>
				<div class="shoping-cart-inner">
					
					<div class="table-responsive">
						<h2 class="csTitle">공지사항</h2>
						<table class="allTable boardTable">
							<thead>
				
								<tr>
									<th class="thSize">번호</th>
									<th>제목</th>
									<th>날짜</th>
									<th class="thSize">작성자</th>
									<th class="thSize">조회</th>
								</tr>
							</thead>
								
							<tbody>
								<c:forEach items="${noticeList }" var="notice">
									<tr>
										<td>${notice.notice_no}</td>
										<td class="noticeTitle">
											<a href="/notice/noticeRead?notice_no=${notice.notice_no}">${notice.notice_title }</a>
										</td>
										<td><fmt:formatDate pattern="yyyy.MM.dd" value="${notice.notice_date}"/>
										</td>
										<td>${notice.notice_writer }</td>
										<td>${notice.notice_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<jsp:include page="/WEB-INF/views/admin/includes/pageInclude.jsp"></jsp:include>
                        <input type="hidden" id="pageId" value="notice">
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/paging.js"></script>
<script src="/resources/member/js/csCenter.js"></script>