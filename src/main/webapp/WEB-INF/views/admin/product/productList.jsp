<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">상품리스트</h1>
                    	<div><a class="btn btn-link" href="/admin/product/productRegister">등록하기</a></div>
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div>
                            		<span><a href="/admin/product/productList?category_no=0">전체</a></span>
                            		<c:forEach items="${category}" var="cate" varStatus="status">
                            			<span class="moveCategory">
                            				<a href="#" onclick="fnMoveCategory(${cate.category_no})">
                            					${cate.category_name}
                            				</a>
                            			</span> 
                            			
                            		</c:forEach>
                            		<form id="moveCategoryForm" method="get"
                            			action="/admin/product/productList">
											<input type="hidden" name="pageNum" value="1">
											<input type="hidden" name="amount" value="${page.cri.amount}">
											
									</form>
                            	</div>
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="thWidth10">번호</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                            <th>조회수</th>
                                            <th>생성일자</th>
                                            <th>수정일자</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                   		<c:set var="num" value="${page.total-(page.cri.pageNum-1) * page.cri.amount}"/>
	                                    <c:forEach items="${productList }" var="product">
	                                    	<tr>
	                                            <td class="align-middle">${num}</td>
	                                            <td class="align-middle">
		                                            <div><img  class="productListImage" alt="" src="/display?fileName=${product.product_thumb_img}">
		                                            	<span><a href="/admin/product/productRead?product_no=${product.product_no}">${product.product_name}</a></span>
		                                            </div>
	                                            
	                                            </td>
	                                            
	                                            <td class="align-middle">${product.product_price }</td>
	                                            <td class="align-middle">${product.product_hit }</td>
	                                            <td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd" value = "${product.product_regdate }"/></td>
	                                            <td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd" value = "${product.product_updateDate }"/></td>
	                                             
	                                        </tr>
	                                    	<c:set var="num" value="${num-1}"/>
	                                    </c:forEach>
                                        
                                        
                                    </tbody>
                                </table>
                                
                              <jsp:include page="/WEB-INF/views/admin/includes/pageInclude.jsp"></jsp:include>
                              <input type="hidden" id="pageId" value="product">
                               
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           
	
	<!-- End of Main Content -->
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
