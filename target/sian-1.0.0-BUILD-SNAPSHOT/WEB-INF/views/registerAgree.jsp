<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>


    <div class="ltn__utilize-overlay"></div>
<style>

</style>
    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                        <div class="section-title-area">
                            
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
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="account-login-inner">
                        <h2>이용약관동의</h2>
                        <form id="registerNext" action="/register" method="post">
                        	<div class="agreeBox">
                        		<div class="allCheck"><input type="checkbox" id="agreeAllChk">모든 약관을 확인하고 전체 동의합니다.</div>
                        		<div class="checkFirst">
                        			<input type="checkbox" id="agreeChk1" name="agree1" value="true" >이용약관 (필수) <button>약관보기</button>
                        		</div>
                        		<div>
                        			<input type="checkbox" id="agreeChk2" name="agree2" value="true">개인정보 수집 및 이용 (필수) <button>약관보기</button>
                        		</div>
                        	</div>
                        	<div class="btn-wrapper">
                        		<button type="button" id="cencleBtn" class="theme-btn-3 btn btn-effect-3">취소</button>
                        		<button type="button" id="registerNextBtn" class="theme-btn-1 btn btn-effect-1" >다음</button>
                        	</div>
                        </form>
						                        
						
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGIN AREA END -->

 
   
    
    
  <jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
  

	
<script src="/resources/member/js/register.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

