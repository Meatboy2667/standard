<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/menu.css" />
</head>
<body>
	<div id="login">
		<c:if test="${sessionScope.userid != null}">
			${sessionScope.userid}
			<a href="${path}/user/logout.do" style="color:gray">로그아웃</a>
		</c:if>
		<c:if test="${sessionScope.userid == null }">
			<a href="${path}/user/login.do">로그인</a>
		</c:if>
	</div>
	<h1 id="logo">
		<a href="${path}/">P.GP</a>
	</h1>
	<div id="header">
		<div class="menu">
			<ul>
				<li><a href="${path}/main/front.do">Front</a></li>
				<li><a href="${path}/upload/uploadForm.do">파일업로드 시험</a></li>
				<li><a href="${path}/board/list.do">게시판</a></li>
				<li><a href="${path}/upload/uploadAjax.do">fileUpload(Ajax)</a></li>
				<li><a href="${path}/boot/choice.do">버튼초이스</a></li>
			</ul>
		</div>
	</div>
</body>
</html>