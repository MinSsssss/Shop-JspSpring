<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageInfo_wrap">
	이전${page.prev}
	다음${page.next}
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
			<c:if test="${page.prev}">
				<li class="pageInfo_btn previous"><a href="<c:url value='${(page.startPage-2)*page.cri.amount}'/>">이전</a></li>
			</c:if>

			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				<li class="pageInfo_btn ${page.cri.pageNum == (num-1)*5 ? "active":"" }">
					<a href="<c:url value='${(num-1)*page.cri.amount}'/>">
						<c:out value='${num}'/>
					</a>
				</li>
			</c:forEach>


			<c:if test="${page.next}">
				<li class="pageInfo_btn next"><a href="${(page.endPage)*page.cri.amount}">다음</a></li>
			</c:if>

		</ul>
	</div>
</div>
<form id="moveForm" method="get">
	<input type="text" name="pageNum" value="<c:out value='${page.cri.pageNum}'/>">
	<input type="hidden" name="amount" value="<c:out value='${page.cri.amount}'/>">
</form>
