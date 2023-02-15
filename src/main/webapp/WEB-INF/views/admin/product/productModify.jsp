<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 수정</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">

				<form action="<c:url value='/admin/product/productModifyProc'/>" method="post"
					id="productModifyForm" enctype="multipart/form-data">
					<input type="hidden" name="product_no" value="<c:out value='${product.product_no}'/>">
					
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<tbody>
							 <tr>
								<td>카테고리</td>
								<td>
									<select name="category_no" id="category_name">
										
										<c:choose>
											<c:when test="${not empty product.category_name}">
												<c:forEach items="${categoryList }" var="category">
													<option id="categorySelect" value="<c:out value='${category.category_no}'/>">
														<c:out value='${category.category_name }'/>
													</option>
												</c:forEach>
											</c:when> 
											
											<c:when test="${empty product.category_name}">
												<option id="categorySelect" value="0">카테고리없음</option>
												<c:forEach items="${categoryList }" var="category">
													<option id="categorySelect" value="<c:out value='${category.category_no}'/>">
														<c:out value='${category.category_name}'/>
													</option>
												</c:forEach>
											</c:when>
									
										</c:choose> 
										
									</select>
								</td>
							</tr>

							<tr>
								<td>상품이름</td>
								<td>
									<input type="text" name="product_name" id="product_name" value="<c:out value='${product.product_name}'/>">
								</td>
							</tr>
							
							<tr>
								<td>설명</td>
								<td>
									<textarea rows="10" cols="50" name="product_detail"
										id="product_detail"><c:out value='${product.product_detail}'/>
									</textarea>
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea rows="20" cols="50" name="product_content"
										id="product_content"><c:out value='${product.product_content}'/>
									</textarea>
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>
								<input type="text" name="product_price"
									id="product_price" value="<c:out value='${product.product_price }'/>">
								</td>
							</tr>
							
							
							
							<tr>
								<td>이미지 첨부<br>
									(대표사진설정)
								</td>
								<td class="uploadTd"><input type="file" name="uploadFile"
									id="fileItem" multiple>
									<div class="uploadResult">
										<ul>
											
											<c:forEach items="${product.product_imgs}" var="images" varStatus="status">
												<c:set var="attach" value="${product.attachList[status.index]}"/>	
												<c:if test="${images eq product.product_thumb_img }" >
													<li data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" 
													data-filename="${attach.fileName}" data-type="${attach.fileType}">
														
														<div>
															<span>${attach.fileName}</span>
															<button  type='button' data-file="\'${images}'\"
															data-type='image' class='btn btn-warning btn-circle'>
															<i class='fa fa-times'></i>
															</button><br>
															
																<input type='radio' name='product_thumb_img' value="<c:out value='${images}'/>" checked="checked">
															
															<img src="<c:url value='/display?fileName=${images}'/>">	
														</div>
														
													</li>
												</c:if>
												
													
												<c:if test="${images ne product.product_thumb_img }" >
													<li data-path="${attach.uploadPath}" data-uuid="${attach.uuid}" 
													data-filename="${attach.fileName}" data-type="${attach.fileType}">
														
														<div>
															<span>${attach.fileName}</span>
															<button  type='button' data-file="\'${images}'\"
															data-type='image' class='btn btn-warning btn-circle'>
															<i class='fa fa-times'></i>
															</button><br>
															
																<input type='radio' name='product_thumb_img' value="${images }">
															
															<img src='/display?fileName=${images}'>	
														</div>
														
													</li>
												</c:if>
												
												
											</c:forEach>
										</ul>
									</div>
								</td>
									
							</tr>

						</tbody>
					</table>
					
				</form>
				<button class="btn btn-primary btn-sm" data-toggle="modal"
					data-target="#productModifyModal" id="productModifyBtn">등록</button>
				<button class="btn btn-secondary btn-sm" id="productModifyCencleBtn">취소</button>
				 


			</div>


		</div>
		<!--Product Modal -->
		<div class="modal fade" id="productModifyModal" tabindex="-1"
			role="dialog" aria-labelledby="productModifyCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="productModifyModalTitle">상품 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">상품을 수정하시겠습니까?</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="productModifyModalBtn">등록</button>
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

