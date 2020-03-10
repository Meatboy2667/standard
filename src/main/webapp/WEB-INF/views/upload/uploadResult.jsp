<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title insert here</title>
</head>
<body>
파일이 업로드 되었습니다.<br />
파일명 : ${savedName}
<script type="text/javascript">
	var result ="${savedName}";
	parent.addFilePath(result); //파일명을 부모페이지로 전달
</script>
</body>
</html>