<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="../includes/memberHeader.jsp"></jsp:include>



<div class="ltn__utilize-overlay"></div>

<!-- BREADCRUMB AREA START -->
<div
	class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image"
	data-bg="img/bg/4.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
					<div class="section-title-area">
						<h1 class="section-title white-color">마이페이지</h1>
					</div>
					<div class="ltn__breadcrumb-list">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li>My Account</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- BREADCRUMB AREA END -->

<!-- WISHLIST AREA START -->
<div class="liton__wishlist-area pb-120">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- PRODUCT TAB AREA START -->
				<div class="ltn__product-tab-area">
					<div class="container">
						<div class="row">
							<div class="col-lg-4">

								<!-- myPageListInclude.jsp -->
								<jsp:include page="./myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="col-lg-8">
								<div class="tab-content">
									<table class="table">
										<thead>
											<tr>
												<th>Order</th>
												<th>Date</th>
												<th>Status</th>
												<th>Total</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Jun 22, 2019</td>
												<td>Pending</td>
												<td>$3000</td>
												<td><a href="cart.html">View</a></td>
											</tr>
											<tr>
												<td>2</td>
												<td>Nov 22, 2019</td>
												<td>Approved</td>
												<td>$200</td>
												<td><a href="cart.html">View</a></td>
											</tr>
											<tr>
												<td>3</td>
												<td>Jan 12, 2020</td>
												<td>On Hold</td>
												<td>$990</td>
												<td><a href="cart.html">View</a></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- PRODUCT TAB AREA END -->
			</div>
		</div>
	</div>
</div>
<!-- WISHLIST AREA START -->





<jsp:include page="../includes/memberFooter.jsp"></jsp:include>
