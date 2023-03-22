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
                        <form name="registerForm" id="regForm" action="/registerProc" method="post" class="ltn__form-box contact-form-box">
                        	<table class="registerTable">
                        		<tbody>
                        			<tr>
                        				<th>아이디</th>
                        				<td>
                        					<input type="text" id="mem_id" name="mem_id" placeholder="아이디">
                           					<button class="btn btn-warning btnCheck" type="button" id="idChk"
                            				onclick="fn_idChk();" value="N" >중복 확인</button>
                            			</td>
                        			</tr>
                        			<tr>
                        				<th>비밀번호</th>
                        				<td>
                        					<input type="password" id="mem_pwd" name="mem_pwd" placeholder="비밀번호">
                            			</td>
                        			</tr>
                        			<tr>
                        				<th>비밀번호 확인</th>
                        				<td>
                        					<input type="password" id="mem_pwd_re" name="mem_pwd_re" placeholder="비밀번호 확인">
                            			</td>
                        			</tr>
                        			<tr>
                        				<th>이름</th>
                        				<td>
                        					<input type="text" id="mem_name" name="mem_name" placeholder="이름">
                            			</td>
                        			</tr>
                        			<tr>
                        				<th>휴대전화</th>
                        				<td>
                        					<input type="text" id="mem_tel" name="mem_tel" placeholder="휴대전화">
                        					
                            			</td>
                        			</tr>
                        			<tr>
                        				<th>이메일</th>
                        				<td>
                        					<input type="email" id="mem_email" name="mem_email" placeholder="email">
                            			</td>
                        			</tr>
                        			<tr id="address_tr">
                        				<th >주소</th>
                        				<td>
                        					<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly">
											<input type="button" class="btn btn-warning btnCheck" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" name="address" id="address" placeholder="주소" readonly="readonly"><br>
											<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
											<input type="hidden" id="extraAddress" placeholder="참고항목" >
                            			</td>
                        			</tr>
                        		</tbody>
                        		
                        	
                        	</table>
 
                            <div class="btn-wrapper">
                                <button type="button" id="joinBtn" 
                                class="theme-btn-1 btn reverse-color btn-block" 
                                onclick="return joinCheck()">가입하기</button>
                            </div>
                            <div class="btn-wrapper">
                            
                                <button id="cencleBtn" class="theme-btn-1 btn reverse-color btn-block" 
                                type="button">취소하기</button>
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
<script src="/resources/member/js/address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

