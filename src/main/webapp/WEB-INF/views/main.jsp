<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/main.css">
<title>Main</title>
</head>
<body>
<%@ include file="include/menu.jsp" %>

	<div id="main">
		<div class="nav">
			<ul>
				<li><button type="button" class="btn btn-primary" onclick="sendAjax('ajaxView1')">화면1</button></li>
				<li><button type="button" class="btn btn-warning" onclick="sendAjax('ajaxView2')">화면2</button></li>
				<li><a href="#this" onclick="sendAjax('ajaxView1')">화면1</a></li>
			</ul>
		</div>
		<div class="content">
			<div id="changeView"></div>
		</div>
	</div>
	
<script type="text/javascript" src="${path}/resources/js/ajax.js"></script>
<%@ include file="include/footer.jsp" %>
</body>
</html>