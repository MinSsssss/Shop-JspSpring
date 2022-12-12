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
								<div class="ltn__myaccount-tab-content-inner">
									<p>정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
									<div class="ltn__form-box">
										<form action="memberModify" method="post">
											<div class="row mb-50">
												<div class="col-md-6">
													<label>아이디</label> 
													<input type="text" name="mem_id" 
													value='<sec:authentication property="principal.member.mem_id"/>' readonly="readonly">
												</div>
												<div class="col-md-6">
													<label>비밀번호</label> 
													<input type="password"name="mem_pwd">
												</div>
												
											</div>
												
											
											<div class="btn-wrapper">
												<button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase" >확인</button>
												<button type="submit" class="btn theme-btn-3 btn-effect-1 text-uppercase">취소</button>
											</div>
											
										</form>
									</div>
								</div>
								<!-- <div class="ltn__myaccount-tab-content-inner">
									<p>정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
									<div class="ltn__form-box">
										<form action="#">
											<div class="row mb-50">
												<div class="col-md-6">
													<label>First name:</label> <input type="text"
														name="ltn__name">
												</div>
												<div class="col-md-6">
													<label>Last name:</label> <input type="text"
														name="ltn__lastname">
												</div>
												<div class="col-md-6">
													<label>Display Name:</label> <input type="text"
														name="ltn__lastname" placeholder="Ethan">
												</div>
												<div class="col-md-6">
													<label>Display Email:</label> <input type="email"
														name="ltn__lastname" placeholder="example@example.com">
												</div>
											</div>
											<fieldset>
												<legend>Password change</legend>
												<div class="row">
													<div class="col-md-12">
														<label>Current password (leave blank to leave
															unchanged):</label> <input type="password" name="ltn__name">
														<label>New password (leave blank to leave
															unchanged):</label> <input type="password" name="ltn__lastname">
														<label>Confirm new password:</label> <input
															type="password" name="ltn__lastname">
													</div>
												</div>
											</fieldset>
											<div class="btn-wrapper">
												<button type="submit"
													class="btn theme-btn-1 btn-effect-1 text-uppercase">Save
													Changes</button>
											</div>
										</form>
									</div>
								</div> -->


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
<script src="/resources/member/js/myPage.js"></script>