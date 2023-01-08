<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

       
                                
                                    <div class="ltn__tab-menu-list">
                                        <div class="nav">
                                            <a data-toggle="tab" href="#" id="orderList">주문목록/배송조회 </a>
                                            <a data-toggle="tab" href="#" id="wishList">찜 리스트 </a>           
                                            <a data-toggle="tab" href="#" id="reviewList">리뷰 내역 </a>
                                            <a data-toggle="tab" href="#" id="qnaList">문의내역 </a>
                                            <a data-toggle="tab" href="#" id="memberModify">개인정보확인/수정 </a>
                                            
                                            <form action="/member/auth/logout" id="logoutForm" method="post">
	                                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	                                            <a href="#" data-toggle="modal" data-target="#logoutModal"  >로그아웃 </a>
	                                            <!--logout Modal -->
													<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalCenterTitle" aria-hidden="true">
													  <div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="logoutModalTitle">로그아웃</h5>
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </button>
													      </div>
													      <div class="modal-body">
													        로그아웃 하시겠습니까?
													      </div>
													      <div class="modal-footer">
													      	<button type="button" class="btn btn-primary" id="logoutBtn">로그아웃</button>
													        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
													        
													      </div>
													    </div>
													  </div>
													</div>
	                                            	<!--End Logout Modal -->
                                            
                                            </form>
                                            <a data-toggle="tab" href="#" id="memberDrop">회원 탈퇴 </a>
  
                                            
                                        </div>
                                    </div>
                                    
	
	