<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">1:1 문의 조회</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<form action="/admin/qna/qnaDeleteProc" method="post" id="deleteForm">
					<input type="hidden" name="qna_no" value="<c:out value='${qna.qna_no}'/>">
				</form>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<tbody>
						<tr>
							<th>답변상태</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${qna.qna_status}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>분류</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${qna.category_name}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${qna.qna_writer}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${qna.qna_tel}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>주문번호</th>
							<td class="align-middle readOnlyText">
								<a href="<c:url value='/admin/order/orderDetailView?order_no=${qna.order_no}'/>">
									<c:out value='${qna.order_no}'/>
								</a>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${qna.qna_title}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td> 
							<textarea class="readOnlyText"
							rows="" cols="" readonly="readonly"><c:out value='${qna.qna_content}'/></textarea> 
							</td>
						</tr>			
					</tbody>
				</table>
				
				
			</div>
			<c:choose>
				<c:when test="${qna.qna_status eq '접수'}">
					<h4>답변작성</h4>
					<textarea class="answerText" id="qna_answer"></textarea>
					<input type="hidden" id="qna_no" value="<c:out value='${qna.qna_no}'/>">
					<input type="hidden" id="qna_status" value="답변 완료">
					<br>
					<button class="btn btn-primary btn-sm" id="qnaAnswerBtn">답변하기</button>
				</c:when>
				<c:when test="${qna.qna_status eq '답변 완료'}">
					<h4>작성하신 답변</h4>
					<textarea class="readOnlyText"
							rows="" cols="" readonly="readonly"><c:out value='${qna.qna_answer}'/></textarea> 
				</c:when>
			</c:choose>
			
			
		</div>
		<!--Category Modal -->
		<div class="modal fade" id="qnaDeleteModal" tabindex="-1"
			role="dialog" aria-labelledby="qnaDeleteCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="qnaDeleteModalTitle">QNA삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">삭제하시겠습니까?</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>

					</div>
				</div>
			</div>
		</div>
		<!--End Category Modal -->
	</div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
