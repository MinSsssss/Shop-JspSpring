<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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

<!-- SHOPING CART AREA START -->
<div class="liton__shoping-cart-area mb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="csCenterNav">
					<a href="#" id="noticeList">공지사항 </a> 
					<a href="#" id="faqList">자주묻는질문</a> 
					<a href="#" id="qnaBoard">1:1 문의</a> 
		 
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
								
								<c:set var="num" value="${page.total-page.cri.pageNum}"/>
								<c:forEach items="${noticeList }" var="notice">
									<tr>
										<td><c:out value='${num}'/></td>
										<td class="noticeTitle">
											<a href="<c:url value='/notice/noticeRead/${notice.notice_no}'/>">
												<c:out value='${notice.notice_title}'/>
											</a>
										</td>
										<td>
											<fmt:formatDate pattern="yyyy.MM.dd" value="${notice.notice_date}"/>
										</td>
										<td><c:out value='${notice.notice_writer }'/></td>
										<td><c:out value='${notice.notice_hit }'/></td>
									</tr>
									<c:set var="num" value="${num-1}"/>
								</c:forEach>
								
							</tbody>
						</table>
						<jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
                        <input type="hidden" id="pageId" value="notice">
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>










<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/paging.js"></script>
<script src="/resources/member/js/csCenter.js"></script>