<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="./includes/adminHeader.jsp"></jsp:include>
	
	

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품리스트</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                            <th>조회수</th>
                                            <th>생성일자</th>
                                            <th>수정일자</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    <c:forEach items="${productList }" var="product">
                                    	<tr>
                                            <td><c:out value= "${product.product_no }" /></td>
                                            <td><c:out value= "${product.product_name }" /></td>
                                            <td><c:out value= "${product.product_price }" /></td>
                                            <td><c:out value= "${product.product_hit }" /></td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value = "${product.product_regdate }"/></td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value = "${product.product_updateDate }"/></td>
                                             
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

           
	
	<!-- End of Main Content -->
	<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
