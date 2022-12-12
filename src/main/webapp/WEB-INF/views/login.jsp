<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./member/includes/memberHeader.jsp"></jsp:include>
    

    <div class="ltn__utilize-overlay"></div>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="member/img/bg/4.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                        <div class="section-title-area">
                            <h1 class="section-title white-color">Login</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>Login</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- LOGIN AREA START -->
    <div class="ltn__login-area pb-65">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title-area text-center">
                        <h1 class="section-title">로그인</h1>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="account-login-inner">
                        <form action="/loginProcess" role="form" method="post" class="ltn__form-box contact-form-box">
                            <input type="text" name="mem_id" placeholder="아이디 ">
                            <input type="password" name="mem_pwd" placeholder="비밀번호">
                            <div class="btn-wrapper mt-0">
                                <!-- <input type='submit' class='btn-success' value="로그인"> -->
                                   <a href="/member" class="btn btn-lg btn-success btn-block">Login</a>     
                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                            </div>
                            <div class="go-to-btn mt-20">
                                <a href="#"><span class="mr-30">아이디 찾기</span></a>
                                <a href="#"><span>비밀번호 찾기</span></a>
                            </div>
                           
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="account-create text-center pt-50">
                        <h4>아이디가 없으세요?</h4>
                        
                        <div class="btn-wrapper">
                            <a href="/register" class="theme-btn-1 btn black-btn">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGIN AREA END -->

    

   

    
<jsp:include page="./member/includes/memberFooter.jsp"></jsp:include>
<script>
		$(".btn-success").on("click",function(e){
			e.preventDefault();
			$("form").submit();
		})
	</script>