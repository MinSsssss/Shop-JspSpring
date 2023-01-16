<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<a data-toggle="tab" href="#" id="noticeList">공지사항 </a> <a
						data-toggle="tab" href="#" id="faqList">자주묻는질문</a> <a
						data-toggle="tab" href="#" id="qnaBoard">고객게시판</a>

				</div>
				<div class="shoping-cart-inner">

					<div class="table-responsive">
						<h2 class="csTitle">고객게시판</h2>
						<table class="allTable boardTable">
							<thead>

								<tr>
									<th class="thSize">번호</th>
									<th>제목</th>
									<th>날짜</th>
									<th class="thSize">작성자</th>

								</tr>
							</thead>

							<tbody>
								<c:forEach items="${qnaList}" var="qna" varStatus="status">
									<tr>
										<td>${qna.qna_no}</td>
										<td class="noticeTitle">
										<a href="#" onclick="getQnaFun(${status.count})">${qna.qna_title}</a>
											<input type="hidden" id="qna_no${status.count}" value="${qna.qna_no}">
											<input type="hidden" id="mem_id${status.count}" value="${qna.mem_id}" >
										</td>
										<td><fmt:formatDate pattern="yyyy.MM.dd"
												value="${qna.qna_date}" /></td>
										<td>${qna.qna_writer}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
						<input type="hidden" id="pageId" value="qnaBoard"> 
						
						<input type="hidden" id="memChk" value="<sec:authentication property='principal'/>">
						<sec:authorize access="isAuthenticated()">
							<input type="hidden" id="memIdChk" value="<sec:authentication property='principal.member.mem_id'/>">
						</sec:authorize>
						
					</div>
					<!--MemberDrop Modal -->
					<div class="modal fade" id="pwdChkModal" tabindex="-1"
						role="dialog" aria-labelledby="pwdChkCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="pwdChkModalTitle">비밀번호 확인</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">비밀번호를 입력해주세요
									<form action="/qna/pwdChk" id="pwdChkForm" method="post">
										<input type="text" id="qna_pwd" name="qna_pwd">
										<input type="hidden" name="qna_no" id="chk_qna_no">
									</form>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										id="pwdChkBtn">확인</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>

								</div>
							</div>
						</div>
					</div>
					<!--End MemberDrop Modal -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- SHOPING CART AREA END -->

<script>

var result = '${msg}';
if(result === 'false'){
	
	alert('비밀번호가 틀렸습니다.');
}
</script>







<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/paging.js"></script>
<script src="/resources/member/js/csCenter.js"></script>