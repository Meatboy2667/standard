<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function() {
	$('#choice').click(function() {
		location.href="${path}/boot/choice.do"
	});
	$('#textT').click(function(){
		location.href="${path}/boot/text.do";
	});
	
	$('#tableT').click(function() {
		location.href="${path}/boot/table.do";
	});
});
</script>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>table default</h2>
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
	</tbody>
</table>
<h2>table striped</h2>
<table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
	</tbody>
</table>
<h2>table bordered</h2>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
	</tbody>
</table>
<h2>table hover</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
		<tr>
			<td>165</td>
			<td>이제 곧 bootstrap4 출시</td>
			<td>길라임</td>
			<td>2016.12.02</td>
			<td>2</td>
		</tr>
	</tbody>
</table>
<button type="button" id="choice" class="btn btn-primary btn sm">choice</button>
<button type="button" id="textT" class="btn btn-info btn-lg">textT</button>
<button type="button" id="tableT" class="btn btn-warning btn-xs">tableAction</button>
</body>
</html>