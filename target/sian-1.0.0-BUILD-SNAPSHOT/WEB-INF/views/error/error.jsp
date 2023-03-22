<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/includes/memberHeader.jsp"></jsp:include>

	<div class="ltn__utilize-overlay"></div>

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

    <!-- 404 area start -->
    <div class="ltn__404-area ltn__404-area-1 mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="error-404-inner text-center">
                        
                        <h2><c:out value="${code}"/></h2>
                       
                        
                        <div class="btn-wrapper">
                            <button onClick="history.go(-1)" class="btn btn-transparent"><i class="fas fa-long-arrow-alt-left"></i> 이전페이지로</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 404 area end -->

    
  <jsp:include page="/WEB-INF/views/includes/memberFooter.jsp"></jsp:include>
  

	
<script src="/resources/member/js/register.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

