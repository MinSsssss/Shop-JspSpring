<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<jsp:include page="../includes/memberHeader.jsp"></jsp:include>





   <div class="ltn__utilize-overlay"></div>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-4 bg-overlay-theme-10--- bg-image" data-bg="img/bg/4.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-4 justify-content-between">
                        <div class="section-title-area">
                            <h1 class="section-title white-color">Checkout</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>Checkout</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- WISHLIST AREA START -->
    <div class="ltn__checkout-area mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__checkout-inner">
                        
                        <div class="ltn__checkout-single-content mt-50">
                            <h4 class="title-2">주문/결제</h4>
                            <div class="ltn__checkout-single-content-info">
                                <form action="#" >
                                    <h5>구매자정보</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                        	<label>이름</label>
                                            <div class="input-item">
                                                <input type="text" name="ltn__name" placeholder="First name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        	<label>이메일</label>
                                            <div class="input-item">
                                                <input type="text" name="ltn__lastname" placeholder="Last name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        	<label>휴대폰번호</label>
                                            <div class="input-item">
                                                <input type="email" name="ltn__email" placeholder="email address">
                                            </div>
                                        </div>
                                        
                                    </div> 
                                    <h5>받는사람정보</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                        	<label>이름</label>
                                            <div class="input-item">
                                                <input type="text" name="ltn__name" placeholder="First name">
                                            </div>
                                        </div>
                                       
                                        <div class="col-md-6">
                                        	<label>연락처</label>
                                            <div class="input-item">
                                                <input type="email" name="ltn__email" placeholder="email address">
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                        	<label>배송주소</label>
                                            <div class="input-item">
                                                <input type="text" name="ltn__lastname" placeholder="Last name">
                                            </div>
                                        </div>
                                        
                                        
                                    </div> 
        
                                    <h6>배송 요청 사항 (선택)</h6>
                                    <div class="input-item input-item-textarea">
                                        <textarea name="ltn__message" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ltn__checkout-payment-method mt-50">
                        <h4 class="title-2">결제 수단</h4>
                        <div id="checkout_accordion_1">
                            <!-- card -->
                            <div class="card">
                                <h5 class="collapsed ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-1" aria-expanded="false">
                                    Check payments
                                </h5>
                                <div id="faq-item-2-1" class="collapse" data-parent="#checkout_accordion_1">
                                    <div class="card-body">
                                        <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- card -->
                            <div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-2" aria-expanded="true"> 
                                    Cash on delivery 
                                </h5>
                                <div id="faq-item-2-2" class="collapse show" data-parent="#checkout_accordion_1">
                                    <div class="card-body">
                                        <p>Pay with cash upon delivery.</p>
                                    </div>
                                </div>
                            </div>                          
                            <!-- card -->
                            <div class="card">
                                <h5 class="collapsed ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-3" aria-expanded="false" >
                                    PayPal <img src="img/icons/payment-3.png" alt="#">
                                </h5>
                                <div id="faq-item-2-3" class="collapse" data-parent="#checkout_accordion_1">
                                    <div class="card-body">
                                        <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ltn__payment-note mt-30 mb-30">
                            <p>Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.</p>
                        </div>
                        <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit">결제하기</button>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping-cart-total mt-50">
                        <h4 class="title-2">결제 하실 상품 내역</h4>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Brake Conversion Kit <strong>× 2</strong></td>
                                    <td>$298.00</td>
                                </tr>
                                <tr>
                                    <td>OE Replica Wheels <strong>× 2</strong></td>
                                    <td>$170.00</td>
                                </tr>
                                <tr>
                                    <td>Wheel Bearing Retainer <strong>× 2</strong></td>
                                    <td>$150.00</td>
                                </tr>
                                <tr>
                                    <td>Shipping and Handing</td>
                                    <td>$15.00</td>
                                </tr>
                                <tr>
                                    <td>Vat</td>
                                    <td>$00.00</td>
                                </tr>
                                <tr>
                                    <td><strong>Total</strong></td>
                                    <td><strong>$633.00</strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- WISHLIST AREA START -->

    

    

<jsp:include page="../includes/memberFooter.jsp"></jsp:include>
<script src="/resources/member/js/myPage.js"></script>
