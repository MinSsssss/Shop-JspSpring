<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<h1 class="section-title white-color">마이페이지</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>My Account</li>
						</ul>
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
													
													<td>${qna.category_name}</td>
													<td><a href="/qna/qnaRead?qna_no=${qna.qna_no}">${qna.qna_title }</a></td>
													<td><fmt:formatDate pattern="yyyy.MM.dd" value="${qna.qna_date}"/></td>
													<td>${qna.qna_status}</td>
												</tr>
											
											</c:forEach>
											
											
										</tbody>
									</table>
									<jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
									<input type="hidden" id="pageId" value="qnaList">
									
								</div>

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

var result = '${msg}';
if(result === 'successModify'){
	
	alert('수정이 완료되었습니다.');
}
</script>




<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>