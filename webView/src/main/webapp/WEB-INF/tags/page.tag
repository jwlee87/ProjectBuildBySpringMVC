<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="data" type="kr.co.playground.domain.Search"%>
	<c:if test="${data.totalCount != 0}">
		<nav>
			<ul class="pagination">
			
				<li class="<c:if test="${data.prev eq false}">disabled</c:if>">
					<a href="<c:if test="${data.prev eq true}">javascript:goPage(${data.startPage - 1}, '${data.id}');</c:if>" aria-label="Previous">
						<!-- <span aria-hidden="true">&laquo;</span> -->
						<img id="leftBtn" src="/webView/img/common/shopList/leftBtn.png"/>
					</a>
				</li>
				
					<c:forEach var="i" begin="${data.startPage}" end="${data.endPage}">
						<c:choose>
							<c:when test="${i eq data.page}">
								<li class="active"><a href="#1">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:goPage(${i});">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				
				<li class="<c:if test="${data.next eq false}">disabled</c:if>">
					<a href="<c:if test="${data.next eq true}">javascript:goPage(${data.endPage + 1}, '${data.id}');</c:if>" aria-label="Next">
						<!-- <span aria-hidden="true">&raquo;</span> -->
						<img id="rightBtn" src="/webView/img/common/shopList/rightBtn.png"/>
					</a>
				</li>
				
			</ul>
		</nav>
	</c:if>
