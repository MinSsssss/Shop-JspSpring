<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">notice 수정</h1>

	<!-- DataTales Example -->

	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">

				<form action="/admin/noticeModifyProc" method="post" id="modifyForm">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<tbody>
							<tr>
								<th>번호</th>
								<td class="align-middle">
								<input class="readOnlyText" type="text" name="notice_no" id="notice_no" value="${notice.notice_no}" readonly="readonly">
								</td>

							</tr>
							
							<tr>
								<th>제목</th>
								<td class="align-middle">
								<input type="text" name="notice_title" id="notice_title" value="${notice.notice_title}">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
								<textarea  name="notice_content"
										id="notice_title" rows="10" cols="30">${notice.notice_content}</textarea>
								</td>
							</tr>



						</tbody>
						
					</table>
					<button type="submit" class="btn btn-primary btn-sm" id="noticeModyfyBtn">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" id="noticeCencleBtn">취소</button>
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
