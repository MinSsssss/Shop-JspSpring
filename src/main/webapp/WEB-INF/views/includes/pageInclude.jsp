<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageInfo_wrap">
	<div class="pageInfo_area">
	
		<ul id="pageInfo" class="pageInfo">
			<c:if test="${page.prev}">
				<li class="pageInfo_btn previous"><a href="${page.startPage-1}">이전</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				<li class="pageInfo_btn ${page.cri.pageNum == num ?" active ":" " }">
					<a href="<c:url value='${num}'/>">
						<c:out value='${num}'/>
					</a>
				</li>
			</c:forEach>
			

			<c:if test="${page.next}">
				<li class="pageInfo_btn next"><a href="<c:url value='${page.endPage + 1}'/>">다음</a></li>
			</c:if>

		</ul>
	</div>
</div>
<form id="moveForm" method="get">
	<input type="hidden" name="pageNum" value="<c:out value='${page.cri.pageNum}'/>">
	<input type="hidden" name="amount" value="<c:out value='${page.cri.amount}'/>">
	  
</form>
