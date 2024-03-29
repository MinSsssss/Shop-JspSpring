<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 조회</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<form action="<c:url value='/admin/product/productDeleteProc'/>" method="post" id="deleteForm">
					<input type="hidden" name="product_no" value="<c:out value='${product.product_no}'/>">
				</form>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<tbody>
						
						<tr>
							<th>분류</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${product.category_name}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${product.product_name}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${product.product_price}'/>" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>설명</th>
							<td> 
							<pre><c:out value='${product.product_detail}'/></pre> 
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td> 
							<pre><c:out value='${product.product_content}'/></pre> 
							</td>
						</tr>
						<tr>
							<th>대표사진</th>
							<td class="align-middle readOnlyText">
								<div><img alt="" src="<c:url value='/display?fileName=${product.product_thumb_img}'/>"></div>
							</td>
						</tr>
						<tr>
							<th>사진</th>
							<td class="align-middle readOnlyText">
								 <c:forEach items="${product.product_imgs}" var="images" varStatus="status">
									<div><img src="<c:url value='/display?fileName=${images}'/>"></div>
									
								</c:forEach> 			
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" readonly="readonly"
								value="<fmt:formatDate pattern="yyyy-MM-dd" value="${product.product_regdate }"/>">
							</td>
						</tr>
						<tr>
							<th>수정일</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" readonly="readonly"
								value="<fmt:formatDate pattern="yyyy-MM-dd" value="${product.product_updateDate }"/>">
							</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td class="align-middle readOnlyText">
								<input class="readOnlyText" type="text" value="<c:out value='${product.product_hit}'/>" readonly="readonly">
							</td>
						</tr>	
						

							
					</tbody>
				</table>
				
				
			</div>
			<a href="<c:url value='/admin/product/productModify/${product.product_no}'/>" class="btn btn-primary btn-sm" id="productModyfyBtn">수정</a>
			<button class="btn btn-secondary btn-sm"
			data-toggle="modal" data-target="#productDeleteModal">삭제</button>
			
		</div>
		<!--Category Modal -->
		<div class="modal fade" id="productDeleteModal" tabindex="-1"
			role="dialog" aria-labelledby="productDeleteCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="productDeleteModalTitle">상품 삭제</h5>
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
<script>
	let result = '<c:out value="${msg}"/>';
	successFun(result);
</script>   
