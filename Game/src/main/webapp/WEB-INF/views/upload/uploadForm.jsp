<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
<style>
	/* iframe style setting */
	iframe {width:600px; height:100px; border:1px solid black;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<!-- 타겟을 지정한 곳으로 form data가 이동 -->
	<form id="form1" target="iframePhoto" action="${path}/upload/upload.do" method="post" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="업로드">
	</form>
	<!-- form data가 이곳으로 이동 -->
	<iframe name="iframePhoto"></iframe>
<script type="text/javascript">
	function addFilePath(msg){
		console.log(msg);
		document.getElementById("form1").reset(); //iframe에 업로드 결과를 출력후 form에 저장된 데이터초기화
	}
</script>
</body>
</html>