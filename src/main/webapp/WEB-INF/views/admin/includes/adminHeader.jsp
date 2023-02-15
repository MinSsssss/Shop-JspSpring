<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SIAN COFFEE - ADMIN</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/admin/css/custom.css" rel="stylesheet">
    
    
	<link rel="stylesheet" href="/resources/summernote/css/summernote-lite.css">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <div class="sidebar-brand d-flex align-items-center justify-content-center">
	            <div class="sidebar-brand-icon">
                    <a href="<c:url value='/admin'/>">Admin</a>
                </div>
                
                <div class="sidebar-brand-text mx-3">
                	<a href="<c:url value='/'/>">Sian Coffee<sup></sup></a>
                </div>
                
            </div>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#memberManage"
                    aria-expanded="true" aria-controls="memberManage">
                    <span>회원관리</span>
                </a>
                <div id="memberManage" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/member/memberList'/>">회원조회</a>
                       <!--  <a class="collapse-item" href="#">회원정보</a> -->
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#orderManage"
                    aria-expanded="true" aria-controls="orderManage">
                    <span>주문관리</span>
                </a>
                <div id="orderManage" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/order/orderList'/>">주문조회</a>
                        <!-- <a class="collapse-item" href="#">배송조회</a> -->
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#productManage"
                    aria-expanded="true" aria-controls="productManage">
                    <span>상품관리</span>
                </a>
                <div id="productManage" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<a class="collapse-item" href="<c:url value='/admin/category/categoryList?category_class=product'/>">상품카테고리조회</a>
                      
                        <a class="collapse-item" href="<c:url value='/admin/product/productList?category_no=0'/>">상품조회</a>
                      
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#qnaManage"
                    aria-expanded="true" aria-controls="qnaManage">
                    <span>고객센터관리</span>
                </a>
                <div id="qnaManage" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/notice/noticeList'/>">공지사항조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/category/categoryList?category_class=faq'/>">FAQ 카테고리조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/faq/faqList?category_no=0'/>">FAQ 조회</a>
                        
						<a class="collapse-item" href="<c:url value='/admin/category/categoryList?category_class=qna'/>">QNA 카테고리조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/qna/qnaList?category_no=0'/>">QNA 조회</a>
                    </div>
                </div>
            </li>


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                 <sec:authorize access="isAuthenticated()">
                           		<div class=""><sec:authentication property="principal.member.mem_name"/> 관리자님</div>
                           </sec:authorize>
                                </span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/admin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                              	<a class="dropdown-item" href="/">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    메인페이지로
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
