<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">공지사항 등록</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">

				<form action="<c:url value='/admin/notice/noticeRegisterProc'/>" method="post" id="registerForm">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<tbody>
							
							
							<tr>
								<td>제목</td>
								<td><input type="text" name="notice_title"
									id="notice_title"></td>
							</tr>

							<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="20" name="notice_content"
										id="notice_content"></textarea></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="notice_writer"
									value="관리자" readonly="readonly"></td>
							</tr>

						</tbody>
					</table>

				</form>
				<button class="btn btn-primary btn-sm" data-toggle="modal"
					data-target="#noticeRegModal" id="noticeRegBtn">등록</button>
				<button class="btn btn-secondary btn-sm" id="noticeRegCencleBtn">취소</button>


			</div>


		</div>
		<!--Product Modal -->
		<div class="modal fade" id="noticeRegModal" tabindex="-1"
			role="dialog" aria-labelledby="noticeRegCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="noticeRegModalTitle">공지사항등록</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">공지사항을 등록하시겠습니까?</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="regModalBtn">등록</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>

					</div>
				</div>
			</div>
		</div>
		<!--End Product Modal -->
	</div>





</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>

