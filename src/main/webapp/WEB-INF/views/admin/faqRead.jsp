<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">FAQ 조회</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<form action="/admin/faqDeleteProc" method="post" id="deleteForm">
					<input type="hidden" name="faq_no" value="${faq.faq_no}">
				</form>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<tbody>
						<tr>
							<th>번호</th>
							<td class="align-middle">
								<input class="readOnlyText" type="text" value="${faq.faq_no}" readonly="readonly">
							</td>

						</tr>
						<tr>
							<th>분류</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="${faq.category_name}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="${faq.faq_title}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td> 
							<textarea class="readOnlyText "
							rows="10" cols="30" readonly="readonly">${faq.faq_content}</textarea> 
							</td>
						</tr>		
						

							
					</tbody>
				</table>
				
				
			</div>
			<a href="/admin/faqModify?faq_no=${faq.faq_no}" class="btn btn-primary btn-sm" id="faqModyfyBtn">수정</a>
			<button class="btn btn-secondary btn-sm"
			data-toggle="modal" data-target="#faqDeleteModal">삭제</button>
			
		</div>
		<!--Category Modal -->
		<div class="modal fade" id="faqDeleteModal" tabindex="-1"
			role="dialog" aria-labelledby="faqDeleteCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="faqDeleteModalTitle">FAQ삭제</h5>
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
<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
