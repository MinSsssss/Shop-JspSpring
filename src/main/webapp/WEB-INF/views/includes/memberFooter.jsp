<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!-- FOOTER AREA START -->
    <footer class="ltn__footer-area">
        <div class="footer-top-area  section-bg-2 plr--5">
            <div class="container-fluid">
                <div class="footer-row">
                	
                    <div class="col-xl-3 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-about-widget">
                            
                            <h4 class="footer-title">SIAN COFFEE</h4>
                            <div class="footer-menu">
                                <ul>
                                	<li>
                                        <div class="footer-address-info">
                                            <p>대표자명 : 000</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-info">
                                            <p>주소 : 0000000000000000</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-info">
                                            <p>사업자등록번호 : 000-00-00000</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-info">
                                            <p>tel : 000-0000-0000</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-info">
                                            <p>email : 00000@00000.000</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="ltn__social-media mt-20">
                                <ul>
                                    <li><a href="https://www.facebook.com/siancoffee" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                  
                                    <li><a href="https://www.instagram.com/si_an_coffee" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">C/S CENTER</h4>
                            <div class="footer-menu">
                                <ul>
                                    <li>전화 : 000-0000-0000</li>
                                    <li>팩스 : 000-0000-0000</li>
                                    <li>이메일 : 0000000@00000.000</li>
                                    <li>카카오톡 ID : 0000000</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">근무시간</h4>
                            <div class="footer-menu">
                                <ul>
                                    <li>월 ~ 금 AM 9:00 ~ PM 6:00</li>
                                    <li>점심시간 : PM 12:00 ~ PM 1:00</li>
                                    <li>고객센터 : AM 10:00 ~ PM 6:00</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">은행정보</h4>
                            <div class="footer-menu">
                                <ul>
                                    <li>OO은행 OOOO-OOOO-OOOO-OOOO</li>
                                    <li>예금주 : OOOOOOOOOO</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
        
    </footer>
    <!-- FOOTER AREA END -->



<!--logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="logoutModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="logoutModalTitle">로그아웃</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">로그아웃 하시겠습니까?</div>
			<div class="modal-footer">
				<form action="/logout" id="logoutForm" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<button type="submit" class="btn btn-primary" id="logoutBtn">로그아웃</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</form>	
			</div>
		</div>
	</div>
</div>
<!--End Logout Modal -->





</div>
<!-- Body main wrapper end -->

<!-- preloader area start -->
<div class="preloader d-none" id="preloader">
	<div class="preloader-inner">
		<div class="spinner">
			<div class="dot1"></div>
			<div class="dot2"></div>
		</div>
	</div>
</div>
<!-- preloader area end -->

<!-- All JS Plugins -->

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>



<script src="/resources/member/js/plugins.js"></script>

<script src="/resources/member/js/main.js"></script>

<script src="/resources/member/js/myPage.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</body>
</html>
