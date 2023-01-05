<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">공지사항조회</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<form action="/admin/noticeDeleteProc" method="post" id="deleteForm">
					<input type="hidden" name="notice_no" value="${notice.notice_no}">
				</form>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<tbody>
						<tr>
							<th>번호</th>
							<td class="align-middle">
								<input class="readOnlyText" type="text" value="${notice.notice_no}" readonly="readonly">
							</td>

						</tr>
						
						<tr>
							<th>제목</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="${notice.notice_title}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td> 
							<textarea class="readOnlyText "
							rows="10" cols="30" readonly="readonly">${notice.notice_content}</textarea> 
							</td>
						</tr>		
						

							
					</tbody>
				</table>
				
				
			</div>
			<a href="/admin/noticeModify?notice_no=${notice.notice_no}" class="btn btn-primary btn-sm" id="noticeModyfyBtn">수정</a>
			<button class="btn btn-secondary btn-sm"
			data-toggle="modal" data-target="#noticeDeleteModal">삭제</button>
			
		</div>
		<!--Category Modal -->
		<div class="modal fade" id="noticeDeleteModal" tabindex="-1"
			role="dialog" aria-labelledby="noticeDeleteCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="noticeDeleteModalTitle">공지사항삭제</h5>
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
