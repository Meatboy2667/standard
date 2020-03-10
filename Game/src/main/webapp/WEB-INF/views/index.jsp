<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>P.G.P</title>
<link rel="stylesheet" href="${path}/resources/css/main.css"/>
</head>
<body>
<%@ include file="include/menu.jsp" %>
	<div id="main">
		<div class="nav">
			navigation~
		</div>
		<div class="content">
			<c:if test="${sessionScope.userid != null}" >
				<h2>${sessionScope.userid}님의 방문을 환영합니다.</h2>
			</c:if>
			content Area!
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>
