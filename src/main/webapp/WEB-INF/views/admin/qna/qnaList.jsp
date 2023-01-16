<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">1:1문의 조회</h1>
                    	
                    </div>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="thWidth10">번호</th>
                                            <th>제목</th>
                                            <th class="thWidth15">작성자</th>
                                            <th class="thWidth15">날짜</th>
                                            <th class="thWidth15">처리결과</th>        
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    <c:forEach items="${productList }" var="product">
                                    	<tr>
                                            <td>번호</td>
                                            <td>제목</td>
                                            <td>작성자</td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value = "${product.product_regdate }"/></td>
                                            <td>처리결과</td>
                                             
                                        </tr>
                                    
                                    </c:forEach>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
