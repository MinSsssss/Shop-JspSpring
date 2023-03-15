<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<!-- PRODUCT TAB AREA START -->
				<div class="ltn__product-tab-area">
					<div class="container">
						<div class="row">
							<div class="col-lg-4">

								<!-- myPageListInclude.jsp -->
								<jsp:include page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								
								<div class="tab-content">
									<h2>문의내역</h2>
									<table class="table">
										<thead>
											<tr>
												
												<th>분류</th>
												<th>제목</th>
												<th>날짜</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${qnaList}" var="qna">
												<tr>
													
													<td><c:out value='${qna.category_name}'/></td>
													<td>
														<a href="<c:url value='/qna/qnaRead/${qna.qna_no}'/>">
															<c:out value='${qna.qna_title}'/>
														</a>
													</td>
													<td><fmt:formatDate pattern="yyyy.MM.dd" value="${qna.qna_date}"/></td>
													<td><c:out value='${qna.qna_status}'/></td>
												</tr>
											
											</c:forEach>
											
											
										</tbody>
									</table>
									
									
								</div>
								<jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
								<input type="hidden" id="pageId" value="qnaMemberList">
							</div>
						</div>
					</div>
				</div>
				<!-- PRODUCT TAB AREA END -->
			</div>
		</div>
	</div>
</div>
<!-- WISHLIST AREA START -->
<script>

var result = "<c:out value='${msg}'/>'";
if(result === 'successModify'){
	
	alert('수정이 완료되었습니다.');
}
</script>




<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/paging.js"></script>