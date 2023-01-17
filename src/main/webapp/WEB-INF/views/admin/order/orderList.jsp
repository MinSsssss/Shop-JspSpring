<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	

                
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">주문조회</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>회원번호</th>
                                            <th>총금액</th>
                                            <th>주문날짜</th>
                                            <th>처리상태</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<c:forEach items="${orderList}" var="order">
	                                        <tr>
	                                            <td><a href="/admin/order/orderDetailView?order_no=${order.order_no}">${order.order_no}</a></td>
	                                            <td>${order.mem_id }</td>
	                                            <td>${order.total_price}</td>
	                                            <td><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${order.order_date}"/> </td>
	                                            <td>${order.order_status }</td>
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
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
