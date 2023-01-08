<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${title}카테고리생성</h1>

	<!-- DataTales Example -->
	<form action="/admin/category/categoryRegisterProc" id="categoryRegisterForm" method="post">
		<div class="card shadow mb-4">

			<table class="table table-bordered">
				
				<tr>
					<td>카테고리이름</td>
					<td><input type="text" id="category_name" name="category_name"></td>
				</tr>
			</table>

		</div>
		<input type="hidden" name="category_class" value="${category_class}"> 
		<input type="submit" id="cateBtnSubmit" class="btn btn-primary btn-icon-split " value="생성">
		<input type="button" id="cateBtnCencle" class="btn btn-secondary btn-icon-split " value="취소">

	</form>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>

<script>
	let result = '${msg}';
	successFun(result);
</script>   

