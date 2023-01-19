<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>



<div class="ltn__tab-menu-list">
	<div class="nav">
		<a data-toggle="tab" href="#" id="orderList">주문목록/배송조회 </a> 
		<a data-toggle="tab" href="#" id="wishList">찜 리스트 </a> 
		<a data-toggle="tab" href="#" id="reviewList">리뷰 내역 </a> 
		<a data-toggle="tab" href="#" id="qnaList">문의내역 </a> 
		<a data-toggle="tab" href="#" id="memberModify">개인정보확인/수정 </a>

		<form action="/logout" id="logoutForm" method="post">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />
		</form>	
		<a href="#" data-toggle="modal" data-target="#logoutModal">로그아웃 </a>

		<a data-toggle="tab" href="#" id="memberDrop">회원 탈퇴 </a>


	</div>
</div>


