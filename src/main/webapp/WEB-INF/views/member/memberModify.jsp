<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<div class="col-lg-8">
								<div class="ltn__myaccount-tab-content-inner">
									<p>정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
									<div class="ltn__form-box">
									
										<form action="<c:url value='/member/memberModify'/>" id="memberModifyForm" method="post">
											<div class="row mb-50">
												
												<input type="hidden" id="mem_id" name="mem_id" 
													value='<sec:authentication property="principal.member.mem_id"/>'>
												<div class="col-md-6">
													<label>비밀번호</label> 
													<input type="password" id="mem_pwd" name="mem_pwd">
												</div>
												
											</div>
												
											
											<div class="btn-wrapper">
												<button type="button" id="pwChkSubmitBtn" class="btn theme-btn-1 btn-effect-1 text-uppercase" >확인</button>
												<button type="button" id="pwChkCancleBtn" class="btn theme-btn-3 btn-effect-1 text-uppercase">취소</button>
											</div>
											
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
</div>






<jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
