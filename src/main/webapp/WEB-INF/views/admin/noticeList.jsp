<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<jsp:include page="./includes/adminHeader.jsp"></jsp:include>
	
	
<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="pageHead">
                    	<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
                    	<div><a class="btn btn-link" href="/admin/noticeRegister">등록하기</a></div>
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
                                    	<c:forEach items="${noticeList}" var="notice">
	                                    	<tr>
	                                            <td>${notice.notice_no}</td>
	                                            <td><a href="/admin/noticeRead?notice_no=${notice.notice_no}">${notice.notice_title }</a></td>
	                                            <td><fmt:formatDate pattern="yyyy.MM.dd" value = "${notice.notice_date }"/></td>
  
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
         
	<jsp:include page="./includes/adminFooter.jsp"></jsp:include>
<script>
	let result = '${msg}';
	successFun(result);
</script>   