<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">FAQ 수정</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">

				<form action="/admin/faqModifyProc" method="post" id="modifyForm">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<tbody>
							<tr>
								<th>번호</th>
								<td class="align-middle">
								<input class="readOnlyText" type="text" name="faq_no" id="faq_no" value="${faq.faq_no}" readonly="readonly">
								</td>

							</tr>
							<tr>
								<th>카테고리</th>
								<td>
									<select name="category_name">
										<c:forEach items="${category}" var="cate">
											<option>${cate.category_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td class="align-middle">
								<input type="text" name="faq_title" id="faq_title" value="${faq.faq_title}">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
								<textarea  name="faq_content"
										id="faq_title" rows="10" cols="30">${faq.faq_content}</textarea>
								</td>
							</tr>



						</tbody>
						
					</table>
					<button type="submit" class="btn btn-primary btn-sm" id="faqModyfyBtn">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" id="faqCencleBtn">취소</button>
				</form>

			</div>
			

		</div>
		
	</div>





</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
