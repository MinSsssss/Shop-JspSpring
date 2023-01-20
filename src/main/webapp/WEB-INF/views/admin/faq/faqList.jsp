<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">FAQ</h1>
                    	<div><a class="btn btn-link" href="/admin/faq/faqRegister">등록하기</a></div>
                    </div>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div>
                            		<span><a href="/admin/faq/faqList?category_no=0">전체</a></span>
                            		<c:forEach items="${category}" var="cate" varStatus="status">
                            			<span class="moveCategory">
                            				<a href="#" onclick="fnMoveCategory(${cate.category_no})">
                            					${cate.category_name}
                            				</a>
                            			</span> 
                            			
                            		</c:forEach>
                            		<form id="moveCategoryForm" method="get"
                            			action="/admin/faq/faqList">
											<input type="hidden" name="pageNum" value="1">
											<input type="hidden" name="amount" value="${page.cri.amount}">
											
									</form>
                            	</div>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="thWidth10">번호</th>
                                            <th >제목</th>
                                            <th class="thWidth15">분류</th>             
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<c:set var="num" value="${page.total-(page.cri.pageNum-1) * page.cri.amount}"/>
                                    	<c:forEach items="${faqList}" var="faq">
	                                    	<tr>
	                                            <td>${num}</td>
	                                            <td><a href="/admin/faq/faqRead?faq_no=${faq.faq_no}">${faq.faq_title }</a></td>
	                                            <td>${faq.category_name }</td>
	                                             
	                                        </tr>
	                                    	<c:set var="num" value="${num-1}"/>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                                <jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
								<input type="hidden" id="pageId" value="adminFaqList">
								
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
        
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
	<script>
		let result = '${msg}';
		successFun(result);
	</script>    
	
