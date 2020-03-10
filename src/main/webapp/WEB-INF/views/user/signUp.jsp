<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<style>
	table {border-spacing:0; margin:0 auto; width:400px;}
</style>
<script>
	$(document).ready(function() {
		var formObj = $("form[name='createForm']");
		
		$('#sign_btn').on("click", function() {
			//정규표현식 검토
			
			formObj.attr("action", "${path}/user/create.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		$('.home_btn').on("click", function() {
			location.href="${path}/";
		})
		
		//정규표현식 완성해야함
		//$(선택자).blur 사용 => 해당요소를 벗어낫을때 이벤트발생 버블링x
	})
</script>
</head>
<body>
	<h1 align="center">회원가입</h1>
	<hr />
	<form name="createForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요."/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요."/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" id="email" name="email" placeholder="이메일을 입력해주세요."/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" id="sign_btn">회원가입</button>&nbsp;<input type="reset" value="초기화" />
				<button type="button" class="home_btn">메인화면</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>