<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./includes/adminHeader.jsp"></jsp:include>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">카테고리생성</h1>

	<!-- DataTales Example -->
	<form action="" method="post" enctype="multipart/form-data">
		<div class="card shadow mb-4">

			<table>
				<tr>
					<td>카테고리</td>
					<td><select name="catecory" id="">
							<option value="">카테고리선택</option>
							<option value="">커피</option>
							<option value="">원두</option>
							<option value="">드립백</option>
							<option value="">..</option>

					</select></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><textarea rows="10" cols="20" name="content"></textarea></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>이미지 첨부</td>
					<td><input type="file" name="image" accept="image/*"
						onchange="loadFile(this)"></td>
				</tr>

			</table>

		</div>
		<input type="submit">

	</form>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<!-- End of Main Content -->
<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
