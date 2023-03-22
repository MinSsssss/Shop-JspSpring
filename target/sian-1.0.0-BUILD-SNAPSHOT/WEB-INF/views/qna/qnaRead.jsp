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

<!-- WISHLIST AREA START -->
<div class="liton__wishlist-area pb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="ltn__product-tab-area">
					<div class="container">
						<div class="row">
							<div class="col-lg-4">

								<!-- myPageListInclude.jsp -->
								<jsp:include
									page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="tab-content">
									<h2>1:1 문의</h2>
									<div class="boardWrap">
										<div class="boardTitle">
											<h4><c:out value='${qna.qna_title}'/></h4>
											<div><c:out value='${qna.qna_status}'/></div>
										</div>
										
										<div class="boardInfo">
											<div>
												<strong><c:out value='${qna.qna_writer}'/></strong> <span>
												<fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${qna.qna_date }" /></span>
											</div>
										</div>
										<div class="boardContent"><c:out value='${qna.qna_content}'/></div>
										<c:if test="${not empty qna.qna_answer }">
											<div class="boardContent">
												<p>답변내용</p>
												<div><c:out value='${qna.qna_answer}'/></div>
											</div>
										</c:if>
										
									</div>
								</div>
								<div class="boardReadBtns">
									<button id="qnaModify">수정</button>
									<button id="qnaDelete">삭제</button>
									<button id="qnaList2">목록</button>
									<input type="hidden" id="qna_no" value="<c:out value='${qna.qna_no}'/>">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->









<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/paging.js"></script>
