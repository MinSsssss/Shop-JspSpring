<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
                    	<div><a class="btn btn-link" href="<c:url value='/admin/notice/noticeRegister'/>">등록하기</a></div>
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
                                            <th class="thWidth15">날짜</th>        
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<c:set var="num" value="${page.total-page.cri.pageNum}"/>
                                    	<c:forEach items="${noticeList}" var="notice">
                                    	
	                                    	<tr>
	                                            <td><c:out value='${num}'/></td>
	                                            <td>
	                                            	<a href="<c:url value='/admin/notice/noticeRead/${notice.notice_no}'/>">
	                                            		<c:out value='${notice.notice_title}'/>
	                                            	</a>
	                                            </td>
	                                            <td><fmt:formatDate pattern="yyyy.MM.dd" value ="${notice.notice_date }"/></td>
  
	                                        </tr>
	                                     	<c:set var="num" value="${num-1}"/>
 										</c:forEach>
                                    </tbody>
                                </table>
                                <jsp:include page="/WEB-INF/views/includes/pageInclude.jsp"></jsp:include>
                                <input type="hidden" id="pageId" value="notice">
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
         
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
<script>
	let result = "<c:out value='${msg}'/>";
	successFun(result);
</script>   