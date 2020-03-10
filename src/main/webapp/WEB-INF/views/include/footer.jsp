<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/footer.css" />
</head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#index').click(function(){
			location.href="${path}/";
		});
		
		$('#ex').click(function() {
			location.href="${path}/main/ajax.do";
		})
	});
</script>
<body>
	<div id="footer">
		COPYRIGHTⓒ Promotion<br />
		<a href="${path}/board/write.do">글 작성Page</a><br />
		<button type="button" id="index" class="btn btn-info btn-sm">Index Page</button>
		<button type="button" id="ex" class="btn btn-primary btn-sm">Ex</button>
	</div>
</body>
</html>