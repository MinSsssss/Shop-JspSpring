<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>



<div class="ltn__utilize-overlay"></div>

<!-- BREADCRUMB AREA START -->
<div class="ltn__breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div
					class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
					<div class="section-title-area">
						
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
								<jsp:include page="/WEB-INF/views/includes/myPageListInclude.jsp"></jsp:include>

							</div>
							<div class="ltn__myaccount-tab-content-inner">
								<p>회원탈퇴 하시겠습니까?</p>
								<div class="ltn__form-box">
									<form action="<c:url value='/member/memberDropProc'/>" id="memberDropForm"
										method="post">
										<div class="row mb-50">
											<div class="col-md-6">
												<label>비밀번호를 입력해주세요.</label>
												 <input type="password" id="mem_pwd" name="mem_pwd">
											</div>

										</div>

										<div class="btn-wrapper">
											<button type="button" data-toggle="modal" data-target="#memberDropModal"
												class="btn theme-btn-1 btn-effect-1 text-uppercase">회원탈퇴</button>
										</div>
										
										<!--MemberDrop Modal -->
										<div class="modal fade" id="memberDropModal" tabindex="-1"
											role="dialog" aria-labelledby="memberDropCenterTitle"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="memberDropModalTitle">회원탈퇴</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">탈퇴하시겠습니까?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															id="memberDropBtn">회원탈퇴</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>

													</div>
												</div>
											</div>
										</div>
										<!--End MemberDrop Modal -->

									</form>
								</div>
							</div>

						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>






<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
