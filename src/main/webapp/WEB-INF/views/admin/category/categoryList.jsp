<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="pageHead">
		<h1 class="h3 mb-2 text-gray-800"><c:out value="${title} "/>카테고리조회</h1>
		<div>
			<a class="btn btn-link" href="<c:url value='/admin/category/categoryRegister/${category_class}'/>">등록하기</a>
		</div>
	</div>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="thWidth10">번호</th>
							<th>카테고리이름</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach items="${categoryList }" var="category" varStatus="status">
							<tr>
								<td class="align-middle">
									<a id="categoryMove" href="<c:url value='/admin/category/categoryRead/${category.category_no}'/>">
										<c:out value="${status.count}"/>
									</a>
								</td>

								<td class="align-middle"><c:out value="${category.category_name }"/></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>
		
		<form id='actionForm' action="<c:url value='/admin/categoryList'/>" method='get'>

		</form>
		
		<!--Category Modal -->
		<div class="modal fade" id="categoryDropModal" tabindex="-1"
			role="dialog" aria-labelledby="categoryDropCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="categoryDropModalTitle">카테고리삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">삭제하시겠습니까?</div>
					<div class="modal-body">
						카테고리번호를 입력해주세요. <input type="text" id="" name="category_no">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="categoryDropBtn">삭제</button>
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
<script>
	let result = '<c:out value="${msg}"/>';
	successFun(result);
</script> 