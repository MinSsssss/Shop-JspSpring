<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">카테고리조회</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<tbody>
						<tr>
							<td>카테고리번호</td>
							<td class="align-middle">
								<c:out value="${categoryRead.category_no }" />
							</td>

						</tr>
						
						<tr>
							<td>카테고리이름</td>
							<td class="align-middle">
								<c:out value="${categoryRead.category_name }" />
							</td>
						</tr>
						<tr>
							<td colspan="2">포함된 제품</td>
						</tr>		
						<tr>
							<td colspan="2">
								<p>상품1</p>
								<p>상품1</p>
								<p>상품1</p>
								<p>상품1</p>
								<p>상품1</p>			
							</td>
						</tr>

							
					</tbody>
				</table>
				
				
			</div>
			<button class="btn btn-primary btn-sm" id="categoryModyfyBtn">수정</button>
			<button class="btn btn-secondary btn-sm" id="categoryDeleteBtn" 
			data-toggle="modal" data-target="#categoryDropModal">삭제</button>
			
		</div>
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


	</form>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
