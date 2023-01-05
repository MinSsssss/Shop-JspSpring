<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">FAQ 등록</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">

				<form action="/admin/faqRegisterProc" method="post"
					id="registerForm">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<tbody>
							<tr>
								<td>카테고리</td>
								<td>
									<select name="category_name">
										<c:forEach items="${category}" var="cate">
											<option>${cate.category_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>제목</td>
								<td><input type="text" name="faq_title"
									id="faq_title"></td>
							</tr>

							<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="20" name="faq_content"
										id="faq_content"></textarea></td>
							</tr>
							

						</tbody>
					</table>

				</form>
				<button class="btn btn-primary btn-sm" data-toggle="modal"
					data-target="#regModal" id="faqRegBtn">등록</button>
				<button class="btn btn-secondary btn-sm" id="regCencleBtn">취소</button>


			</div>


		</div>
		<!--Product Modal -->
		<div class="modal fade" id="regModal" tabindex="-1"
			role="dialog" aria-labelledby="regCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="regModalTitle">FAQ 등록</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">FAQ를 등록하시겠습니까?</div>

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
<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
<script src="/resources/admin/js/admin.js"></script>
