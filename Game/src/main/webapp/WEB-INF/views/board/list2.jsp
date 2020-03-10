<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P.G.P</title>
<link rel="stylesheet" href="${path}/resources/bootstrap/bootstrap.css"/>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
	<form id="boardForm" name="boardForm" method="post">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${list}" varStatus="status">
					<tr>
						<td><c:out value="${result.seq }"></c:out>
						<td><a href="#" onClick="fn_getBoard(${result.seq})"><c:out value="${result.title}"></c:out></a>
						<td><c:out value="${result.writer}"></c:out></td>
						<td><fmt:formatDate value="${result.regDate}" pattern="yyyy-mm-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			<a href="#" onClick="fn_write()" class="btn btn-success">글쓰기</a>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
	function fn_write() {
		var form = document.getElementById("boardForm");
		
		form.action = "<c:url value='/board/write.do'/>";
		form.submit();
	}
	function fn_getBoard(seq) {
		var form = document.getElementById("boardForm");
		var url = "<c:url value='/board/getBoard.do'/>";
		url = url + "?seq=" + seq;
		
		form.action = url;
		form.submit();
	}
</script>
</body>
</html>