<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./member/includes/memberHeader.jsp"></jsp:include>


    <div class="ltn__utilize-overlay"></div>
<style>
	#mem_id{
		width:70%;
	}
	.btnCheck{
	padding:15px 0;
	color:white;
	}
</style>
    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                        <div class="section-title-area">
                            <h1 class="section-title white-color">Register</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>Register</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- LOGIN AREA START (Register) -->
    <div class="ltn__login-area pb-110">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title-area text-center">
                        <h1 class="section-title">회원가입</h1>
                        <p>환영합니다!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="account-login-inner">
                        <form name="registerForm" id="regForm" action="/registerProc" method="post" class="ltn__form-box contact-form-box">
                            <input type="text" id="mem_id" name="mem_id" placeholder="아이디">
                           
                            <button class="btn btn-warning btnCheck" type="button" id="idChk"
                            onclick="fn_idChk();" value="N" >중복 확인</button>
                            
                            <input type="password" id="mem_pwd" name="mem_pwd" placeholder="비밀번호">
                            <input type="password" id="mem_pwd_re" name="mem_pwd_re" placeholder="비밀번호 확인">
                            <input type="text" id="mem_name" name="mem_name" placeholder="이름">
                            <input type="email" id="mem_email" name="mem_email" placeholder="email">
                            <input type="text" id="mem_tel" name="mem_tel" placeholder="전화번호">
                            
                            <!-- <label class="checkbox-inline"> -->
                             <!--    <input type="checkbox" value="">
                                SMS 수신을 동의 하십니까?
                            </label>
                            <br>
                            <label class="checkbox-inline">
                                <input type="checkbox" value="">
                                이메일 수신을 동의 하십니까? -->
                            
                            <div class="btn-wrapper">
                                <button id="joinBtn" class="theme-btn-1 btn reverse-color btn-block" type="button"
                                onclick="return joinCheck()">가입하기</button>
                            </div>
                            <div class="btn-wrapper">
                            
                                <button id="cencleBtn" class="theme-btn-1 btn reverse-color btn-block" 
                                type="button">취소하기</button>
                            </div>
                        </form>
                        <!-- <div class="by-agree text-center">
                            <p>By creating an account, you agree to our:</p>
                            <p><a href="#">TERMS OF CONDITIONS  &nbsp; &nbsp; | &nbsp; &nbsp;  PRIVACY POLICY</a></p>
                            <div class="go-to-btn mt-50">
                                <a href="login.html">ALREADY HAVE AN ACCOUNT ?</a>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGIN AREA END -->

 
   
    
    
  
<jsp:include page="./member/includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/register.js"></script>

