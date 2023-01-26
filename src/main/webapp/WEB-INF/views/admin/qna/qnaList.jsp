<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">1:1문의 내역</h1>
                    	
                    </div>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div>
                            		<span><a href="/admin/qna/qnaList?category_no=0">전체</a></span>
                            		<c:forEach items="${category}" var="cate">
                            			<span>
                            				<a href="/admin/qna/qnaList?category_no=${cate.category_no}">
                            					${cate.category_name}
                            				</a>
                            			</span> 
                            		</c:forEach>
                            	</div>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="thWidth10">번호</th>
											<th class="thWidth10">카테고리</th>
											<th>제목</th>
											<th class="thWidth10">날짜</th>
											<th class="thWidth10">작성자</th>
											<th class="thWidth10">처리상태</th>             
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<c:set var="num" value="${page.total-(page.cri.pageNum-1) * page.cri.amount}"/>
                                    	<c:forEach items="${qnaList}" var="qna">
	                                    	<tr>
	                                            <td>${num}</td>
												<td>${qna.category_name}</td>
												<td class="noticeTitle">
												<a href="/admin/qna/qnaRead?qna_no=${qna.qna_no}">${qna.qna_title}</a>
													
												</td>
												<td><fmt:formatDate pattern="yyyy.MM.dd"
														value="${qna.qna_date}" /></td>
												<td>${qna.qna_writer}</td>
												<td>${qna.qna_status}</td>
	                                             
	                                        </tr>
	                                        <c:set var="num" value="${num-1}"/>
                                    	</c:forEach>
                                       
                                    </tbody>
                                </table>
                                <jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
								<input type="hidden" id="pageId" value="qnaList"> 
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
	<script src="/resources/member/js/paging.js"></script>
