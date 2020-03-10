<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	div.center {width:800px; margin:20px auto;}
</style>
<script>
	$(document).ready(function() {
		$('#textT').click(function(){
			location.href="${path}/boot/text.do";
		});
		
		$('#tableT').click(function() {
			location.href="${path}/boot/table.do";
		});
	});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h3 style="text-align:center">버튼초이스</h3>
<div class="center">
	<button type="button" >one</button>
	<button type="button" class="btn">btn</button>
	<button type="button" class="btn btn-default">btn-default</button>
	<button type="button" class="btn btn-primary">btn-primary</button>
	<button type="button" class="btn btn-success">btn-success</button>
	<button type="button" class="btn btn-warning">btn-warning</button>
	<button type="button" class="btn btn-info">btn-info</button>
	<button type="button" class="btn btn-danger">btn-danger</button>
</div>
<div class="center">
	<button type="button" class="btn btn-default btn-lg">btn-default(lg)</button>
	<button type="button" class="btn btn-primary btn-lg">btn-primary(lg)</button>
	<button type="button" class="btn btn-success btn-lg">btn-success(lg)</button>
	<button type="button" class="btn btn-warning btn-lg">btn-warning(lg)</button>
	<button type="button" class="btn btn-info btn-lg">btn-info(lg)</button>
	<button type="button" class="btn btn-danger btn-lg">btn-danger(lg)</button>
</div>
<div class="center">
	<button type="button" class="btn btn-default btn-xs">btn-default(xs)</button>
	<button type="button" class="btn btn-primary btn-xs">btn-primary(xs)</button>
	<button type="button" class="btn btn-success btn-xs">btn-success(xs)</button>
	<button type="button" class="btn btn-warning btn-xs">btn-warning(xs)</button>
	<button type="button" class="btn btn-info btn-xs">btn-info(xs)</button>
	<button type="button" class="btn btn-danger btn-xs">btn-danger(xs)</button>
</div>
<div class="center">
	<button type="button" class="btn btn-default btn-sm">btn-default(sm)</button>
	<button type="button" class="btn btn-primary btn-sm">btn-primary(sm)</button>
	<button type="button" class="btn btn-success btn-sm">btn-success(sm)</button>
	<button type="button" class="btn btn-warning btn-sm">btn-warning(sm)</button>
	<button type="button" class="btn btn-info btn-sm">btn-info(sm)</button>
	<button type="button" class="btn btn-danger btn-sm">btn-danger(sm)</button>
</div>
<button type="button" id="textT" class="btn btn-info btn-lg">textT</button>
<button type="button" id="tableT" class="btn btn-warning btn-xs">tableAction</button>
</body>
</html>