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
									<div class="ltn__form-box">
										<form action="/member/auth/memberModifyNextProc"
										id="memberModifyNextForm" method="post">
											<div class="row mb-50">
											
												<fieldset>
												<legend>회원 정보 수정</legend>
												<div class="row">
													<div class="col-md-12">
														<label>아이디</label> 
														<input type="text" name="mem_id" readonly="readonly"
														value='<sec:authentication property="principal.member.mem_id"/>'>
														
														<label>이름</label> 
														<input type="text" name="mem_name" readonly="readonly"
														value='<sec:authentication property="principal.member.mem_name"/>'>
														
														<label>이메일</label> <button class="btn">이메일변경</button>
														<input type="email" name="mem_tel" readonly="readonly"
														value='<sec:authentication property="principal.member.mem_email"/>'>
														
														<label>전화번호</label> <button class="btn">전화번호변경</button>
														<input type="text" name="mem_email" readonly="readonly"
														value='<sec:authentication property="principal.member.mem_tel"/>'>
														
														<label>현재 비밀번호</label>
														<input type="password" id="this_mem_pwd">
														<label>새 비밀번호</label>
														<input type="password" id="mem_pwd" name="mem_pwd">
														<label>새 비밀번호 다시 입력</label>
														<input type="password" id="mem_pwd_re">	 
													</div>
												</div>
											</fieldset>
											<div class="btn-wrapper">
												<button type="button" id="memModifySubmitBtn"
													class="btn theme-btn-1 btn-effect-1 text-uppercase">Save
													Changes</button>
											</div>
											</div>
											
											
										</form>
									</div>
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
