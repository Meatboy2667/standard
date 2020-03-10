<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<title>게시판</title>
<style type="text/css">
	table {	width: 600px;border-spacing: 0;}
	tr td {	text-align: center;}
	tr td:nth-of-type(2) {text-align: left;	padding-left: 10px;}
	.text-center {width:500px; margin:0 auto;}
	.text-center pagination {text-align:center;}
</style>
<script type="text/javascript">
	 		$(document).ready(function() {
	 			$("#btnWrite").click(function(){
	 				location.href="${path}/board/write.do";
	 			})
	 		});
	 		
	 		function list(page){
	 			location.href="${path}/board/list.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	 		};
	 	</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h1>게시글 목록</h1>
	<hr />
	<form name="form1" method="post" action="${path}/board/list.do">
		<select name="searchOption">
			<option value="all"
				<c:out value="${map.searchOption == 'all'?'selected':''}" /> >제목+이름+내용</option>
			<option value="name"
				<c:out value="${map.searchOption == 'name'?'selected':''}" /> >이름</option>
			<option value="content"
				<c:out value="${map.searchOption == 'content'?'selected':''}" /> >내용</option>
			<option value="title"
				<c:out value="${map.searchOption == 'title'?'selected':''}" /> >제목</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
		<c:if test="${sessionScope.userid != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	</form>
	${map.count}개의 게시물이 있습니다.
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${map.list}" var="list">
			<tr>
				<td><c:out value="${list.seq}" /></td>
				<td><a href="${path}/board/getBoard.do?seq=${list.seq}&curPage=${map.Pager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}"><c:out value="${list.title}" />
					<c:if test="${list.recnt > 0}">
						<span style="color:red;">(${list.recnt})</span>
					</c:if>
				</a></td>
				<td><c:out value="${list.name}" /></td>
				<td><fmt:formatDate value="${list.regDate}"	pattern="yyyy-MM-dd" /></td>
				<td><c:out value="${list.cnt}" /></td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<div class="text-center">
			<ul class="pagination">
				<li>
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음] 하이퍼링크를 화면에 출력-->
					<c:if test="${map.Pager.curPage > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블럭으로 이동 : 현재페이지 블럭이 1보다 크면 [이전]하이퍼 링크를 화면에 출력 -->
					<c:if test="${map.Pager.curBlock > 1}">
						<a href="javascript:list('${map.Pager.prevPage}')">[이전]</a>
					</c:if>
					<!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
					<c:forEach var="num" begin="${map.Pager.blockBegin}" end="${map.Pager.blockEnd}">
						<!-- 현재 페이지에서 하이퍼링크 제거 -->
						<c:choose>
							<c:when test="${num == map.Pager.curPage}">
								<span style="color:gray">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음페이지 블럭으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력-->
					<c:if test="${map.Pager.curBlock < map.Pager.totBlock}">
						<a href="javascript:list('${map.Pager.nextPage}')">[다음]</a>
					</c:if>
					<!-- 끝페이지 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
					<c:if test="${map.Pager.curPage < map.Pager.totPage}">
						<a href="javascript:list('${map.Pager.totPage}')">[끝]</a> <!-- href="javascript:메소드명()"함수호출 -->
					</c:if>
				</li>
			</ul>
		</div>
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
			function fn_getBoard(seq) {
				var form = document.getElementById("gBoard");
				var url = "<c:url value='/board/getBoard.do'/>";
				url = url + "?seq=" + seq;
				
				form.action = url; 
				form.submit();
			}
	</script>
</body>
</html>