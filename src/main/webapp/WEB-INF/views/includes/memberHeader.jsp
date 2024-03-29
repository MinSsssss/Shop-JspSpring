<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>SIAN COFFEE</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <!-- Font Icons css -->
    <link rel="stylesheet" href="/resources/member/css/font-icons.css"/>
    <!-- plugins css -->
    <link rel="stylesheet" href="/resources/member/css/plugins.css"/>
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="/resources/member/css/style.css"/>
    <!-- Responsive css -->
    <link rel="stylesheet" href="/resources/member/css/responsive.css"/>
    
    <link rel="stylesheet" href="/resources/member/css/custom.css"/>
</head>

<body>
   

<!-- Body main wrapper start -->
<div class="body-wrapper">



    <!-- HEADER AREA START (header-4) -->
    <header class="ltn__header-area ltn__header-4 ltn__header-6 ltn__header-transparent gradient-color-2---">
        <!-- ltn__header-top-area start -->
        <div class="top-bar">

	        <sec:authorize access="isAnonymous()">
	            <a href="<c:url value='/login'/>">로그인</a>
	            <a href="<c:url value='/registerAgree'/>">회원가입</a>
	        </sec:authorize>
	        
	        <sec:authorize access="isAuthenticated()">
	            <div class=""><sec:authentication property="principal.member.mem_name"/>님</div>
	            <a href="#" data-toggle="modal" data-target="#logoutModal">로그아웃</a>
	        </sec:authorize>
	        <a href="<c:url value='/notice/noticeList?pageNum=0&amount=5'/>">고객센터</a>
	        
        </div>
        
        
        <!-- ltn__header-middle-area start -->
        <div class="ltn__header-middle-area ltn__header-sticky ltn__sticky-bg-white">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="site-logo">
                            <a href="/"><img src="/resources/member/img/logo.png" alt="Logo"></a>
                        </div>
                    </div>
                    <div class="col header-menu-column menu-color-white---">
                        <div class="header-menu d-none d-xl-block">
                            <nav>
                                <div class="ltn__main-menu">
                                    <ul>
                                      	<c:forEach items="${categoryList }" var="category">
	                                      	<li>
	                                    		<a class="menu-icon" id="productMove"
	                                    			href="<c:url value='/product/productList/${category.category_no}'/>">
	                                    			<c:out value='${category.category_name}'/>
	                                    		</a>
	                                    	</li>
                                        </c:forEach>
                                        
                                    </ul>
                                </div>
                            </nav>
                        </div>
                       <form id='actionForm' action="<c:url value='/member/productList'/>" method='get'>
							<input type="hidden" name=>
						</form>
                    </div>
                    <div class="col">
                        <div class="ltn__header-options ltn__header-options-color-white----">
 
                            <div class="header-search-wrap">
                                <div class="header-search-1">
                                    <div class="search-icon">
                                        <i class="icon-search for-search-show"></i>
                                        <i class="icon-cancel  for-search-close"></i>
                                    </div>
                                </div>
                                <div class="header-search-1-form">
                                    <form action="<c:url value='/product/productList/0?pageNum=0'/>" id="searchForm" method="get">
                                      
                                        <input type="text" name="keyword" placeholder="Search...">
					                   	<input type="hidden" name="pageNum" value="0">
                                        <button type="submit">
                                            <span><i class="icon-search"></i></span>
                                        </button>
                                    </form>
                                    
                                </div>
                            </div>
                            <!-- user-menu -->
                            <sec:authorize access="isAnonymous()"> 
	                            <div class="ltn__drop-menu user-menu">
	                                    <a href="/login"><i class="icon-user"></i></a>   
	                            </div>
                            </sec:authorize>
                            
                            
                             <sec:authorize access="hasRole('ROLE_MEMBER')"> 
	                            <div class="ltn__drop-menu user-menu">
	                                    <a href="<c:url value='/order/orderList'/>"><i class="icon-user"></i></a>   
	                            </div>
	                         
	                            
	                            <!-- mini-cart -->
	                            <div class="mini-cart-icon">
	                                <a href="<c:url value='/cart/cartView'/>" >
	                                    <i class="icon-shopping-cart"></i>
	                                    <sup></sup>
	                                </a>
	                            </div>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
	                            <div class="ltn__drop-menu user-menu">
	                                    <a href="<c:url value='/admin'/>"><i class="icon-user"></i></a>   
	                            </div>
	                        </sec:authorize>
                            <!-- Mobile Menu Button -->
                            <div class="mobile-menu-toggle d-xl-none">
                                <a href="#ltn__utilize-mobile-menu" class="ltn__utilize-toggle">
                                    <svg viewBox="0 0 800 600">
                                        <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200" id="top"></path>
                                        <path d="M300,320 L540,320" id="middle"></path>
                                        <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190" id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                    </svg>
                                </a>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- ltn__header-middle-area end -->
    </header>
    <!-- HEADER AREA END -->

    

    <!-- Utilize Mobile Menu Start -->
    <div id="ltn__utilize-mobile-menu" class="ltn__utilize ltn__utilize-mobile-menu">
        <div class="ltn__utilize-menu-inner ltn__scrollbar">
            <div class="ltn__utilize-menu-head">
                <div class="site-logo">
                    <a href="<c:url value='/'/>"><img src="<c:url value='/resources/member/img/logo.png'/>" alt="Logo"></a>
                </div>
                <button class="ltn__utilize-close">×</button>
            </div>
            
            
            
            <div class="ltn__utilize-menu-search-form">
                <form action="<c:url value='/product/productList/0'/>" id="searchForm" method="get">
                    <input type="text" name="keyword" placeholder="Search...">
                    
                	<input type="hidden" name="pageNum" value="0">
                    <button><i class="fas fa-search"></i></button>
                </form>
            </div>
            
            <div class="ltn__utilize-menu">
                <ul>
                    <c:forEach items="${categoryList }" var="category">
                        <li>
                        	<a class="menu-icon" id="productMove"
                            	href="<c:url value='/product/productList/${category.category_no}'/>">
                            	<c:out value='${category.category_name}'/>
                            </a>
                       </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="ltn__utilize-buttons ltn__utilize-buttons-2">
                <ul>
                    <li>
                        <a href="<c:url value='/login'/>" title="Login">
                            <span class="utilize-btn-icon">
                                <i class="far fa-user"></i>
                            </span>
                            로그인 / 회원가입
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value='/wish/wishListView'/>" title="Wishlist">
                            <span class="utilize-btn-icon">
                                <i class="far fa-heart"></i>
                                <sup>3</sup>
                            </span>
                            찜 리스트
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value='/cart/cartView'/>" title="Shoping Cart">
                            <span class="utilize-btn-icon">
                                <i class="fas fa-shopping-cart"></i>
                                <sup>5</sup>
                            </span>
                            장바구니
                        </a>
                    </li>
                </ul>
            </div>
            <div class="ltn__social-media-2">
                <ul>
                    <li><a href="https://www.facebook.com/siancoffee" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="https://www.instagram.com/si_an_coffee" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                    
                </ul>
            </div>
        </div>
    </div>
    <!-- Utilize Mobile Menu End -->