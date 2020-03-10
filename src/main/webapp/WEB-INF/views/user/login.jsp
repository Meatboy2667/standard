<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	table {margin:0 auto; width:350px;}
	td:nth-child(1) {width:100px; padding-left:5px;}
	tr:nth-of-type(3) div {color:red;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login_btn").on("click", function(){
			var userid = $("#userid").val();
			var password = $("#password").val();
			if(userid == "" || userid == null){
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return;
			}else if(password == "" || password == null){
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
				return;
			}
			document.form1.action="${path}/user/loginChk.do";
			document.form1.submit();
		})
		
		$("#signup_btn").click(function() {
			location.href="${path}/user/signUp.do";
		})
	})
</script>
</head>
<body>
	<h1 align="center">로그인 페이지 입니다</h1>
	<hr />
	<form name="form1" method="post">
		<table border="1" style="border-spacing:0;" >
			<tr>
				<td>ID</td>
				<td><input type="text" name="userid" id="userid"/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="password" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" id="login_btn">로그인</button>
				<button type="button" id="signup_btn">회원가입</button>
				<c:if test="${message == 'error'}">
					<div>
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${message == 'logout'}">
					<div>
						로그아웃 되었습니다.
					</div>
				</c:if>
				<c:if test="${message == 'no_Login'}">
					<div>
						로그인 후 이용 가능합니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<hr />
	<a href="${pageContext.request.contextPath}/">index</a>
</body>
</html>