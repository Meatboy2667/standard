<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>P.Gp</title>
<link rel="stylesheet" href="${path}/resources/css/main.css"/>
</head>
<body>
<%@ include file="include/menu.jsp" %>
	<div id="main">
		<div class="nav">
			<ul>
				<li><a href="#" onclick="sendAjax('main/ajaxView1')">왜 P.Gp인가?</a></li>				
				<li><button type="button" class="btn btn-warning" onclick="sendAjax('main/ajaxView2')">ajax2</button></li>
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
