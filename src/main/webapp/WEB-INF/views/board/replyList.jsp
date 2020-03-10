<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<table style="width:700px;">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>
					${list.name}(<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
					<br />
					${list.replytext}
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음] 하이퍼링크를 화면에 출력-->
				<c:if test="${replyPager.curPage > 1}">
					<a href="javascript:listReply('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블럭으로 이동 : 현재페이지 블럭이 1보다 크면 [이전]하이퍼 링크를 화면에 출력 -->
				<c:if test="${replyPager.curBlock > 1}">
					<a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
				</c:if>
				<!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
				<c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
					<!-- 현재 페이지에서 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == replyPager.curPage}">
							<span style="color:gray">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:listReply('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음페이지 블럭으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력-->
				<c:if test="${replyPager.curBlock < replyPager.totBlock}">
					<a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
				</c:if>
				<!-- 끝페이지 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${replyPager.curPage < replyPager.totPage}">
					<a href="javascript:listReply('${replyPager.totPage}')">[끝]</a> <!-- href="javascript:메소드명()"함수호출 -->
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>