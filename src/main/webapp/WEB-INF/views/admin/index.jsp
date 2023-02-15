<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
	
	
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<div class="mb-5">
			<p>최근 주문 내역</p>
			<table style="width: 70%;">
				<tr>
					<th>주문번호</th>
					<th>주문일자</th>
				</tr>
				<c:forEach items="${orderList}" var="order">
					<tr>
						<td style="width: 30%; padding-right:10px;">
							<a href="<c:url value='/admin/order/orderDetailView?order_no=${order.order_no}'/> "><c:out value="${order.order_no}"/></a>
						</td>
						<td>
							<fmt:formatDate value="${order.order_date}" pattern="yyyy.MM.dd"/> 
						</td>
					</tr>
				</c:forEach>	
			</table>
		</div>
		
		
		<div>
			<p>최근 문의 내역</p>
			<table style="width: 70%;">
				<tr>
					<th>분류</th>
					<th>제목</th>
					<th>문의일자</th>
				</tr>
				<c:forEach items="${qnaList}" var="qna">
					<tr>
						<td style="width: 100px; padding-right: 10px;">
							<c:out value="${qna.category_name}"/>
						</td>
						<td style="width: 20%; text-overflow: ellipsis;">
							<a href="<c:url value='/admin/qna/qnaRead?qna_no=${qna.qna_no}'/>"> 
								<c:out value="${qna.qna_title}"/>
							</a>
						</td>
						<td>
							<fmt:formatDate value="${qna.qna_date}" pattern="yyyy.MM.dd"/>
						</td>
						
						
					</tr>
				
				</c:forEach>
				
			</table>
		</div>
		
	
	</div>
	
	<!-- End of Main Content -->
	<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
</body>
</html>